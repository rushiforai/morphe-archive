package io.github.kirby1997.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Tinder ("Privacy preference centre" / "TCF purposes" popup) does NOT use a
// third-party CMP SDK — Match Group ships its own TCF consent manager under
// com.tinder.cmp. So the universal OneTrust patch does nothing here; this is
// Tinder-specific.
//
// The prompt is enqueued by CmpLifecycleObserver.promptIfNeccesary(), compiled to
// the static Lcom/tinder/cmp/trigger/a;->d(Lcom/tinder/cmp/trigger/a;ZZ)Lkotlinx/coroutines/flow/j;.
// When its first boolean (should-prompt) is true and a foreground Activity exists it
// builds CmpLifecycleObserver$promptIfNeccesaryInput$1 and pushes it onto the trigger
// display queue; otherwise it returns the empty-flow singleton kotlinx.coroutines.flow.i
// (its :cond_0 branch) and no prompt is shown.
//
// We take that existing no-prompt branch unconditionally: return the empty flow at
// offset 0. The CMP UI never enqueues, so the consent popup never appears. Because
// the prompt is skipped, no TCF consent is granted (default = vendors not permitted),
// which is the privacy-preserving outcome. The empty-flow branch is a path the app
// already handles, so nothing downstream breaks.

object CmpPromptIfNecessaryFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/cmp/trigger/a;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lkotlinx/coroutines/flow/j;",
    parameters = listOf("Lcom/tinder/cmp/trigger/a;", "Z", "Z"),
)

@Suppress("unused")
val disableCmpPromptPatch = bytecodePatch(
    name = "Disable consent prompt",
    description = "Suppresses Tinder's in-house TCF consent popup (\"Privacy preference centre\") by taking " +
        "CmpLifecycleObserver's existing no-prompt branch unconditionally. No consent is granted, so " +
        "non-essential tracking stays unpermitted and the popup never appears.",
) {
    compatibleWith(Constants.TINDER)

    execute {
        CmpPromptIfNecessaryFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lkotlinx/coroutines/flow/i;->a:Lkotlinx/coroutines/flow/i;
                return-object p0
            """,
        )
    }
}
