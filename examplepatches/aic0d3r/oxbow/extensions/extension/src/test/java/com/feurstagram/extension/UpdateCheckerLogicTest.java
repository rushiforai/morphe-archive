package com.feurstagram.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Table tests for the updater's own logic, which has no Android in it: the release JSON parsers,
 * the tag normalisation and the version comparison that decide whether an update is offered.
 */
public class UpdateCheckerLogicTest {

    private static final String NOTES = "Oxbow for Instagram 456.1.0.56.78 (patch bundle 1.3.4).\\n"
            + "Line two \\u2014 \\u00e9 \\\"quoted\\\" \\\\ \\/";

    /** One asset the way GitHub emits it, keys in GitHub's order: size and digest before the URL. */
    private static String asset(String name, long size) {
        return "    {\n"
                + "      \"url\": \"https://api.github.com/repos/aic0d3r/oxbow/releases/assets/1\",\n"
                + "      \"id\": 1,\n"
                + "      \"node_id\": \"RA_example\",\n"
                + "      \"name\": \"" + name + "\",\n"
                + "      \"label\": \"\",\n"
                + "      \"uploader\": {\"login\": \"aic0d3r\", \"site_admin\": false},\n"
                + "      \"content_type\": \"application/vnd.android.package-archive\",\n"
                + "      \"state\": \"uploaded\",\n"
                + "      \"size\": " + size + ",\n"
                + "      \"digest\": \"sha256:0000\",\n"
                + "      \"download_count\": 3,\n"
                + "      \"created_at\": \"2026-11-23T20:00:00Z\",\n"
                + "      \"updated_at\": \"2026-11-23T20:00:00Z\",\n"
                + "      \"browser_download_url\": "
                + "\"https://github.com/aic0d3r/oxbow/releases/download/v456-1-0-56-78/" + name + "\"\n"
                + "    }";
    }

    private static final String RELEASE = "{\n"
            + "  \"url\": \"https://api.github.com/repos/aic0d3r/oxbow/releases/1\",\n"
            + "  \"tag_name\": \"v456-1-0-56-78\",\n"
            + "  \"draft\": false,\n"
            + "  \"body\": \"" + NOTES + "\",\n"
            + "  \"assets\": [\n" + asset("oxbow-clone.apk", 258712135L) + ",\n"
            + asset("oxbow.apk", 258000001L) + ",\n"
            + asset("patches-1.3.4.mpp", 1583637L) + "\n"
            + "  ]\n}";

    @Test
    public void eachBuildDownloadsItsOwnApk() {
        String base = "https://github.com/aic0d3r/oxbow/releases/download/v456-1-0-56-78/";
        assertEquals(base + "oxbow.apk", UpdateChecker.extractApkUrl(RELEASE, false));
        assertEquals(base + "oxbow-clone.apk", UpdateChecker.extractApkUrl(RELEASE, true));
        assertEquals(258000001L, UpdateChecker.extractApkSize(RELEASE, false));
        assertEquals(258712135L, UpdateChecker.extractApkSize(RELEASE, true));
    }

    @Test
    public void aReleaseWithoutThisBuildsApkOffersNothing() {
        String plainOnly = "{\"assets\": [" + asset("oxbow.apk", 10L) + "]}";
        assertNull(UpdateChecker.extractApkUrl(plainOnly, true));
        assertEquals(-1L, UpdateChecker.extractApkSize(plainOnly, true));
        assertNull(UpdateChecker.extractApkUrl("{}", false));
        assertEquals(-1L, UpdateChecker.extractApkSize(null, false));
    }

    @Test
    public void theTagBecomesTheInstalledVersionName() {
        assertEquals("456.1.0.56.78", UpdateChecker.normalize("v456-1-0-56-78"));
        assertEquals("455.0.0.51.72", UpdateChecker.normalize("V455-0-0-51-72"));
        assertEquals("456.1.0.56.78", UpdateChecker.normalize("  456.1.0.56.78 "));
        assertEquals("", UpdateChecker.normalize(null));
    }

    @Test
    public void newerComparesNumbersNotStrings() {
        assertTrue(UpdateChecker.isNewer("456.1.0.56.78", "455.0.0.51.72"));
        assertFalse(UpdateChecker.isNewer("455.0.0.51.72", "456.1.0.56.78"));
        assertFalse(UpdateChecker.isNewer("456.1.0.56.78", "456.1.0.56.78"));
        assertTrue(UpdateChecker.isNewer("456.10.0.1.1", "456.9.0.9.9"));
        assertTrue(UpdateChecker.isNewer("456.1", "456.0.9.9.9"));
        assertFalse(UpdateChecker.isNewer("456", "456.0.0.0.1"));
        assertTrue(UpdateChecker.isNewer("456.1.0.56.78", "unknown"));
        assertFalse(UpdateChecker.isNewer("unknown", "unknown"));
    }

    @Test
    public void theNotesNameThePatchBundle() {
        assertEquals("1.3.4", UpdateChecker.extractBundleVersion(
                "Oxbow for Instagram 456.1.0.56.78 (patch bundle 1.3.4). Earlier bundles: see below."));
        assertNull(UpdateChecker.extractBundleVersion("patch bundle coming soon"));
        assertNull(UpdateChecker.extractBundleVersion(null));
        // A changelog line that mentions an older bundle must not win over the summary line after it.
        assertEquals("1.3.4", UpdateChecker.extractBundleVersion(
                "Fixes a crash since patch bundle 1.3.2.\n\n---\nOxbow for Instagram 456.1.0.56.78 (patch bundle 1.3.4)."));
    }

    @Test
    public void theNotesAreUnescapedAndBlankOnesAreNone() {
        assertEquals("Oxbow for Instagram 456.1.0.56.78 (patch bundle 1.3.4).\nLine two — é \"quoted\" \\ /",
                UpdateChecker.extractReleaseBody(RELEASE));
        assertNull(UpdateChecker.extractReleaseBody("{\"body\": \"   \"}"));
        assertNull(UpdateChecker.extractReleaseBody("{}"));
    }
}
