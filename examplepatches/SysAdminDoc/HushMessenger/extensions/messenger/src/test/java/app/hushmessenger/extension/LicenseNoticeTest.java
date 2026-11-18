package app.hushmessenger.extension;

import android.text.Spanned;
import android.text.style.StyleSpan;
import android.view.View;
import android.widget.TextView;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * Source and licenses shows the NOTICE the repository ships, word for word and with no connection. Morphe's section 7b
 * asks that its notice reach the person using the app, and a hand-kept copy would drift from NOTICE the first time
 * either changed.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class LicenseNoticeTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    private static File repositoryFile(String name) {
        File dir = new File("").getAbsoluteFile();
        while (dir != null && !new File(dir, "settings.gradle.kts").isFile()) dir = dir.getParentFile();
        if (dir == null) throw new IllegalStateException("No repository root above " + new File("").getAbsolutePath());
        return new File(dir, name);
    }

    @Test public void theAppCarriesNoticeExactly() throws Exception {
        String notice = new String(Files.readAllBytes(repositoryFile("NOTICE").toPath()), StandardCharsets.UTF_8)
            .replace("\r\n", "\n");
        assertEquals(notice, LicenseNotice.TEXT);
    }

    /** Morphe's current notice, all three of its section 7 terms, and the projects the code came from. */
    @Test public void theNoticeCarriesMorphesSectionSevenAndEveryUpstream() {
        for (String term : new String[] {
                "All derivative works (source code and binaries) must include this\nNOTICE text and provide it to the software user.",
                "GPLv3 Section 7b: Preservation of User Notices",
                "GPLv3 Section 7c: Prohibiting Misrepresentation of Origin",
                "GPLv3 Section 7e: Declining Grant of Trademark Rights",
                "Project Name Restriction"}) {
            assertTrue("NOTICE does not carry " + term, LicenseNotice.TEXT.contains(term));
        }
        for (String upstream : new String[] {
                "https://github.com/MorpheApp/morphe-patches",
                "https://github.com/RookieEnough/De-Vanced",
                "https://github.com/rushiranpise/morphe-patches",
                "https://gitlab.com/ReVanced/revanced-patches",
                "https://github.com/NeonOrbit/ChatHeadEnabler"}) {
            assertTrue("NOTICE does not name " + upstream, LicenseNotice.TEXT.contains(upstream));
        }
    }

    @Test public void theSourceRowOpensTheNoticeInTheApp() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("source_licenses").performClick();
            // Nothing leaves the app until Source code is tapped.
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
            SettingsDialog sheet = screen.get().licensesSheet();
            assertTrue(sheet.dialog.isShowing());
            assertEquals("Source and licenses", ((TextView) sheet.findViewWithTag("dialog_title")).getText().toString());
            CharSequence shown = ((TextView) sheet.findViewWithTag("licenses_text")).getText();
            String words = shown.toString();
            assertTrue(words.contains("GPLv3 Section 7b: Preservation of User Notices"));
            assertTrue(words.contains("GPLv3 Section 7e: Declining Grant of Trademark Rights"));
            // Hard-wrapped prose reads as one paragraph on the phone.
            assertTrue(words.contains("All derivative works (source code and binaries) must include this NOTICE text and provide it to the software user."));
            assertTrue(words.contains("adapted from RookieEnough/De-Vanced (0d01e3dd5ec82b6796b28b82c33fc6af4944b2e6), including"));
            // The rules under headings are text-file markup, so they go and the heading turns bold.
            assertFalse(words.contains("====="));
            assertFalse(words.contains("-----\n"));
            assertTrue(isBold(shown, "HushMessenger NOTICE"));
            assertTrue(isBold(shown, "Morphe: Project Name Restriction"));
            // The license texts keep their own lines.
            assertTrue(words.contains("   1. Definitions.\n"));
            // Each project's address sits under its name, where it fits a narrow screen.
            assertTrue(words.contains("morphe-patches\nhttps://github.com/MorpheApp/morphe-patches\n"));

            ((TextView) sheet.findViewWithTag("licenses_close")).performClick();
            assertFalse(sheet.dialog.isShowing());
            root.findViewWithTag("source_licenses").performClick();
            sheet = screen.get().licensesSheet();
            sheet.findViewWithTag("licenses_source").performClick();
            assertEquals("https://github.com/SysAdminDoc/HushMessenger",
                Shadows.shadowOf(screen.get()).getNextStartedActivity().getDataString());
        }
    }

    /** A second tap while the sheet is up doesn't stack another one on it. */
    @Test public void aSecondTapKeepsOneSheet() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("source_licenses").performClick();
            SettingsDialog first = screen.get().licensesSheet();
            root.findViewWithTag("source_licenses").performClick();
            assertSame(first, screen.get().licensesSheet());
        }
    }

    /** The notice is the license text, so it reads the same in every language settings come in. */
    @Test @Config(qualifiers = "es") public void theNoticeStaysInEnglishWhileTheSheetIsTranslated() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("source_licenses").performClick();
            SettingsDialog sheet = screen.get().licensesSheet();
            assertEquals("Código fuente y licencias", ((TextView) sheet.findViewWithTag("dialog_title")).getText().toString());
            assertEquals("Código fuente", ((TextView) sheet.findViewWithTag("licenses_source")).getText().toString());
            assertTrue(((TextView) sheet.findViewWithTag("licenses_text")).getText().toString()
                .contains("GPLv3 Section 7b: Preservation of User Notices"));
        }
    }

    private static boolean isBold(CharSequence shown, String heading) {
        int start = shown.toString().indexOf(heading);
        if (start < 0 || !(shown instanceof Spanned)) return false;
        for (StyleSpan span : ((Spanned) shown).getSpans(start, start + heading.length(), StyleSpan.class)) {
            if (span.getStyle() == android.graphics.Typeface.BOLD) return true;
        }
        return false;
    }
}
