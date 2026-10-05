/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/chat/antidelete/Fingerprints.kt
 */
package app.morphe.patches.twitch.chat.antidelete

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object DeletedMessageClickableSpanCtorMethodFingerprint : Fingerprint(
    definingClass = "DeletedMessageClickableSpan;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V"
)

internal object SetHasModAccessMethodFingerprint : Fingerprint(
    definingClass = "DeletedMessageClickableSpan;",
    name = "setHasModAccess",
    returnType = "V",
    parameters = listOf("Z")
)

