package app.morphe.extension.shared.diagnostics;

import static org.junit.Assert.*;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import org.junit.Test;

public class BuildDetailsTest {
    public static String metadata() throws Exception {
        try (InputStream input = BuildDetailsTest.class.getResourceAsStream("/build-details/complete.txt")) {
            assertNotNull("the producer/consumer fixture is missing", input);
            return new String(input.readAllBytes(), StandardCharsets.UTF_8).replace("\r\n", "\n");
        }
    }

    @Test public void aCompleteRecordPreservesProvenanceAndDistinguishesEngineVersions() throws Exception {
        String record = metadata(), report = BuildDetails.report(record);
        assertTrue(report.contains("build_metadata: available\n"));
        for (String field : new String[]{"source_commit", "source_start", "source_end"}) {
            String value = record.substring(record.indexOf(field + "=") + field.length() + 1).split("\n")[0];
            assertTrue("an ID-like numeric run in a hash was redacted", report.contains(field + ": " + value + "\n"));
        }
        assertTrue(report.contains("patcher_bundle_compat: 1.14.1\n"));
        assertTrue(report.contains("patcher_applying_engine: 1.14.2\n"));
        assertTrue(report.contains("patch_time_selected.amoled: true\n"));
        assertTrue(report.contains("patch_time.amoled_color: #121212\n"));
        assertTrue(report.contains("patch_time.native_locales_retained: en,he,id,in,iw,tr\n"));
        assertTrue(report.contains("patch_time.tool_core_assets: already_stripped\n"));
        assertTrue(report.contains("patch_time.tool_creation: absent\n"));
        assertTrue(report.contains("patch_time_selected.tool_live_extras: false\n"));
        assertTrue(report.contains("patch_time.version_code_override: 2147483647\n"));
        assertEquals(report, BuildDetails.report(record));
    }

    @Test public void legacyMissingOrIncompleteRecordsSayUnknownWithoutGuessing() throws Exception {
        for (String record : new String[]{null, "", "schema=1\n", metadata().stripTrailing(),
                metadata().replace("schema=1", "schema=2"), metadata().repeat(8)}) {
            assertUnknown(record);
        }
        String report = BuildDetails.report("");
        assertFalse(report.isEmpty()); // Manual Build details must work with no events or asset.
        assertTrue(report.contains("patch_time_selected.amoled: unknown\n"));
        assertTrue(report.contains("target_package: unknown\n"));
    }

    @Test public void malformedRawOptionsExtraFieldsAndCredentialsAreNeverRendered() throws Exception {
        String record = metadata();
        for (String field : new String[]{"bundle_version", "source_commit", "source_clean", "source_start",
                "source_end", "target_package", "target_version", "target_version_code", "patcher_bundle_compat",
                "patcher_applying_engine", "amoled", "amoled_color", "language_packs", "native_locales_retained",
                "tool_p2p_relay", "tool_core_assets", "tool_creation", "tool_live_extras", "version_code_override"}) {
            String changed = record.replaceFirst("(?m)^" + field + "=.*$", field + "=sessionid=RAW_SENTINEL");
            assertUnknown(changed);
            assertFalse(BuildDetails.report(changed).contains("RAW_SENTINEL"));
        }
        assertUnknown(record + "arbitrary_option=https://RAW_SENTINEL.invalid/\n");
        assertUnknown(record.replace("schema=1\n", "schema=1\naccount=RAW_SENTINEL\n"));
        assertUnknown(record.replace("bundle_version=0.66.0\nsource_commit=", "source_commit="));
        assertUnknown(record.replace("\n", "\r\n"));
    }

    @Test public void localesMustBeReviewedSortedUniqueAndKeepEnglishAndAndroidAliases() throws Exception {
        for (String codes : new String[]{"en,xx", "tr", "tr,en", "en,en,tr", "en,he", "en,id", "en,he,iw,ID", "en,,tr"}) {
            assertUnknown(metadata().replace("en,he,id,in,iw,tr", codes));
        }
        assertTrue(BuildDetails.report(metadata().replace("en,he,id,in,iw,tr", "en,tr"))
                .contains("build_metadata: available\n"));
    }

    @Test public void impossibleSuccessCombinationsAreRejected() throws Exception {
        String record = metadata();
        assertUnknown(record.replace("amoled=applied", "amoled=not_selected"));
        assertUnknown(record.replace("#121212", "#ff121212"));
        assertUnknown(record.replace("language_packs=stripped", "language_packs=not_selected"));
        assertUnknown(record.replace("source_end=A1234567890123456789B", "source_end=B1234567890123456789B"));
        assertUnknown(record.replace("target_version_code=2024701040", "target_version_code=2147483647"));
        assertUnknown(record.replace("target_package=com.zhiliaoapp.musically", "target_package=unknown"));
        assertUnknown(record.replace("version_code_override=2147483647", "version_code_override=2024701040"));
    }

    @Test public void unverifiedSelectionsAndUntickedChoicesRemainDifferent() throws Exception {
        String record = metadata().replace("amoled=applied", "amoled=unverified")
                .replace("amoled_color=#121212", "amoled_color=unknown")
                .replace("language_packs=stripped", "language_packs=not_selected")
                .replace("native_locales_retained=en,he,id,in,iw,tr", "native_locales_retained=unknown");
        String report = BuildDetails.report(record);
        assertTrue(report.contains("build_metadata: available\n"));
        assertTrue(report.contains("patch_time_selected.amoled: true\n"));
        assertTrue(report.contains("patch_time.amoled: unverified\n"));
        assertTrue(report.contains("patch_time_selected.language_packs: false\n"));
        assertTrue(report.contains("patch_time.native_locales_retained: unknown\n"));
    }

    @Test public void dirtyBundlesAndDifferentResourceChoicesProduceDifferentReports() throws Exception {
        String record = metadata(), report = BuildDetails.report(record);
        String dirty = record.replace("source_clean=true", "source_clean=false")
                .replace("source_end=A1234567890123456789B", "source_end=B1234567890123456789B");
        assertTrue(BuildDetails.report(dirty).contains("source_clean: false\n"));
        assertNotEquals(report, BuildDetails.report(dirty));
        assertNotEquals(report, BuildDetails.report(record.replace("#121212", "#000000")));
        assertNotEquals(report, BuildDetails.report(record.replace("en,he,id,in,iw,tr", "en")));
    }

    @Test public void everyReviewedLocaleAndDeclaredTargetHasTheSameProducerConsumerContract() throws Exception {
        String locales;
        try (InputStream input = getClass().getResourceAsStream("/build-details/native-locales.txt")) {
            assertNotNull(input);
            locales = new String(input.readAllBytes(), StandardCharsets.UTF_8).strip();
        }
        String record = metadata().replace("en,he,id,in,iw,tr", locales).replace("language_packs=stripped", "language_packs=kept_all");
        String targets;
        try (InputStream input = getClass().getResourceAsStream("/build-details/targets.txt")) {
            assertNotNull(input);
            targets = new String(input.readAllBytes(), StandardCharsets.UTF_8).strip();
        }
        for (String line : targets.split("\\R")) {
            String[] target = line.split("=");
            String report = BuildDetails.report(record.replace("47.1.4", target[0]).replace("2024701040", target[1]));
            assertTrue(report, report.contains("build_metadata: available\n"));
            assertTrue(report.contains("patch_time.native_locales_retained: " + locales + "\n"));
            assertTrue(report.contains("target_version: " + target[0] + "\n"));
        }
        // A build the bundle no longer declares is no target of this one.
        assertUnknown(record.replace("47.1.4", "47.1.3").replace("2024701040", "2024701030"));
    }

    private static void assertUnknown(String record) {
        String report = BuildDetails.report(record);
        assertTrue(report, report.contains("build_metadata: unknown\n"));
        assertFalse(report, report.contains("build_metadata: available\n"));
    }
}
