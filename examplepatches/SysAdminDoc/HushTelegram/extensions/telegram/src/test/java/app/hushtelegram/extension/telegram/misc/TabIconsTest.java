/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.TextUtils;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TabIconsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Remembers where it was drawn and with what tint. */
    private static class Recording extends Drawable {
        ColorFilter filter;
        int draws;

        @Override public void draw(Canvas canvas) { draws++; }
        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter filter) { this.filter = filter; }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** All Chats, a groups folder and a mixed one, the way Telegram lists them. */
    private static class Fake implements TabIcons.Telegram {
        boolean[] defaults = {true, false, false};
        int[] flags = {0, TabIcons.GROUPS, TabIcons.CONTACTS | TabIcons.GROUPS};
        int[] picks = {0, 0, 0};
        boolean broken;
        final List<String> asked = new ArrayList<>();
        final Map<String, Recording> drawn = new HashMap<>();
        final Map<Object, Integer> tabs = new HashMap<>();

        @Override public int account() { return 0; }

        @Override public int count(int account) {
            if (broken) throw new IllegalStateException("Telegram changed");
            return defaults.length;
        }

        @Override public boolean isDefault(int account, int index) { return defaults[index]; }
        @Override public int flags(int account, int index) { return flags[index]; }
        @Override public int picks(int account, int index) { return picks[index]; }

        @Override public int position(Object tab) {
            Integer position = tabs.get(tab);
            return position == null ? -1 : position;
        }

        @Override public Drawable drawable(String name) {
            asked.add(name);
            Recording drawing = new Recording();
            drawn.put(name, drawing);
            return drawing;
        }
    }

    private Fake telegram;
    private TabIcons.Telegram original;

    @Before public void setUp() {
        original = TabIcons.telegram;
        telegram = new Fake();
        TabIcons.telegram = telegram;
        TabIcons.clearForTests();
        PatchFamilyForTests.inBuild(PatchFamily.HIDE_FOLDER_COUNTERS);
        PatchFamilyForTests.installed(PatchFamily.Capability.TAB_ICONS);
        Settings.FOLDER_TAB_ICONS.save(true);
        HookStatus.clear();
    }

    @After public void tearDown() {
        TabIcons.telegram = original;
        TabIcons.clearForTests();
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        Settings.FOLDER_TAB_ICONS.resetToDefault();
        Settings.FOLDER_ICON_PACK.resetToDefault();
    }

    private static String iconOf(CharSequence title) {
        TabIcons.Icon icon = TabIcons.icon(title);
        return icon == null ? null : icon.key;
    }

    @Test public void kindsGetTheIconsTelegramDesktopPicks() {
        int people = TabIcons.CONTACTS | TabIcons.NON_CONTACTS;
        assertEquals("msg_discussion", TabIcons.telegramIcon(true, TabIcons.GROUPS, 3));
        assertEquals("msg_folders_private", TabIcons.telegramIcon(false, TabIcons.CONTACTS, 0));
        assertEquals("msg_folders_private", TabIcons.telegramIcon(false, TabIcons.NON_CONTACTS, 0));
        assertEquals("msg_folders_private", TabIcons.telegramIcon(false, people, 0));
        assertEquals("msg_folders_groups", TabIcons.telegramIcon(false, TabIcons.GROUPS, 0));
        assertEquals("msg_folders_channels", TabIcons.telegramIcon(false, TabIcons.CHANNELS, 0));
        assertEquals("msg_folders_bots", TabIcons.telegramIcon(false, TabIcons.BOTS, 0));
        // Chats picked by hand make it a folder of its own, whatever kinds it adds.
        assertEquals("msg_folders", TabIcons.telegramIcon(false, TabIcons.GROUPS, 2));
        assertEquals("msg_folders", TabIcons.telegramIcon(false, TabIcons.GROUPS | TabIcons.CHANNELS, 0));
        assertEquals("msg_folders_read", TabIcons.telegramIcon(false, TabIcons.ALL_CHAT_TYPES | TabIcons.EXCLUDE_READ, 0));
        assertEquals("msg_folders_muted", TabIcons.telegramIcon(false, TabIcons.ALL_CHAT_TYPES | TabIcons.EXCLUDE_MUTED, 0));
        assertEquals("msg_folders", TabIcons.telegramIcon(false,
                TabIcons.ALL_CHAT_TYPES | TabIcons.EXCLUDE_READ | TabIcons.EXCLUDE_MUTED, 0));
        assertEquals("msg_folders", TabIcons.telegramIcon(false, TabIcons.EXCLUDE_READ, 0));
    }

    @Test public void tabTitleGetsItsFoldersIconInFront() {
        CharSequence all = TabIcons.title("All Chats", 0);
        CharSequence groups = TabIcons.title("Groups", 1);
        CharSequence mixed = TabIcons.title("Work", 2);

        assertEquals(" All Chats", all.toString());
        assertEquals("msg_discussion", iconOf(all));
        assertEquals("msg_folders_groups", iconOf(groups));
        assertEquals("msg_folders", iconOf(mixed));
        assertEquals("All Chats", TabIcons.plain(all).toString());
        assertTrue(String.join("\n", HookStatus.report()).contains(TabIcons.SHOWN));
    }

    @Test public void titleKeepsTheNamesOwnSpans() {
        android.text.SpannableString name = new android.text.SpannableString("Work");
        Object bold = new android.text.style.StyleSpan(android.graphics.Typeface.BOLD);
        name.setSpan(bold, 0, 4, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);

        Spanned decorated = (Spanned) TabIcons.title(name, 2);

        assertEquals(1, decorated.getSpanStart(bold));
        assertEquals(5, decorated.getSpanEnd(bold));
    }

    @Test public void offOrLeftOutTheTitleStaysAsItIs() {
        String title = "Groups";
        Settings.FOLDER_TAB_ICONS.save(false);
        assertSame(title, TabIcons.title(title, 1));

        Settings.FOLDER_TAB_ICONS.save(true);
        PatchFamilyForTests.installed();
        assertSame(title, TabIcons.title(title, 1));
        assertTrue(telegram.asked.isEmpty());
    }

    @Test public void tabWithoutAFolderStaysAsItIs() {
        assertSame("Groups", TabIcons.title("Groups", -1));
        assertSame("Groups", TabIcons.title("Groups", 3));
        assertNull(TabIcons.title(null, 1));
    }

    @Test public void iconIsAddedOnce() {
        CharSequence once = TabIcons.title("Groups", 1);
        assertSame(once, TabIcons.title(once, 1));
    }

    @Test public void sameNameBuiltAgainComparesEqual() {
        CharSequence first = TabIcons.title("Groups", 1);
        CharSequence again = TabIcons.title("Groups", 1);

        assertTrue(TextUtils.equals(first, again));
        assertEquals(first, again);
        // What the tab's title check reads, against the plain name it's handed.
        assertTrue(TextUtils.equals(TabIcons.plain(first), "Groups"));
        assertSame("Groups", TabIcons.plain("Groups"));
    }

    @Test public void retitledTabGetsTheIconOfItsFolder() {
        Object tab = new Object();
        telegram.tabs.put(tab, 0);

        assertEquals("msg_discussion", iconOf(TabIcons.retitle("All Chats", tab)));
        assertSame("All Chats", TabIcons.retitle("All Chats", new Object()));
    }

    @Test public void pickedPackDrawsTheTabs() {
        Settings.FOLDER_ICON_PACK.save(FolderIcons.FILL);

        CharSequence all = TabIcons.title("All Chats", 0);
        CharSequence work = TabIcons.title("Work", 2);

        assertEquals("fill/chat-circle", iconOf(all));
        assertEquals("fill/briefcase", iconOf(work));
        assertNotNull(TabIcons.icon(work).drawable());
        assertTrue(telegram.asked.isEmpty());
    }

    @Test public void telegramThatChangedIsReported() {
        telegram.broken = true;

        assertSame("Groups", TabIcons.title("Groups", 1));
        assertTrue(String.join("\n", HookStatus.report()).contains("folder tab icons"));
    }

    @Test public void iconTakesMoreRoomThanASpaceAndDrawsInTheTextColor() {
        TextPaint paint = new TextPaint();
        paint.setTextSize(30f);
        paint.setColor(Color.RED);
        CharSequence title = TabIcons.title("Groups", 1);
        TabIcons.Icon icon = TabIcons.icon(title);

        int width = icon.getSize(paint, title, 0, 1, null);
        assertEquals(36 + 9, width);
        assertTrue(width > paint.measureText(" "));

        Canvas canvas = new Canvas(Bitmap.createBitmap(100, 100, Bitmap.Config.ARGB_8888));
        icon.draw(canvas, title, 0, 1, 10f, 20, 40, 80, paint);
        Recording drawing = telegram.drawn.get("msg_folders_groups");
        assertEquals(1, drawing.draws);
        // As tall as the text's 1.2 times, in the middle of the line.
        assertEquals(10, drawing.getBounds().left);
        assertEquals(36, drawing.getBounds().width());
        assertEquals(32, drawing.getBounds().top);
        assertTrue(drawing.filter instanceof PorterDuffColorFilter);
    }

    @Test public void missingDrawingDrawsNothing() {
        TabIcons.telegram = new Fake() {
            @Override public Drawable drawable(String name) { return null; }
        };
        CharSequence title = TabIcons.title("Groups", 1);
        TabIcons.Icon icon = TabIcons.icon(title);
        Paint paint = new Paint();
        paint.setTextSize(30f);

        icon.draw(new Canvas(Bitmap.createBitmap(10, 10, Bitmap.Config.ARGB_8888)), title, 0, 1, 0f, 0, 10, 10, paint);
        assertNull(icon.drawable());
        assertFalse(String.join("\n", HookStatus.report()).contains("folder tab icons"));
    }
}
