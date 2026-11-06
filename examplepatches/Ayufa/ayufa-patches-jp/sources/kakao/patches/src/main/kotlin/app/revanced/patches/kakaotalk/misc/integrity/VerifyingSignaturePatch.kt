package app.revanced.patches.kakaotalk.misc.integrity

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.revanced.patches.kakaotalk.misc.integrity.fingerprints.IntentResolveClientMethod
import app.revanced.patches.kakaotalk.misc.integrity.fingerprints.VerifyingSignatureFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

@Suppress("unused")
val verifyingSignaturePatch = bytecodePatch(
    name = "Disable verifying signature",
    description = "アプリの実行を妨げる署名検証チェックを無効化します。",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        VerifyingSignatureFingerprint.method.returnEarly(true)

        IntentResolveClientMethod.method.returnEarly(true)
    }
}