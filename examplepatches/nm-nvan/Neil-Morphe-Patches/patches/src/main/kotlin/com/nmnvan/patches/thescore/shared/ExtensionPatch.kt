package com.nmnvan.patches.thescore.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_BUNDLE
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_PACKAGE

internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/fivemobile/thescore/ScoreApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Adds the extension code and gives it the application context before anything else runs.
 */
internal val sharedExtensionPatch = bytecodePatch {
    extendWith(EXTENSION_BUNDLE)

    execute {
        ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/Utils;->setContext(Landroid/content/Context;)V"
        )
    }
}

/**
 * Makes `isPatchIncluded()` of an extension class return true, so the settings screen
 * only shows settings of patches that were applied.
 */
internal fun BytecodePatchContext.setExtensionIsPatchIncluded(extensionClass: String) {
    mutableClassDefBy(extensionClass).methods.single { it.name == "isPatchIncluded" }.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """
    )
}
