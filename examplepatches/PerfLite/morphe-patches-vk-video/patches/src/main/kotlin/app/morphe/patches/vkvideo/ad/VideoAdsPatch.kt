package app.morphe.patches.vkvideo.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO

// VideoAdvertisementsRepositoryImpl
internal object VideoAdvertisementsRepoGFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoAdvertisementsRepositoryImpl.kt" },
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/vk/dto/common/InstreamAd;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "J"
    )
)

internal object VideoAdvertisementsRepoBFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoAdvertisementsRepositoryImpl.kt" },
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/vk/dto/common/AdSection;")
)

internal object VideoAdvertisementsRepoCFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoAdvertisementsRepositoryImpl.kt" },
    returnType = "V",
    parameters = listOf("Lcom/vk/libvideo/api/ad/VideoAdvertisementsRepository\$AdType;")
)

internal object VideoAdvertisementsRepoDFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoAdvertisementsRepositoryImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("J")
)

// VideoAdLayout (com.vk.libvideo.design.view.ad.VideoAdLayout)
internal object VideoAdLayoutAFingerprint : Fingerprint(
    definingClass = "Lcom/vk/libvideo/design/view/ad/VideoAdLayout;",
    returnType = "V",
    parameters = listOf("L", "L", "L", "L", "L", "Lkotlin/Lazy;")
)

// VideoFileOld (com.vk.dto.common.VideoFileOld): ad getters
internal object VideoFileOldInstreamAdFingerprint : Fingerprint(
    definingClass = "Lcom/vk/dto/common/VideoFileOld;",
    returnType = "Lcom/vk/dto/common/InstreamAd;",
    parameters = emptyList()
)

internal object VideoFileOldVideoAdInfoFingerprint : Fingerprint(
    definingClass = "Lcom/vk/dto/common/VideoFileOld;",
    returnType = "Lcom/vk/dto/common/VideoAdInfo;",
    parameters = emptyList()
)

internal object VideoFileOldOrdAdInfoFingerprint : Fingerprint(
    definingClass = "Lcom/vk/dto/common/VideoFileOld;",
    returnType = "Lcom/vk/dto/common/OrdAdInfo;",
    parameters = emptyList()
)

// VideoAttachment (com.vkontakte.android.attachments.VideoAttachment)
internal object VideoAttachmentBcFingerprint : Fingerprint(
    definingClass = "Lcom/vkontakte/android/attachments/VideoAttachment;",
    returnType = "Lcom/vkontakte/android/attachments/ShitAttachment;",
    parameters = emptyList()
)

internal object VideoAttachmentGcFingerprint : Fingerprint(
    definingClass = "Lcom/vkontakte/android/attachments/VideoAttachment;",
    returnType = "V",
    parameters = listOf("Lcom/vkontakte/android/attachments/ShitAttachment;")
)

// VideoGrowthTrapsManagerImpl
internal object VideoGrowthTrapsManagerAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthTrapsManagerImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "L", "Z", "L")
)

internal object VideoGrowthTrapsManagerBFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthTrapsManagerImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "L", "J", "Lcom/vk/video/growth/api/data/VideoGrowthCommunitySource;")
)

internal object VideoGrowthTrapsManagerCFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthTrapsManagerImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "J", "Lcom/vk/video/growth/api/data/VideoStandaloneUploadSource;")
)

internal object VideoGrowthTrapLauncherAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthTrapLauncherImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "L", "L", "L", "L", "L")
)

@Suppress("unused")
val videoAdsPatch = bytecodePatch(
    name = "Video ad-blocker",
    description = "Removes video ads (pre-rolls, mid-rolls, post-rolls, and overlay ad controls), suppresses promo recommendation snippets, and disables promo popups.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    execute {
        // Prevent VideoAdvertisementsRepositoryImpl from loading ads
        VideoAdvertisementsRepoGFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        VideoAdvertisementsRepoBFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        VideoAdvertisementsRepoCFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        VideoAdvertisementsRepoDFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        // Prevent VideoAdLayout from showing ad overlays in video player
        VideoAdLayoutAFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        // Return null for video file ad getters so player sees no attached ad streams
        VideoFileOldInstreamAdFingerprint.methodOrNull?.apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        }

        VideoFileOldVideoAdInfoFingerprint.methodOrNull?.apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        }

        VideoFileOldOrdAdInfoFingerprint.methodOrNull?.apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        }

        // Prevent VideoAttachment from returning or holding attached promo cards (ShitAttachment)
        VideoAttachmentBcFingerprint.methodOrNull?.apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        }

        VideoAttachmentGcFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        // Neutralize VideoGrowth traps
        VideoGrowthTrapsManagerAFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        VideoGrowthTrapsManagerBFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        VideoGrowthTrapsManagerCFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        VideoGrowthTrapLauncherAFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }
    }
}
