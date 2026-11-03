package app.czyeru.extension.tiktok.inbox;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

import app.czyeru.extension.shared.Logger;
import app.czyeru.extension.tiktok.search.ListSearch;
import app.czyeru.extension.tiktok.settings.Settings;

/**
 * Inbox "Activity and new followers" search bar.
 * <p>
 * Filters notifications in NotificationResultFragment ("Activity") and
 * InboxFollowerFragmentV2 ("New followers") by user, comment text, aweme caption,
 * or notification content.
 */
@SuppressWarnings("unused")
public final class InboxActivitySearchPatch {
    private InboxActivitySearchPatch() {
    }

    /**
     * Called at the end of NotificationResultFragment.onViewCreated.
     */
    public static void onNotificationListViewCreated(Object fragment, View root) {
        try {
            if (!Settings.INBOX_ACTIVITY_SEARCH.get()) {
                return;
            }

            View recyclerView = resolveRecyclerView(fragment, root);
            if (recyclerView != null) {
                recyclerView.post(() -> ListSearch.install(
                        searchAnchor(recyclerView),
                        recyclerView,
                        root,
                        "Search activity",
                        InboxActivitySearchPatch::matches
                ));
            } else if (root != null) {
                root.post(() -> {
                    View delayed = resolveRecyclerView(fragment, root);
                    if (delayed != null) {
                        ListSearch.install(
                                searchAnchor(delayed),
                                delayed,
                                root,
                                "Search activity",
                                InboxActivitySearchPatch::matches
                        );
                    }
                });
            }
        } catch (Throwable throwable) {
            Logger.printException(() -> "Inbox activity search hook failed", throwable);
        }
    }

    /**
     * Called at the end of InboxFollowerFragmentV2.onViewCreated.
     */
    public static void onFollowersListViewCreated(Object fragment, View root) {
        try {
            if (!Settings.INBOX_ACTIVITY_SEARCH.get()) {
                return;
            }

            View recyclerView = resolveRecyclerView(fragment, root);
            if (recyclerView != null) {
                recyclerView.post(() -> ListSearch.install(
                        recyclerView,
                        root,
                        "Search new followers",
                        InboxActivitySearchPatch::matches
                ));
            } else if (root != null) {
                root.post(() -> {
                    View delayed = resolveRecyclerView(fragment, root);
                    if (delayed != null) {
                        ListSearch.install(
                                delayed,
                                root,
                                "Search new followers",
                                InboxActivitySearchPatch::matches
                        );
                    }
                });
            }
        } catch (Throwable throwable) {
            Logger.printException(() -> "Inbox follower search hook failed", throwable);
        }
    }

    /**
     * Start of PowerAdapter.onBindViewHolder. TikTok loaded more items or refreshed.
     */
    public static void onBind(Object adapter) {
        ListSearch.onBind(adapter);
    }

    /**
     * The view the Activity search bar goes above. There the list is the direct child of
     * TikTok's pull-to-refresh "Spring layout" (a FrameLayout subclass) that lays out only its
     * header and one child, and throws with more children, so the bar goes above that layout.
     * (On New followers the list sits in a plain FrameLayout, so the bar goes above the list.)
     */
    private static View searchAnchor(View list) {
        ViewParent parent = list.getParent();
        return parent instanceof FrameLayout && parent.getClass() != FrameLayout.class
                ? (View) parent
                : list;
    }

    /**
     * Resolves the RecyclerView/PowerList from either the fragment or root view.
     */
    public static View resolveRecyclerView(Object fragment, View root) {
        if (fragment != null) {
            // Check well-known interface and fragment methods (qq, BX, zX).
            for (String name : new String[]{"qq", "BX", "zX"}) {
                try {
                    Method method = fragment.getClass().getMethod(name);
                    method.setAccessible(true);
                    Object result = method.invoke(fragment);
                    if (result instanceof View && isRecyclerView((View) result)) {
                        return (View) result;
                    }
                } catch (Throwable ignored) {
                }
            }

            // Scan any no-arg public or declared methods returning a View.
            for (Method method : fragment.getClass().getDeclaredMethods()) {
                if (method.getParameterTypes().length == 0 && View.class.isAssignableFrom(method.getReturnType())) {
                    try {
                        method.setAccessible(true);
                        Object result = method.invoke(fragment);
                        if (result instanceof View && isRecyclerView((View) result)) {
                            return (View) result;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
        }

        // Fallback to searching the root view hierarchy.
        if (root != null) {
            View found = findRecyclerView(root);
            if (found != null) {
                return found;
            }
        }

        return null;
    }

    /**
     * Recursively traverses a view hierarchy to locate a RecyclerView / PowerList.
     */
    public static View findRecyclerView(View view) {
        if (view == null) {
            return null;
        }
        if (isRecyclerView(view)) {
            return view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            int childCount = group.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = group.getChildAt(i);
                View match = findRecyclerView(child);
                if (match != null) {
                    return match;
                }
            }
        }
        return null;
    }

    /**
     * Checks if a view is a RecyclerView or PowerList without hardcoding package names.
     */
    public static boolean isRecyclerView(View view) {
        if (view == null) {
            return false;
        }
        for (Class<?> c = view.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            String name = c.getName();
            if ("androidx.recyclerview.widget.RecyclerView".equals(name)
                    || name.endsWith(".PowerList")
                    || name.contains("RecyclerView")) {
                return true;
            }
        }
        return false;
    }

    private static final ListSearch.TextCache itemTexts = new ListSearch.TextCache();

    /**
     * Matches an item against the folded search query. The texts are collected once per item
     * (deep reflection is slow) and are the same strings the matcher used to test one by one.
     */
    public static boolean matches(Object item, String query) {
        return ListSearch.anyTextMatches(item, query, itemTexts, InboxActivitySearchPatch::readTexts);
    }

    private static String[] readTexts(Object item) {
        List<String> texts = new ArrayList<>();
        collectTexts(item, 0, texts);
        return texts.toArray(new String[0]);
    }

    private static void addText(List<String> texts, Object value) {
        String folded = ListSearch.foldOrNull(value);
        if (folded != null && !folded.isEmpty()) {
            texts.add(folded);
        }
    }

    private static void addUserTexts(List<String> texts, Object user) {
        if (user == null) {
            return;
        }
        addText(texts, ListSearch.call(user, "getNickname"));
        addText(texts, ListSearch.call(user, "getUniqueId"));
        addText(texts, ListSearch.call(user, "getSignature"));
    }

    private static void collectTexts(Object item, int depth, List<String> texts) {
        if (item == null || depth > 2) {
            return;
        }

        if (item instanceof CharSequence) {
            addText(texts, item.toString());
            return;
        }

        // User: nickname, handle, bio. Comment: text and its author. Video: caption, title, creator.
        addUserTexts(texts, item);
        addText(texts, ListSearch.call(item, "getText"));
        addUserTexts(texts, ListSearch.call(item, "getUser"));
        addText(texts, ListSearch.call(item, "getDesc"));
        addText(texts, ListSearch.call(item, "getTitle"));
        Object author = ListSearch.call(item, "getAuthor");
        addText(texts, ListSearch.call(author, "getNickname"));
        addText(texts, ListSearch.call(author, "getUniqueId"));

        if (item instanceof Iterable) {
            for (Object child : (Iterable<?>) item) {
                collectTexts(child, depth + 1, texts);
            }
            return;
        }

        // Common bean getters.
        for (String getter : new String[]{"getUser", "getAweme", "getComment", "getText", "getContent", "getTitle"}) {
            Object value = ListSearch.call(item, getter);
            if (value != null) {
                collectTexts(value, depth + 1, texts);
            }
        }

        // Fields of TikTok's own classes.
        for (Class<?> clazz = item.getClass(); clazz != null && clazz != Object.class; clazz = clazz.getSuperclass()) {
            String className = clazz.getName();
            if (className.startsWith("android.") || className.startsWith("java.")) {
                break;
            }

            for (Field field : clazz.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                Class<?> type = field.getType();
                if (type.isPrimitive()) {
                    continue;
                }

                try {
                    field.setAccessible(true);
                    Object value = field.get(item);
                    if (value == null) {
                        continue;
                    }

                    if (value instanceof CharSequence) {
                        addText(texts, value.toString());
                    } else if (value instanceof Iterable) {
                        for (Object child : (Iterable<?>) value) {
                            collectTexts(child, depth + 1, texts);
                        }
                    } else {
                        String typeName = type.getName();
                        if (typeName.startsWith("com.ss.android.ugc.aweme") || typeName.startsWith("com.bytedance")) {
                            collectTexts(value, depth + 1, texts);
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }
    }
}
