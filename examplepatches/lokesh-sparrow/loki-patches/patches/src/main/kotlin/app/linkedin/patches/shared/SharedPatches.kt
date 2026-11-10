/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.shared

import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.w3c.dom.Document
import org.w3c.dom.Element

// Smali types of the extension classes the shared hooks call.
private const val EXT_SETTINGS = "$EXTENSION_PACKAGE/Settings;"
private const val EXT_NAV_PANEL = "$EXTENSION_PACKAGE/NavPanelPatch;"
private const val EXT_SDUI_FILTER = "$EXTENSION_PACKAGE/SduiComponentFilter;"
private const val EXT_SDUI_MEDIA = "$EXTENSION_PACKAGE/SduiMediaDownload;"
private const val EXT_SHORTCUT = "$EXTENSION_PACKAGE/SettingsShortcut;"

private const val LI_NAV_PANEL = "Lcom/linkedin/android/home/navpanel"
private const val LI_SDUI_FRAGMENT = "Lcom/linkedin/android/infra/sdui/view/SduiFragment;"
private const val LI_COMPONENT = "Lproto/sdui/components/core/Component;"

/** Java package of the extension, as the manifest spells class names. */
private const val EXT_JAVA_PACKAGE = "app.linkedin.extension"

/** Builds `<tag a="b" ...>` with the attributes in the given order and appends [children] to it. */
private fun Document.node(tag: String, vararg attributes: Pair<String, String>, children: List<Element> = emptyList()) =
    createElement(tag).also { element ->
        for ((key, value) in attributes) element.setAttribute(key, value)
        children.forEach(element::appendChild)
    }

/**
 * Two activities of the extension that LinkedIn's manifest has to declare, since the extension ships none:
 * the Loki Patches settings screen, and an invisible activity that receives the `lokipatches://post/...`
 * links behind the rows added to a post's ⋯ menu.
 */
private val extensionActivitiesManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0)
            application.appendChild(
                manifest.node(
                    "activity",
                    "android:name" to "$EXT_JAVA_PACKAGE.SettingsActivity",
                    "android:exported" to "false",
                    "android:label" to "Loki Patches",
                    "android:theme" to "@android:style/Theme.DeviceDefault.DayNight",
                )
            )
            val postLinks = manifest.node(
                "intent-filter",
                children = listOf(
                    manifest.node("action", "android:name" to "android.intent.action.VIEW"),
                    manifest.node("category", "android:name" to "android.intent.category.DEFAULT"),
                    manifest.node("data", "android:scheme" to "lokipatches", "android:host" to "post"),
                ),
            )
            application.appendChild(
                manifest.node(
                    "activity",
                    "android:name" to "$EXT_JAVA_PACKAGE.PostActionActivity",
                    "android:exported" to "true",
                    "android:excludeFromRecents" to "true",
                    "android:noHistory" to "true",
                    "android:taskAffinity" to "",
                    "android:theme" to "@android:style/Theme.Translucent.NoTitleBar",
                    children = listOf(postLinks),
                )
            )
        }
    }
}

/** A fingerprint that pins a method exactly by class, name, return type and parameter types. */
private fun exactMethod(owner: String, method: String, returns: String, params: List<String>) =
    Fingerprint(definingClass = owner, name = method, returnType = returns, parameters = params)

// Launcher entry point: every LinkedIn icon and shortcut starts here.
private val mainActivityCreate = exactMethod(
    "Lcom/linkedin/android/infra/navigation/MainActivity;", "onCreate", "V", listOf("Landroid/os/Bundle;"),
)

// Builds the rows of the native "Me" side panel from the aggregated response.
private val mePanelRows = exactMethod(
    "$LI_NAV_PANEL/HomeNavPanelTransformer;", "transform", "Ljava/util/AbstractList;",
    listOf("$LI_NAV_PANEL/HomeNavPanelAggregateResponse;"),
)

// Binds one "Me" panel section and installs its own click listener.
private val mePanelSectionBind = exactMethod(
    "$LI_NAV_PANEL/presenter/HomeNavPanelSectionV2Presenter;", "onBind", "V",
    listOf("Landroidx/databinding/ViewDataBinding;"),
)

/**
 * Positions of every [opcode] instruction in the method, highest first: rewriting from the end leaves the
 * positions still to be visited untouched.
 */
private fun MutableMethod.positionsOf(opcode: Opcode): List<Int> {
    val code = implementation!!.instructions.toList()
    return code.indices.filter { code[it].opcode == opcode }.asReversed()
}

/*
 * The hooks below swap a return instruction for a call plus a fresh return, instead of inserting the call
 * before the return: a branch that targets the return directly would otherwise jump past the call.
 */

/** Ends every `return-object vX` of the method by passing vX through [hook] first. */
private fun MutableMethod.filterObjectReturns(hook: String) = positionsOf(Opcode.RETURN_OBJECT).forEach { at ->
    val reg = getInstruction<OneRegisterInstruction>(at).registerA
    replaceInstruction(at, "invoke-static/range { v$reg .. v$reg }, $hook")
    addInstructions(at + 1, "move-result-object v$reg\nreturn-object v$reg")
}

/** Runs [hook] on `this` (p0) right before every `return-void` of the method. */
private fun MutableMethod.callOnVoidReturns(hook: String) = positionsOf(Opcode.RETURN_VOID).forEach { at ->
    replaceInstruction(at, "invoke-static/range { p0 .. p0 }, $hook")
    addInstruction(at + 1, "return-void")
}

/**
 * Base of every other patch: bundles the extension, adds the Loki Patches entry points (a row in the "Me"
 * panel, a launcher shortcut) and lets the extension follow SduiFragment's lifecycle for the download button.
 */
val settingsPatch = bytecodePatch {
    dependsOn(extensionActivitiesManifestPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // The extension reports this as its own version (About screen, update check).
        exactMethod(EXT_SETTINGS, "patchesVersion", "Ljava/lang/String;", emptyList()).method.addInstructions(
            0,
            "const-string v0, \"${bundleVersion()}\"\nreturn-object v0",
        )

        // Shortcut registration and the "What's new" prompt hang off the main activity alone, so they keep
        // working when a LinkedIn update moves the Me panel or the SDUI classes.
        mainActivityCreate.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXT_SHORTCUT->onMainActivityCreated(Landroid/app/Activity;)V",
        )

        // The extension appends its row to whatever list the transformer hands back...
        mePanelRows.method.filterObjectReturns("$EXT_NAV_PANEL->addSettingsItem(Ljava/lang/Object;)Ljava/util/AbstractList;")
        // ...and takes over that row's click once the presenter has set LinkedIn's listener.
        mePanelSectionBind.method.callOnVoidReturns("$EXT_NAV_PANEL->onSectionBind(Ljava/lang/Object;)V")

        val fragmentHooks = listOf(
            Triple("onResume", emptyList(), "{ p0 .. p0 }, $EXT_SDUI_MEDIA->onFragmentResumed(Ljava/lang/Object;)V"),
            Triple("onPause", emptyList(), "{ p0 .. p0 }, $EXT_SDUI_MEDIA->onFragmentPaused(Ljava/lang/Object;)V"),
            Triple("onHiddenChanged", listOf("Z"), "{ p0 .. p1 }, $EXT_SDUI_MEDIA->onFragmentHiddenChanged(Ljava/lang/Object;Z)V"),
        )
        for ((callback, params, call) in fragmentHooks) {
            exactMethod(LI_SDUI_FRAGMENT, callback, "V", params).method.addInstruction(0, "invoke-static/range $call")
        }
    }
}

/**
 * The single funnel of server driven UI: each Component is turned into a view model here, and a null result
 * already means "draw nothing". Matched loosely on the trailing parameters, which are obfuscated types.
 */
private val sduiTransform = Fingerprint(
    definingClass = "Lcom/linkedin/sdui/transformer/impl/ComponentTransformer;",
    name = "doTransform",
    parameters = listOf(LI_COMPONENT, "L", "L", "L", "Z", "Z"),
)

/** Gives the extension two say-sos over every SDUI component: rewrite it, then optionally drop it. */
val sduiComponentFilterPatch = bytecodePatch {
    dependsOn(settingsPatch)

    execute {
        with(sduiTransform.method) {
            // Nothing is stored in the locals yet at offset 0, so v0 is free to use.
            val dropIfHidden = listOf(
                "invoke-static/range { p1 .. p1 }, $EXT_SDUI_FILTER->shouldHide(Ljava/lang/Object;)Z",
                "move-result v0",
                "if-eqz v0, :show",
                "const/4 v0, 0x0",
                "return-object v0",
            )
            addInstructionsWithLabels(0, dropIfHidden.joinToString("\n"), ExternalLabel("show", getInstruction(0)))

            // Placed ahead of the check above, so the filter sees the edited component (extra ⋯ menu rows).
            val rewrite = listOf(
                "invoke-static/range { p1 .. p1 }, $EXT_SDUI_FILTER->rewrite(Ljava/lang/Object;)Ljava/lang/Object;",
                "move-result-object p1",
                "check-cast p1, $LI_COMPONENT",
            )
            addInstructions(0, rewrite.joinToString("\n"))
        }
    }
}

/**
 * Version string the build stamps into the .mpp manifest, found by the bundle's "Name" attribute among all
 * manifests on the class path. "dev" when there is none (or it carries no Version).
 */
fun bundleVersion(): String {
    val manifests = object {}.javaClass.classLoader.getResources("META-INF/MANIFEST.MF")
    while (manifests.hasMoreElements()) {
        val main = manifests.nextElement().openStream().use { java.util.jar.Manifest(it).mainAttributes }
        if (main.getValue("Name") != "Loki Patches") continue
        return main.getValue("Version") ?: "dev"
    }
    return "dev"
}

/** Lets the extension know a feature was patched in: `Settings.<flag>()` now always answers true. */
fun BytecodePatchContext.markIncluded(method: String) {
    exactMethod(EXT_SETTINGS, method, "Z", emptyList()).method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}
