/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MessageMenuTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final List<BooleanSetting> SWITCHES = Arrays.asList(Settings.MESSAGE_MENU_REPEAT, Settings.MESSAGE_MENU_COPY_PHOTO,
            Settings.MESSAGE_MENU_DETAILS);

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : SWITCHES) {
            SettingReadsForTests.mend(setting);
            setting.resetToDefault();
        }
        HookStatus.clear();
    }

    /** Reply, Forward and Delete, as Telegram numbers them. */
    private static List<List<Object>> menu() {
        return Arrays.asList(new ArrayList<Object>(Arrays.asList(11, 12, 13)), new ArrayList<Object>(Arrays.asList("Reply", "Forward", "Delete")),
                new ArrayList<Object>(Arrays.asList(8, 2, 1)));
    }

    @Test public void offByDefaultTheMenuStaysTelegrams() {
        for (BooleanSetting setting : SWITCHES) assertFalse(setting.key, setting.get());
        List<List<Object>> menu = menu();
        MessageMenu.fill(new Object(), new Object(), (ArrayList<Object>) menu.get(0), (ArrayList<Object>) menu.get(1), (ArrayList<Object>) menu.get(2));
        assertEquals(menu(), menu);
        MessageMenu.chosen(new Object(), MessageMenu.REPEAT);
        MessageMenu.chosen(new Object(), MessageMenu.COPY_PHOTO);
        MessageMenu.chosen(new Object(), 2);
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.MESSAGE_MENU_REPEAT));
    }

    @Test public void onRepeatAndCopyPhotoFollowForwardAndDetailsGoesLast() {
        List<List<Object>> menu = menu();
        MessageMenu.offer(menu.get(0), menu.get(1), menu.get(2), true, true, true, 2);
        assertEquals(Arrays.asList(8, 2, MessageMenu.REPEAT, MessageMenu.COPY_PHOTO, 1, MessageMenu.DETAILS), menu.get(2));
        assertEquals(Arrays.asList("Reply", "Forward", "Repeat", "Copy photo", "Delete", "Message details"), menu.get(1));
        assertEquals(6, menu.get(0).size());

        // Each switch on its own, a menu without Forward, an empty one and lists out of step.
        List<List<Object>> details = menu();
        MessageMenu.offer(details.get(0), details.get(1), details.get(2), false, false, true, 2);
        assertEquals(Arrays.asList(8, 2, 1, MessageMenu.DETAILS), details.get(2));
        List<List<Object>> copy = menu();
        MessageMenu.offer(copy.get(0), copy.get(1), copy.get(2), false, true, false, 2);
        assertEquals(Arrays.asList(8, 2, MessageMenu.COPY_PHOTO, 1), copy.get(2));
        List<List<Object>> noForward = menu();
        MessageMenu.offer(noForward.get(0), noForward.get(1), noForward.get(2), true, true, false, 7);
        assertEquals(menu(), noForward);
        List<Object> empty = new ArrayList<>();
        MessageMenu.offer(new ArrayList<>(), new ArrayList<>(), empty, true, true, true, 2);
        assertTrue(empty.isEmpty());
        List<List<Object>> skewed = menu();
        skewed.get(0).remove(0);
        MessageMenu.offer(skewed.get(0), skewed.get(1), skewed.get(2), true, true, true, 2);
        assertEquals(Arrays.asList(8, 2, 1), skewed.get(2));
    }

    @Test public void repeatKeepsTelegramsPremiumRuleAndSendsTheWholeAlbum() {
        // Unpatched, the chat never takes messages and no photo is on the phone, so neither item is offered.
        assertFalse(MessageMenu.repeatable(new Object(), new Object()));
        assertNull(MessageMenu.downloaded(new Object()));
        Object message = new Object();
        assertEquals(Arrays.asList(message), MessageMenu.batch(new Object(), message));
        assertFalse(ForwardSender.hides(false, 36, 0, 36));
        assertTrue(ForwardSender.hides(true, 36, 0, 36));
    }

    @Test public void detailsReadAsOneFactALineInLocalTime() {
        Context context = RuntimeEnvironment.getApplication();
        MessageMenu.Facts facts = new MessageMenu.Facts();
        facts.id = 42;
        facts.chat = -1001234567890L;
        facts.sender = 777000L;
        facts.date = 1_790_000_000;
        facts.forwarded = true;
        facts.forwardName = "Alice";
        facts.forwardFrom = 99L;
        facts.dc = 4;
        facts.size = 2048;
        List<String> lines = Arrays.asList(MessageMenu.describe(context, facts).split("\n"));
        assertEquals("Message ID: 42", lines.get(0));
        assertEquals("Chat ID: -1001234567890", lines.get(1));
        assertEquals("Sender ID: 777000", lines.get(2));
        assertTrue(lines.get(3), lines.get(3).startsWith("Sent: ") && lines.get(3).matches(".*\\d:\\d\\d:\\d\\d.*"));
        assertTrue(lines.get(4), lines.get(4).startsWith("Forwarded from: ") && lines.get(4).contains("Alice"));
        assertEquals("Original sender ID: 99", lines.get(5));
        assertEquals("File data center: 4", lines.get(6));
        assertTrue(lines.get(7), lines.get(7).startsWith("File size: "));
        assertEquals("no edit and no original date, so no lines for them", 8, lines.size());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheMenu() {
        for (BooleanSetting setting : SWITCHES) {
            setting.save(true);
            assertTrue(setting.key, MessageMenu.on(setting));
            for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
                if (reason == HushTelegramPause.Reason.NONE) continue;
                PauseForTests.pause(reason);
                assertFalse(reason.name(), MessageMenu.on(setting));
                PauseForTests.resume();
            }
            SettingsContextRule.withoutContext(() -> assertFalse(MessageMenu.on(setting)));
            SettingReadsForTests.breakReads(setting);
            assertFalse(MessageMenu.on(setting));
        }
        assertFalse(HookStatus.missing(FamilyNames.MESSAGE_MENU_REPEAT).isEmpty());
    }
}
