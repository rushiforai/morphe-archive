/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.morphe.extension.hushthreads.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.L10nTablesForTests;
import app.morphe.extension.shared.SettingsContextRule;

/**
 * What a save says, drawn under en-XA: every word the catalog draws is bracketed there, so plain
 * English in a toast or the notification is text that never went through it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "en-rXA")
public class SaveTextL10nTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final Context context = RuntimeEnvironment.getApplication();

    @After
    public void clear() {
        notifications().cancelAll();
    }

    @Test
    public void everyResultAndTheProgressLineComeFromTheCatalog() {
        List<String> said = new ArrayList<>();
        for (Downloader.Status status : Downloader.Status.values()) {
            for (boolean lower : new boolean[] { false, true }) {
                said.add(MediaSave.message(context, status, null, lower));
                said.add(MediaSave.message(context, status, "Movies/Threads", lower));
            }
        }
        said.add(SaveControl.progressText(5_000_000, 50_000_000));
        said.add(SaveControl.progressText(5_000_000, -1));
        for (String text : said) {
            assertTrue("not from the catalog: " + text, text.startsWith("[") && text.endsWith("]"));
        }
        // The folder is a value, and a value is never drawn accented.
        assertTrue(MediaSave.message(context, Downloader.Status.OK, "Movies/Threads", false).contains("Movies/Threads"));
        assertTrue(MediaSave.message(context, Downloader.Status.OK, "Movies/Threads", true).contains("Movies/Threads"));
    }

    @Test
    public void theNotificationAndItsChannelComeFromTheCatalog() {
        SaveControl.Save save = SaveControl.begin(context, true);
        try {
            Notification shown = null;
            for (Notification notification : Shadows.shadowOf(notifications()).getAllNotifications()) {
                if (SaveControl.CHANNEL.equals(notification.getChannelId())) shown = notification;
            }
            assertNotNull("no save notification", shown);
            String title = String.valueOf(shown.extras.getCharSequence(Notification.EXTRA_TITLE));
            assertTrue(title, title.startsWith("[") && title.endsWith("]"));
            // Cancel comes from the catalog too, so it's in the title's language.
            String cancel = String.valueOf(shown.actions[0].title);
            assertTrue(cancel, cancel.startsWith("[") && cancel.endsWith("]"));

            NotificationChannel channel = notifications().getNotificationChannel(SaveControl.CHANNEL);
            assertTrue(String.valueOf(channel.getName()), String.valueOf(channel.getName()).startsWith("["));
            assertTrue(channel.getDescription(), channel.getDescription().startsWith("["));
        } finally {
            save.end();
        }
    }

    /** The numbers are written the phone's way, in whatever language the sentence comes out in. */
    @Test
    @Config(qualifiers = "de")
    public void progressNumbersAreWrittenThePhonesWay() {
        long mib = 1024L * 1024L;
        String german = L10nTablesForTests.of("de").get("%1$s of %2$s");
        assertEquals(String.format(german, "4,2 MB", "100 MB"), SaveControl.progressText((long) (4.2 * mib), 100 * mib));
    }

    /** A French phone has no French table: an English sentence, French numbers. */
    @Test
    @Config(qualifiers = "fr-rFR")
    public void aPhoneWithNoTableReadsEnglishWithItsOwnNumbers() {
        long mib = 1024L * 1024L;
        assertEquals("4,2 MB of 100 MB", SaveControl.progressText((long) (4.2 * mib), 100 * mib));
        assertEquals("12 MB so far", SaveControl.progressText(12 * mib, -1));
    }

    /** A save's result reaches a Spanish phone in Spanish, with Threads named in it. */
    @Test
    @Config(qualifiers = "es")
    public void aResultIsSaidInThePhonesLanguage() {
        String lower = L10nTablesForTests.of("es").get("Saved to %1$s in lower quality than on Threads");
        assertNotNull(lower);
        assertTrue(lower, lower.contains("Threads"));
        // The folder goes in isolated, so a right-to-left sentence can't reorder it.
        assertEquals(String.format(lower, L10n.isolate("Movies/Threads")),
                MediaSave.message(context, Downloader.Status.OK, "Movies/Threads", true));
        assertEquals(L10nTablesForTests.of("es").get("Saved to the gallery"),
                MediaSave.message(context, Downloader.Status.OK, null, false));
    }

    /**
     * Android 12 and later cut a text toast after two lines, so each toast a save shows there fits
     * two lines of a narrow phone in every language the catalog carries. The Storage permission
     * message is left out: it only shows on Android 9, which draws the whole toast.
     */
    @Test
    public void everyToastFitsTwoLinesInEveryLanguage() {
        List<String> tooLong = new ArrayList<>();
        for (String language : new String[] { "en", "de", "es", "in", "it", "ko", "pt-rBR", "tr", "zh-rTW" }) {
            RuntimeEnvironment.setQualifiers(language);
            List<String> toasts = new ArrayList<>();
            for (Downloader.Status status : Downloader.Status.values()) {
                if (status == Downloader.Status.NO_PERMISSION) continue;
                for (boolean lower : new boolean[] { false, true }) {
                    toasts.add(MediaSave.message(context, status, null, lower));
                    toasts.add(MediaSave.message(context, status, "Pictures/Threads", lower));
                }
            }
            toasts.add(new MediaSave.BatchResult(31, 1, 0, 0, false).message(context));
            toasts.add(new MediaSave.BatchResult(1, 0, 31, 0, true).message(context));
            // Two digits in every count, the widest a 32 page carousel can give.
            toasts.add(new MediaSave.BatchResult(10, 10, 12, 0, false).message(context));
            toasts.add(new MediaSave.BatchResult(10, 10, 12, 0, true).message(context));
            toasts.add(new MediaSave.BatchResult(30, 1, 1, 30, false).message(context));
            toasts.add(new MediaSave.BatchResult(1, 1, 30, 0, false, false, true).message(context));
            toasts.add(L10n.t(context, "Saving... To cancel, open Downloads in HushThreads settings."));
            toasts.add(L10n.f(context, "Not saved: a carousel can have at most %1$d pages", 32));
            toasts.add(L10n.quantity(context, 1, "A save stopped. Reopen the post and save again.",
                    "%1$d saves stopped. Reopen the post and save again."));
            toasts.add(L10n.quantity(context, 12, "A save stopped. Reopen the post and save again.",
                    "%1$d saves stopped. Reopen the post and save again."));
            for (String text : toasts) {
                // Feedback shows each line of a message as its own toast.
                for (String toast : text.split("\n")) {
                    if (toastLines(toast) > 2) tooLong.add(language + ": " + toast);
                }
            }
        }
        assertTrue("past two lines: " + tooLong, tooLong.isEmpty());
    }

    /**
     * The lines a toast takes, wrapped by word at 34 characters. An S22 (384 dp wide, font scale 1)
     * cut a toast's second line at "This network's proxy asks for a p…", 34 characters and the
     * ellipsis. The marks that isolate a folder's name take no room. A Han or Hangul character is
     * drawn about twice as wide as a Latin letter and a line can break before any one of them, so
     * each is a word of its own two characters wide.
     */
    private static int toastLines(String toast) {
        String text = toast.replace("⁨", "").replace("⁩", "");
        int lines = 1;
        int used = 0;
        boolean spaced = false;
        for (int at = 0; at < text.length(); ) {
            int point = text.codePointAt(at);
            if (point == ' ') {
                spaced = true;
                at++;
                continue;
            }
            int width;
            int end = at + Character.charCount(point);
            if (wide(point)) {
                width = 2;
            } else {
                width = 1;
                while (end < text.length() && text.codePointAt(end) != ' ' && !wide(text.codePointAt(end))) {
                    width++;
                    end += Character.charCount(text.codePointAt(end));
                }
            }
            int gap = used > 0 && spaced ? 1 : 0;
            if (used > 0 && used + gap + width > 34) {
                lines++;
                used = width;
            } else {
                used += gap + width;
            }
            spaced = false;
            at = end;
        }
        return lines;
    }

    private static boolean wide(int point) {
        Character.UnicodeScript script = Character.UnicodeScript.of(point);
        return script == Character.UnicodeScript.HAN || script == Character.UnicodeScript.HANGUL
                || (point >= 0x3000 && point <= 0x303F) || (point >= 0xFF00 && point <= 0xFF60);
    }

    /** A channel named in one language is renamed in the next, keeping what the person set. */
    @Test
    @Config(qualifiers = "de")
    public void aChannelNamedInAnotherLanguageIsRenamed() {
        NotificationChannel old = new NotificationChannel(SaveControl.CHANNEL, "HushThreads saves",
                NotificationManager.IMPORTANCE_LOW);
        notifications().createNotificationChannel(old);

        SaveControl.begin(context, false).end();
        NotificationChannel renamed = notifications().getNotificationChannel(SaveControl.CHANNEL);
        assertEquals(L10nTablesForTests.of("de").get("HushThreads saves"), String.valueOf(renamed.getName()));
        assertEquals(NotificationManager.IMPORTANCE_LOW, renamed.getImportance());
    }

    private NotificationManager notifications() {
        return context.getSystemService(NotificationManager.class);
    }
}
