/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-12
 */

package app.morphe.extension.shared.patches;

import static org.junit.Assert.*;

import org.junit.Test;

public class PatchesUpdateDataTest {
    @Test
    public void semanticPrereleaseOrder() {
        String[] versions = {"1.0.0-alpha", "1.0.0-alpha.1", "1.0.0-alpha.beta", "1.0.0-beta",
                "1.0.0-beta.2", "1.0.0-beta.11", "1.0.0-rc.1", "1.0.0"};
        for (int index = 1; index < versions.length; index++) {
            assertTrue(PatchesUpdateData.compareVersions(versions[index - 1], versions[index]) < 0);
            assertTrue(PatchesUpdateData.compareVersions(versions[index], versions[index - 1]) > 0);
        }
    }

    @Test
    public void developmentStableAndNextDevelopmentOrder() {
        assertTrue(PatchesUpdateData.compareVersions("1.34.2-dev.2", "1.34.2-dev.10") < 0);
        assertTrue(PatchesUpdateData.compareVersions("1.34.2-dev.2", "1.34.2") < 0);
        assertTrue(PatchesUpdateData.compareVersions("1.34.2", "1.34.3-dev.1") < 0);
        assertTrue(PatchesUpdateData.compareVersions("2.0.0", "1.99.99") > 0);
    }

    @Test
    public void metadataDoesNotChangePrecedence() {
        assertEquals(Integer.valueOf(0), PatchesUpdateData.compareVersions("1.2.3+build.1", "1.2.3+other"));
        assertEquals(Integer.valueOf(0), PatchesUpdateData.compareVersions("1.2.3-dev.2+x", "1.2.3-dev.2"));
    }

    @Test
    public void malformedVersionsCannotProduceNotice() {
        String[] invalid = {"Unknown", "", "v1.2.3", "1.2", "1.02.3", "1.2.3-dev.01", "1.2.3-",
                "1.2.3-hello..world", "1.2.3+", "1.2.3\n", "-1.2.3", "1.2.3-ç"};
        for (String version : invalid) {
            assertNull(version, PatchesUpdateData.compareVersions(version, "1.2.3"));
            assertNull(version, PatchesUpdateData.selectVersion(version, "DEV", "2.0.0", "2.1.0-dev.1"));
            assertNull(version, PatchesUpdateData.selectVersion("1.0.0", "STABLE", version, "2.1.0-dev.1"));
        }
        assertNull(PatchesUpdateData.compareVersions(null, "1.0.0"));
    }

    @Test
    public void arbitrarilyLargeNumericIdentifiersDoNotOverflow() {
        assertTrue(PatchesUpdateData.compareVersions("999999999999999999999.0.0", "2.0.0") > 0);
        assertTrue(PatchesUpdateData.compareVersions("1.0.0-dev.999999999999999999999", "1.0.0-dev.9") > 0);
    }

    @Test
    public void installedChannelDefault() {
        assertEquals("DEV", PatchesUpdateData.defaultChannel("1.34.2-dev.2"));
        assertEquals("STABLE", PatchesUpdateData.defaultChannel("1.34.2"));
        assertEquals("STABLE", PatchesUpdateData.defaultChannel("Unknown"));
    }

    @Test
    public void stableChannelExcludesDevelopment() {
        assertEquals("1.34.2", PatchesUpdateData.selectVersion("1.34.1", "STABLE", "1.34.2", "1.35.0-dev.1"));
        assertNull(PatchesUpdateData.selectVersion("1.34.1", "STABLE", "1.35.0-dev.1", "1.35.0-dev.2"));
    }

    @Test
    public void developmentChannelChoosesNewestAcrossBothFeeds() {
        assertEquals("1.34.3", PatchesUpdateData.selectVersion("1.34.2-dev.1", "DEV", "1.34.3", "1.34.2-dev.2"));
        assertEquals("1.34.2", PatchesUpdateData.selectVersion("1.34.2-dev.1", "DEV", "1.34.2", "1.34.2-dev.2"));
        assertEquals("1.34.3-dev.1", PatchesUpdateData.selectVersion("1.34.2", "DEV", "1.34.2", "1.34.3-dev.1"));
        assertEquals("1.34.2-dev.2",
                PatchesUpdateData.selectVersion("1.34.2-dev.1", "DEV", "invalid", "1.34.2-dev.2"));
    }

    @Test
    public void offEqualOlderAndUnknownNeverOfferUpdate() {
        assertNull(PatchesUpdateData.selectVersion("1.34.2", "OFF", "2.0.0", "3.0.0-dev.1"));
        assertNull(PatchesUpdateData.selectVersion("1.34.2", "garbage", "2.0.0", "3.0.0-dev.1"));
        assertNull(PatchesUpdateData.selectVersion("1.34.2", "DEV", "1.34.2", "1.34.2-dev.2"));
        assertNull(PatchesUpdateData.selectVersion("1.34.2", "DEV", "1.34.1", "Unknown"));
    }

    @Test
    public void notesAreReadablePlainTextAndBounded() {
        assertEquals("Features\n• Fix: Read more",
                PatchesUpdateData.releaseNotes("## Features\n* **Fix:** [Read more](https://example.com)"));
        assertEquals("safe", PatchesUpdateData.releaseNotes("<b>safe</b>"));
        assertTrue(PatchesUpdateData.releaseNotes("a".repeat(20000)).length() <= 2401);
        assertEquals("", PatchesUpdateData.releaseNotes(""));
    }
}
