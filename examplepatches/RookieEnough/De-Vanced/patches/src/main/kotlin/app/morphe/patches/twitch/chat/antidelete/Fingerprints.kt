/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/chat/antidelete/Fingerprints.kt
 */
package app.morphe.patches.twitch.chat.antidelete

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object DeletedMessageClickableSpanCtorMethodFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    custom = { _, classDef ->
        classDef.type.endsWith("DeletedMessageClickableSpan;")
    },
)

internal object SetHasModAccessMethodFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    custom = { method, classDef ->
        method.name == "setHasModAccess" && classDef.type.endsWith("DeletedMessageClickableSpan;")
    },
)

