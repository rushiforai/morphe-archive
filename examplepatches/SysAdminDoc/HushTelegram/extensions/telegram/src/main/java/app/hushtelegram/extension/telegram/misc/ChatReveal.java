/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.text.Spanned;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Show all spoilers and Expand all quotes in a chat's menu at the top, and collapsed quotes that
 * open when a chat search lands inside them. Both menu items act on the messages the chat has
 * loaded, the way a tap on each spoiler or quote would. A search hit inside a collapsed quote opens
 * that quote while Telegram still highlights the message, so the match it marks can be seen.
 * Each is off by default.
 */
public final class ChatReveal {
    private ChatReveal() {
    }

    /** The items' numbers, which Telegram's own menu may never use, after the other Hush items. */
    static final int SPOILERS_ITEM = 0x4854540C;
    static final int QUOTES_ITEM = 0x4854540D;

    /** The chats that already have the items, so a later update doesn't add them again. */
    private static final Set<Object> ADDED = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    static boolean active() {
        HookStatus.invoked(FamilyNames.REVEAL_SPOILERS);
        try {
            return Utils.settingsReady() && Settings.REVEAL_MENU.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "menu switch", failure);
            return false;
        }
    }

    static boolean searchActive() {
        HookStatus.invoked(FamilyNames.REVEAL_SPOILERS);
        try {
            return Utils.settingsReady() && Settings.SEARCH_OPENS_QUOTES.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "search switch", failure);
            return false;
        }
    }

    /** Asked whenever the chat updates its own Translate item, which exists when the chat has a menu at the top. */
    public static void headerMenu(Object chat) {
        try {
            if (chat == null || ADDED.contains(chat) || !active() || !hasHeader(chat)) return;
            addHeaderItem(chat, SPOILERS_ITEM, icon("msg_spoiler_off"), L10n.t("Show all spoilers"));
            addHeaderItem(chat, QUOTES_ITEM, icon("msg_expand"), L10n.t("Expand all quotes"));
            ADDED.add(chat);
            HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "chat menu items added");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "header menu", failure);
        }
    }

    /**
     * Asked first when an item of the chat's menu at the top is chosen.
     *
     * @return true when the choice was ours, so Telegram's own handling is skipped
     */
    public static boolean headerClick(Object delegate, int id) {
        if (id != SPOILERS_ITEM && id != QUOTES_ITEM) return false;
        boolean spoilers = id == SPOILERS_ITEM;
        try {
            // An item left in an open menu after the switch went off is still ours, and does nothing.
            if (!active()) return true;
            Object chat = chatOf(delegate);
            int changed = chat == null ? -1 : reveal(chat, spoilers);
            if (changed < 0) {
                HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "chat messages unknown");
                Utils.showToastShort(L10n.t("Couldn't update the messages here."));
            } else if (changed == 0) {
                Utils.showToastShort(spoilers ? L10n.t("No hidden spoilers in the loaded messages.")
                        : L10n.t("No collapsed quotes in the loaded messages."));
            } else {
                HookStatus.counted(FamilyNames.REVEAL_SPOILERS, spoilers ? "spoilers shown from the menu" : "quotes expanded from the menu");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "header menu choice", failure);
            Utils.showToastShort(L10n.t("Couldn't update the messages here."));
        }
        return true;
    }

    /**
     * Asked right before a chat search marks a match in a message, with the match's start and end in
     * the message's text or caption and the blocks that text is laid out in. A match inside a
     * collapsed quote opens the quote, but only while the message is the highlighted hit, so a quote
     * the user collapses again afterwards stays collapsed.
     */
    public static void searchHit(Object cell, int start, int end, ArrayList<?> blocks) {
        try {
            if (cell == null || blocks == null || start < 0 || !searchActive() || !highlighted(cell)) return;
            for (Object block : blocks) {
                if (block == null || start < blockStart(block) || start >= blockEnd(block)) continue;
                if (collapsedQuote(block) && expand(blockMessage(block), blockIndex(block))) {
                    openCell(cell);
                    HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "quote opened on a search hit");
                }
                return;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "search hit", failure);
        }
    }

    /** Shows the spoilers or opens the quotes of every loaded message, and how many changed, or -1 when the chat has no list. */
    static int reveal(Object chat, boolean spoilers) {
        List<?> loaded = messages(chat);
        if (loaded == null) return -1;
        Set<Object> changed = Collections.newSetFromMap(new IdentityHashMap<>());
        for (Object message : new ArrayList<>(loaded)) {
            if (message != null && (spoilers ? showSpoilers(message) : expandQuotes(message))) changed.add(message);
        }
        if (!changed.isEmpty()) refresh(chat, changed);
        return changed.size();
    }

    /**
     * Uncovers a message's spoilers as a tap on them would. Text Reveal spoilers already uncovered,
     * and view-once or sensitive media, don't count.
     */
    static boolean showSpoilers(Object message) {
        boolean auto = autoReveal();
        boolean text = false;
        List<?> blocks = textBlocks(message);
        if (!spoilersRevealed(message)) {
            if (blocks != null) {
                for (Object block : blocks) {
                    List<?> covers = blockSpoilers(block);
                    if (covers != null && !covers.isEmpty()) text = true;
                }
            }
            CharSequence caption = caption(message);
            if (!text && caption instanceof Spanned) text = covered((Spanned) caption, auto);
        }
        boolean media = !auto && !Spoilers.shown(message) && Spoilers.stockMediaCovered(message) && !Spoilers.keptCovered(message);
        if (text) {
            revealSpoilers(message);
            if (blocks != null) {
                for (Object block : blocks) {
                    List<?> covers = blockSpoilers(block);
                    if (covers != null) covers.clear();
                }
            }
        }
        if (media) Spoilers.show(message);
        return text || media;
    }

    /** Whether a caption has a spoiler Reveal spoilers leaves covered. */
    private static boolean covered(Spanned caption, boolean auto) {
        boolean spoiler = false;
        for (Object span : caption.getSpans(0, caption.length(), Object.class)) {
            if (Spoilers.spoilerSpan(span)) spoiler = true;
        }
        return spoiler && !(auto && Spoilers.uncoverable(caption, Spoilers::spoilerSpan));
    }

    private static boolean autoReveal() {
        try {
            return Utils.settingsReady() && Settings.REVEAL_SPOILERS.get();
        } catch (Throwable failure) {
            return false;
        }
    }

    /** Opens every collapsed quote in a message's text. */
    static boolean expandQuotes(Object message) {
        List<?> blocks = textBlocks(message);
        if (blocks == null) return false;
        HashSet<Object> wanted = null;
        for (Object block : blocks) {
            if (block == null || !collapsedQuote(block)) continue;
            if (wanted == null) wanted = new HashSet<>();
            wanted.add(blockIndex(block));
        }
        if (wanted == null) return false;
        HashSet<?> open = expandedQuotes(message);
        if (open != null) wanted.addAll(open);
        setExpandedQuotes(message, wanted);
        return true;
    }

    /** Opens one quote of a message, as Telegram does: a new set each time. */
    static boolean expand(Object message, int index) {
        if (message == null) return false;
        HashSet<?> open = expandedQuotes(message);
        if (open != null && open.contains(index)) return false;
        HashSet<Object> next = open == null ? new HashSet<>() : new HashSet<>(open);
        next.add(index);
        setExpandedQuotes(message, next);
        return true;
    }

    /**
     * Lays the changed messages out again: the ones on screen at once, through the cell's own
     * update, and the rest the next time the chat binds them.
     */
    private static void refresh(Object chat, Set<Object> changed) {
        for (Object message : changed) forceUpdate(message);
        Object list = listView(chat);
        if (!(list instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) list;
        List<View> children = new ArrayList<>();
        for (int i = 0; i < group.getChildCount(); i++) children.add(group.getChildAt(i));
        for (View child : children) {
            Object message = cellMessage(child);
            if (message != null && changed.contains(message)) openCell(child);
        }
    }

    /** One of Telegram's icons, or none where it has none. */
    static int icon(String name) {
        Context context = Utils.getContext();
        return context == null ? 0 : context.getResources().getIdentifier(name, "drawable", context.getPackageName());
    }

    static void resetForTests() {
        ADDED.clear();
    }

    // Stubs. The patch writes their bodies.

    /** Whether the chat built its menu at the top, read from the Translate item Telegram adds to it. */
    public static boolean hasHeader(Object chat) { return false; }

    public static Object addHeaderItem(Object chat, int id, int icon, String text) { return null; }

    public static Object chatOf(Object delegate) { return null; }

    /** The messages the chat has loaded. */
    public static ArrayList<?> messages(Object chat) { return null; }

    /** The chat's list of messages on screen. */
    public static Object listView(Object chat) { return null; }

    /** The message a chat's row shows, or null when the row isn't a message. */
    public static Object cellMessage(Object view) { return null; }

    /** Whether the message's row is the highlighted search hit. */
    public static boolean highlighted(Object cell) { return false; }

    /** Asks the chat to lay the row out again, as a tap on a quote's expand button does. */
    public static void openCell(Object cell) {}

    public static ArrayList<?> textBlocks(Object message) { return null; }

    public static ArrayList<?> blockSpoilers(Object block) { return null; }

    public static int blockStart(Object block) { return 0; }

    public static int blockEnd(Object block) { return 0; }

    public static int blockIndex(Object block) { return 0; }

    public static Object blockMessage(Object block) { return null; }

    /** A quote that can collapse and is collapsed now. */
    public static boolean collapsedQuote(Object block) { return false; }

    public static boolean spoilersRevealed(Object message) { return false; }

    public static void revealSpoilers(Object message) {}

    public static CharSequence caption(Object message) { return null; }

    public static HashSet<?> expandedQuotes(Object message) { return null; }

    public static void setExpandedQuotes(Object message, HashSet<?> open) {}

    public static void forceUpdate(Object message) {}
}
