// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.comments;

import android.content.Context;

import com.onelouder.baconreader.connectivity.Tasks;
import com.onelouder.baconreader.reddit.Comment;
import com.onelouder.baconreader.reddit.Listing;
import com.onelouder.baconreader.reddit.More;
import com.onelouder.baconreader.reddit.MoreChildrenResponse;
import com.onelouder.baconreader.reddit.RedditApi;
import com.onelouder.baconreader.reddit.Thing;
import com.onelouder.baconreader.reddit.ThingData;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.Logger;

/**
 * "load more comments" when Reddit refuses it. Reddit answers api/morechildren with 403 Blocked to apps since late
 * October 2026, but still serves threads: a nested "more" loads from its parent comment's thread, a top-level one
 * from each comment's thread, {@link #BATCH} at a time, with a new "more" for the rest. The app still asks
 * api/morechildren first, in case Reddit serves it again.
 */
@SuppressWarnings({"unused", "unchecked"})
public final class FixLoadMoreCommentsPatch {
    /** The single-comment threads a top-level "more" loads at a time. */
    private static final int BATCH = 50;
    /** Comments a thread asks for: a parent comment's replies, or one top-level comment's. */
    private static final int THREAD_LIMIT = 500;
    private static final String THREAD_MANAGER = "com.onelouder.baconreader.data.ThreadManager";

    /**
     * The "more" ThreadManager.loadMore is loading, and its thread's key, for getMoreChildren, which it calls right
     * away. Both run while ThreadManager is locked.
     */
    private static More loading;
    private static Object loadingThread;

    private FixLoadMoreCommentsPatch() {
    }

    /** What to do with an answer (java.util.function.Consumer needs Android 7). */
    private interface Done<T> {
        void accept(T value);
    }

    /** Injected at the start of ThreadManager.loadMore(context, owner, threadKey, more, listener). */
    public static void loading(Object threadKey, Object more) {
        loadingThread = threadKey;
        loading = more instanceof More ? (More) more : null;
    }

    /**
     * Injected at the start of RedditApi.getMoreChildren(context, linkId, sort, children, listener): the listener to
     * use instead, which gets Reddit's answer as before, unless Reddit refuses api/morechildren (403). Then the same
     * comments come from their threads, and the listener gets them as api/morechildren would have sent them.
     */
    public static Tasks.OnCompleteListener<MoreChildrenResponse> guard(
            Context context, String linkId, String sort, Tasks.OnCompleteListener<MoreChildrenResponse> listener) {
        More more = loading;
        Object threadKey = loadingThread;
        loading = null;
        loadingThread = null;
        if (context == null || linkId == null || listener == null || more == null) return listener;
        return new Guarded(context, linkId, sort, more, threadKey, listener);
    }

    private static final class Guarded extends Tasks.OnCompleteListener<MoreChildrenResponse> {
        private final Context context;
        private final String linkId;
        private final String sort;
        private final More more;
        private final Object threadKey;
        private final Tasks.OnCompleteListener<MoreChildrenResponse> app;

        Guarded(Context context, String linkId, String sort, More more, Object threadKey,
                Tasks.OnCompleteListener<MoreChildrenResponse> app) {
            this.context = context;
            this.linkId = linkId;
            this.sort = sort;
            this.more = more;
            this.threadKey = threadKey;
            this.app = app;
        }

        @Override
        public void processInBackground(MoreChildrenResponse response) {
            app.processInBackground(response);
        }

        @Override
        public void onComplete(MoreChildrenResponse response) {
            app.onComplete(response);
        }

        @Override
        public void onCancel(String error) {
            if (error == null || !error.contains("403")) {
                app.onCancel(error);
                return;
            }
            Logger.printInfo(() -> "api/morechildren refused (" + error + "): loading the comments from their threads");
            try {
                String parent = more.parent_id;
                if (parent != null && parent.startsWith("t1_")) loadFromParent(parent.substring(3), error);
                else loadTopLevel(error);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not load the comments from their threads", ex);
                app.onCancel(error);
            }
        }

        /**
         * A "more" under a comment: the comment's thread holds the comments it hides, its replies or further down,
         * which keep their depth below the comment.
         */
        private void loadFromParent(String parentId, String error) {
            Set<String> wanted = new HashSet<>(children());
            thread(parentId, listings -> {
                Comment parent = findComment(listings, parentId);
                if (parent == null) {
                    app.onCancel(error);
                    return;
                }
                List<Thing> found = new ArrayList<>();
                collect(parent.replies, wanted, found);
                Integer shown = depthInThread(parentId);
                int depth = shown != null ? shown : parent.depth;
                if (!found.isEmpty()) {
                    int by = depth - parent.depth;
                    if (by != 0) {
                        for (Thing thing : found) {
                            if (thing.data instanceof Comment) shiftBy((Comment) thing.data, by);
                        }
                    }
                    deliver(found);
                    return;
                }
                // Reddit leaves deleted and removed comments out of threads; api/morechildren still named them.
                // Their own threads show those Reddit still has.
                List<String> ids = children();
                loadEach(ids.subList(0, Math.min(BATCH, ids.size())), depth + 1, comments -> {
                    List<Thing> things = new ArrayList<>();
                    for (Comment comment : comments) things.add(thing("t1", comment));
                    deliver(things);
                });
            });
        }

        /** A "more" of top-level comments: their threads, {@link #BATCH} at a time, in their order, and a "more" for the rest. */
        private void loadTopLevel(String error) {
            List<String> children = children();
            List<String> batch = children.subList(0, Math.min(BATCH, children.size()));
            List<String> rest = new ArrayList<>(children.subList(batch.size(), children.size()));
            if (batch.isEmpty()) {
                app.onCancel(error);
                return;
            }
            loadEach(batch, 0, comments -> {
                List<Thing> things = new ArrayList<>();
                int count = 0;
                for (Comment comment : comments) {
                    count += 1 + replyCount(comment);
                    things.add(thing("t1", comment));
                }
                if (things.isEmpty() && rest.isEmpty()) {
                    app.onCancel(error);
                    return;
                }
                if (!rest.isEmpty()) {
                    More next = new More();
                    next.id = rest.get(0);
                    next.name = "t1_" + rest.get(0);
                    next.parent_id = more.parent_id;
                    next.children = rest;
                    next.count = Math.max(rest.size(), more.count - count);
                    things.add(thing("more", next));
                }
                deliver(things);
            });
        }

        /** The comments ids from their own threads, in their order, at depth, or none for those Reddit doesn't send. */
        private void loadEach(List<String> ids, int depth, Done<List<Comment>> done) {
            if (ids.isEmpty()) {
                done.accept(new ArrayList<>());
                return;
            }
            Comment[] loaded = new Comment[ids.size()];
            int[] answered = {0};
            for (int i = 0; i < ids.size(); i++) {
                int index = i;
                String id = ids.get(i);
                thread(id, listings -> {
                    Comment comment = findComment(listings, id);
                    if (comment != null) shiftBy(comment, depth - comment.depth);
                    loaded[index] = comment;
                    if (++answered[0] < ids.size()) return;
                    List<Comment> comments = new ArrayList<>();
                    for (Comment found : loaded) {
                        if (found != null) comments.add(found);
                    }
                    done.accept(comments);
                });
            }
        }

        private List<String> children() {
            return more.children != null ? more.children : new ArrayList<>();
        }

        /** How deep the comment id is in the thread the app shows, or null when it isn't there. */
        private Integer depthInThread(String id) {
            try {
                Class<?> threadManager = Class.forName(THREAD_MANAGER);
                synchronized (threadManager) {
                    Field threadsField = threadManager.getDeclaredField("threads");
                    threadsField.setAccessible(true);
                    Object thread = ((Map<Object, Object>) threadsField.get(null)).get(threadKey);
                    if (thread == null) return null;
                    Field repliesField = thread.getClass().getDeclaredField("replies");
                    repliesField.setAccessible(true);
                    Collection<Object> replies = (Collection<Object>) repliesField.get(thread);
                    if (replies == null) return null;
                    for (Object reply : replies) {
                        if (reply instanceof Comment && id.equals(((Comment) reply).id)) return ((Comment) reply).depth;
                    }
                    return null;
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not read the thread's comments", ex);
                return null;
            }
        }

        /** The thread of one comment of the post, as BaconReader asks for a post's comments. */
        private void thread(String commentId, Done<List<Listing>> done) {
            RedditApi.getComments(context, linkId, commentId, 0, sort, THREAD_LIMIT,
                    new Tasks.OnCompleteListener<List<Listing>>() {
                        @Override
                        public void onComplete(List<Listing> listings) {
                            try {
                                done.accept(listings);
                            } catch (Exception ex) {
                                Logger.printInfo(() -> "Could not load the comments from their threads", ex);
                                app.onCancel("Could not load the comments: " + ex);
                            }
                        }

                        @Override
                        public void onCancel(String error) {
                            Logger.printInfo(() -> "Could not load the thread of " + commentId + ": " + error);
                            done.accept(null);
                        }
                    });
        }

        /** What api/morechildren would have answered, to the app's own listener. */
        private void deliver(List<Thing> things) {
            MoreChildrenResponse response = new MoreChildrenResponse();
            response.json = new MoreChildrenResponse.MoreChildrenResponseJson();
            response.json.errors = new ArrayList<>();
            response.json.data = new MoreChildrenResponse.MoreChildrenResponseData();
            response.json.data.things = things;
            app.processInBackground(response);
            app.onComplete(response);
        }
    }

    /** The comment id of a thread's comments, or null. */
    private static Comment findComment(List<Listing> listings, String id) {
        if (listings == null || listings.size() < 2) return null;
        List<Comment> comments = listings.get(1).getChildren(Comment.class);
        if (comments == null) return null;
        for (Comment comment : comments) {
            if (id.equals(comment.id)) return comment;
        }
        return null;
    }

    /**
     * The topmost of replies and their replies that wanted names, in order: comments, with their replies, and "more"s
     * that hide some of them.
     */
    private static void collect(List<Thing> replies, Set<String> wanted, List<Thing> found) {
        if (replies == null) return;
        for (Thing reply : replies) {
            if (reply.data instanceof Comment) {
                Comment comment = (Comment) reply.data;
                if (wanted.contains(comment.id)) found.add(reply);
                else collect(comment.replies, wanted, found);
            } else if (reply.data instanceof More) {
                List<String> children = ((More) reply.data).children;
                if (children == null) continue;
                for (String child : children) {
                    if (wanted.contains(child)) {
                        found.add(reply);
                        break;
                    }
                }
            }
        }
    }

    private static Thing thing(String kind, ThingData data) {
        Thing thing = new Thing();
        thing.kind = kind;
        thing.data = data;
        return thing;
    }

    /**
     * Moves a comment, and its replies with it, by the given depth: a thread starts at its own comment, and
     * BaconReader indents a comment by its depth.
     */
    private static void shiftBy(Comment comment, int by) {
        if (by == 0) return;
        comment.depth += by;
        if (comment.replies == null) return;
        for (Thing reply : comment.replies) {
            if (reply.data instanceof Comment) shiftBy((Comment) reply.data, by);
        }
    }

    private static int replyCount(Comment comment) {
        int count = 0;
        if (comment.replies == null) return count;
        for (Thing reply : comment.replies) {
            if (reply.data instanceof Comment) count += 1 + replyCount((Comment) reply.data);
            else if (reply.data instanceof More) count += ((More) reply.data).count;
        }
        return count;
    }
}
