package app.fakh.patches.linkedin.shared

import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val SETTINGS_CLASS = "$EXTENSION_PACKAGE/Settings;"
private const val SETTINGS_ACTIVITY = "app.fakh.extension.linkedin.SettingsActivity"
private const val SDUI_FILTER_CLASS = "$EXTENSION_PACKAGE/SduiComponentFilter;"
private const val SDUI_MEDIA_CLASS = "$EXTENSION_PACKAGE/SduiMediaDownload;"
private const val SDUI_FRAGMENT = "Lcom/linkedin/android/infra/sdui/view/SduiFragment;"

/**
 * Declares the Fakh Patches settings activity. It is reached from LinkedIn's Settings screen and by long
 * pressing the download button.
 */
private val settingsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", SETTINGS_ACTIVITY)
            // Exported for the fakhpatches://settings row on LinkedIn's Settings screen, which LinkedIn
            // opens with an implicit ACTION_VIEW intent (SduiSettingsEntry).
            activity.setAttribute("android:exported", "true")
            activity.setAttribute("android:label", "Fakh Patches")
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            val filter = document.createElement("intent-filter")
            listOf("action" to "android.intent.action.VIEW", "category" to "android.intent.category.DEFAULT").forEach { (tag, name) ->
                filter.appendChild(document.createElement(tag).apply { setAttribute("android:name", name) })
            }
            filter.appendChild(document.createElement("data").apply {
                setAttribute("android:scheme", "fakhpatches")
                setAttribute("android:host", "settings")
            })
            activity.appendChild(filter)
            application.appendChild(activity)
        }
    }
}

/**
 * Settings screen, reached from a "Fakh Patches" row on LinkedIn's Settings screen (SduiSettingsEntry), and
 * SduiFragment lifecycle hooks that drive the SDUI download button.
 */
val settingsPatch = bytecodePatch {
    dependsOn(settingsManifestPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Tell the extension which bundle version it belongs to (shown in the diagnostic report).
        Fingerprint(
            definingClass = SETTINGS_CLASS,
            name = "patchesVersion",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                const-string v0, "${bundleVersion()}"
                return-object v0
            """
        )

        fun lifecycle(name: String, parameters: List<String>) = Fingerprint(
            definingClass = SDUI_FRAGMENT,
            name = name,
            returnType = "V",
            parameters = parameters,
        ).method

        lifecycle("onResume", emptyList()).addInstruction(
            0, "invoke-static/range { p0 .. p0 }, $SDUI_MEDIA_CLASS->onFragmentResumed(Ljava/lang/Object;)V"
        )
        lifecycle("onPause", emptyList()).addInstruction(
            0, "invoke-static/range { p0 .. p0 }, $SDUI_MEDIA_CLASS->onFragmentPaused(Ljava/lang/Object;)V"
        )
        lifecycle("onHiddenChanged", listOf("Z")).addInstruction(
            0, "invoke-static/range { p0 .. p1 }, $SDUI_MEDIA_CLASS->onFragmentHiddenChanged(Ljava/lang/Object;Z)V"
        )
    }
}

/**
 * ComponentTransformer.doTransform(Component, TransformContext, ParentLayoutInfo,
 * ViewNameHierarchyNode, boolean, boolean). Every server driven UI component passes
 * through here, and it already returns null for components it does not render.
 */
private object SduiComponentTransformFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/sdui/transformer/impl/ComponentTransformer;",
    name = "doTransform",
    parameters = listOf("Lproto/sdui/components/core/Component;", "L", "L", "L", "Z", "Z"),
)

/** Lets the extension skip (hide) any server driven UI component. */
val sduiComponentFilterPatch = bytecodePatch {
    dependsOn(settingsPatch)

    execute {
        SduiComponentTransformFingerprint.method.apply {
            // At method entry every local register is free, so v0 can be used as scratch.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $SDUI_FILTER_CLASS->shouldHide(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :show
                    const/4 v0, 0x0
                    return-object v0
                """,
                ExternalLabel("show", getInstruction(0))
            )
            // Runs before the filter: edits components (the Fakh Patches row on the Settings screen, focus mode counts).
            addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $SDUI_FILTER_CLASS->rewrite(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, Lproto/sdui/components/core/Component;
                """
            )
        }
    }
}

/** Version of this patch bundle, from the manifest the build writes into the .mpp (Version attribute). */
/** Version of this patch bundle, read from the manifest of the .mpp. */
fun bundleVersion(): String {
    val loader = object {}.javaClass.classLoader
    for (url in loader.getResources("META-INF/MANIFEST.MF")) {
        val attributes = url.openStream().use { java.util.jar.Manifest(it).mainAttributes }
        if (attributes.getValue("Name") == "Fakh Patches") {
            return attributes.getValue("Version") ?: break
        }
    }
    return "dev"
}

/** Makes Settings.<method>() return true, marking a feature as patched in. */
fun BytecodePatchContext.markIncluded(method: String) {
    Fingerprint(
        definingClass = SETTINGS_CLASS,
        name = method,
        returnType = "Z",
        parameters = emptyList(),
    ).method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """
    )
}
