package app.bin0culars.patches.reddit.layout.hometabs

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.FEED
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/HomeFeedTabsPatch;"

@Suppress("unused")
val homeFeedTabsPatch =
    patch(
        name = "Home feed tabs",
        description = "Adds swipeable For You, Following and Popular tabs to the home feed. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "home_feed_tabs",
                    section = FEED,
                    title = "Home feed tabs",
                    summary =
                    "Shows For You, Following and Popular tabs under the search bar, like the older app. Swipe or tap to switch. Following needs you to be signed in. Restart Reddit after changing this.",
                    default = false,
                ),
            )

            val smali =
                """
                    invoke-static {}, $EXTENSION_CLASS->isEnabled()Z
                    move-result v0
                    if-eqz v0, :reddit_default
                    return v0
                    :reddit_default
                    nop
                """.trimIndent()

            PopularHomeTabFlagFingerprint.method.addInstructionsWithLabels(0, smali)
            ForYouTabsFlagFingerprint.method.addInstructionsWithLabels(0, smali)

            val variantSmali =
                """
                    invoke-static {}, $EXTENSION_CLASS->isEnabled()Z
                    move-result v0
                    if-eqz v0, :reddit_variant
                    sget-object v0, Lcom/reddit/feeds/domain/features/ForYouFollowingVariant;->FOR_YOU_NAME:Lcom/reddit/feeds/domain/features/ForYouFollowingVariant;
                    return-object v0
                    :reddit_variant
                    nop
                """.trimIndent()

            val swipeSmali =
                """
                    invoke-static {}, $EXTENSION_CLASS->isEnabled()Z
                    move-result p0
                    return p0
                """.trimIndent()

            ForYouFollowingVariantFingerprint.method.addInstructionsWithLabels(0, variantSmali)
            PagerSwipeEnabledFingerprint.method.addInstructions(0, swipeSmali)
        }
    }
