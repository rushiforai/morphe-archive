package app.morphe.patches.vk.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK

// Method names are obfuscated and change between VK releases, so fingerprints rely on
// parameter and return types, which R8 keeps.

// VideoAdvertisementsRepositoryImpl
// g: initiates instream/overlay ad loading
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

// b: sets ad section
internal object VideoAdvertisementsRepoBFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoAdvertisementsRepositoryImpl.kt" },
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/vk/dto/common/AdSection;")
)

// c: sets ad type
internal object VideoAdvertisementsRepoCFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoAdvertisementsRepositoryImpl.kt" },
    returnType = "V",
    parameters = listOf("Lcom/vk/libvideo/api/ad/VideoAdvertisementsRepository\$AdType;")
)

// d: loads banner/overlay ad data
internal object VideoAdvertisementsRepoDFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoAdvertisementsRepositoryImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("J")
)

// VideoAdLayout (com.vk.libvideo.design.view.ad.VideoAdLayout)
// a: binds and displays video ad overlay controls ("Реклама", redirect button, timers)
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
// Getter of ShitAttachment (promo snippet card under video)
internal object VideoAttachmentBcFingerprint : Fingerprint(
    definingClass = "Lcom/vkontakte/android/attachments/VideoAttachment;",
    returnType = "Lcom/vkontakte/android/attachments/ShitAttachment;",
    parameters = emptyList()
)

// Setter of ShitAttachment
internal object VideoAttachmentGcFingerprint : Fingerprint(
    definingClass = "Lcom/vkontakte/android/attachments/VideoAttachment;",
    returnType = "V",
    parameters = listOf("Lcom/vkontakte/android/attachments/ShitAttachment;")
)

// VideoGrowthTrapsManagerImpl (Video growth traps and superapp standalone bottomsheet / bombing popups)
internal object VideoGrowthTrapsManagerAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthTrapsManagerImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "L",
        "Z",
        "L"
    )
)

internal object VideoGrowthTrapsManagerBFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthTrapsManagerImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "L",
        "J",
        "Lcom/vk/video/growth/api/data/VideoGrowthCommunitySource;"
    )
)

internal object VideoGrowthTrapsManagerCFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthTrapsManagerImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "J",
        "Lcom/vk/video/growth/api/data/VideoStandaloneUploadSource;"
    )
)

// VideoGrowthTrapLauncherImpl
internal object VideoGrowthTrapLauncherAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthTrapLauncherImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/vk/video/growth/api/VideoGrowthTrapArguments;")
)

// VideoGrowthBombingControllerImpl
internal object VideoGrowthBombingControllerAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthBombingControllerImpl.kt" && !classDef.type.contains("\$") },
    returnType = "Z",
    parameters = emptyList()
)

// VideoGrowthListingControllerImpl
internal object VideoGrowthListingControllerBFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VideoGrowthListingControllerImpl.kt" && !classDef.type.contains("\$") },
    returnType = "Z",
    parameters = listOf("Z")
)

@Suppress("unused")
// BackgroundRestrictionProvider (blocks "Смотреть видео в фоне можно в отдельном приложении" / RuStore download prompts)
internal object BackgroundRestrictionProviderBFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "BackgroundRestrictionProvider.kt" &&
        !classDef.type.contains("\$") &&
        method.name == "b"
    },
    returnType = "L",
    parameters = listOf("L")
)

// TrapBottomSheet (dismisses any VK Video / RuStore modal bottomsheet immediately)
internal object TrapBottomSheetOnStartFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "TrapBottomSheet.kt" &&
        !classDef.type.contains("\$") &&
        method.name == "onStart"
    },
    returnType = "V",
    parameters = emptyList()
)

// TrapBannerDelegate (blocks promotional mini banners under video player)
internal object TrapBannerDelegateAFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "TrapBannerDelegate.kt" &&
        method.name == "a" &&
        method.parameters.size == 6
    },
    returnType = "V"
)

internal object TrapBannerDelegateBFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "TrapBannerDelegate.kt" &&
        method.name == "b" &&
        method.parameters.size == 8
    },
    returnType = "V"
)

internal object TrapBannerDelegateCFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "TrapBannerDelegate.kt" &&
        method.name == "c" &&
        method.returnType == "Z"
    },
    returnType = "Z"
)

// VideoGrowthTrapCoordinatorImpl (neutralizes trap coordinators from triggering background/download traps)
internal object VideoGrowthTrapCoordinatorBFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "VideoGrowthTrapCoordinatorImpl.kt" &&
        method.name == "b" &&
        method.returnType == "Z"
    },
    returnType = "Z"
)

internal object VideoGrowthTrapCoordinatorAFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "VideoGrowthTrapCoordinatorImpl.kt" &&
        method.name == "a" &&
        method.parameters.size == 2
    }
)

val videoAdsPatch = bytecodePatch(
    name = "Video ads",
    description = "Blocks video player in-stream advertisements (prerolls, midrolls, postrolls, ad overlays), attached promo ad cards below videos, and VK Video / RuStore download prompts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK)

    execute {
        // Neutralize VideoAdvertisementsRepositoryImpl methods so video ads are never loaded
        VideoAdvertisementsRepoGFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        VideoAdvertisementsRepoBFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        VideoAdvertisementsRepoCFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        VideoAdvertisementsRepoDFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Prevent VideoAdLayout from showing ad overlays in video player
        VideoAdLayoutAFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Return null for video file ad getters so player sees no attached ad streams
        VideoFileOldInstreamAdFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        VideoFileOldVideoAdInfoFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        VideoFileOldOrdAdInfoFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        // Prevent VideoAttachment from returning or holding attached promo cards (ShitAttachment)
        VideoAttachmentBcFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        VideoAttachmentGcFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Neutralize VideoGrowth traps and "Смотри в приложении VK Видео" popups / bottomsheets
        VideoGrowthTrapsManagerAFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        VideoGrowthTrapsManagerBFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        VideoGrowthTrapsManagerCFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        VideoGrowthTrapLauncherAFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        VideoGrowthBombingControllerAFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        VideoGrowthListingControllerBFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
BackgroundRestrictionProviderBFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        TrapBottomSheetOnStartFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    invoke-virtual { p0 }, Lcom/vk/core/ui/bottomsheet/ModalBottomSheet;->dismissAllowingStateLoss()V
                    return-void
                """
            )
        }

        TrapBannerDelegateAFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        TrapBannerDelegateBFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        TrapBannerDelegateCFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        VideoGrowthTrapCoordinatorBFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        VideoGrowthTrapCoordinatorAFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }
    }
}
