package lab.analiti.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * PairIP's licence entry point, called from the patched `Application` subclass
 * during startup. Making it a no-op removes the "not genuine" Play Store redirect.
 *
 * Matched on a string literal rather than the (obfuscation-unstable) class name.
 */
internal object LicenseClientCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("Skipping license check in isolated process."),
    ),
)

/**
 * The Expert tier gate. Returns true only when at least one of the supplied
 * feature keys resolves to an entitled purchase.
 *
 * Matched structurally: array-length of the incoming `String[]`, then a call that
 * takes a `String` plus a `boolean`, inside a loop.
 */
internal object ExpertTierFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("[Ljava/lang/String;", "Z"),
    filters = listOf(
        app.morphe.patcher.opcode(com.android.tools.smali.dexlib2.Opcode.ARRAY_LENGTH),
        app.morphe.patcher.opcode(com.android.tools.smali.dexlib2.Opcode.AGET_OBJECT),
        app.morphe.patcher.opcode(com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC),
    ),
)

/**
 * The activity method that fills the `globalMessages` bar directly under the toolbar.
 *
 * That bar is shared, but the only writer in the app is this method, and it emits
 * exactly three kinds of text: the account/sign-in prompts, an "EXPERT" status line,
 * and an upgrade notice.
 *
 * Anchored on two literals that only occur together here, so it does not depend on
 * the (obfuscated) class or method name.
 */
internal object GlobalMessageBarFingerprint : Fingerprint(
    returnType = "V",
    // No parameter constraint: 2026.10.98554 uses F(Lu31;)V and 2026.10.98884
    // uses j()V. Both contain the two literals below and only one such method
    // exists in either APK.
    filters = listOf(
        string("action_user_account"),
        string("signIn_was_here"),
    ),
)
