package app.morphe.patches.pixiv.premium

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

val pixivPremiumPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Premium Features",
    description = "Emulates client-side Pixiv Premium membership status and removes the mute list limits.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)

    extendWith("extensions/pixiv.mpe")

    execute {
        val oauthUserClass = mutableClassDefBy("Ljp/pxv/android/domain/auth/entity/OAuthUser;")
        val isPremiumMethod = oauthUserClass.methods.first { it.name == "m0" && it.returnType == "Z" }
        isPremiumMethod.addInstructions(
            1,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )

        val profileApiClass = mutableClassDefBy("Ljp/pxv/android/data/userstate/remote/dto/ProfileApiModel;")
        val profileIsPremiumMethod = profileApiClass.methods.first { it.name == "f" && it.returnType == "Z" }
        profileIsPremiumMethod.addInstructions(
            1,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )

        // Constructor tail in 6.203.0: (..., isPremium: Z, isUsingCustomProfileImage: Z, Badge);
        // p20 is isPremium, p21 is the profile-image flag.
        val domainProfileClass = mutableClassDefByOrNull("Ljp/pxv/android/domain/commonentity/PixivProfile;")
        domainProfileClass?.let { cls ->
            val ctor = cls.methods.firstOrNull { it.name == "<init>" && it.parameterTypes.size == 22 }
            ctor?.addInstructions(
                1,
                "const/16 p20, 0x1"
            )
        }

        val muteSettingClass = mutableClassDefByOrNull("Ljp/pxv/android/data/mute/remote/dto/MuteSettingResponse;")
        muteSettingClass?.let { cls ->
            val limitMethod = cls.methods.firstOrNull { it.name == "a" && it.returnType == "I" }
            limitMethod?.addInstructions(
                1,
                """
                const/16 v0, 0x270f
                return v0
                """.trimIndent()
            )
        }

        val muteTextLimitClass = mutableClassDefByOrNull("Ljp/pxv/android/data/mute/remote/dto/MuteLimitForTextApiModel;")
        muteTextLimitClass?.let { cls ->
            for (name in listOf("a", "b")) {
                cls.methods.firstOrNull { it.name == name && it.returnType == "I" }?.addInstructions(
                    1,
                    """
                    const/16 v0, 0x270f
                    return v0
                    """.trimIndent()
                )
            }
        }

        // The browsing history is not patched here: Pixiv only serves it to premium accounts, so the
        // works the user opens are recorded locally by PixivHistoryPatch instead of being mapped into
        // the shared illust/novel list pipeline.
    }
}
