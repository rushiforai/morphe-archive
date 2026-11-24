package app.jofslash.extension.quora;

import java.util.Set;

/** Checks that the presets only name switches the settings know. Run by run.sh. */
public final class PresetsTest {

    public static void main(String[] args) {
        Set<String> keys = SettingsCatalog.keys();
        int failures = 0;
        for (String key : Presets.CLEAN_FEED) {
            if (!keys.contains(key)) {
                System.err.println("FAIL Presets: Clean feed names " + key + ", which SettingsCatalog doesn't list");
                failures++;
            }
        }
        for (String key : Presets.ADS_ONLY) {
            if (!keys.contains(key)) {
                System.err.println("FAIL Presets: Ads and privacy only names " + key + ", which SettingsCatalog doesn't list");
                failures++;
            }
            if (!Presets.CLEAN_FEED.contains(key)) {
                System.err.println("FAIL Presets: Ads and privacy only keeps " + key + " on, but Clean feed turns it off");
                failures++;
            }
        }
        for (String key : Presets.READING) {
            if (!keys.contains(key)) {
                System.err.println("FAIL Presets: For reading names " + key + ", which SettingsCatalog doesn't list");
                failures++;
            }
        }
        if (!Presets.READING.containsAll(Presets.CLEAN_FEED)) {
            System.err.println("FAIL Presets: For reading must keep everything Clean feed keeps");
            failures++;
        }
        for (String key : Presets.PERSONAL) {
            if (!keys.contains(key)) {
                System.err.println("FAIL Presets: PERSONAL names " + key + ", which SettingsCatalog doesn't list");
                failures++;
            }
            if (Presets.READING.contains(key)) {
                System.err.println("FAIL Presets: " + key + " is personal, so no preset may name it");
                failures++;
            }
        }
        if (!Presets.ADS_ONLY.contains("removeAds")) {
            System.err.println("FAIL Presets: Ads and privacy only must keep Remove ads on");
            failures++;
        }
        if (failures > 0) System.exit(1);
        System.out.println("Presets: " + keys.size() + " switches, Clean feed keeps " + Presets.CLEAN_FEED.size()
                + ", For reading keeps " + Presets.READING.size() + ", Ads and privacy only keeps " + Presets.ADS_ONLY.size());
    }
}
