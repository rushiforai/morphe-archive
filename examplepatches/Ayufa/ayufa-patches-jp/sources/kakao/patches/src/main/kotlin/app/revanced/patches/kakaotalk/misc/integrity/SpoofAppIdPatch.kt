package app.revanced.patches.kakaotalk.misc.integrity

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.kakaotalk.misc.integrity.fingerprints.GetAppIdFingerprint
import app.revanced.patches.kakaotalk.misc.integrity.fingerprints.UaffacetidMethodFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

@Suppress("unused")
val spoofAppIdPatch = bytecodePatch(
    name = "Spoof App ID",
    description = "整合性チェックを回避するためにアプリIDを偽装します。（生体認証の回避など）",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        val apkKeyHash = "android:apk-key-hash:7MRbkCrB6DyL4XWKJX5nSS3jdFY"

        val method = GetAppIdFingerprint.method
        method.replaceInstructions(
            0,
            """
                const-string v0, "$apkKeyHash"
                return-object v0
            """.trimIndent()
        )

        val uaffacetidClass = UaffacetidMethodFingerprint.classDef
        uaffacetidClass.methods.forEach {
            if (it.returnType != "Ljava/lang/String;") return@forEach
            it.replaceInstructions(
                0,
                """
                    const-string v0, "$apkKeyHash"
                    return-object v0
                """.trimIndent()
            )
        }
    }
}