/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feed;

import app.morphe.extension.tiktok.download.SavedVideoMark;
import app.morphe.extension.tiktok.publishdate.AlwaysShowPublishDatePatch;

/**
 * What a profile grid cell shows for its view count. The grid's bind asks here right after TikTok
 * formats the count, and Show engagement rate, Always show publish date and Advanced downloads
 * each add their part while their switch is on: the rate after the count ("12.3K · 4.2%"), the
 * date on a line of its own under it, and a check mark before the count for a video saved here.
 * The count's view takes the cell's width less its icons and wraps, so the date gets its own line
 * rather than pushing the count and the rate over it.
 */
public final class ProfileGridCount {
    private ProfileGridCount() {
    }

    public static String text(String count, Object item) {
        if (count == null) {
            return null;
        }
        String text = SavedVideoMark.gridText(EngagementRate.gridCount(count, item), item);
        String date = AlwaysShowPublishDatePatch.gridDate(item);
        return date == null ? text : text + "\n" + date;
    }
}
