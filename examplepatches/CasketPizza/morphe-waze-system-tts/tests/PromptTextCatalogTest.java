import app.waze.systemtts.extension.PromptTextCatalog;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.zip.ZipFile;

/** Run against the user's original base.apk; no Waze assets are redistributed. */
public final class PromptTextCatalogTest {
    public static void main(String[] args) throws Exception {
        try (ZipFile apk = new ZipFile(args[0]);
             InputStreamReader reader = new InputStreamReader(
                     apk.getInputStream(apk.getEntry("assets/res/key_value_tts_strings.txt")), StandardCharsets.UTF_8)) {
            PromptTextCatalog catalog = new PromptTextCatalog(reader);
            check(catalog.resolve("/sound/eng/ApproachPermanentHazardSpeedBump.mp3"), "Speed bumps ahead");
            check(catalog.resolve("TTS_APPTEXT_APPROACH_PERMANENT_HAZARD_SPEED_BUMP"), "Speed bumps ahead");
            check(catalog.resolve("/sound/eng/ApproachPermanentHazardSchoolZone.mp3"), "School zone ahead");
            check(catalog.resolve("/sound/eng/Police.mp3"), "police reported ahead");
            check(catalog.resolve("/sound/eng/ApproachRailroadCrossing.mp3"), "Approaching a railroad crossing");
            check(catalog.resolve("/sound/eng/TurnLeft.mp3"), "turn left");
            check(catalog.resolve("/sound/eng/200meters.mp3"), "in two hundred meters");
            for (String sound : new String[]{"ping.mp3", "beepbeep.mp3", "speed_limit.mp3", "click.mp3",
                    "TTS_APPTEXT_ESTIMATED_TIME_IN_TRAFFIC", "TTS_APPTEXT_INSIGHTS_APPROACH_SEGMENT_PS_PS", "unknown.mp3"}) {
                check(catalog.resolve(sound), null);
            }
            String speedBump = catalog.alertKey("ApproachPermanentHazardSpeedBump.mp3", null);
            check(catalog.alerts().get(speedBump), "Speed bumps ahead");
            check(catalog.alertKey("cache-hash", "  Speed bumps ahead  "), speedBump);
            check(catalog.alertKey("TurnLeft.mp3", "turn left"), null);
            check(catalog.alertKey("beep.mp3", null), null);
            PromptTextCatalog duplicates = new PromptTextCatalog(new java.io.StringReader(
                    "TTS_APPTEXT_FIRST=Same alert\nTTS_APPTEXT_SECOND=Same alert\nTTS_TEMPLATE=%s ahead\n"));
            check(duplicates.alertKey("First.mp3", null), duplicates.alertKey("Second.mp3", null));
            check(duplicates.alertKey(null, "same alert"), duplicates.alertKey("Second.mp3", null));
            if (duplicates.alerts().size() != 1) throw new AssertionError("Duplicate/template editor entries");
            System.out.println("PASS: prompt resolution, alert identities, duplicate aliases and template exclusions");
        }
    }

    private static void check(String actual, String expected) {
        if (!java.util.Objects.equals(actual, expected)) throw new AssertionError("Expected " + expected + "; got " + actual);
    }
}
