/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.util.List;

import static org.junit.Assert.*;

public class OfflineCueFileTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test public void metadataRoundTripDoesNotInlineCuesOrRewriteThem() throws Exception {
        File directory = temporary.newFolder();
        List<OfflineSubtitle.Cue> cues = List.of(new OfflineSubtitle.Cue(10, 100, "Hello"));
        OfflineCueFile source = new OfflineCueFile(cues);
        String name = source.store(directory);
        File saved = new File(directory, name);
        assertTrue(saved.isFile());
        long modified = saved.lastModified();
        JSONObject metadata = new JSONObject().put("cueFile", name);
        assertFalse(metadata.has("cues"));
        OfflineCueFile copy = OfflineCueFile.fromJson(new JSONObject(metadata.toString()));
        assertEquals(cues, copy.load(directory));
        assertEquals(name, copy.store(directory));
        assertEquals(modified, saved.lastModified());
        copy.delete(directory);
        assertFalse(saved.exists());
    }

    @Test public void oldInlineCuesLoadAndMigrateOnlyWhenSaved() throws Exception {
        File directory = temporary.newFolder();
        JSONObject old = new JSONObject().put("cues", new JSONArray()
                .put(new JSONArray().put(0).put(1000).put("Old index")));
        OfflineCueFile migrated = OfflineCueFile.fromJson(old);
        assertEquals("Old index", migrated.load(directory).get(0).text());
        assertEquals(0, directory.list().length);
        String name = migrated.store(directory);
        assertEquals(1, directory.list().length);
        assertEquals(migrated.load(directory), OfflineCueFile.fromJson(
                new JSONObject().put("cueFile", name)).load(directory));
    }

    @Test public void untrustedPathsCannotEscapeTheCueDirectory() throws Exception {
        OfflineCueFile data = OfflineCueFile.fromJson(new JSONObject().put("cueFile", "../../outside.json"));
        assertTrue(data.load(temporary.newFolder()).isEmpty());
    }
}
