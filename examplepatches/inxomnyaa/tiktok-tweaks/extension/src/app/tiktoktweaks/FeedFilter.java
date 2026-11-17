package app.tiktoktweaks;

import android.util.Log;
import com.ss.android.ugc.aweme.commerce.AwemeCommerceStruct;
import com.ss.android.ugc.aweme.feed.model.AnchorCommonStruct;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.AwemeSaaSExtKt;
import com.ss.android.ugc.aweme.feed.model.FeedItemList;
import com.ss.android.ugc.aweme.feed.model.live.FYPCommerceStruct;
import com.ss.android.ugc.aweme.feed.model.live.FeedRoomTag;
import com.ss.android.ugc.aweme.feed.model.live.FeedRoomTagList;
import com.ss.android.ugc.aweme.feed.model.live.LiveRoomStruct;
import com.ss.android.ugc.aweme.feed.model.live.NewLiveRoomStruct;
import com.ss.android.ugc.aweme.feed.model.live.RoomFeedCellStruct;
import com.ss.android.ugc.aweme.follow.presenter.FollowFeed;
import com.ss.android.ugc.aweme.follow.presenter.FollowFeedList;
import java.util.ArrayList;
import java.util.List;

/**
 * Feed filtering for TikTok 47.7.1.
 * Ad and Shop detection derive from niposch/revanced-tiktok-patches (GPL-3.0).
 */
public final class FeedFilter {
    private static final String TAG = "TikTokCustom";
    // getItems() is called repeatedly with the same list; skip rescanning it.
    private static volatile List<Aweme> lastClean;

    private FeedFilter() {}

    public static List<Aweme> getter(FeedItemList feed, List<Aweme> items) {
        List<Aweme> filtered = filter(items);
        if (feed != null && feed.items == items) feed.items = filtered;
        return filtered;
    }

    public static void feed(FeedItemList feed) {
        if (feed == null) return;
        feed.items = filter(feed.items);
        clearPreloadAds(feed);
    }

    public static void clearPreloadAds(FeedItemList feed) {
        if (feed != null && Prefs.removeAds()) feed.preloadAds = null;
    }

    public static void follow(FollowFeedList list) {
        if (list == null || list.items == null || list.items.isEmpty()) return;
        List<FollowFeed> items = list.items;
        ArrayList<FollowFeed> filtered = null;
        for (int i = 0; i < items.size(); i++) {
            FollowFeed entry = items.get(i);
            boolean remove = entry != null && entry.aweme != null && shouldRemove(entry.aweme);
            if (remove && filtered == null) {
                filtered = new ArrayList<>(items.size());
                filtered.addAll(items.subList(0, i));
            }
            if (!remove && filtered != null) filtered.add(entry);
        }
        if (filtered != null) list.items = filtered;
    }

    /** Copies only when removing, so fixed-size and cached lists stay safe. */
    private static List<Aweme> filter(List<Aweme> items) {
        if (items == null || items.isEmpty() || items == lastClean) return items;
        List<Aweme> result = scan(items);
        lastClean = result;
        return result;
    }

    private static List<Aweme> scan(List<Aweme> items) {
        ArrayList<Aweme> filtered = null;
        for (int i = 0; i < items.size(); i++) {
            Aweme item = items.get(i);
            boolean remove = item != null && shouldRemove(item);
            if (remove && filtered == null) {
                filtered = new ArrayList<>(items.size());
                filtered.addAll(items.subList(0, i));
            }
            if (!remove && filtered != null) filtered.add(item);
        }
        return filtered == null ? items : filtered;
    }

    private static boolean shouldRemove(Aweme item) {
        try {
            return (Prefs.removeAds() && isAd(item))
                || (Prefs.hideShop() && isShop(item))
                || (Prefs.hideLive() && isLive(item))
                || (Prefs.hideStory() && item.getIsTikTokStory())
                || (Prefs.hideImage() && isImage(item));
        } catch (Throwable t) {
            // A model change must never take the feed down with it.
            Log.w(TAG, "filter failed", t);
            return false;
        }
    }

    private static boolean isLive(Aweme item) {
        return AwemeSaaSExtKt.isLive(item) || item.isLiveReplay()
            || item.getRoomFeedCellStruct() != null || item.newLiveRoomData != null;
    }

    private static boolean isImage(Aweme item) {
        List<?> images = item.getImageInfos();
        return (images != null && !images.isEmpty()) || item.getPhotoModeImageInfo() != null;
    }

    private static boolean isAd(Aweme item) {
        if (item._isAd || item._isSoftAd || item.isAd() || item.isWithPromotionalMusic()) return true;
        AwemeCommerceStruct commerce = item.getCommerceVideoAuthInfo();
        if (commerce != null && (commerce.isBrandedContent() || commerce.isBrandOrganicContent())) return true;
        if (item.newLiveRoomData != null && hasDisclosure(item.newLiveRoomData.feedRoomTagList)) return true;
        RoomFeedCellStruct cell = item.getRoomFeedCellStruct();
        return cell != null && ((cell.newLiveRoomData != null && hasDisclosure(cell.newLiveRoomData.feedRoomTagList))
            || (cell.room != null && hasDisclosure(cell.room.feedRoomTagList)));
    }

    private static boolean isShop(Aweme item) {
        if (item.getProductsCount() > 0 || item.getIsLiveHasProduct()) return true;
        if (isShopRoom(item.newLiveRoomData)) return true;
        RoomFeedCellStruct cell = item.getRoomFeedCellStruct();
        if (cell != null && (isShopRoom(cell.newLiveRoomData) || isShopRoom(cell.room))) return true;
        List<?> products = item.getProductsInfo();
        if (products != null && !products.isEmpty()) return true;
        String url = item.getShareUrl();
        if (url != null && (url.contains("placeholder_product_id") || url.contains("shop_tab_feed")
                || url.contains("ec_shared_reflux"))) return true;
        List<AnchorCommonStruct> anchors = item.getAnchors();
        if (anchors == null) return false;
        for (AnchorCommonStruct anchor : anchors) {
            if (anchor == null) continue;
            switch (anchor.getType()) {
                // SHOP, SHOP_LINK, SHOP_WINDOW, SHOP_MIX, SHOWCASE.
                case 3: case 6: case 33: case 35: case 89: return true;
                default: break;
            }
        }
        return false;
    }

    private static boolean isShopRoom(NewLiveRoomStruct room) {
        return room != null && (room.hasCommerceGoods || hasProducts(room.fypCommerceStruct) || hasShopTag(room.feedRoomTagList));
    }

    private static boolean isShopRoom(LiveRoomStruct room) {
        return room != null && (room.hasCommerceGoods || hasProducts(room.fypCommerceStruct) || hasShopTag(room.feedRoomTagList));
    }

    private static boolean hasShopTag(FeedRoomTagList tags) {
        return tags != null && (hasShopTag(tags.firstTags) || hasShopTag(tags.subTags)
            || hasShopTag(tags.bottomTags) || hasShopTag(tags.bottomSubTags)
            || hasShopTag(tags.bcToggleTags) || hasShopTag(tags.boostToggleTags));
    }

    private static boolean hasShopTag(List<FeedRoomTag> tags) {
        if (tags == null) return false;
        for (FeedRoomTag tag : tags) if (tag != null && tag.id == 1000001L) return true;
        return false;
    }

    private static boolean hasDisclosure(FeedRoomTagList tags) {
        if (tags == null || tags.bcToggleTags == null) return false;
        for (FeedRoomTag tag : tags.bcToggleTags) {
            if (tag != null && tag.content != null && !tag.content.isEmpty()) return true;
        }
        return false;
    }

    private static boolean hasProducts(FYPCommerceStruct commerce) {
        return commerce != null && ((commerce.productNum != null && commerce.productNum > 0)
            || (commerce.popProductId != null && commerce.popProductId > 0));
    }
}
