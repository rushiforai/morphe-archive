/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feedfilter;

import app.morphe.extension.tiktok.blockauthor.Reflect;

/**
 * Show only mutual friends on the Friends tab.
 *
 * <p>The Friends tab mixes in posts from accounts you follow that don't follow you back,
 * "People you may know" suggestions and reposts by strangers. Every entry names whose it is,
 * and that account's {@code User} carries TikTok's follow status toward it: 0 none, 1 you
 * follow them, 2 you follow each other. Only 2 is a friend, which is the test kveld9's strict
 * mode makes. A repost belongs to whoever reposted it, so a friend's repost of anyone's video
 * stays and a stranger's repost of a friend's video goes. A LIVE card belongs to the room's
 * owner. The signed-in account's own posts and reposts always stay.
 *
 * <p>An entry whose account or status can't be read is kept: a renamed member must leave the
 * tab as TikTok built it, not empty it.
 */
final class FriendsMutuals {
    /** The reason the Friends tab's report and debug log give for an entry this drops. */
    static final String REASON = "FriendsMutualsFilter";
    /** TikTok's FollowStatus for two accounts that follow each other. */
    static final int MUTUAL = 2;

    private FriendsMutuals() {
    }

    /** Whether a Friends tab entry (FriendsFeed or FriendsV3FeedModel) comes from a friend. */
    static boolean fromMutual(Object entry, String ownId) {
        Object user = ownerOf(entry);
        if (user == null) return true;
        String uid = Reflect.string(user, "getUid", "uid");
        if (ownId != null && ownId.equals(uid)) return true;
        Object status = Reflect.property(user, "getFollowStatus", "followStatus");
        if (!(status instanceof Number)) return true;
        return ((Number) status).intValue() == MUTUAL;
    }

    /** The account an entry is shown for: the reposter, the author, or the LIVE's host. */
    static Object ownerOf(Object entry) {
        if (entry == null) return null;
        Object repost = Reflect.readField(entry, "repostItem");
        if (repost != null) {
            Object reposter = Reflect.readField(repost, "reposter");
            if (reposter != null) return reposter;
        }
        Object aweme = FeedItemsFilter.friendsEntryAweme(entry);
        if (aweme != null) return Reflect.property(aweme, "getAuthor", "author");
        Object room = Reflect.readField(entry, "roomStruct");
        if (room == null) return null;
        Object live = Reflect.property(room, "getNewLiveRoomData", "newLiveRoomData");
        return Reflect.property(live, "getOwner", "owner");
    }
}
