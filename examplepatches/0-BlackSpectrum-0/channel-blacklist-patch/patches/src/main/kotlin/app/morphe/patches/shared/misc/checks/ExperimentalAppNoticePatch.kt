package app.morphe.patches.shared.misc.checks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.settings.RecommendedAppVersionUtilsFingerprint
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/ExperimentalAppNoticePatch;"

internal fun experimentalAppNoticePatch(
    mainActivityFingerprint: Fingerprint,
    recommendedAppVersion: String
) = bytecodePatch(
    description = "Shows a use dialog message the first time a user launches an experimentally patched app",
) {
    execute {
        RecommendedAppVersionUtilsFingerprint.method.returnEarly(recommendedAppVersion)

        val alreadyHooked = mainActivityFingerprint.method.implementation?.instructions?.any { inst ->
            (inst as? ReferenceInstruction)?.reference?.toString()?.contains("showExperimentalNoticeIfNeeded") == true
        } == true
        if (!alreadyHooked) {
            mainActivityFingerprint.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->showExperimentalNoticeIfNeeded(Landroid/app/Activity;)V",
            )
        }
    }
}
