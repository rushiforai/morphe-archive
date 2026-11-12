/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ReplacementSpan;

import androidx.annotation.Nullable;

import java.util.HashMap;
import java.util.Map;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Icons in front of the folder tab names above the chat list (#68). Telegram 13.2 draws a tab as
 * its name only. With the switch on, each tab's title gets one leading character drawn as an icon,
 * the way other Telegram clients show them: a chat bubble for All Chats, and a person, group, channel
 * or bot for a folder that holds only that kind of chat, from Telegram's own drawables. With a pack
 * picked under Folder icons (#53), the tabs take that pack's icon for the folder's name instead.
 *
 * <p>The icon is a span on the title, so the tab measures and draws it with the name, in the name's
 * color, and the folder itself is never renamed.
 */
public final class TabIcons {
    private TabIcons() {}

    /** What the diagnostic report counts each time a tab gets an icon. */
    static final String SHOWN = "folder tab icon shown";

    // DialogFilter's flags.
    static final int CONTACTS = 1;
    static final int NON_CONTACTS = 2;
    static final int GROUPS = 4;
    static final int CHANNELS = 8;
    static final int BOTS = 16;
    static final int EXCLUDE_MUTED = 32;
    static final int EXCLUDE_READ = 64;
    static final int ALL_CHAT_TYPES = CONTACTS | NON_CONTACTS | GROUPS | CHANNELS | BOTS;

    // Telegram's drawables for each kind of folder.
    static final String ALL_ICON = "msg_discussion";
    static final String FOLDER_ICON = "msg_folders";
    static final String PRIVATE_ICON = "msg_folders_private";
    static final String GROUPS_ICON = "msg_folders_groups";
    static final String CHANNELS_ICON = "msg_folders_channels";
    static final String BOTS_ICON = "msg_folders_bots";
    static final String UNREAD_ICON = "msg_folders_read";
    static final String UNMUTED_ICON = "msg_folders_muted";

    /** The pack icon All Chats gets, as the #53 lists draw it. */
    static final String ALL_PACK_ICON = "chat-circle";

    /** The icon's size and the space after it, as parts of the text size. */
    static final float SIZE = 1.2f;
    static final float GAP = 0.3f;

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /** One span per icon, so a title built again compares equal to the last one. */
    private static final Map<String, Icon> icons = new HashMap<>();

    /**
     * Injected where the tab strip makes a tab: the title with the icon for the folder at
     * [position] in front, or the title as it was with the switch off or no such folder.
     */
    public static CharSequence title(CharSequence title, int position) {
        try {
            if (title == null || icon(title) != null || !available()) return title;
            int account = telegram.account();
            if (position < 0 || position >= telegram.count(account)) return title;
            Icon icon = iconFor(FolderIcons.pack(), telegram.isDefault(account, position),
                    telegram.flags(account, position), telegram.picks(account, position), title.toString());
            SpannableStringBuilder decorated = new SpannableStringBuilder(" ");
            decorated.setSpan(icon, 0, 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            decorated.append(title);
            HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, SHOWN);
            return decorated;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "folder tab icons", failure);
            return title;
        }
    }

    /** Injected where a tab takes a new title: the title with the tab's icon in front. */
    public static CharSequence retitle(CharSequence title, Object tab) {
        try {
            return title(title, telegram.position(tab));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "folder tab icons", failure);
            return title;
        }
    }

    /**
     * Injected where a tab checks whether its title changed: the title without its icon, so the
     * same name doesn't read as a new one.
     */
    public static CharSequence plain(CharSequence title) {
        return title == null || icon(title) == null ? title : title.subSequence(1, title.length());
    }

    /** Whether the icons are on in this build and in the settings. */
    static boolean available() {
        return Utils.settingsReady() && Settings.FOLDER_TAB_ICONS.get() && PatchFamily.Capability.TAB_ICONS.installed();
    }

    /** The span for a folder: from [pack] by its name when one is picked, else Telegram's icon for its kind. */
    static Icon iconFor(String pack, boolean isDefault, int flags, int picks, String name) {
        if (!FolderIcons.OFF.equals(pack)) {
            String icon = isDefault ? ALL_PACK_ICON : FolderIcons.iconFor(name);
            return iconNamed(pack + '/' + icon, () -> FolderIcons.drawable(pack, icon, 1, 0xff000000));
        }
        String icon = telegramIcon(isDefault, flags, picks);
        return iconNamed(icon, () -> telegram.drawable(icon));
    }

    /**
     * Telegram's icon for a folder, picked the way Telegram Desktop picks one: All Chats, a folder of
     * only one kind of chat, of only unread or only unmuted chats, or a plain folder when it lists
     * chats by hand or mixes kinds. [picks] counts the chats always shown.
     */
    static String telegramIcon(boolean isDefault, int flags, int picks) {
        if (isDefault) return ALL_ICON;
        int types = flags & ALL_CHAT_TYPES;
        if (picks > 0 || types == 0) return FOLDER_ICON;
        if ((types & ~(CONTACTS | NON_CONTACTS)) == 0) return PRIVATE_ICON;
        if (types == GROUPS) return GROUPS_ICON;
        if (types == CHANNELS) return CHANNELS_ICON;
        if (types == BOTS) return BOTS_ICON;
        int removed = flags & (EXCLUDE_READ | EXCLUDE_MUTED);
        if (removed == EXCLUDE_READ) return UNREAD_ICON;
        if (removed == EXCLUDE_MUTED) return UNMUTED_ICON;
        return FOLDER_ICON;
    }

    /** The icon a title starts with, or null. */
    @Nullable
    static Icon icon(CharSequence title) {
        if (!(title instanceof Spanned) || title.length() == 0) return null;
        Icon[] found = ((Spanned) title).getSpans(0, 1, Icon.class);
        for (Icon icon : found) {
            if (((Spanned) title).getSpanStart(icon) == 0) return icon;
        }
        return null;
    }

    /** Forgets the spans, so each test asks Telegram for its drawings again. */
    static synchronized void clearForTests() {
        icons.clear();
    }

    private static synchronized Icon iconNamed(String key, Source source) {
        Icon icon = icons.get(key);
        if (icon == null) {
            icon = new Icon(key, source);
            icons.put(key, icon);
        }
        return icon;
    }

    /** Where an icon's drawing comes from, asked once when it's first drawn. */
    interface Source {
        @Nullable
        Drawable drawable() throws Exception;
    }

    /** One icon, drawn as a square as tall as the text and tinted to the text's color. */
    static final class Icon extends ReplacementSpan {
        final String key;
        private final Source source;
        private Drawable drawable;
        private boolean asked;

        Icon(String key, Source source) {
            this.key = key;
            this.source = source;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            float size = paint.getTextSize();
            if (fm != null) paint.getFontMetricsInt(fm);
            return Math.round(size * SIZE) + Math.round(size * GAP);
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
            Drawable icon = drawable();
            if (icon == null) return;
            int size = Math.round(paint.getTextSize() * SIZE);
            int left = Math.round(x);
            int upper = (top + bottom - size) / 2;
            icon.setBounds(left, upper, left + size, upper + size);
            icon.setColorFilter(new PorterDuffColorFilter(paint.getColor(), PorterDuff.Mode.SRC_IN));
            icon.setAlpha(paint.getAlpha());
            icon.draw(canvas);
        }

        @Nullable
        Drawable drawable() {
            if (!asked) {
                asked = true;
                try {
                    Drawable found = source.drawable();
                    drawable = found == null ? null : found.mutate();
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "folder tab icons", failure);
                }
            }
            return drawable;
        }
    }

    /** What this needs from Telegram. */
    interface Telegram {
        int account();

        int count(int account);

        boolean isDefault(int account, int index);

        int flags(int account, int index);

        int picks(int account, int index);

        /** The folder a tab stands for, as its place in the account's folders, or -1. */
        int position(Object tab);

        @Nullable
        Drawable drawable(String name) throws Exception;
    }

    private static final class Stubs implements Telegram {
        @Override public int account() { return LaunchFolder.selectedAccount(); }
        @Override public int count(int account) { return LaunchFolder.folderCount(account); }
        @Override public boolean isDefault(int account, int index) { return LaunchFolder.folderDefault(account, index); }
        @Override public int flags(int account, int index) { return TabIcons.folderFlags(account, index); }
        @Override public int picks(int account, int index) { return TabIcons.folderPicks(account, index); }
        @Override public int position(Object tab) { return TabIcons.tabPosition(tab); }

        @Override
        public Drawable drawable(String name) throws Exception {
            Context context = Utils.getContext();
            int id = HostNames.resource(TabIcons.class.getClassLoader(), "drawable", name);
            return context.getResources().getDrawable(id, context.getTheme());
        }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code getDialogFilters().get(index).flags}. */
    public static int folderFlags(int account, int index) { return 0; }

    /** {@code getDialogFilters().get(index).alwaysShow.size()}. */
    public static int folderPicks(int account, int index) { return 0; }

    /** {@code tab.id}, the tab's place in the account's folders. */
    public static int tabPosition(Object tab) { return -1; }
}
