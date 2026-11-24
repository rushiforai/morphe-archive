package app.southstar21.patches.instagram.misc.extension

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.shared.MainActivityConstructorFingerprint
import app.southstar21.patches.instagram.shared.MainActivityWindowFocusFingerprint
import com.android.tools.smali.dexlib2.Opcode

internal const val INSTAGRAM_HOOKS_CLASS = "Lapp/southstar21/extension/instagram/InstagramHooks;"

/**
 * Bundles the Instagram extension (extensions/instagram) into the app and calls its shared
 * hook, which sets up settings, adds the southstar21 Patches button to the profile page and
 * starts every included patch. Every Instagram patch depends on this.
 */
val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/instagram.mpe")

    execute {
        MainActivityWindowFocusFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $INSTAGRAM_HOOKS_CLASS->onMainActivityWindowFocusChanged(Landroid/app/Activity;)V",
        )

        // An earlier hook, at the end of the constructor, so patches can change views before
        // the first frame is drawn. The focus hook above stays as the fallback.
        MainActivityConstructorFingerprint.method.apply {
            val returns = instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            check(returns.isNotEmpty()) { "InstagramMainActivity.<init> has no return-void" }
            returns.asReversed().forEach { index ->
                addInstruction(
                    index,
                    "invoke-static { p0 }, $INSTAGRAM_HOOKS_CLASS->onMainActivityConstructed(Landroid/app/Activity;)V",
                )
            }
        }
    }
}
