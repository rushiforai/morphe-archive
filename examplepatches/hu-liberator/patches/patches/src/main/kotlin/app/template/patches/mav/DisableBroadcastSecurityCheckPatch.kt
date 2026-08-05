package app.template.patches.mav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import app.template.patches.shared.neutralizeExceptionThrows
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Verified against hu.mav.emmapp_merged.apk (originally JADX: Q2/c.java,
 * method onReceive(Context, Intent); confirmed still present under the same
 * class/method name as of app version 2.4.19-prod, but that's treated as
 * coincidental rather than reliable -- this app's own obfuscated
 * classes/methods get renamed independently on every build (this exact
 * situation broke several other fingerprints in this patch set that pinned
 * exact names), and `onReceive(Context, Intent)` alone is not unique: ~19
 * BroadcastReceiver subclasses share that exact signature in this app. This
 * fingerprint intentionally does NOT pin a definingClass or method name;
 * instead its `custom` block identifies the right one structurally, by
 * counting how many `new-instance ..., Ljava/lang/SecurityException;` sites
 * the method body contains (ten, verified below) -- a shape fingerprint that
 * survives renaming.
 *
 * Originally observed as the actual crash after the Play Integrity and Pairip
 * license-check patches were applied:
 *
 *   FATAL EXCEPTION: main
 *   java.lang.SecurityException
 *       at Q2.c.onReceive(SourceFile:760)
 *       at h2.a.handleMessage(SourceFile:136)
 *
 * This class is a BroadcastReceiver (paired with an IntentFilter via a small
 * wrapper class and dispatched through a Handler -- the internal
 * broadcast-based result-delivery mechanism some Play Core/Play Services
 * client code uses alongside its Task/Listener APIs). JADX fails to
 * decompile the method body (control-flow flattening matching the byte-XOR
 * string decoder used elsewhere in this app), so this was traced in raw
 * smali (via apktool) at the exact source line the stack trace named, which
 * lands on one of ten separate
 * `new-instance v0, Ljava/lang/SecurityException; ... throw v0` sites
 * scattered through the flattened dispatch -- almost certainly a check that
 * the broadcast's sender is genuinely the Play Store, which fails under a
 * side-loaded/sandboxed-Play environment.
 *
 * Since this is a single dedicated onReceive override (not shared across
 * unrelated features), blanking the whole method would be simpler, but would
 * also skip whatever legitimate dispatch happens for broadcasts that do pass.
 * Instead this neutralizes only the `throw` instructions constructing a
 * `SecurityException` (replacing each with `nop` in place, so no instruction
 * addresses shift -- this method's flattened dispatch is exactly the kind of
 * code where deleting an instruction can silently corrupt a jump/switch
 * target elsewhere), via the same technique used for the Play Integrity
 * verdict validation patch.
 */
private const val MIN_SECURITY_EXCEPTION_SITES = 5

object BroadcastSecurityGateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
    custom = { method, _ ->
        method.name == "onReceive" &&
            (method.implementation?.instructions?.count { insn ->
                insn.opcode == Opcode.NEW_INSTANCE &&
                    (insn as Instruction21c).reference.let { it is TypeReference && it.type == "Ljava/lang/SecurityException;" }
            } ?: 0) >= MIN_SECURITY_EXCEPTION_SITES
    },
)

@Suppress("unused")
val disableBroadcastSecurityCheckPatch = bytecodePatch(
    name = "Disable broadcast receiver security check",
    description = "Removes SecurityException throws gating a BroadcastReceiver's onReceive, which fail when the broadcast sender isn't verified as the real Play Store.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        neutralizeExceptionThrows(BroadcastSecurityGateFingerprint.method, "Ljava/lang/SecurityException;")
    }
}
