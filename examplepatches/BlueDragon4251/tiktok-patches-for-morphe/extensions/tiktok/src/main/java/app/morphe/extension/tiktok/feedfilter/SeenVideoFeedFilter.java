package app.morphe.extension.tiktok.feedfilter;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.seen.SeenVideoHistory;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.FeedItemList;
import com.ss.android.ugc.aweme.follow.presenter.FollowFeed;
import com.ss.android.ugc.aweme.follow.presenter.FollowFeedList;

/** Separate BlueIT feed pass for locally seen video ids. */
public final class SeenVideoFeedFilter {
    private SeenVideoFeedFilter() {
    }

    public static void filter(FeedItemList feedItemList) {
        if (feedItemList == null || feedItemList.items == null) {
            return;
        }
        filterList(feedItemList.items, source -> source instanceof Aweme ? (Aweme) source : null);
    }

    public static void filter(FollowFeedList followFeedList) {
        if (followFeedList == null || followFeedList.mItems == null) {
            return;
        }
        filterList(
                followFeedList.mItems,
                source -> source instanceof FollowFeed ? ((FollowFeed) source).aweme : null
        );
    }

    public static void filterFinal(FollowFeedList followFeedList) {
        filter(followFeedList);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static void filterList(List list, AwemeExtractor extractor) {
        if (!Settings.HIDE_SEEN_VIDEOS.get() || list.isEmpty()) {
            return;
        }

        List snapshot = new ArrayList(list);
        List kept = new ArrayList(snapshot.size());
        int removed = 0;

        for (Object container : snapshot) {
            Aweme aweme = extractor.extract(container);
            if (aweme != null && SeenVideoHistory.shouldHide(aweme.getAid())) {
                removed++;
            } else {
                kept.add(container);
            }
        }

        if (removed == 0) {
            return;
        }

        list.clear();
        list.addAll(kept);

        if (BaseSettings.DEBUG.get()) {
            int removedFinal = removed;
            Logger.printInfo(() -> "[BlueIT SeenVideos] filtered " + removedFinal + " repeated feed item(s)");
        }
    }

    @FunctionalInterface
    private interface AwemeExtractor {
        Aweme extract(Object source);
    }
}
