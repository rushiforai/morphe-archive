/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

/**
 * The Licenses row shows the NOTICE the repository ships, word for word. Morphe's section 7b asks
 * that its notice reach the person using the app, and a hand-kept copy would drift from NOTICE the
 * first time either changed.
 */
public class LicenseNoticeTest {
    private static File repositoryFile(String name) {
        File dir = new File("").getAbsoluteFile();
        while (dir != null && !new File(dir, "settings.gradle.kts").isFile()) dir = dir.getParentFile();
        if (dir == null) throw new IllegalStateException("No repository root above " + new File("").getAbsolutePath());
        return new File(dir, name);
    }

    @Test
    public void theLicensesRowShowsNoticeExactly() throws Exception {
        String notice = new String(Files.readAllBytes(repositoryFile("NOTICE").toPath()), StandardCharsets.UTF_8)
                .replace("\r\n", "\n");
        assertEquals(notice, LicenseNotice.TEXT);
    }

    @Test
    public void theNoticeCarriesMorpheSectionSevenAndEveryUpstream() {
        assertTrue(LicenseNotice.TEXT.contains("GPLv3 Section 7b: Preservation of User Notices"));
        assertTrue(LicenseNotice.TEXT.contains("Project Name Restriction"));
        for (String upstream : new String[] {
                "https://github.com/andrewliang25/morphe-patches",
                "https://github.com/SapitoSucio/FroggoMorphePatches",
                "https://github.com/SysAdminDoc/hushfeed",
                "https://gitlab.com/ReVanced/revanced-patches"}) {
            assertTrue("NOTICE does not name " + upstream, LicenseNotice.TEXT.contains(upstream));
        }
    }
}
