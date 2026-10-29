package app.czyeru.extension.tiktok.inbox;

import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collection;

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

    /**
     * Matches an item against the folded search query.
     */
    public static boolean matches(Object item, String query) {
        return matchItem(item, query, 0);
    }

    private static boolean matchItem(Object item, String query, int depth) {
        if (item == null || depth > 2) {
            return false;
        }

        if (item instanceof CharSequence) {
            return ListSearch.containsAllWords(item.toString(), query);
        }

        if (ListSearch.userMatches(item, query)) {
            return true;
        }

        if (ListSearch.commentMatches(item, query)) {
            return true;
        }

        if (ListSearch.awemeMatches(item, query)) {
            return true;
        }

        if (item instanceof Iterable) {
            for (Object child : (Iterable<?>) item) {
                if (matchItem(child, query, depth + 1)) {
                    return true;
                }
            }
            return false;
        }

        // Check common bean getter methods
        for (String getter : new String[]{"getUser", "getAweme", "getComment", "getText", "getContent", "getTitle"}) {
            try {
                Method method = item.getClass().getMethod(getter);
                method.setAccessible(true);
                Object val = method.invoke(item);
                if (val != null && matchItem(val, query, depth + 1)) {
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }

        // Reflectively inspect fields
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
                    Object val = field.get(item);
                    if (val == null) {
                        continue;
                    }

                    if (val instanceof CharSequence) {
                        if (ListSearch.containsAllWords(val.toString(), query)) {
                            return true;
                        }
                    } else if (val instanceof Iterable) {
                        for (Object child : (Iterable<?>) val) {
                            if (matchItem(child, query, depth + 1)) {
                                return true;
                            }
                        }
                    } else {
                        String typeName = type.getName();
                        if (typeName.startsWith("com.ss.android.ugc.aweme") || typeName.startsWith("com.bytedance")) {
                            if (matchItem(val, query, depth + 1)) {
                                return true;
                            }
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }

        return false;
    }
}
