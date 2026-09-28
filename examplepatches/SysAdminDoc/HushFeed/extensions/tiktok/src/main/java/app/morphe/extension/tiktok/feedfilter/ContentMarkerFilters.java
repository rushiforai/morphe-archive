/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.feedfilter;

import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.settings.Settings;

import com.ss.android.ugc.aweme.feed.model.Aweme;

import java.util.Collection;

/**
 * One-predicate feed filters on markers TikTok attaches to a video.
 *
 * <p>The rule every filter here follows: a struct hanging off the video is not a marker. TikTok
 * attaches {@code PaidContentInfo}, {@code MixStruct} and {@code ModerationAigcInfo} to ordinary
 * videos with their fields left at defaults, so "the struct is not null" matches almost the whole
 * feed. Issue #5 is what that looks like from outside: with Hide series on, nine of ten videos in
 * a For You batch were removed as SeriesFilter and the feed never loaded a thing. Each predicate
 * reads a value inside the struct that only a real marker sets, and {@code markerSignal} is where
 * a new one goes.
 *
 * <p>Every accessor named here is an unobfuscated getter on {@code Aweme} in TikTok 46.2.3:
 * {@code getAigcInfo}, {@code getModerationAigcInfo}, {@code getBrandContentAccounts},
 * {@code getCommerceVideoAuthInfo}, {@code getCommercialVideoInfo}, {@code isPaidContent},
 * {@code getMPaidContentInfo}, {@code getMixInfo} and {@code getAuthor}. Names inside the
 * nested structs are read by reflection with fallbacks, since those were not all confirmed.
 */
public final class ContentMarkerFilters {
    private ContentMarkerFilters() {
    }

    /** Videos carrying TikTok's AI generated label. */
    public static class AiGeneratedFilter implements IFilter {
        @Override
        public boolean getEnabled() {
            return Settings.HIDE_AI_GENERATED.get();
        }

        @Override
        public boolean getFiltered(Aweme item) {
            Object aigc = Reflect.property(item, "getAigcInfo", "aigcInfo");
            if (aigc != null) {
                Object labelType = Reflect.property(aigc, "getAIGCLabelType", "aigcLabelType");
                if (labelType instanceof Number && ((Number) labelType).intValue() != 0) {
                    return true;
                }
            }
            Object moderation = Reflect.property(item, "getModerationAigcInfo", "moderationAigcInfo");
            // ModerationAigcInfo rides along on ordinary videos with every field at zero.
            return nonZero(moderation, "getModerationAigcLabelType", "moderationAigcLabelType")
                    || nonZero(moderation, "getModerationUserLabelStatus", "moderationUserLabelStatus");
        }
    }

    /** Videos marked as paid partnership or branded content. */
    public static class PaidPartnershipFilter implements IFilter {
        @Override
        public boolean getEnabled() {
            return Settings.HIDE_PAID_PARTNERSHIP.get();
        }

        @Override
        public boolean getFiltered(Aweme item) {
            return hasPaidPartnershipMarker(item);
        }
    }

    /**
     * TikTok 47.0.3 builds the visible Paid partnership label from AwemeCommerceStruct.
     * Earlier Hushfeed releases only read its generic isCommerce flag, which stays false on
     * branded posts and let the label through. The struct itself also exists on ordinary posts,
     * so each accepted signal must be non-default.
     */
    static boolean hasPaidPartnershipMarker(Aweme item) {
        if (item == null) return false;

        Object accounts = Reflect.property(item, "getBrandContentAccounts", "brandContentAccounts");
        if (accounts instanceof Collection && !((Collection<?>) accounts).isEmpty()) {
            return true;
        }

        Object commerce = Reflect.property(item, "getCommerceVideoAuthInfo", "commerceVideoAuthInfo");
        if (commerce != null) {
            if (Boolean.TRUE.equals(Reflect.property(commerce, "isBrandedContent", "isBrandedContent"))
                    || Boolean.TRUE.equals(Reflect.property(
                    commerce, "isBrandOrganicContent", "isBrandOrganicContent"))
                    || nonZero(commerce, "getBrandedContentType", "brandedContentType")
                    || nonZero(commerce, "getBrandOrganicType", "brandOrganicType")
                    || Reflect.string(
                    commerce, "getEcSearchBoBcLabelText", "ecSearchBoBcLabelText") != null
                    // Compatibility with the older generic commerce shape.
                    || Boolean.TRUE.equals(Reflect.property(commerce, "isCommerce", "isCommerce"))) {
                return true;
            }
        }

        return Reflect.string(item, "getCommercialVideoInfo", "commercialVideoInfo") != null;
    }

    /** Videos that belong to a paid Series. */
    public static class SeriesFilter implements IFilter {
        @Override
        public boolean getEnabled() {
            return Settings.HIDE_SERIES.get();
        }

        @Override
        public boolean getFiltered(Aweme item) {
            Object paid = Reflect.property(item, "isPaidContent", "isPaidContent");
            if (Boolean.TRUE.equals(paid)) {
                return true;
            }
            // PaidContentInfo is attached to ordinary recommended videos, so only a collection
            // behind it makes this a series: an id, a name, an episode number or the intro flag.
            Object info = Reflect.property(item, "getMPaidContentInfo", "mPaidContentInfo");
            if (info == null) {
                return false;
            }
            return nonZero(info, "getPaidCollectionId", "paidCollectionId")
                    || Reflect.string(info, "getCollectionName", "collectionName") != null
                    || isEpisode(Reflect.string(info, "getEpisodeNumber", "episodeNumber"))
                    || Boolean.TRUE.equals(Reflect.property(info, "isPaidCollectionIntro", "isPaidCollectionIntro"));
        }

        /**
         * Episodes count from one. TikTok 47.0.3 fills episode_num with "0" on every ordinary
         * profile post, which is the default and emptied every profile grid in issue #20.
         */
        private static boolean isEpisode(String episodeNumber) {
            if (episodeNumber == null) {
                return false;
            }
            try {
                return Long.parseLong(episodeNumber) > 0L;
            } catch (NumberFormatException notANumber) {
                return false;
            }
        }
    }

    /**
     * TikTok's short dramas: series sold by the episode after the first few free ones, and the
     * cards in the feed that promote them. A drama episode is a paid Series item as well, so Hide
     * Series takes it too; this switch takes the dramas and leaves other Series alone.
     *
     * <p>TikTok tells a drama from another Series by the Series' category (SeriesCategory
     * MINI_DRAMA, 1; DEFAULT is 0), so that is the test here. The drama text (mini_drama_info)
     * is not: it carries panel data every paid Series' player reads. A promotion card is a feed
     * item whose card type is 92, which is set when the item is parsed. TikTok only builds the
     * card's drama data (MiniDramaCardInfo) later, in DramaCardResponseProcessor, after this
     * filter's first pass over the list, so a built card with a card type or dramas also counts.
     */
    public static class DramaFilter implements IFilter {
        @Override
        public boolean getEnabled() {
            return Settings.HIDE_MINI_DRAMAS.get();
        }

        @Override
        public boolean getFiltered(Aweme item) {
            return isMiniDrama(item);
        }
    }

    /** SeriesCategory.MINI_DRAMA. */
    static final long MINI_DRAMA_CATEGORY = 1L;
    /** The CardInsertInfo card type DramaCardResponseProcessor turns into a drama card. */
    static final int DRAMA_CARD_TYPE = 92;

    static boolean isMiniDrama(Aweme item) {
        if (item == null) return false;
        Object insert = Reflect.property(item, "getCardInsertInfo", "cardInsertInfo");
        if (insert != null) {
            Object type = Reflect.property(insert, "getCardType", "cardType");
            if (type instanceof Number && ((Number) type).intValue() == DRAMA_CARD_TYPE) return true;
        }
        Object info = Reflect.property(item, "getMPaidContentInfo", "mPaidContentInfo");
        if (info == null) return false;
        Object category = Reflect.property(info, "getCategory", "category");
        if (category instanceof Number && ((Number) category).longValue() == MINI_DRAMA_CATEGORY) return true;
        Object card = Reflect.property(info, "getMiniDramaCardInfo", "miniDramaCardInfo");
        if (card == null) return false;
        Object dramas = Reflect.property(card, "getDramas", "dramas");
        return Reflect.string(card, "getCardType", "cardType") != null
                || (dramas instanceof Collection && !((Collection<?>) dramas).isEmpty());
    }

    /** Videos posted as part of a playlist ("Part 3 of ..."). */
    public static class PlaylistFilter implements IFilter {
        @Override
        public boolean getEnabled() {
            return Settings.HIDE_PLAYLIST_VIDEOS.get();
        }

        @Override
        public boolean getFiltered(Aweme item) {
            // TikTok 47's native playlist bar reads PlayListInfo directly from playlist_info.
            // Keep the older MixStruct route for retained builds that still populate it.
            Object playlist = Reflect.property(item, "getPlaylist_info", "playlist_info");
            if (playlist != null
                    && Reflect.string(playlist, "getMixId", "mixId") != null) {
                return true;
            }
            // A MixStruct with no id and no name is not a playlist the video belongs to.
            Object mix = Reflect.property(item, "getMixInfo", "mixInfo");
            if (mix == null) {
                return false;
            }
            return Reflect.string(mix, "getMixId", "mixId") != null
                    || Reflect.string(mix, "getMixName", "mixName") != null;
        }
    }

    /** Videos from verified accounts. */
    public static class VerifiedFilter implements IFilter {
        @Override
        public boolean getEnabled() {
            return Settings.HIDE_VERIFIED.get();
        }

        @Override
        public boolean getFiltered(Aweme item) {
            Object author = Reflect.property(item, "getAuthor", "author");
            if (author == null) {
                return false;
            }
            Object type = Reflect.property(author, "getVerificationType", "verificationType");
            if (type instanceof Number && ((Number) type).intValue() != 0) {
                return true;
            }
            return Reflect.string(author, "getCustomVerify", "customVerify") != null
                    || Reflect.string(author, "getEnterpriseVerifyReason", "enterpriseVerifyReason") != null;
        }
    }

    /**
     * True when the struct carries a number that a real marker sets and a default-constructed
     * one leaves at zero. A missing struct, a missing field and a zero all read the same: no
     * marker. This is the check that presence was standing in for.
     */
    static boolean nonZero(Object struct, String getter, String field) {
        if (struct == null) {
            return false;
        }
        Object value = Reflect.property(struct, getter, field);
        return value instanceof Number && ((Number) value).longValue() != 0L;
    }
}
