/*
 * YTAfterglow for Android.
 *
 * Ad component names from the ads filter of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which matches them for
 * YouTube 21.43.523, plus the names in the iOS tweak's ad list. Not an official
 * Morphe file.
 */

package app.afterglow.extension.litho.filters;

import app.afterglow.extension.litho.LithoComponent;
import app.afterglow.extension.litho.LithoFilter;
import app.afterglow.extension.litho.StringFilterGroup;

/**
 * Ads that YouTube sends as feed and page components, for the iOS settings
 * {@code noAds} ("Removes in-app ads", on by default) and {@code noPromotionCards}
 * (tweak "remove-ads").
 *
 * <p>iOS drops every Elements component that carries ad logging data, sections
 * whose first item is a promoted video, and (meant to) the ad layouts in its
 * list ({@code brand_promo}, {@code product_carousel}, {@code text_search_ad},
 * {@code feed_ad_metadata} and the like). Android cannot see the ad logging
 * flag at this point, so the ad components are matched by name: the reference
 * filter's list for 21.43.523 and iOS's list. Comments and regular video
 * lockups are never matched.
 *
 * <p>Video ads before and during playback are not components; they need the
 * separate player response hook (iOS's {@code YTIPlayerResponse} ad arrays,
 * ads playback coordinator and InnerTube ad context hooks).
 */
public final class AdsFilter extends LithoFilter {
    private final StringFilterGroup adLayouts;
    private final StringFilterGroup exceptions = StringFilterGroup.always(
            "|comment.",
            "comment_thread",
            "home_video_with_context",
            "library_recent_shelf",
            "related_video_with_context"
    );

    public AdsFilter() {
        StringFilterGroup carouselAd = new StringFilterGroup("noAds", "carousel_ad");

        adLayouts = new StringFilterGroup(
                "noAds",
                // Reference general ads.
                "_ad_with",
                "_buttoned_layout",
                "ads_video_with_context",
                "banner_text_icon",
                "brand_video_shelf",
                "brand_video_singleton",
                "carousel_footered_layout",
                "carousel_headered_layout",
                "compact_landscape_image_layout",
                "composite_concurrent_carousel_layout",
                "full_width_portrait_image_layout",
                "full_width_square_image_carousel_layout",
                "full_width_square_image_layout",
                "hero_promo_image",
                "image_button_group_layout",
                "landscape_image_carousel_layout",
                "landscape_image_wide_button_layout",
                "primetime_promo",
                "product_details",
                "shopping_timely_shelf.",
                "square_image_layout",
                "text_image_button_layout",
                "text_image_no_button_layout",
                "video_display_button_group_layout",
                "video_display_carousel_button_group_layout",
                "video_display_carousel_buttoned_short_dr_layout",
                "video_display_full_buttoned_short_dr_layout",
                "video_display_full_layout",
                "watch_metadata_app_promo",
                // Merchandise and in-video products (reference), also in iOS's list.
                "product_carousel",
                "shopping_carousel.e",
                "product_item",
                "products_in_video",
                "shopping_overlay.e",
                // iOS's list.
                "brand_promo",
                "product_engagement_panel",
                "text_search_ad",
                "feed_ad_metadata"
        );

        // noPromotionCards: the "Includes paid promotion" overlay, iOS's player_overlay_paid_content.
        // The player's time-bar label is a View (paid_promotion_label_text_view), not a component.
        StringFilterGroup paidPromotion = new StringFilterGroup("noPromotionCards", "paid_content_overlay");

        addIdentifierCallbacks(carouselAd);
        addPathCallbacks(adLayouts, paidPromotion);
    }

    @Override
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        if (matchedGroup == adLayouts) {
            return !exceptions.matches(component.path());
        }
        return true;
    }
}
