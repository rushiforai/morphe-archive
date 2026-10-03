package com.facebook.feed.fragment;

import android.content.Intent;

import com.facebook.api.feedtype.FeedType;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.facebook.navigation.FeedsSubtabRoute;

/**
 * Stands in for the Feeds tab, under its kept name, as the patch leaves it: its filters, and the
 * handler its main screen hands an intent to, which asks the extension where it reads the last
 * feed type, hands its lookup's answer through the extension, and picks that filter when the
 * filters have it. A test can make the handler throw.
 */
public class FeedFiltersFragment {
    public final List<FeedType> filters = new ArrayList<>();
    public FeedType last = FeedType.TOP_STORIES;
    public int picked = -1;
    public int handled;
    public RuntimeException failHandle;

    public void handleDeeplinkFromMainActivity(Intent intent) {
        if (intent == null) return;
        handled++;
        if (failHandle != null) throw failHandle;
        FeedType asked = (FeedType) FeedsSubtabRoute.feedType(last);
        int index = FeedsSubtabRoute.filterFound(filters.indexOf(asked));
        if (index != -1) picked = index;
    }

    /** The patched onResume's end. */
    public void onResume() {
        FeedsSubtabRoute.feedsResumed(this);
    }
}
