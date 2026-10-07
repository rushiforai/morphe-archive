package app.linkedin.patches.shared

import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val SETTINGS_CLASS = "$EXTENSION_PACKAGE/Settings;"
private const val SETTINGS_ACTIVITY = "app.linkedin.extension.SettingsActivity"
private const val SDUI_FILTER_CLASS = "$EXTENSION_PACKAGE/SduiComponentFilter;"
private const val SDUI_MEDIA_CLASS = "$EXTENSION_PACKAGE/SduiMediaDownload;"
private const val SDUI_FRAGMENT = "Lcom/linkedin/android/infra/sdui/view/SduiFragment;"

/**
 * Declares the Michii Patches settings activity. It is reached through a launcher shortcut
 * (long press the LinkedIn icon) and by long pressing the download button.
 */
private val settingsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", SETTINGS_ACTIVITY)
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "Michii Patches")
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            application.appendChild(activity)
        }
    }
}

private const val NAV_PANEL_CLASS = "$EXTENSION_PACKAGE/NavPanelPatch;"

/** HomeNavPanelTransformer.transform(HomeNavPanelAggregateResponse): the items of the native "Me" panel. */
private object NavPanelTransformFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelTransformer;",
    name = "transform",
    returnType = "Ljava/util/AbstractList;",
    parameters = listOf("Lcom/linkedin/android/home/navpanel/HomeNavPanelAggregateResponse;"),
)

/** HomeNavPanelSectionV2Presenter.onBind(ViewDataBinding): sets the section's click listener. */
private object NavPanelSectionBindFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/navpanel/presenter/HomeNavPanelSectionV2Presenter;",
    name = "onBind",
    returnType = "V",
    parameters = listOf("Landroidx/databinding/ViewDataBinding;"),
)

/**
 * Settings screen, reached from a "Michii Patches" item in the "Me" panel (plus a launcher
 * shortcut), and SduiFragment lifecycle hooks that drive the SDUI download button.
 */
val settingsPatch = bytecodePatch {
    dependsOn(settingsManifestPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Tell the extension which bundle version it belongs to (shown in About, used for updates).
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

        // Each return is replaced in place (rather than code inserted before it) because branches
        // may jump straight to the return instruction and would skip inserted code.

        // Add the "Michii Patches" item at every return of the Me panel transformer.
        NavPanelTransformFingerprint.method.apply {
            returnIndices(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(
                    index,
                    "invoke-static/range { v$register .. v$register }, $NAV_PANEL_CLASS->addSettingsItem(Ljava/lang/Object;)Ljava/util/AbstractList;"
                )
                addInstructions(
                    index + 1,
                    """
                        move-result-object v$register
                        return-object v$register
                    """
                )
            }
        }

        // Point the item's click at the settings screen, after the presenter sets its own listener.
        NavPanelSectionBindFingerprint.method.apply {
            returnIndices(Opcode.RETURN_VOID).forEach { index ->
                replaceInstruction(
                    index,
                    "invoke-static/range { p0 .. p0 }, $NAV_PANEL_CLASS->onSectionBind(Ljava/lang/Object;)V"
                )
                addInstruction(index + 1, "return-void")
            }
        }

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
        }
    }
}

/** Indices of all instructions with the opcode, last first so edits keep earlier indices valid. */
private fun MutableMethod.returnIndices(opcode: Opcode) =
    implementation!!.instructions.withIndex().filter { it.value.opcode == opcode }.map { it.index }.reversed()

/** Version of this patch bundle, from the manifest the build writes into the .mpp (Version attribute). */
private fun bundleVersion(): String {
    val loader = object {}.javaClass.classLoader
    for (url in loader.getResources("META-INF/MANIFEST.MF")) {
        val attributes = url.openStream().use { java.util.jar.Manifest(it).mainAttributes }
        if (attributes.getValue("Name") == "Michii Patches") {
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
