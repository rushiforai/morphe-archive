package id.ikuradachi.patches.crunchyroll.player.upnext

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val upNextWindowPatch = bytecodePatch(
    name = "Up Next banner window",
    description = "Customizes how many seconds before the end of an episode the Up Next banner appears.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")

    val upNextWindowSeconds = intOption(
        key = "upNextWindowSeconds",
        default = 10,
        title = "Up Next banner window (seconds)",
        description = "Seconds before the end of playback when the Up Next banner appears. Set to 0 to suppress early appearance.",
        validator = { it != null && it >= 0 },
    )

    execute {
        val windowSeconds = requireNotNull(upNextWindowSeconds.value?.takeIf { it >= 0 }) {
            "Up Next banner window must be 0 or more seconds"
        }
        val windowMs = windowSeconds * 1000L
        val progressDenomBits = maxOf(windowSeconds * 1000f, 1f).toRawBits()

        // 1. Update visibility threshold in UpNextBannerViewModelImpl$isVisible.
        val ctorMatch = UpNextBannerViewModelConstructorFingerprint.matchAll(1..1).single()
        val visibilityClass = (ctorMatch.instructionMatches[3].instruction as ReferenceInstruction)
            .reference
            .toString()
        val visibilityMatch = createUpNextVisibilityWindowFingerprint(visibilityClass)
            .matchAll(1..1)
            .single()
        val windowLiteralMatch = visibilityMatch.instructionMatches[0]
        val windowReg = windowLiteralMatch.getInstruction<OneRegisterInstruction>().registerA
        visibilityMatch.method.replaceInstruction(
            windowLiteralMatch.index,
            "const-wide v$windowReg, 0x${windowMs.toString(16)}L",
        )

        // 2. Scale countdown progress ring denominator in UpNextBannerViewModelImpl$uiModel.
        val progressMatch = UpNextCountdownProgressFingerprint.matchAll(1..1).single()
        val progressLiteralMatch = progressMatch.instructionMatches[1]
        val progressReg = progressLiteralMatch.getInstruction<OneRegisterInstruction>().registerA
        progressMatch.method.replaceInstruction(
            progressLiteralMatch.index,
            "const v$progressReg, 0x${Integer.toHexString(progressDenomBits)}",
        )
    }
}
