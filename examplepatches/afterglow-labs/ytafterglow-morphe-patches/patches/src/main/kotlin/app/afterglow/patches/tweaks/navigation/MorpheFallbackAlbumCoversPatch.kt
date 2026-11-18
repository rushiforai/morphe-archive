/*
 * Copyright 2026 Morphe. Modified for Afterglow.
 * Afterglow for Android. Adapted from the image URL hook and "Bypass image
 * region restrictions" patch of Morphe patches v2.2.0 (GPLv3):
 * https://github.com/MorpheApp/morphe-patches, originally forked from ReVanced.
 * See NOTICE. Rewritten for patcher 2.1.0 and the default-OFF iOS fixAlbums key.
 * Only the image URL constructor is required; no upstream settings, request
 * callbacks or unrelated thumbnail patches are included. Not an official file.
 * Portions provided "AS IS" without express or implied warranties, including
 * merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal val morpheFallbackAlbumCoversHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val encoded = Fingerprint(definingClass = "Lgus;", name = "c",
            parameters = listOf(), returnType = "Ljava/lang/String;",
            strings = listOf("@#&=*+-_.,:!?()/~'%;\$[]"),
            filters = listOf(methodCall(smali = "Landroid/net/Uri;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")))
        val constructor = Fingerprint(classFingerprint = encoded, name = "<init>",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            parameters = listOf("Ljava/lang/String;", "Lgut;"), returnType = "V",
            filters = listOf(methodCall(smali = "Lcci;->aa(Ljava/lang/String;)V"),
                fieldAccess(smali = "Lgus;->e:Ljava/lang/String;", opcode = Opcode.IPUT_OBJECT,
                    location = MatchAfterImmediately())))
        val method = constructor.method
        val store = constructor.instructionMatches.last().instruction as TwoRegisterInstruction
        val thisRegister = method.implementation!!.registerCount - 3
        require(store.registerA == thisRegister + 1 && store.registerB == thisRegister) {
            "Native image request no longer stores its URL argument directly"
        }
        method.addInstructions(0, """
            invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/navigation/MorpheFallbackAlbumCovers;->overrideImageURL(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """)
        println("Afterglow temporary album-image adapter: ${method.smali}")
    }
}
