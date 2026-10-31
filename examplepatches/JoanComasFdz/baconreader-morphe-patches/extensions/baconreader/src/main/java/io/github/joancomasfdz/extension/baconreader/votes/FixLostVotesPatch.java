// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.votes;

import android.os.SystemClock;

import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.shared.Logger;

/**
 * A vote on a post made while its comments load was undone in the post list: the post that comes with the
 * comments was requested before the vote, and the app saves it to the list. The votes made since are applied
 * to it first. The vote itself reaches Reddit.
 */
@SuppressWarnings("unused")
public final class FixLostVotesPatch {
    /** Votes older than this are in any post Reddit sends now. */
    private static final long KEEP_MS = 5 * 60 * 1000;
    private static final int MAX_VOTES = 50;

    /** Thing name ("t3_abc") -> {direction (1, 0, -1), time}. */
    private static final Map<String, long[]> VOTES = new LinkedHashMap<String, long[]>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, long[]> eldest) {
            return size() > MAX_VOTES;
        }
    };

    private FixLostVotesPatch() {
    }

    /** Injected at the start of RedditApi.vote(Context, int dir, String id). */
    public static void onVote(int direction, String name) {
        if (name == null) return;
        synchronized (VOTES) {
            VOTES.put(name, new long[]{direction, SystemClock.elapsedRealtime()});
        }
    }

    /**
     * Injected in ThreadManager.CommentsListener.processInBackground, before the post that came with the
     * comments is saved to the post list.
     */
    public static void keepVote(Object link) {
        try {
            String name = (String) link.getClass().getField("name").get(link);
            long[] vote;
            synchronized (VOTES) {
                vote = VOTES.get(name);
            }
            if (vote == null || SystemClock.elapsedRealtime() - vote[1] > KEEP_MS) return;

            Boolean likes = (Boolean) link.getClass().getField("likes").get(link);
            int current = likes == null ? 0 : likes ? 1 : -1;
            int wanted = (int) vote[0];
            if (current == wanted) return; // Reddit already has it.
            int delta = wanted - current;
            link.getClass().getField("likes").set(link, wanted == 0 ? null : Boolean.valueOf(wanted > 0));
            link.getClass().getField("score").setInt(link, link.getClass().getField("score").getInt(link) + delta);
            link.getClass().getField("ups").setInt(link, link.getClass().getField("ups").getInt(link) + delta);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not keep the vote", ex);
        }
    }
}
