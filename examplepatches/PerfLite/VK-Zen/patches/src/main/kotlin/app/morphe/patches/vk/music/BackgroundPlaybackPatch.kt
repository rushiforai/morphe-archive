package app.morphe.patches.vk.music

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK
import app.morphe.patches.vk.shared.references
import com.android.tools.smali.dexlib2.iface.ClassDef

// Method names are obfuscated and change between VK releases, so fingerprints rely on
// parameter types and on what the method references.

private const val POPUP_DISPLAYER = "Lcom/vk/music/notifications/restriction/MusicRestrictionPopupDisplayer;"
private const val LAUNCH_CONTEXT = "Lcom/vk/music/common/MusicPlaybackLaunchContext;"
private const val POPUP_TYPE = "Lcom/vk/music/notifications/restriction/MusicRestrictionPopupDisplayer\$SubscriptionPopupType;"

// Static helpers on the interface, with default arguments
internal object MusicRestrictionPopupDisplayerDFingerprint : Fingerprint(
    definingClass = POPUP_DISPLAYER,
    returnType = "V",
    parameters = listOf(POPUP_DISPLAYER, "Ljava/lang/String;", LAUNCH_CONTEXT, "Ljava/lang/String;", POPUP_TYPE, "I")
)

internal object MusicRestrictionPopupDisplayerEFingerprint : Fingerprint(
    definingClass = POPUP_DISPLAYER,
    returnType = "V",
    parameters = listOf(
        POPUP_DISPLAYER,
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        LAUNCH_CONTEXT,
        "Ljava/lang/String;",
        POPUP_TYPE,
        "Ljava/lang/String;",
        "I"
    )
)

// BaseMusicRestrictionPopupDisplayer
private fun ClassDef.isBasePopupDisplayer() =
    sourceFile == "BaseMusicRestrictionPopupDisplayer.kt" && interfaces.contains(POPUP_DISPLAYER)

private fun basePopupDisplayerMethod(vararg parameters: String) = Fingerprint(
    custom = { _, classDef -> classDef.isBasePopupDisplayer() },
    returnType = "V",
    parameters = parameters.toList()
)

internal val BaseMusicRestrictionPopupDisplayerCFingerprint = basePopupDisplayerMethod(LAUNCH_CONTEXT)

internal val BaseMusicRestrictionPopupDisplayerFFingerprint = basePopupDisplayerMethod()

internal val BaseMusicRestrictionPopupDisplayerGFingerprint =
    basePopupDisplayerMethod("Lcom/vk/dto/music/MusicDynamicRestriction;", "L")

// Six parameters, their order changes between releases
internal object BaseMusicRestrictionPopupDisplayerHFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.isBasePopupDisplayer() &&
            method.parameterTypes.size == 6 &&
            method.parameterTypes[0].toString() == "I"
    },
    returnType = "V"
)

internal val BaseMusicRestrictionPopupDisplayerIFingerprint =
    basePopupDisplayerMethod("Lcom/vk/dto/music/MusicTrack;")

internal val BaseMusicRestrictionPopupDisplayerKFingerprint =
    basePopupDisplayerMethod("Ljava/lang/String;", LAUNCH_CONTEXT, "Ljava/lang/String;", POPUP_TYPE)

// Two (String)V methods: m shows the device limit popup ("deviceName="), l is the other one
internal object BaseMusicRestrictionPopupDisplayerLFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.isBasePopupDisplayer() && !method.references("deviceName=") },
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object BaseMusicRestrictionPopupDisplayerMFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.isBasePopupDisplayer() && method.references("deviceName=") },
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

// VkMusicRestrictionPopupDisplayer (opens BuyMusicSubscription popup bottomsheet)
internal object VkMusicRestrictionPopupDisplayerAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "VkMusicRestrictionPopupDisplayer.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        LAUNCH_CONTEXT,
        "Ljava/lang/String;",
        POPUP_TYPE,
        "Ljava/lang/String;"
    )
)

internal object MusicPrefsPlayedTimeFingerprint : Fingerprint(
    strings = listOf("played_time"),
    returnType = "J",
    parameters = listOf()
)

internal object MusicBackgroundRestrictionStrategyFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "MusicBackgroundRestrictionStrategy.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf()
)

internal object ScreenStateReceiverFingerprint : Fingerprint(
    definingClass = "Lcom/vk/music/broadcast/ScreenStateReceiver;",
    name = "onReceive"
)

// Screen-off handler: switches between PLAYING and PAUSED
internal object ScreenStateObserverImplDFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "ScreenStateObserverImpl.kt" &&
            method.references("PlayState;->PLAYING:", "PlayState;->PAUSED:")
    },
    returnType = "V",
    parameters = listOf()
)

// Pauses playback after the screen goes off
internal object ScreenStateObserverImplGFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "ScreenStateObserverImpl.kt" &&
            method.references("PlayState;->h()Z", "PlayState;->PAUSED:")
    },
    returnType = "V",
    parameters = listOf()
)

// Block music promo subscription banners in catalog (CatalogBlockVariant.PromoBannersSlider):
// pg registers the block in the MVI registry, qg registers its parser
internal object PromoBannerBlockComponentPgFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "PromoBannerBlockComponent.kt" &&
            !classDef.type.contains("\$") &&
            method.references("CatalogBlockVariant;->PromoBannersSlider:", "Lkotlin/LazyThreadSafetyMode;")
    },
    returnType = "V",
    parameters = listOf("L")
)

internal object PromoBannerBlockComponentQgFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "PromoBannerBlockComponent.kt" &&
            !classDef.type.contains("\$") &&
            method.references("CatalogBlockVariant;->PromoBannersSlider:") &&
            !method.references("Lkotlin/LazyThreadSafetyMode;")
    },
    returnType = "V",
    parameters = listOf("L")
)

@Suppress("unused")
val backgroundPlaybackPatch = bytecodePatch(
    name = "Unlock background music playback",
    description = "Removes background playback restrictions, disables screen-off pause, and disables restriction popups.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK)

    execute {
        // Disable subscription restriction popup dialogs (static helpers on interface)
        MusicRestrictionPopupDisplayerDFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        MusicRestrictionPopupDisplayerEFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Disable all restriction dialogs and subscription popups in BaseMusicRestrictionPopupDisplayer
        BaseMusicRestrictionPopupDisplayerCFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        BaseMusicRestrictionPopupDisplayerFFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        BaseMusicRestrictionPopupDisplayerGFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        BaseMusicRestrictionPopupDisplayerHFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        BaseMusicRestrictionPopupDisplayerIFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        BaseMusicRestrictionPopupDisplayerKFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        BaseMusicRestrictionPopupDisplayerLFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        BaseMusicRestrictionPopupDisplayerMFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Disable BuyMusicSubscription popup in VkMusicRestrictionPopupDisplayer
        VkMusicRestrictionPopupDisplayerAFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Disable background restriction strategy check so it never pauses playback
        MusicBackgroundRestrictionStrategyFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Always return 0 played background time so background timer never expires
        MusicPrefsPlayedTimeFingerprint.method.addInstructions(
            0,
            """
                const-wide/16 v0, 0x0
                return-wide v0
            """
        )

        // Disable screen-off broadcast handling in ScreenStateReceiver
        ScreenStateReceiverFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Disable screen-off playback restriction pause in ScreenStateObserverImpl
        ScreenStateObserverImplDFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        ScreenStateObserverImplGFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Disable registration of PromoBannersSlider in music catalog MVI registry and parser
        PromoBannerBlockComponentPgFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        PromoBannerBlockComponentQgFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
