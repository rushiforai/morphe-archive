// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.chat;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.AdapterView;

import androidx.annotation.Nullable;

import com.onelouder.baconreader.DrawerHandler;
import com.onelouder.baconreader.adapters.DrawerAdapter;
import com.onelouder.baconreader.reddit.Listing;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.WeakHashMap;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * Reddit's chat inside the app, with unread notifications.
 * <p>
 * Reddit has no public chat API, and the app's OAuth login can't open Reddit's website. So the chat is Reddit's
 * mobile website chat in a WebView over MainActivity's post list, where users log in to the website once.
 */
@SuppressWarnings("unused")
public final class RedditChatPatch {
    private static final String TAG = "RedditChat";

    static final String CHAT_URL = "https://www.reddit.com/chat";

    private static final String MAIN_ACTIVITY = "com.onelouder.baconreader.ui.main.MainActivity";

    // Opens MainActivity with the chat at this URL.
    private static final String EXTRA_CHAT_URL = "io.github.joancomasfdz.extension.baconreader.chat.URL";

    // DrawerAdapter's item layout, and the tags of the drawer's own items that the Chat item goes after or before.
    private static final int TYPE_ITEM = 3;
    private static final int TAG_INBOX = 3;
    private static final int TAG_SUBREDDIT = 7;
    private static final int TAG_SETTINGS = 10;

    // Not one of DrawerHandler's ACTION_ tags, so its click handler ignores the item.
    private static final int TAG_CHAT = 0x43484154;

    // The drawer's own icons come as grey PNGs for the light theme and white ones for the dark themes. The patch
    // adds these two to the app's resources.
    private static final String ICON_GREY = "baconreader_patches_chat_grey";
    private static final String ICON_WHITE = "baconreader_patches_chat_white";

    private static final Handler main = new Handler(Looper.getMainLooper());

    /** The main screen's drawer, to show a new unread count. Only used on the main thread. */
    private static WeakReference<DrawerHandler> drawer = new WeakReference<>(null);

    @Nullable
    private static ChatPanel.MainViews views;

    /** The chat of each MainActivity. Only used on the main thread. */
    private static final WeakHashMap<Activity, MainScreen> screens = new WeakHashMap<>();

    private static final class MainScreen {
        @Nullable
        ChatPanel panel;

        /** The chat to show once the activity has opened its first feed. */
        @Nullable
        String pendingUrl;

        /** Opened for a chat link or the notification: back leaves the activity. */
        boolean openedForChat;
    }

    private RedditChatPatch() {
    }

    // region Hooks

    /** Injected after super.onCreate in MainActivity.onCreate: an intent for the chat shows it. */
    public static void onMainCreate(@Nullable Activity activity) {
        if (activity == null) return;
        try {
            Intent intent = activity.getIntent();
            String url = intent == null ? null : intent.getStringExtra(EXTRA_CHAT_URL);
            if (url == null) return;
            MainScreen screen = screen(activity);
            screen.pendingUrl = url;
            screen.openedForChat = true;
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not open the chat", exception);
        }
    }

    /**
     * Injected at the end of MainActivity.openLinkset, which opens a feed: on start, and when a feed is chosen in
     * the drawer or the toolbar. The chat waiting for the first feed shows; any other feed leaves the chat.
     */
    public static void onFeedOpened(@Nullable Activity activity) {
        if (activity == null) return;
        try {
            MainScreen screen = screens.get(activity);
            if (screen == null) return;
            String url = screen.pendingUrl;
            if (url != null) {
                screen.pendingUrl = null;
                show(activity, url);
            } else {
                if (screen.panel != null) screen.panel.hide(false);
                ChatMessages.onChatHidden();
            }
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not leave the chat", exception);
        }
    }

    /** Injected at the start of MainActivity.onBackPressed; true when the chat handled it. */
    public static boolean onMainBack(@Nullable Activity activity, @Nullable DrawerHandler drawerHandler) {
        if (activity == null) return false;
        try {
            MainScreen screen = screens.get(activity);
            if (screen == null) return false;
            ChatPanel panel = screen.panel;
            if (panel == null || !panel.isShowing()) return false;
            // An open drawer closes first, as on the post list.
            if (drawerHandler != null && drawerHandler.handleReturn()) return true;
            boolean handled = panel.back(screen.openedForChat && !activity.isTaskRoot());
            if (!panel.isShowing()) ChatMessages.onChatHidden();
            return handled;
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not go back in the chat", exception);
            return false;
        }
    }

    /** Injected at the end of MainActivity.onPrepareOptionsMenu. */
    public static void prepareMenu(@Nullable Activity activity, @Nullable Menu menu) {
        if (activity == null || menu == null) return;
        try {
            ChatPanel panel = panel(activity);
            if (panel != null) panel.prepareMenu(menu);
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not change the menu for the chat", exception);
        }
    }

    /** Injected first in MainActivity.onOptionsItemSelected: refresh reloads the chat while it shows. */
    public static boolean onMenuItem(@Nullable Activity activity, @Nullable MenuItem item) {
        if (activity == null || item == null) return false;
        ChatPanel panel = panel(activity);
        if (panel == null || !panel.isShowing() || item.getItemId() != views().refreshItem) return false;
        try {
            panel.reload();
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not reload the chat", exception);
        }
        return true;
    }

    /** Injected first in MainActivity.onActivityResult; true for the chat's file chooser. */
    public static boolean onMainActivityResult(@Nullable Activity activity, int requestCode, int resultCode,
                                               @Nullable Intent data) {
        if (activity == null || requestCode != ChatPanel.REQUEST_FILES) return false;
        try {
            ChatPanel panel = panel(activity);
            if (panel != null) panel.onActivityResult(resultCode, data);
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not attach the chosen files", exception);
        }
        return true;
    }

    /**
     * Injected at the start of MainActivity.onResume: gives the chat the login of the account shown, and resumes
     * the chat when it shows.
     */
    public static void onMainResume(@Nullable Activity activity) {
        try {
            ChatPanel panel = activity == null ? null : panel(activity);
            if (panel != null && panel.isShowing()) {
                panel.onResume();
                ChatMessages.onChatShown(activity);
            }
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not resume the chat", exception);
        }
        followAccount();
    }

    /** Injected at the start of MainActivity.onPause. */
    public static void onMainPause(@Nullable Activity activity) {
        if (activity == null) return;
        try {
            ChatPanel panel = panel(activity);
            if (panel == null) return;
            panel.onPause();
            if (panel.isShowing()) ChatMessages.onChatHidden();
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not pause the chat", exception);
        }
    }

    /** Injected at the start of MainActivity.onDestroy: the WebView goes with its activity. */
    public static void onMainDestroy(@Nullable Activity activity) {
        if (activity == null) return;
        try {
            MainScreen screen = screens.remove(activity);
            if (screen == null || screen.panel == null) return;
            if (screen.panel.isShowing()) ChatMessages.onChatHidden();
            screen.panel.destroy();
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not close the chat", exception);
        }
    }

    /**
     * Injected in place of Listing.getChildren in the app's background message check (CheckMessagesExecutor),
     * which asks Reddit for the unread messages: the chat messages are counted for Chat, and the rest returned.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Nullable
    public static List unreadMessages(@Nullable Listing listing, @Nullable Class type) {
        if (listing == null) return null;
        List messages = listing.getChildren(type);
        if (messages == null) return null;
        Context context = context();
        if (context == null) return messages;
        try {
            List others = ChatMessages.onUnread(context, messages);
            refreshDrawer();
            return others;
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not count the chat messages", exception);
            return messages;
        }
    }

    /**
     * Injected in place of Listing.getChildren when the inbox loads a page of messages: the chat messages are left
     * out.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Nullable
    public static List inboxMessages(@Nullable Listing listing, @Nullable Class type) {
        if (listing == null) return null;
        List messages = listing.getChildren(type);
        if (messages == null) return null;
        try {
            if (!InboxChats.separate()) return messages;
            List others = new ArrayList();
            for (Object message : messages) {
                if (!ChatMessages.isChat(message)) others.add(message);
            }
            return others;
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not leave the chat messages out of the inbox", exception);
            return messages;
        }
    }

    /**
     * Injected in DrawerHandler.updateDrawer with the drawer's items, before they show: adds Chat after the Inbox
     * and its folders, or before Subreddit when no account is logged in.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void addChatItem(@Nullable DrawerHandler handler, @Nullable List items) {
        if (items == null) return;
        try {
            if (handler != null) drawer = new WeakReference<>(handler);
            // The drawer updates when the account changes.
            followAccount();
            int lastInbox = -1;
            int subreddit = -1;
            int settingsIcon = 0;
            for (int i = 0; i < items.size(); i++) {
                Object element = items.get(i);
                if (!(element instanceof DrawerAdapter.DrawerItem)) continue;
                DrawerAdapter.DrawerItem drawerItem = (DrawerAdapter.DrawerItem) element;
                if (drawerItem.tag == TAG_INBOX) lastInbox = i;
                if (drawerItem.tag == TAG_SUBREDDIT && subreddit < 0) subreddit = i;
                if (drawerItem.tag == TAG_SETTINGS && settingsIcon == 0) settingsIcon = drawerItem.icon;
            }
            DrawerAdapter.DrawerItem item =
                    new DrawerAdapter.DrawerItem(TYPE_ITEM, chatLabel(), chatIcon(settingsIcon), TAG_CHAT);
            if (lastInbox >= 0) items.add(lastInbox + 1, item);
            else if (subreddit >= 0) items.add(subreddit, item);
            else items.add(item);
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not add Chat to the menu", exception);
        }
    }

    /** Injected first when a drawer item is tapped; true when it was Chat, which it opens. */
    public static boolean onDrawerItemClick(@Nullable DrawerHandler handler, @Nullable AdapterView<?> parent,
                                            int position) {
        if (parent == null) return false;
        try {
            Object item = parent.getItemAtPosition(position);
            if (!(item instanceof DrawerAdapter.DrawerItem) || ((DrawerAdapter.DrawerItem) item).tag != TAG_CHAT) {
                return false;
            }
            if (handler != null) handler.closeDrawer();
            if (parent.getContext() instanceof Activity) show((Activity) parent.getContext(), null);
            return true;
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not open the chat", exception);
            return true;
        }
    }

    /**
     * Injected first in LinkProcessor.getIntent, which opens the links BaconReader handles, unless the link is
     * forced to the browser: the main screen with the chat for Reddit chat links, or null for the app's own
     * handling.
     */
    @Nullable
    public static Intent chatIntent(@Nullable String url) {
        Context context = context();
        if (context == null || url == null) return null;
        try {
            Uri uri = Uri.parse(url);
            if (!isChatLink(uri)) return null;
            return intent(context, uri.buildUpon().scheme("https").build().toString());
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not open the chat link " + url, exception);
            return null;
        }
    }

    // endregion

    /** A new main screen that shows the chat, at url or its start. */
    static Intent intent(Context context, @Nullable String url) {
        return new Intent().setClassName(context, MAIN_ACTIVITY).putExtra(EXTRA_CHAT_URL, url != null ? url : CHAT_URL);
    }

    /** Links of Reddit's chat: www.reddit.com/chat and its pages, and chat.reddit.com. */
    static boolean isChatLink(Uri uri) {
        String scheme = uri.getScheme() == null ? null : uri.getScheme().toLowerCase(Locale.ROOT);
        if (!"https".equals(scheme) && !"http".equals(scheme)) return false;
        if (uri.getHost() == null) return false;
        String host = uri.getHost().toLowerCase(Locale.ROOT);
        if (host.equals("chat.reddit.com")) return true;
        if (!host.equals("reddit.com") && !host.endsWith(".reddit.com")) return false;
        String path = uri.getPath() == null ? "" : uri.getPath();
        return path.equals("/chat") || path.startsWith("/chat/");
    }

    private static MainScreen screen(Activity activity) {
        MainScreen screen = screens.get(activity);
        if (screen == null) {
            screen = new MainScreen();
            screens.put(activity, screen);
        }
        return screen;
    }

    @Nullable
    private static ChatPanel panel(Activity activity) {
        MainScreen screen = screens.get(activity);
        return screen == null ? null : screen.panel;
    }

    private static void show(Activity activity, @Nullable String url) {
        followAccount();
        MainScreen screen = screen(activity);
        if (screen.panel == null) screen.panel = new ChatPanel(activity, views());
        screen.panel.show(url);
        ChatMessages.onChatShown(activity);
    }

    /** MainActivity's views the chat goes between, and its toolbar's refresh. */
    private static ChatPanel.MainViews views() {
        if (views == null) {
            views = new ChatPanel.MainViews(
                    id("listLayout"),
                    id("ad_container"),
                    id("toolbar"),
                    id("toolbarTitle"),
                    id("toolbarFlipper"),
                    id("appBar"),
                    id("action_refresh"));
        }
        return views;
    }

    private static int id(String name) {
        return ResourceUtils.getIdentifierOrThrow(ResourceType.ID, name);
    }

    @Nullable
    private static Context context() {
        return Utils.isContextSet() ? Utils.getContext() : null;
    }

    /** On the main thread: gives the chat the login of the account shown. */
    private static void followAccount() {
        Context context = context();
        if (context == null) return;
        try {
            ChatAccounts.follow(context, () -> {
                for (MainScreen screen : new ArrayList<>(screens.values())) {
                    if (screen.panel != null) screen.panel.restart();
                }
            });
        } catch (Exception exception) {
            ErrorDialog.printException(() -> "Could not switch the chat to the account shown", exception);
        }
    }

    private static void refreshDrawer() {
        main.post(() -> {
            try {
                DrawerHandler handler = drawer.get();
                if (handler != null) handler.updateDrawer();
            } catch (Exception exception) {
                ErrorDialog.printException(() -> "Could not show the unread chat messages", exception);
            }
        });
    }

    private static String chatLabel() {
        Context context = context();
        int unread = context == null ? 0 : ChatMessages.unread(context);
        return unread > 0
                ? str("revanced_baconreader_chat_entry_unread", unread)
                : str("revanced_baconreader_chat_entry");
    }

    /**
     * The icon in the color of the drawer's own icons: their dark themes use white icons, the light one grey ones.
     */
    private static int chatIcon(int settingsIcon) {
        int grey = ResourceUtils.getIdentifier(ResourceType.DRAWABLE, ICON_GREY);
        Context context = context();
        if (settingsIcon == 0 || context == null) return grey;
        try {
            Resources resources = context.getResources();
            String name = resources.getResourceEntryName(settingsIcon);
            return name.contains("white") ? ResourceUtils.getIdentifier(ResourceType.DRAWABLE, ICON_WHITE) : grey;
        } catch (Exception exception) {
            return grey;
        }
    }
}
