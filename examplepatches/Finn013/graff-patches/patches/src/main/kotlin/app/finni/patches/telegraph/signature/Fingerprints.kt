package app.finni.patches.telegraph.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * p2021 self signature check in LaunchActivity.onResume:
 * SHA1(signature) is compared with p2021's certificate fingerprint and on mismatch the
 * "Your Telegraph Messenger is modified" dialog is shown.
 *
 *   invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
 *   move-result v7
 *   if-nez v7, :pass
 */
internal object SignatureCheckFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/LaunchActivity;",
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Ljava/security/MessageDigest;", name = "getInstance"),
        methodCall(definingClass = "Landroid/content/pm/Signature;", name = "toByteArray"),
        methodCall(definingClass = "Ljava/security/MessageDigest;", name = "digest"),
        methodCall(definingClass = "Ljava/lang/String;", name = "equals", location = MatchAfterWithin(6)),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
    ),
)

/**
 * Hidden package check in LaunchActivity.onResume: Base64-decoded package name
 * ("aXIucDIwMjEudGVsZWdyYXBo" = ir.p2021.telegraph) is compared with a literal and on mismatch
 * the app calls System.exit(1).
 *
 *   invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
 *   move-result v6
 *   if-nez v6, :pass
 */
internal object PackageCheckFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/LaunchActivity;",
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Landroid/util/Base64;", name = "decode"),
        methodCall(definingClass = "Ljava/lang/String;", name = "equalsIgnoreCase"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
        methodCall(definingClass = "Ljava/lang/System;", name = "exit"),
    ),
)
