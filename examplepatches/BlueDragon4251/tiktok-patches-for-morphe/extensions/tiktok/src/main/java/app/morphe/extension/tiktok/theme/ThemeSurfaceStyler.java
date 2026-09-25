package app.morphe.extension.tiktok.theme;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.Locale;
import java.util.WeakHashMap;

/**
 * Applies BlueIT theme palettes to concrete TikTok 46.7.3 UI surfaces.
 *
 * This implementation is deliberately conservative and fail-open. TikTok mixes classic Views,
 * Compose hosts and heavily obfuscated containers, so broad geometry-only recoloring can easily
 * mistake feed overlays or a DM composer for a settings/list surface. The styler therefore uses a
 * bounded iterative walk, strong screen hints and only narrow geometry fallbacks.
 */
@SuppressWarnings({"deprecation", "unused"})
final class ThemeSurfaceStyler {
    private static final int MAX_SCAN_NODES = 1800;
    private static final int MAX_STYLE_NODES = 2200;
    private static final int MAX_DYNAMIC_HINT_NODES = 420;
    private static final long DYNAMIC_SCROLL_DEBOUNCE_MS = 90L;
    private static final long DYNAMIC_REAPPLY_MIN_INTERVAL_MS = 140L;
    private static final WeakHashMap<View, DynamicListScrollWatcher> DYNAMIC_LIST_WATCHERS =
            new WeakHashMap<>();

    private ThemeSurfaceStyler() {}

    static void apply(
            Activity activity,
            String preset,
            int background,
            int surface,
            int accent,
            int text,
            int secondaryText,
            int divider,
            int cornerRadiusDp
    ) {
        // Theme Engine must never be capable of taking TikTok down. In particular this catches
        // LinkageError/VerifyError/StackOverflowError/OOM-adjacent view failures that an
        // Exception-only guard would miss.
        try {
            if (activity == null || activity.isFinishing() || activity.getWindow() == null) return;

            View decor = activity.getWindow().getDecorView();
            if (decor == null || decor.getWidth() <= 0 || decor.getHeight() <= 0) return;

            int rootWidth = decor.getWidth();
            int rootHeight = decor.getHeight();
            if (ThemeNativeTargets.hasChat(decor)) return;
            ScreenHints hints = scanScreenHints(decor, rootHeight);
            updateDynamicListWatcher(activity, decor, hints);

            ArrayDeque<Node> queue = new ArrayDeque<>();
            queue.add(new Node(decor, false, false, false, false, false));

            int styledNodes = 0;
            while (!queue.isEmpty() && styledNodes++ < MAX_STYLE_NODES) {
                Node node = queue.removeFirst();
                View view = node.view;
                if (ThemeNativeTargets.isOwned(view)) continue;
                if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) {
                    continue;
                }

                if (!(view instanceof ViewGroup)) {
                    if (node.textContext) {
                        styleLeaf(view, accent, text, secondaryText, divider);
                    }
                    continue;
                }

                ViewGroup group = (ViewGroup) view;
                String combined = resourceEntryName(group) + " " + className(group);

                // Custom/native DM bubbles and the composer own their complete subtrees. This also
                // prevents a third-party TikTok bubble style from being resized/recolored by BlueIT.
                if (hints.chatLike
                        && (isExplicitChatBubble(combined) || isChatComposer(combined))) {
                    continue;
                }

                boolean drawer = !hints.chatLike
                        && isLikelyDrawer(group, combined, rootWidth, rootHeight);
                boolean settingsRoot = !node.insideSettings
                        && hints.settingsLike
                        && isLargeScreenContainer(group, rootWidth, rootHeight);
                boolean inboxRoot = !hints.chatLike
                        && !node.insideInbox
                        && hints.inboxLike
                        && isLargeScreenContainer(group, rootWidth, rootHeight);
                boolean bottomNavigation = !hints.chatLike
                        && isBottomNavigation(group, combined, rootWidth, rootHeight);
                boolean sheet = isExplicitSheet(combined);

                boolean nowInsideDrawer = node.insideDrawer || drawer;
                boolean nowInsideSettings = node.insideSettings || settingsRoot;
                boolean nowInsideInbox = node.insideInbox || inboxRoot;

                // Only one screen root is painted. Nested full-size containers inherit the state
                // instead of repeatedly walking/repainting the entire subtree.
                if (settingsRoot || inboxRoot) {
                    try {
                        group.setBackgroundColor(opaque(background));
                    } catch (Throwable ignored) {
                    }
                }

                // Activity/follower recommendation screens in 46.7.3 can compose a dark header and
                // a separately inflated stock-light list container. Paint large nested list sections
                // as page background as well so a later fragment/list bind cannot leave white-on-
                // white content below an otherwise themed screen.
                boolean inboxSection = nowInsideInbox
                        && !inboxRoot
                        && !bottomNavigation
                        && isLargeListSection(group, rootWidth, rootHeight);
                if (inboxSection) {
                    try {
                        group.setBackgroundColor(opaque(background));
                    } catch (Throwable ignored) {
                    }
                }

                boolean settingsCard = nowInsideSettings
                        && !settingsRoot
                        && !node.parentCardStyled
                        && isCardContainer(group, rootWidth, rootHeight);
                boolean inboxRow = nowInsideInbox
                        && !inboxRoot
                        && !node.parentCardStyled
                        && isListRow(group, rootWidth, rootHeight);
                boolean drawerSection = nowInsideDrawer
                        && !drawer
                        && !node.parentCardStyled
                        && isDrawerSection(group, rootWidth, rootHeight);

                boolean themedSurface = drawer
                        || bottomNavigation
                        || sheet
                        || settingsCard
                        || inboxRow
                        || drawerSection;

                if (themedSurface) {
                    int radius = cornerRadiusDp;
                    if (inboxRow) radius = Math.min(22, Math.max(12, cornerRadiusDp));
                    if (settingsCard) radius = Math.min(26, Math.max(12, cornerRadiusDp));
                    if (drawer) radius = 0;
                    applySurface(group, preset, surface, divider, radius);
                }

                boolean textContext = node.textContext
                        || themedSurface
                        || nowInsideSettings
                        || nowInsideInbox
                        || nowInsideDrawer;

                // Style the group itself if it happens to be a specialized TextView-like subclass,
                // then let each child get exactly one visit through the bounded queue.
                if (textContext) {
                    styleLeaf(group, accent, text, secondaryText, divider);
                }

                boolean childParentCardStyled = node.parentCardStyled
                        || settingsCard
                        || inboxRow
                        || drawerSection;

                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    queue.addLast(new Node(
                            child,
                            nowInsideDrawer,
                            nowInsideSettings,
                            nowInsideInbox,
                            childParentCardStyled,
                            textContext
                    ));
                }
            }
        } catch (Throwable ignored) {
            // Fail open. A partially applied visual theme is always preferable to a TikTok crash.
        }
    }

    private static ScreenHints scanScreenHints(View root, int rootHeight) {
        ScreenHints hints = new ScreenHints();
        ArrayDeque<ScanNode> queue = new ArrayDeque<>();
        queue.add(new ScanNode(root, 0));

        int visited = 0;
        while (!queue.isEmpty() && visited++ < MAX_SCAN_NODES) {
            ScanNode node = queue.removeFirst();
            View view = node.view;
            if (view == null || view.getVisibility() != View.VISIBLE) continue;

            String resource = resourceEntryName(view);
            String className = className(view);
            String combined = resource + " " + className;

            if (containsAny(combined,
                    "chat_detail", "chatdetail", "chat_room", "chatroom",
                    "conversation_detail", "conversationdetail", "message_detail", "messagedetail",
                    "im_chat", "chat_fragment", "conversation_fragment",
                    "message_input", "chat_input", "input_panel",
                    "message_composer", "chat_composer", "message_edit", "chat_edit")) {
                hints.chatLike = true;
            }

            if (containsAny(combined,
                    "inbox", "message_list", "session_list", "chat_list",
                    "notification_list", "notice_list", "im_session", "inbox_list",
                    "activity_list", "activity_page", "notification_page", "follower_list")) {
                hints.inboxLike = true;
            }

            if (containsAny(combined,
                    "setting", "preference", "privacy_setting", "settings_page", "settings_root")) {
                hints.settingsLike = true;
            }

            if (view instanceof TextView) {
                CharSequence value = ((TextView) view).getText();
                if (value != null) {
                    String raw = value.toString().trim();
                    String lower = raw.toLowerCase(Locale.ROOT);

                    if ("BlueIT Service".equals(raw)) hints.settingsLike = true;

                    if (isTopScreenTitle(view, rootHeight)
                            && ("Inbox".equalsIgnoreCase(raw)
                            || "Posteingang".equalsIgnoreCase(raw)
                            || "Messages".equalsIgnoreCase(raw)
                            || "Nachrichten".equalsIgnoreCase(raw))) {
                        hints.inboxLike = true;
                    }

                    if (isTopScreenTitle(view, rootHeight)
                            && (lower.equals("aktivität")
                            || lower.equals("activity")
                            || lower.equals("all activity")
                            || lower.equals("alle aktivitäten")
                            || lower.equals("notifications")
                            || lower.equals("benachrichtigungen"))) {
                        hints.inboxLike = true;
                        hints.activityLike = true;
                    }

                    if (isTopScreenTitle(view, rootHeight)
                            && (lower.equals("einstellungen und datenschutz")
                            || lower.equals("settings and privacy"))) {
                        hints.settingsLike = true;
                    }

                    // Strong composer hints for an active direct-message screen.
                    if (lower.equals("schreib etwas")
                            || lower.equals("schreibe etwas")
                            || lower.equals("write a message")
                            || lower.equals("send a message")
                            || lower.equals("type a message")
                            || lower.equals("write something")) {
                        hints.chatLike = true;
                    }
                }
            }

            if (view instanceof ViewGroup && node.depth < 40) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    queue.addLast(new ScanNode(group.getChildAt(i), node.depth + 1));
                }
            }
        }

        // Direct conversations often contain generic message/session-list names internally.
        if (hints.chatLike) hints.inboxLike = false;
        return hints;
    }

    private static void updateDynamicListWatcher(Activity activity, View decor, ScreenHints hints) {
        try {
            boolean dynamic = hints.inboxLike || hints.activityLike;
            synchronized (DYNAMIC_LIST_WATCHERS) {
                DynamicListScrollWatcher watcher = DYNAMIC_LIST_WATCHERS.get(decor);
                if (!dynamic) {
                    if (watcher != null) {
                        watcher.detach();
                        DYNAMIC_LIST_WATCHERS.remove(decor);
                    }
                    return;
                }

                if (watcher == null) {
                    watcher = new DynamicListScrollWatcher(activity, decor);
                    DYNAMIC_LIST_WATCHERS.put(decor, watcher);
                    watcher.attach();
                } else {
                    watcher.activityRef = new WeakReference<>(activity);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean hasDynamicListScreenHint(View root) {
        try {
            if (root == null || root.getHeight() <= 0) return false;
            int rootHeight = root.getHeight();
            ArrayDeque<ScanNode> queue = new ArrayDeque<>();
            queue.add(new ScanNode(root, 0));

            int visited = 0;
            while (!queue.isEmpty() && visited++ < MAX_DYNAMIC_HINT_NODES) {
                ScanNode node = queue.removeFirst();
                View view = node.view;
                if (ThemeNativeTargets.isOwned(view)) continue;
                if (view == null || view.getVisibility() != View.VISIBLE) continue;

                if (view instanceof TextView && isTopScreenTitle(view, rootHeight)) {
                    CharSequence value = ((TextView) view).getText();
                    if (value != null) {
                        String lower = value.toString().trim().toLowerCase(Locale.ROOT);
                        if (lower.equals("inbox")
                                || lower.equals("posteingang")
                                || lower.equals("messages")
                                || lower.equals("nachrichten")
                                || lower.equals("aktivität")
                                || lower.equals("activity")
                                || lower.equals("all activity")
                                || lower.equals("alle aktivitäten")
                                || lower.equals("notifications")
                                || lower.equals("benachrichtigungen")) {
                            return true;
                        }
                    }
                }

                if (view instanceof ViewGroup && node.depth < 24) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new ScanNode(group.getChildAt(i), node.depth + 1));
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static boolean isTopScreenTitle(View view, int rootHeight) {
        int[] location = location(view);
        return location != null && location[1] >= 0 && location[1] < rootHeight * 0.28f;
    }

    private static void applySurface(
            ViewGroup group,
            String preset,
            int surface,
            int divider,
            int radiusDp
    ) {
        try {
            Context context = group.getContext();
            GradientDrawable drawable = new GradientDrawable();
            drawable.setShape(GradientDrawable.RECTANGLE);
            drawable.setColor(surface);
            drawable.setCornerRadius(dp(context, Math.max(0, radiusDp)));

            boolean translucent = Color.alpha(surface) < 250;
            boolean glassLike = translucent
                    || "liquid_glass".equals(preset)
                    || "frosted_graphite".equals(preset);

            if (glassLike || radiusDp > 0) {
                drawable.setStroke(Math.max(1, Math.round(dp(context, 1))), divider);
            }

            group.setBackground(drawable);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                group.setBackgroundTintList(null);
                if (radiusDp > 0) group.setClipToOutline(true);
                group.setElevation(dp(context, glassLike ? 5 : 2));
            }
        } catch (Throwable ignored) {
        }
    }

    private static void styleLeaf(View view, int accent, int primary, int secondary, int divider) {
        try {
            String resource = resourceEntryName(view);

            if (view instanceof TextView) {
                TextView textView = (TextView) view;
                boolean secondaryText = containsAny(resource,
                        "summary", "subtitle", "secondary", "description", "desc", "hint", "time")
                        || textSizeSp(textView) < 14.5f;

                int color = (textView.isSelected() || textView.isActivated())
                        ? accent
                        : (secondaryText ? secondary : primary);

                textView.setTextColor(color);
                textView.setHintTextColor(secondary);
                textView.setLinkTextColor(accent);
                tintCompoundDrawables(textView, color);
                return;
            }

            if (view instanceof ImageView) {
                tintImageIfIcon((ImageView) view, resource, primary);
                return;
            }

            if (isDivider(view)) view.setBackgroundColor(divider);
        } catch (Throwable ignored) {
        }
    }

    private static boolean isExplicitChatBubble(String combined) {
        return containsAny(combined,
                "message_bubble", "messagebubble", "chat_bubble", "chatbubble", "msg_bubble",
                "bubble_layout", "bubblelayout", "message_content", "chat_message",
                "message_item", "im_message_cell", "message_cell", "messagecard");
    }

    private static boolean isChatComposer(String combined) {
        return containsAny(combined,
                "message_input", "chat_input", "input_panel", "message_composer", "chat_composer",
                "message_edit", "chat_edit", "input_bar", "composer_bar", "send_panel");
    }

    private static boolean isExplicitSheet(String combined) {
        // No generic geometry fallback here. Feed captions and DM composers can have the same
        // dimensions as a sheet, which caused the dev.4 giant-glass overlays and startup churn.
        return containsAny(combined,
                "bottom_sheet", "bottomsheet", "comments_panel", "comment_panel",
                "share_panel", "action_sheet", "dialog_sheet", "emoji_panel", "sticker_panel",
                "half_screen", "sheet_container", "modal_panel");
    }

    private static boolean isBottomNavigation(
            ViewGroup group,
            String combined,
            int rootWidth,
            int rootHeight
    ) {
        if (containsAny(combined,
                "bottom_navigation", "bottom_nav", "bottom_tab", "main_tab",
                "tab_bar", "navigation_bar", "main_bottom")) {
            return true;
        }

        int width = group.getWidth();
        int height = group.getHeight();
        if (width < rootWidth * 0.88f) return false;

        int minHeight = Math.round(dp(group.getContext(), 44));
        int maxHeight = Math.round(dp(group.getContext(), 116));
        if (height < minHeight || height > maxHeight) return false;

        int[] location = location(group);
        if (location == null) return false;
        int bottom = location[1] + height;
        if (location[1] < rootHeight * 0.76f
                || bottom < rootHeight - Math.round(dp(group.getContext(), 28))) {
            return false;
        }

        int visibleChildren = 0;
        int compactChildren = 0;
        int firstCenter = Integer.MAX_VALUE;
        int lastCenter = Integer.MIN_VALUE;

        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE || child.getWidth() <= 0) continue;
            visibleChildren++;
            if (child.getWidth() <= rootWidth * 0.34f) compactChildren++;
            int center = child.getLeft() + child.getWidth() / 2;
            firstCenter = Math.min(firstCenter, center);
            lastCenter = Math.max(lastCenter, center);
        }

        if (visibleChildren < 4 || visibleChildren > 7 || compactChildren < 4) return false;
        if (lastCenter - firstCenter < rootWidth * 0.58f) return false;

        int shortTexts = countShortTextViews(group, 3, 12);
        int images = countImageViews(group, 3, 12);
        return shortTexts >= 3 || images >= 3;
    }

    private static boolean isLikelyDrawer(
            ViewGroup group,
            String combined,
            int rootWidth,
            int rootHeight
    ) {
        if (containsAny(combined,
                "drawer", "side_menu", "sidemenu", "profile_menu", "profilemenu",
                "navigation_drawer", "side_panel")) {
            return true;
        }

        int width = group.getWidth();
        int height = group.getHeight();
        if (width < rootWidth * 0.58f || width > rootWidth * 0.96f) return false;
        if (height < rootHeight * 0.72f) return false;

        int[] location = location(group);
        if (location == null) return false;

        int right = location[0] + width;
        boolean touchesLeft = location[0] <= Math.round(dp(group.getContext(), 8));
        boolean touchesRight = right >= rootWidth - Math.round(dp(group.getContext(), 8));
        if (!touchesLeft && !touchesRight) return false;

        return countTextViews(group, 2, 8) >= 3;
    }

    private static boolean isLargeScreenContainer(ViewGroup group, int rootWidth, int rootHeight) {
        if (group.getWidth() < rootWidth * 0.88f) return false;
        if (group.getHeight() < rootHeight * 0.68f) return false;

        int[] location = location(group);
        return location != null && location[0] <= rootWidth * 0.08f;
    }

    private static boolean isLargeListSection(ViewGroup group, int rootWidth, int rootHeight) {
        int width = group.getWidth();
        int height = group.getHeight();
        if (width < rootWidth * 0.86f) return false;
        if (height < rootHeight * 0.26f || height > rootHeight * 0.92f) return false;

        int[] location = location(group);
        if (location == null || location[0] > rootWidth * 0.10f) return false;

        return countTextViews(group, 3, 12) >= 1 || countImageViews(group, 3, 12) >= 2;
    }

    private static boolean isCardContainer(ViewGroup group, int rootWidth, int rootHeight) {
        int width = group.getWidth();
        int height = group.getHeight();
        if (width < rootWidth * 0.78f || width > rootWidth * 1.02f) return false;

        int minHeight = Math.round(dp(group.getContext(), 64));
        int maxHeight = Math.min(
                Math.round(dp(group.getContext(), 620)),
                Math.round(rootHeight * 0.55f)
        );
        if (height < minHeight || height > maxHeight) return false;
        if (group.getChildCount() < 1 || group.getChildCount() > 18) return false;

        return countTextViews(group, 2, 6) >= 1;
    }

    private static boolean isListRow(ViewGroup group, int rootWidth, int rootHeight) {
        int width = group.getWidth();
        int height = group.getHeight();
        if (width < rootWidth * 0.74f) return false;

        int minHeight = Math.round(dp(group.getContext(), 54));
        int maxHeight = Math.round(dp(group.getContext(), 128));
        if (height < minHeight || height > maxHeight) return false;

        int[] location = location(group);
        if (location == null) return false;
        if (location[1] + height > rootHeight - Math.round(dp(group.getContext(), 96))) {
            return false;
        }

        int texts = countTextViews(group, 4, 8);
        int images = countImageViews(group, 4, 8);
        return texts >= 1
                && texts <= 7
                && images >= 1
                && group.getChildCount() >= 1
                && group.getChildCount() <= 12;
    }

    private static boolean isDrawerSection(ViewGroup group, int rootWidth, int rootHeight) {
        int width = group.getWidth();
        int height = group.getHeight();
        if (width < rootWidth * 0.52f || width > rootWidth * 0.94f) return false;

        int minHeight = Math.round(dp(group.getContext(), 48));
        int maxHeight = Math.round(dp(group.getContext(), 150));
        if (height < minHeight || height > maxHeight) return false;

        int texts = countTextViews(group, 2, 5);
        return texts >= 1 && texts <= 4;
    }

    private static int countTextViews(View root, int maxDepth, int maxCount) {
        if (root == null || maxDepth < 0 || maxCount <= 0) return 0;
        int count = root instanceof TextView ? 1 : 0;
        if (count >= maxCount || !(root instanceof ViewGroup) || maxDepth == 0) return count;

        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount() && count < maxCount; i++) {
            count += countTextViews(group.getChildAt(i), maxDepth - 1, maxCount - count);
        }
        return count;
    }

    private static int countShortTextViews(View root, int maxDepth, int maxCount) {
        if (root == null || maxDepth < 0 || maxCount <= 0) return 0;

        int count = 0;
        if (root instanceof TextView) {
            CharSequence value = ((TextView) root).getText();
            if (value != null) {
                int length = value.toString().trim().length();
                if (length > 0 && length <= 24) count = 1;
            }
        }

        if (count >= maxCount || !(root instanceof ViewGroup) || maxDepth == 0) return count;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount() && count < maxCount; i++) {
            count += countShortTextViews(group.getChildAt(i), maxDepth - 1, maxCount - count);
        }
        return count;
    }

    private static int countImageViews(View root, int maxDepth, int maxCount) {
        if (root == null || maxDepth < 0 || maxCount <= 0) return 0;
        int count = root instanceof ImageView ? 1 : 0;
        if (count >= maxCount || !(root instanceof ViewGroup) || maxDepth == 0) return count;

        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount() && count < maxCount; i++) {
            count += countImageViews(group.getChildAt(i), maxDepth - 1, maxCount - count);
        }
        return count;
    }

    private static void tintImageIfIcon(ImageView imageView, String resource, int color) {
        if (resource == null) resource = "";

        if (containsAny(resource,
                "avatar", "profile", "photo", "image", "cover", "thumbnail", "story", "head")) {
            return;
        }

        boolean iconName = containsAny(resource,
                "icon", "arrow", "chevron", "back", "menu", "search", "setting",
                "close", "more", "camera", "bell", "shield", "wallet", "qr");
        if (!iconName) return;

        int maxSize = Math.round(dp(imageView.getContext(), 64));
        if (imageView.getWidth() > maxSize || imageView.getHeight() > maxSize) return;

        Drawable drawable = imageView.getDrawable();
        if (drawable == null) return;

        try {
            Drawable tinted = drawable.mutate();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                tinted.setTint(color);
                imageView.setImageDrawable(tinted);
                imageView.setImageTintList(ColorStateList.valueOf(color));
            }
        } catch (Throwable ignored) {
        }
    }

    private static void tintCompoundDrawables(TextView textView, int color) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) return;

        try {
            Drawable[] drawables = textView.getCompoundDrawablesRelative();
            for (Drawable drawable : drawables) {
                if (drawable != null) drawable.mutate().setTint(color);
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isDivider(View view) {
        int width = view.getWidth();
        int height = view.getHeight();
        if (width <= 0 || height <= 0) return false;

        float density = view.getResources().getDisplayMetrics().density;
        return height <= Math.max(2, Math.round(1.5f * density))
                && width >= Math.round(48f * density);
    }

    private static float textSizeSp(TextView view) {
        float scaledDensity = view.getResources().getDisplayMetrics().scaledDensity;
        if (scaledDensity <= 0f) return 16f;
        return view.getTextSize() / scaledDensity;
    }

    private static int[] location(View view) {
        try {
            int[] location = new int[2];
            view.getLocationOnScreen(location);
            return location;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String resourceEntryName(View view) {
        int id = view.getId();
        if (id == View.NO_ID || id == 0) return "";

        try {
            return view.getResources().getResourceEntryName(id).toLowerCase(Locale.ROOT);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static String className(View view) {
        try {
            String simple = view.getClass().getSimpleName();
            return simple == null ? "" : simple.toLowerCase(Locale.ROOT);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static boolean containsAny(String value, String... tokens) {
        if (value == null || value.isEmpty()) return false;
        String normalized = value.toLowerCase(Locale.ROOT);
        for (String token : tokens) {
            if (normalized.contains(token)) return true;
        }
        return false;
    }

    private static int opaque(int color) {
        return Color.argb(255, Color.red(color), Color.green(color), Color.blue(color));
    }

    private static float dp(Context context, int value) {
        return value * context.getResources().getDisplayMetrics().density;
    }

    private static final class DynamicListScrollWatcher
            implements ViewTreeObserver.OnScrollChangedListener {
        WeakReference<Activity> activityRef;
        final View root;
        boolean pending;
        long lastReapplyMs;

        DynamicListScrollWatcher(Activity activity, View root) {
            this.activityRef = new WeakReference<>(activity);
            this.root = root;
        }

        void attach() {
            try {
                if (root.getViewTreeObserver().isAlive()) {
                    root.getViewTreeObserver().addOnScrollChangedListener(this);
                }
            } catch (Throwable ignored) {
            }
        }

        void detach() {
            try {
                if (root.getViewTreeObserver().isAlive()) {
                    root.getViewTreeObserver().removeOnScrollChangedListener(this);
                }
            } catch (Throwable ignored) {
            }
        }

        @Override
        public void onScrollChanged() {
            try {
                if (pending || !root.isAttachedToWindow()) return;
                pending = true;
                root.postDelayed(() -> {
                    pending = false;
                    try {
                        if (!root.isAttachedToWindow() || !hasDynamicListScreenHint(root)) {
                            synchronized (DYNAMIC_LIST_WATCHERS) {
                                DynamicListScrollWatcher current = DYNAMIC_LIST_WATCHERS.get(root);
                                if (current == this) {
                                    detach();
                                    DYNAMIC_LIST_WATCHERS.remove(root);
                                }
                            }
                            return;
                        }

                        long now = SystemClock.uptimeMillis();
                        if (now - lastReapplyMs < DYNAMIC_REAPPLY_MIN_INTERVAL_MS) return;
                        lastReapplyMs = now;

                        Activity activity = activityRef.get();
                        if (activity == null || activity.isFinishing()) return;
                        ThemeEngine.requestReapply();
                    } catch (Throwable ignored) {
                    }
                }, DYNAMIC_SCROLL_DEBOUNCE_MS);
            } catch (Throwable ignored) {
            }
        }
    }

    private static final class ScreenHints {
        boolean settingsLike;
        boolean inboxLike;
        boolean activityLike;
        boolean chatLike;
    }

    private static final class ScanNode {
        final View view;
        final int depth;

        ScanNode(View view, int depth) {
            this.view = view;
            this.depth = depth;
        }
    }

    private static final class Node {
        final View view;
        final boolean insideDrawer;
        final boolean insideSettings;
        final boolean insideInbox;
        final boolean parentCardStyled;
        final boolean textContext;

        Node(
                View view,
                boolean insideDrawer,
                boolean insideSettings,
                boolean insideInbox,
                boolean parentCardStyled,
                boolean textContext
        ) {
            this.view = view;
            this.insideDrawer = insideDrawer;
            this.insideSettings = insideSettings;
            this.insideInbox = insideInbox;
            this.parentCardStyled = parentCardStyled;
            this.textContext = textContext;
        }
    }
}
