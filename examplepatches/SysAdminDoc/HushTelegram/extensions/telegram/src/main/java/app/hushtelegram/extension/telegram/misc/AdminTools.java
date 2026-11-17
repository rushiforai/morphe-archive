/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Admin tools in the menu at the top of a group or channel you own or administer (#79). The item
 * opens a list of the admin screens Telegram's own profile and Manage screens open, as far as your
 * rights there go: Recent Actions, Administrators, Members or Subscribers, Permissions (Removed
 * users in a channel) and Invite Links. Each opens the way Telegram opens it, with the chat's
 * details Telegram already loaded. It rides on My messages' hooks, which ask this first, and has
 * its own switch. Off by default.
 */
public final class AdminTools {
    private AdminTools() {
    }

    /** The item's number, which Telegram's own menu may never use, after the other menu items'. */
    static final int ITEM = 0x4854540F;

    /** What {@link #rights} sets: the chat is known, then your rights and the chat's kind. */
    static final int KNOWN = 1, CREATOR = 2, ADMIN = 4, BROADCAST = 8, MEGAGROUP = 16, BAN_USERS = 32, INVITE_USERS = 64;

    /** Telegram's member list types, as its profile screen opens them. */
    static final int TYPE_BANNED = 0, TYPE_ADMIN = 1, TYPE_USERS = 2, TYPE_KICKED = 3;

    /** The screens the list can open, in the order it shows them. */
    enum Tool {
        RECENT_ACTIONS, ADMINISTRATORS, MEMBERS, SUBSCRIBERS, PERMISSIONS, REMOVED_USERS, INVITE_LINKS;

        /** Telegram's own name for the screen, with Telegram's translations of it. */
        String label() {
            switch (this) {
                case RECENT_ACTIONS: return L10n.t("Recent Actions");
                case ADMINISTRATORS: return L10n.t("Administrators");
                case MEMBERS: return L10n.t("Members");
                case SUBSCRIBERS: return L10n.t("Subscribers");
                case PERMISSIONS: return L10n.t("Permissions");
                case REMOVED_USERS: return L10n.t("Removed Users");
                default: return L10n.t("Invite Links");
            }
        }
    }

    /** The chats that already have the item, so a later update doesn't add a second one. */
    private static final Set<Object> ADDED = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    static boolean active() {
        HookStatus.invoked(FamilyNames.MY_MESSAGES);
        try {
            return Utils.settingsReady() && Settings.ADMIN_TOOLS.get() && PatchFamily.Capability.ADMIN_TOOLS.installed();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MY_MESSAGES, "admin tools switch", failure);
            return false;
        }
    }

    /** Whether the rights are a group or channel you own or administer. */
    static boolean manages(int rights) {
        return (rights & KNOWN) != 0 && (rights & (CREATOR | ADMIN)) != 0;
    }

    /**
     * The screens your rights in a chat open, as Telegram's own Manage screen offers them. A basic
     * group lists its members from the chat's details, so without them only a supergroup or channel
     * has anything to open, and Invite Links always needs them.
     */
    static List<Tool> tools(int rights, boolean details) {
        List<Tool> tools = new ArrayList<>();
        if (!manages(rights)) return tools;
        boolean creator = (rights & CREATOR) != 0;
        boolean broadcast = (rights & BROADCAST) != 0;
        boolean channel = broadcast || (rights & MEGAGROUP) != 0;
        if (channel) tools.add(Tool.RECENT_ACTIONS);
        if (channel || details) {
            tools.add(Tool.ADMINISTRATORS);
            tools.add(broadcast ? Tool.SUBSCRIBERS : Tool.MEMBERS);
            if (creator || (rights & BAN_USERS) != 0) tools.add(broadcast ? Tool.REMOVED_USERS : Tool.PERMISSIONS);
        }
        if (details && (creator || (rights & INVITE_USERS) != 0)) tools.add(Tool.INVITE_LINKS);
        return tools;
    }

    /** Asked from My messages' hook whenever the chat updates its own Translate item. */
    static void headerMenu(Object chat) {
        try {
            if (chat == null || ADDED.contains(chat) || !active() || !MyMessages.hasHeader(chat) || !manages(rights(chat))) return;
            MyMessages.addHeaderItem(chat, ITEM, icon(), L10n.t("Admin tools"));
            ADDED.add(chat);
            HookStatus.counted(FamilyNames.MY_MESSAGES, "admin tools item added");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MY_MESSAGES, "admin tools item", failure);
        }
    }

    /**
     * Asked from My messages' hook when an item of the chat's menu at the top is chosen.
     *
     * @return true when the choice was ours, so Telegram's own handling is skipped
     */
    static boolean headerClick(Object delegate, int id) {
        if (id != ITEM) return false;
        try {
            // An item left in an open menu after the switch went off is still ours, and does nothing.
            if (active()) show(MyMessages.chatOf(delegate));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MY_MESSAGES, "admin tools choice", failure);
            Utils.showToastShort(L10n.t("Couldn't open admin tools here."));
        }
        return true;
    }

    private static void show(Object chat) {
        Object details = chat == null ? null : chatFull(chat);
        List<Tool> tools = chat == null ? Collections.emptyList() : tools(rights(chat), details != null);
        Activity activity = chat == null ? null : activity(chat);
        if (tools.isEmpty() || activity == null || activity.isFinishing()) {
            HookStatus.counted(FamilyNames.MY_MESSAGES, "admin tools had nothing to open");
            Utils.showToastShort(L10n.t("Couldn't open admin tools here."));
            return;
        }
        String[] rows = new String[tools.size()];
        for (int i = 0; i < rows.length; i++) rows[i] = tools.get(i).label();
        new AlertDialog.Builder(activity)
                .setTitle(L10n.t("Admin tools"))
                .setItems(rows, (shown, which) -> open(chat, tools.get(which), details))
                .show();
    }

    /** Opens one screen the way Telegram's profile screen does, or says it couldn't. */
    static void open(Object chat, Tool tool, Object details) {
        boolean opened;
        try {
            switch (tool) {
                case RECENT_ACTIONS: opened = recentActions(chat); break;
                case ADMINISTRATORS: opened = members(chat, TYPE_ADMIN, details); break;
                case MEMBERS:
                case SUBSCRIBERS: opened = members(chat, TYPE_USERS, details); break;
                case PERMISSIONS: opened = members(chat, TYPE_KICKED, details); break;
                case REMOVED_USERS: opened = members(chat, TYPE_BANNED, details); break;
                case INVITE_LINKS: opened = details != null && inviteLinks(chat, details); break;
                default: opened = false;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MY_MESSAGES, "admin tools screen", failure);
            opened = false;
        }
        if (opened) {
            HookStatus.counted(FamilyNames.MY_MESSAGES, "admin tools opened");
        } else {
            Utils.showToastShort(L10n.t("Couldn't open admin tools here."));
        }
    }

    /** Telegram's admins icon, or none where it has none. */
    static int icon() {
        Context context = Utils.getContext();
        return context == null ? 0 : context.getResources().getIdentifier("msg_admins", "drawable", context.getPackageName());
    }

    static void resetForTests() {
        ADDED.clear();
    }

    // Stubs. The patch writes their bodies.

    /** {@link #KNOWN} and the rest for the chat a chat screen shows; 0 for a person, a channel's direct messages or a chat Telegram doesn't have. */
    public static int rights(Object chat) { return 0; }

    /** The chat's details Telegram has loaded, or null. */
    public static Object chatFull(Object chat) { return null; }

    /** The activity the chat screen is in, or null once it has left. */
    public static Activity activity(Object chat) { return null; }

    /** Opens the chat's Recent Actions; false when Telegram doesn't have the chat. */
    public static boolean recentActions(Object chat) { return false; }

    /** Opens the chat's member list of this type with its details; false when nothing opened. */
    public static boolean members(Object chat, int type, Object details) { return false; }

    /** Opens the chat's Invite Links with its details; false when nothing opened. */
    public static boolean inviteLinks(Object chat, Object details) { return false; }
}
