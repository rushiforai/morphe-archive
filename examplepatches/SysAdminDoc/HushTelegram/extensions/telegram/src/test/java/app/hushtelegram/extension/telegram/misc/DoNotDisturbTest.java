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

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DoNotDisturbTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** One item Telegram's menu was given. */
    private static final class Item {
        final Object options;
        final CharSequence text;
        final Runnable onTap;

        Item(Object options, CharSequence text, Runnable onTap) {
            this.options = options;
            this.text = text;
            this.onTap = onTap;
        }
    }

    private final List<Item> items = new ArrayList<>();

    @Before public void setUp() {
        DoNotDisturb.menu = (options, icon, text, onTap) -> items.add(new Item(options, text, onTap));
        Settings.DND_MENU.resetToDefault();
        DoNotDisturb.Stored.ON.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        DoNotDisturb.menu = DoNotDisturb::addItem;
        SettingReadsForTests.mend(Settings.DND_MENU);
        SettingReadsForTests.mend(DoNotDisturb.Stored.ON);
        Settings.DND_MENU.resetToDefault();
        DoNotDisturb.Stored.ON.resetToDefault();
        HookStatus.clear();
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    /** Telegram as it is: no item, every notification posted, the in-chat sound as its own switch says. */
    private void assertStock(String why) {
        items.clear();
        DoNotDisturb.menu(new Object());
        assertTrue(why, items.isEmpty());
        assertFalse(why, DoNotDisturb.quiet());
        assertTrue(why, DoNotDisturb.chatSound(1));
        assertFalse(why, DoNotDisturb.chatSound(0));
    }

    private void tap(Item item) throws Exception {
        item.onTap.run();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
    }

    private Item shownItem() {
        items.clear();
        Object options = new Object();
        DoNotDisturb.menu(options);
        assertEquals(1, items.size());
        assertSame(options, items.get(0).options);
        return items.get(0);
    }

    @Test public void offByDefaultTelegramNotifiesAsItAlwaysHas() {
        assertFalse(Settings.DND_MENU.get());
        assertFalse(DoNotDisturb.Stored.ON.get());
        // The state never goes in a settings file, so an import can't silence another phone.
        assertFalse(DoNotDisturb.Stored.ON.includeWithImportExport);
        assertStock("default");
        // A stray Do Not Disturb state does nothing without its switch.
        DoNotDisturb.Stored.ON.save(true);
        assertStock("state without the switch");
        assertFalse(report(), report().contains(DoNotDisturb.HELD));
    }

    @Test public void aTapTurnsItOnHoldsNotificationsAndTheChatSoundThenTurnsItOff() throws Exception {
        Settings.DND_MENU.save(true);
        Item item = shownItem();
        assertEquals("Turn on Do Not Disturb", String.valueOf(item.text));
        assertFalse(DoNotDisturb.quiet());
        assertTrue(DoNotDisturb.chatSound(1));

        tap(item);
        assertTrue(DoNotDisturb.Stored.ON.get());
        assertEquals("Do Not Disturb is on.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        assertTrue(DoNotDisturb.quiet());
        assertFalse(DoNotDisturb.chatSound(1));
        // Telegram's own in-chat sound switch off stays off.
        assertFalse(DoNotDisturb.chatSound(0));
        assertTrue(report(), report().contains(DoNotDisturb.HELD));
        assertTrue(report(), report().contains(DoNotDisturb.CHAT_SOUND));

        // The menu says what the next tap does, and that tap puts everything back.
        Item off = shownItem();
        assertEquals("Turn off Do Not Disturb", String.valueOf(off.text));
        tap(off);
        assertFalse(DoNotDisturb.Stored.ON.get());
        assertEquals("Do Not Disturb is off.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        assertFalse(DoNotDisturb.quiet());
        assertTrue(DoNotDisturb.chatSound(1));
        assertEquals("Turn on Do Not Disturb", String.valueOf(shownItem().text));
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void pauseNoContextBrokenReadsAndTheSwitchOffLeaveTelegramStock() {
        Settings.DND_MENU.save(true);
        DoNotDisturb.Stored.ON.save(true);
        assertTrue(DoNotDisturb.quiet());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock(reason.name());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertStock("no context"));
        SettingReadsForTests.breakReads(DoNotDisturb.Stored.ON);
        assertStock("broken state read");
        SettingReadsForTests.mend(DoNotDisturb.Stored.ON);
        SettingReadsForTests.breakReads(Settings.DND_MENU);
        assertStock("broken switch read");
        SettingReadsForTests.mend(Settings.DND_MENU);
        HookStatus.clear();
        Settings.DND_MENU.save(false);
        assertStock("switch off");
        assertFalse(report(), report().contains(DoNotDisturb.HELD));
    }

    @Test public void eachChangeOfTheSwitchStartsWithDoNotDisturbOff() {
        Settings.DND_MENU.save(true);
        DoNotDisturb.Stored.ON.save(true);
        DoNotDisturb.switched();
        assertFalse(DoNotDisturb.Stored.ON.get());
        assertFalse(DoNotDisturb.quiet());
    }

    @Test public void aTapAfterTheSwitchWentOffChangesNothing() throws Exception {
        Settings.DND_MENU.save(true);
        Item item = shownItem();
        Settings.DND_MENU.save(false);
        tap(item);
        assertFalse(DoNotDisturb.Stored.ON.get());
        assertNull(ShadowToast.getTextOfLatestToast());
        // Paused, a tap changes nothing either.
        Settings.DND_MENU.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        tap(item);
        PauseForTests.resume();
        assertFalse(DoNotDisturb.Stored.ON.get());
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aMenuThatChangedIsRecordedAndTelegramShowsItsOwnMenu() {
        Settings.DND_MENU.save(true);
        DoNotDisturb.menu = (options, icon, text, onTap) -> {
            throw new IllegalStateException("Telegram changed");
        };
        DoNotDisturb.menu(new Object());
        String missed = String.join("\n", HookStatus.missing(FamilyNames.PROXY_MENU));
        assertTrue(missed, missed.contains("'" + DoNotDisturb.MENU_ITEM + "'"));
        // Without a menu there's nothing to add to.
        HookStatus.clear();
        DoNotDisturb.menu = (options, icon, text, onTap) -> items.add(new Item(options, text, onTap));
        DoNotDisturb.menu(null);
        assertTrue(items.isEmpty());
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void theToastsFitTwoLinesInEveryLanguage() {
        String[] toasts = {"Do Not Disturb is on.", "Do Not Disturb is off.", "Couldn't save that. Try again."};
        for (String toast : toasts) {
            assertFitsATwoLineToast("en", toast);
            for (String language : new String[]{"bg", "de", "es", "in", "pt-rbr", "tr", "zh-hans"}) {
                String row = L10nTablesForTests.of(language).get(toast);
                assertNotNull(language + ": " + toast, row);
                assertFitsATwoLineToast(language, row);
            }
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }
}
