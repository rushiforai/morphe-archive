/*
 * YTAfterglow for Android.
 *
 * Component names and icon names from the Shorts and ads filters of Morphe
 * patches v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3), which
 * match them for YouTube 21.43.523, mapped onto the iOS tweak's Shorts roles.
 * Not an official Morphe file.
 */

package app.afterglow.extension.litho.filters;

import app.afterglow.extension.litho.ByteArrayFilterGroup;
import app.afterglow.extension.litho.ByteArrayFilterGroupList;
import app.afterglow.extension.litho.LithoComponent;
import app.afterglow.extension.litho.LithoFilter;
import app.afterglow.extension.litho.StringFilterGroup;

/**
 * The Shorts player overlay, for the iOS settings {@code hideShortsAvatars},
 * {@code hideShortsThanks}, {@code hideShortsSource}, {@code hideShortsChannelName},
 * {@code hideShortsDescription}, {@code hideShortsAudioTrack},
 * {@code hideShortsPromoCards}, {@code hideShortsInfoPanel} and
 * {@code hideShortsMetapanel}.
 *
 * <p>iOS gives each overlay view a role from its renderer's name
 * ({@code YTAGShortsElementPolicyCore.h}) and hides that view with everything
 * in it. Here each role is the Android component with the same name. The
 * channel bar is split the way the settings describe it: channel name hides
 * the bar's name (and, as iOS's "subscribebutton" rule does, its subscribe
 * button) but keeps the avatar, which only hideShortsAvatars hides. iOS checks
 * the avatar role before the channel role, and so does this filter.
 *
 * <p>Component names are server-sent templates and can only be confirmed on a
 * device; icon names are checked against the 21.43.523 resources.
 */
public final class ShortsOverlayFilter extends LithoFilter {
    private static final String CHANNEL_BAR = "reel_channel_bar.e";
    private static final String METAPANEL = "reel_metapanel.e";
    private static final String PLAYER_OVERLAY = "reel_player_overlay.e";

    private final StringFilterGroup channelBar;
    private final StringFilterGroup channelBarAvatar;
    private final StringFilterGroup subscribeButton;
    private final StringFilterGroup metapanel;
    private final StringFilterGroup carousel;
    private final ByteArrayFilterGroupList carouselChips = new ByteArrayFilterGroupList();
    private final StringFilterGroup suggestedAction;
    private final ByteArrayFilterGroupList suggestedActions = new ByteArrayFilterGroupList();
    /** Hosts of channel pictures, so a part that shows the avatar can be told apart in any language. */
    private final ByteArrayFilterGroup avatarImage =
            ByteArrayFilterGroup.always("yt3.ggpht.com", "yt3.googleusercontent.com");

    public ShortsOverlayFilter() {
        // iOS "pivotbutton" / "nativepivot": the round pivot button at the bottom of the action
        // bar, which shows the channel's or the sound's picture.
        StringFilterGroup pivotButton = new StringFilterGroup(
                "hideShortsAvatars",
                "reel_pivot_button",
                "reel_avatar"
        );

        // iOS "channelavatar": an avatar inside the channel bar is the avatar role, not the
        // channel role, so it goes with hideShortsAvatars alone.
        channelBarAvatar = new StringFilterGroup("hideShortsAvatars", CHANNEL_BAR);

        // iOS "channelname" / "creatorname" / "subscribebutton": the parts of the channel bar
        // other than the avatar.
        channelBar = new StringFilterGroup("hideShortsChannelName", CHANNEL_BAR);

        // iOS "subscribebutton" / "followbutton" is the channel role too, but only the overlay's.
        subscribeButton = new StringFilterGroup("hideShortsChannelName", "subscribe_button");

        // iOS "multiformatlink" / "fullvideolink": the link to the full video or another Short.
        StringFilterGroup multiFormatLink = new StringFilterGroup(
                "hideShortsSource",
                "reel_multi_format_link"
        );

        // iOS "videotitle" / "shortsdescription" / "shortsvideodescription".
        StringFilterGroup title = new StringFilterGroup(
                "hideShortsDescription",
                "shorts_video_title_item",
                "shorts_video_description",
                "shorts_description"
        );

        // iOS "soundmetadata" / "reelsound".
        StringFilterGroup soundMetadata = new StringFilterGroup(
                "hideShortsAudioTrack",
                "reel_sound_metadata"
        );

        // iOS "productsticker" / "reelpromotion".
        StringFilterGroup productSticker = new StringFilterGroup(
                "hideShortsPromoCards",
                "product_sticker.e",
                "reel_promotion"
        );

        // iOS hides the whole info panel and the whole metapanel.
        StringFilterGroup infoPanel = new StringFilterGroup(
                "hideShortsInfoPanel",
                "shorts_info_panel_overview",
                "reel_info_panel"
        );
        metapanel = new StringFilterGroup("hideShortsMetapanel", METAPANEL);

        // The chips row under the title: the full video link and the sound are told apart by
        // their icons.
        carousel = StringFilterGroup.anyOf(
                new String[] {"hideShortsSource", "hideShortsAudioTrack"},
                "reel_carousel.e"
        );
        carouselChips.addAll(
                new ByteArrayFilterGroup("hideShortsSource", "yt_fill_play_", "yt_fill_experimental_play_"),
                new ByteArrayFilterGroup("hideShortsAudioTrack", "yt_outline_audio_", "yt_outline_experimental_audio_")
        );

        // Suggested action buttons: Super Thanks (iOS "superthanks") and products (iOS
        // "shoppingcard" / "productcard"), told apart by icon or by the product list id.
        suggestedAction = StringFilterGroup.anyOf(
                new String[] {"hideShortsThanks", "hideShortsPromoCards"},
                "suggested_action.e"
        );
        suggestedActions.addAll(
                new ByteArrayFilterGroup("hideShortsThanks",
                        "yt_outline_dollar_sign_heart_", "yt_outline_experimental_dollar_sign_heart_"),
                new ByteArrayFilterGroup("hideShortsPromoCards",
                        "yt_outline_bag_", "yt_outline_experimental_bag_", "PAproduct_listZ")
        );

        addPathCallbacks(
                pivotButton,
                channelBarAvatar,
                channelBar,
                subscribeButton,
                multiFormatLink,
                title,
                soundMetadata,
                productSticker,
                infoPanel,
                metapanel,
                carousel,
                suggestedAction
        );
    }

    @Override
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        if (matchedGroup == channelBarAvatar || matchedGroup == channelBar) {
            int insideBar = matchIndex + CHANNEL_BAR.length();
            // The bar itself stays: its parts are decided one by one.
            if (component.pathIndexOf(".e", insideBar) < 0) return false;
            boolean avatar = component.pathIndexOf("avatar", insideBar) >= 0;
            if (matchedGroup == channelBarAvatar) return avatar;
            // A part that is, or holds, the avatar (its proto carries the channel picture) stays.
            return !avatar && !avatarImage.matches(component);
        }
        if (matchedGroup == subscribeButton) {
            // Other subscribe buttons, such as the watch page's, are not part of the overlay.
            return component.pathStartsWith(CHANNEL_BAR)
                    || component.pathStartsWith(METAPANEL)
                    || component.pathStartsWith(PLAYER_OVERLAY);
        }
        if (matchedGroup == metapanel) {
            // The metapanel element itself, with everything in it.
            return matchIndex == 0;
        }
        if (matchedGroup == carousel) {
            return carouselChips.matches(component);
        }
        if (matchedGroup == suggestedAction) {
            return suggestedActions.matches(component);
        }
        return true;
    }
}
