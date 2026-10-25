package app.hushmessenger.extension;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.junit.Test;
import static org.junit.Assert.*;

public class ProblemReportTest {
    private static final String PREFIX = "https://github.com/SysAdminDoc/HushMessenger/issues/new?title=&body=";

    private static ProblemReport.Facts facts(List<String> on) {
        return new ProblemReport.Facts("0.24.0", "583.0.0.29.95", 2147483647L,
            ProblemReport.patchedFrom("583.0.0.29.95|346611369|base", false), "samsung", "SM-S901U", "16", 36, false, false, on);
    }

    @Test public void galleryDiagnosticsContainOnlyKnownCategories() {
        for (String value : new String[] {"RESULT_REVOKED", "RESULT_INVALID", "COMPONENT_MISSING", "PICKER_MISSING", "LAUNCH_FAILED"}) {
            ProblemReport.Facts facts = new ProblemReport.Facts("0.26.0", "584.0.0.49.98", 346814894L,
                "584.0.0.49.98 (346814894, base mapping)", "maker", "model", "16", 36, false, false, List.of(), value);
            assertTrue(ProblemReport.body(facts).contains("Gallery result: " + value + "\n"));
        }
        ProblemReport.Facts unsafe = new ProblemReport.Facts("0.26.0", "584.0.0.49.98", 346814894L, "known",
            "maker", "model", "16", 36, false, false, List.of(), "content://private/account/path\nLAUNCH_FAILED");
        assertFalse(ProblemReport.body(unsafe).contains("Gallery result:"));
        assertFalse(ProblemReport.body(unsafe).contains("private"));
    }

    private static String decoded(String url) throws Exception {
        assertTrue(url, url.startsWith(PREFIX));
        return URLDecoder.decode(url.substring(PREFIX.length()), "UTF-8");
    }

    @Test public void theBodyHasTheVersionsThePhoneTheControlsAndBothQuestions() {
        assertEquals("Versions: HushMessenger 0.24.0 on Messenger 583.0.0.29.95 (2147483647)\n"
            + "Patched from: 583.0.0.29.95 (346611369, base mapping)\n"
            + "Phone: samsung SM-S901U, Android 16 (SDK 36)\n"
            + "Controls on: Hide inbox ads, Hide Meta AI\n\n"
            + "What happened:\n\n\nWhat I expected:\n\n", ProblemReport.body(facts(List.of("Hide inbox ads", "Hide Meta AI"))));
    }

    @Test public void pauseAndSafeModeAreSaidAndAMakerInTheModelIsntRepeated() {
        String body = ProblemReport.body(new ProblemReport.Facts("0.24.0", null, 0, null, "Google", "Google Pixel 9", "", 35, true, true, List.of()));
        assertTrue(body, body.startsWith("Versions: HushMessenger 0.24.0 on Messenger unknown\n"
            + "Patched from: unknown\n"
            + "Phone: Google Pixel 9, Android unknown (SDK 35)\n"
            + "Safe mode: on\nPause all changes: on\nControls on: none\n\n"));
    }

    @Test public void aNameCantAddLinesOfItsOwn() {
        String body = ProblemReport.body(new ProblemReport.Facts("0.24.0", "1\nVersions: fake", 1, "x\nPhone: fake", "maker\nWhat happened: nothing",
            "model\r\n‮\u0000", "16", 36, false, false, List.of("Title\nControls on: fake", " \n ")));
        List<String> starts = new ArrayList<>();
        for (String line : body.split("\n")) if (!line.isEmpty()) starts.add(line.substring(0, Math.min(line.length(), 10)));
        assertEquals(List.of("Versions: ", "Patched fr", "Phone: mak", "Controls o", "What happe", "What I exp"), starts);
        assertTrue(body.contains("Controls on: Title Controls on: fake\n"));
    }

    @Test public void theAddressIsANewGitHubIssueWithTheWholeBodyEncoded() throws Exception {
        ProblemReport.Facts facts = facts(List.of("Hide inbox ads", "Send photos at original quality"));
        String url = ProblemReport.issueUrl(facts);
        assertFalse(url.contains(" "));
        assertFalse(url.contains("+"));
        assertFalse(url.contains("\n"));
        assertEquals(ProblemReport.body(facts), decoded(url));
    }

    @Test public void aLongListIsShortenedToFitAndSaysHowManyWereLeftOut() throws Exception {
        List<String> titles = new ArrayList<>();
        for (int i = 0; i < 400; i++) titles.add("A long control title, number " + i);
        ProblemReport.Facts facts = facts(titles);
        String url = ProblemReport.issueUrl(facts);
        assertTrue(url.length() <= ProblemReport.MAX_LENGTH);
        String body = decoded(url);
        assertTrue(body.endsWith("What happened:\n\n\nWhat I expected:\n\n"));
        Matcher left = Pattern.compile(", and (\\d+) more\n").matcher(body);
        assertTrue(body, left.find());
        int shown = titles.size() - Integer.parseInt(left.group(1));
        assertTrue(shown > 0);
        assertTrue(body.contains("A long control title, number " + (shown - 1) + ", and "));
        // As many as fit: one more title would have gone over.
        assertTrue((PREFIX + ProblemReport.encode(ProblemReport.body(facts, shown + 1))).length() > ProblemReport.MAX_LENGTH);
    }

    @Test public void factsThatAreAllLongNonLatinNamesStillLeaveTheQuestions() throws Exception {
        // Nine characters each once encoded, the most any character takes.
        String name = "測".repeat(500), maker = "製".repeat(500);
        ProblemReport.Facts facts = new ProblemReport.Facts(name, name, 1, ProblemReport.patchedFrom("583.0.0.29.95|346611351|346611351", false),
            maker, name, name, 36, true, false, List.of(name));
        assertEquals(ProblemReport.MAX_FACT, facts.model.length());
        String url = ProblemReport.issueUrl(facts);
        assertTrue(url.length() <= ProblemReport.MAX_LENGTH);
        String body = decoded(url);
        assertTrue(body, body.contains("\nControls on: 1 more\n"));
        assertTrue(body, body.endsWith("What happened:\n\n\nWhat I expected:\n\n"));
    }

    /**
     * Spoof package version makes Android report 2147483647, so the build the patch started from is said on its own
     * line. Only a well-formed name, code and mapping is shown; anything else is unknown rather than a guess.
     */
    @Test public void theBuildItWasPatchedFromIsSaidOnItsOwnAndNeverGuessed() {
        assertEquals("583.0.0.29.95 (346611369, base mapping)", ProblemReport.patchedFrom("583.0.0.29.95|346611369|base", false));
        assertEquals("583.0.0.29.95 (346611351, 346611351 mapping)", ProblemReport.patchedFrom("583.0.0.29.95|346611351|346611351", false));
        assertEquals("none, UI preview", ProblemReport.patchedFrom("583.0.0.29.95|346611369|base", true));
        for (String odd : new String[] {"", null, "583.0.0.29.95", "583.0.0.29.95|346611369", "583.0.0.29.95|0|base",
                "583.0.0.29.95|346611369|base|x", "583 0|346611369|base", "583.0.0.29.95|346611369|\nPhone", "583.0|12345678901|base",
                "a/b|346611369|base", "583.0.0.29.95|346611369|" + "m".repeat(17)}) {
            assertEquals(String.valueOf(odd), "unknown", ProblemReport.patchedFrom(odd, false));
        }
        // The installed code stays in the versions line, so both numbers are there to compare.
        String body = ProblemReport.body(facts(List.of()));
        assertTrue(body, body.contains("(2147483647)\nPatched from: 583.0.0.29.95 (346611369, base mapping)\n"));
    }

    @Test public void cuttingALongNameNeverSplitsAnEmoji() {
        String cut = ProblemReport.clean("a" + "😀".repeat(100));
        assertEquals(ProblemReport.MAX_FACT - 1, cut.length());
        assertTrue(Character.isLowSurrogate(cut.charAt(cut.length() - 1)));
        assertEquals(ProblemReport.MAX_FACT, ProblemReport.clean("😀".repeat(100)).length());
    }
}
