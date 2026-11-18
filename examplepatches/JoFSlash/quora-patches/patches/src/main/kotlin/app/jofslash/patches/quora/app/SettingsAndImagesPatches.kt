package app.jofslash.patches.quora.app

import app.jofslash.patches.quora.ads.PageFinishedFingerprint
import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.video.InitWebViewFingerprint
import app.jofslash.patches.quora.tabs.SetupTabsFingerprint
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SETTINGS_CLASS = "Lapp/jofslash/extension/quora/PatchSettings;"
private const val IMAGES_CLASS = "Lapp/jofslash/extension/quora/SaveImagesPatch;"
private const val TAB_BAR = "Lcom/quora/android/controls/QTabBar;"

@Suppress("unused")
val patchSettingsPatch = bytecodePatch(
    name = "Patch settings",
    description = "Long-press the Home tab, or open Settings > Morphe > Quora patches, to switch the page patches on and off and edit the filters, " +
            "without patching again. It also tells you when Quora changes its pages so that some patches stop working.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        SetupTabsFingerprint.method.apply {
            // Right after createTabs(), which has filled the TabLayout in the tabs field. Found in the
            // current instructions, since Start tab may have added some to the start of this method.
            val index = implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_DIRECT &&
                        ((it as ReferenceInstruction).reference as MethodReference).name == "createTabs"
            }
            if (index < 0) throw PatchException("createTabs call not found")
            addInstructions(
                index + 1,
                """
                    iget-object v0, p0, $TAB_BAR->tabs:Lcom/google/android/material/tabs/TabLayout;
                    invoke-static { v0 }, $SETTINGS_CLASS->attach(Landroid/view/View;)V
                """
            )
        }
        // Notices when Quora changes its feed so that page patches stop working, and says so here.
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, Lapp/jofslash/extension/quora/PageCheck;->onPageFinished(Landroid/webkit/WebView;)V"
        )
        // A "Morphe" section with a "Quora patches" entry on Quora's settings page opens the same dialog.
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $SETTINGS_CLASS->settingsEntry(Landroid/webkit/WebView;)V"
        )
        InitWebViewFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $SETTINGS_CLASS->bind(Landroid/webkit/WebView;)V"
        )
    }
}

internal object OpenImageFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/controls/FullScreenImageViewer;",
    name = "openImage",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;", "Landroid/view/View;"),
)

@Suppress("unused")
val saveImagesPatch = bytecodePatch(
    name = "Save images",
    description = "Long-press an image you opened full screen to save it to Pictures/Quora.",
    default = true
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        // p0 is the viewer, p1 the image URL.
        OpenImageFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $IMAGES_CLASS->onOpenImage(Ljava/lang/Object;Ljava/lang/String;)V"
        )
    }
}
