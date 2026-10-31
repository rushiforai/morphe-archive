// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.comments;

import android.os.Handler;
import android.os.Looper;

import com.onelouder.baconreader.connectivity.Tasks;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;
import app.morphe.extension.shared.Logger;

/**
 * <p>
 * Fewer "load more comments" in posts. Reddit returns about 200 comments by default and puts the replies that do
 * not fit behind "load more comments (N replies)", often for one or two low-ranked replies. The thread is
 * requested with the chosen number of comments (200 to 500), and the "load more" of up to the chosen number of
 * replies are loaded right after the thread.
 */
@SuppressWarnings({"unused", "unchecked"})
public final class LoadMoreCommentsPatch {
    /** Safety limit of automatic requests per thread. */
    private static final int MAX_AUTO_REQUESTS = 30;
    private static final String THREAD_MANAGER = "com.onelouder.baconreader.data.ThreadManager";
    private static final String MORE = "com.onelouder.baconreader.reddit.More";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** The "more" items already loaded or tried (a reload of the thread has new ones). */
    private static final Set<Object> TRIED = Collections.newSetFromMap(new WeakHashMap<>());
    /** Per loaded thread (its first comment): the automatic requests made. */
    private static final Map<Object, Integer> REQUESTS = new WeakHashMap<>();
    /** Comment lists loading a "more" automatically. */
    private static final Map<Object, Boolean> RUNNING = new WeakHashMap<>();

    private LoadMoreCommentsPatch() {
    }

    /**
     * Injected at the start of RedditApi.getComments: the limit of the request, 0 for Reddit's default (200); the
     * "Comments to load" setting instead (200 to 500).
     */
    public static int commentLimit(int limit) {
        return limit > 0 ? limit : CommentLimitPreference.limit();
    }

    /** Injected at the end of CommentsAdapter.processData, whenever the comment list gets its items. */
    public static void onItemsProcessed(final Object adapter) {
        if (Settings.AUTO_LOAD_MORE_COMMENTS.get() <= 0 || Boolean.TRUE.equals(RUNNING.get(adapter))) return;
        // After the list has shown the new items.
        MAIN.post(() -> loadNext(adapter));
    }

    private static void loadNext(final Object adapter) {
        try {
            int maxReplies = Settings.AUTO_LOAD_MORE_COMMENTS.get();
            if (maxReplies <= 0 || Boolean.TRUE.equals(RUNNING.get(adapter))) return;
            // The list loads its last "more" by itself when scrolled to the end.
            if (Boolean.TRUE.equals(field(adapter, "loading"))) {
                MAIN.postDelayed(() -> loadNext(adapter), 500);
                return;
            }
            Object threadKey = field(adapter, "threadKey");
            Object more = null;
            Object firstComment = null;
            Class<?> threadManager = Class.forName(THREAD_MANAGER);
            synchronized (threadManager) {
                Map<Object, Object> threads = (Map<Object, Object>) staticField(threadManager, "threads");
                Object thread = threads.get(threadKey);
                if (thread == null) return;
                Map<String, Integer> states = (Map<String, Integer>) field(thread, "states");
                List<Object> replies = new ArrayList<>((Collection<Object>) field(thread, "replies"));
                if (!replies.isEmpty()) firstComment = replies.get(0);
                for (Object reply : replies) {
                    if (!reply.getClass().getName().equals(MORE)) continue;
                    List<String> children = (List<String>) field(reply, "children");
                    String id = (String) field(reply, "id");
                    int count = (int) field(reply, "count");
                    // "Continue this thread" has no children: it is another page.
                    if (children == null || children.isEmpty() || count > maxReplies) continue;
                    if (TRIED.contains(reply) || states.containsKey(id)) continue; // Loaded or loading.
                    more = reply;
                    break;
                }
            }
            if (more == null || firstComment == null) return;
            Integer requests = REQUESTS.get(firstComment);
            if (requests != null && requests >= MAX_AUTO_REQUESTS) return;
            REQUESTS.put(firstComment, requests == null ? 1 : requests + 1);
            TRIED.add(more);
            RUNNING.put(adapter, true);

            Method loadMore = null;
            for (Method method : threadManager.getMethods()) {
                if (method.getName().equals("loadMore") && method.getParameterTypes().length == 5) loadMore = method;
            }
            if (loadMore == null) throw new NoSuchMethodException("ThreadManager.loadMore");
            loadMore.invoke(null, field(adapter, "activity"), adapter, threadKey, more,
                    new Tasks.OnCompleteListener<Object>() {
                        @Override
                        public void onComplete(Object data) {
                            RUNNING.remove(adapter);
                            try {
                                // Shows the comments, and processData continues with the next "more".
                                adapter.getClass().getMethod("requery").invoke(adapter);
                            } catch (Exception ex) {
                                Logger.printInfo(() -> "Could not show the loaded comments", ex);
                            }
                        }

                        @Override
                        public void onCancel(String error) {
                            RUNNING.remove(adapter);
                            Logger.printInfo(() -> "Could not load more comments: " + error);
                        }
                    });
        } catch (Exception ex) {
            RUNNING.remove(adapter);
            ErrorDialog.printException(() -> "Could not load more comments", ex);
        }
    }

    private static Object field(Object target, String name) throws Exception {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Object staticField(Class<?> type, String name) throws Exception {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }
}
