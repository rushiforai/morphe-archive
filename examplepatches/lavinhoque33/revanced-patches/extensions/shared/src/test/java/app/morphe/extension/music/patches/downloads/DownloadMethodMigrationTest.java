/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class DownloadMethodMigrationTest {
    private static DownloadMethod oldLists(String songs, String playlists) {
        return DownloadMethodMigration.resolve(null, false, songs, playlists, true, true, true, true, true);
    }

    @Test public void allMixedListChoicesPreferStreamsThenFilesThenDelegation() {
        String[] songs = {"STREAM", "DEVICE_FILE", "EXTERNAL_APP"};
        String[] playlists = {"STREAM", "DEVICE_FILES", "MUSIC_OWN"};
        DownloadMethod[][] expected = {
                {DownloadMethod.STREAM, DownloadMethod.STREAM, DownloadMethod.STREAM},
                {DownloadMethod.STREAM, DownloadMethod.DEVICE_FILES, DownloadMethod.DEVICE_FILES},
                {DownloadMethod.STREAM, DownloadMethod.DEVICE_FILES, DownloadMethod.DELEGATED}
        };
        for (int song = 0; song < songs.length; song++) {
            for (int playlist = 0; playlist < playlists.length; playlist++) {
                assertEquals(songs[song] + "/" + playlists[playlist], expected[song][playlist],
                        oldLists(songs[song], playlists[playlist]));
            }
        }
    }

    @Test public void omittedOldListDefaultsStillBeatTheOtherKindsDeviceOrExternalChoice() {
        assertEquals(DownloadMethod.STREAM, oldLists(null, "DEVICE_FILES"));
        assertEquals(DownloadMethod.STREAM, oldLists("DEVICE_FILE", null));
        assertEquals(DownloadMethod.STREAM, oldLists(null, "MUSIC_OWN"));
        assertEquals(DownloadMethod.STREAM, oldLists("EXTERNAL_APP", null));
    }

    @Test public void listChoicesTakePrecedenceOverObsoleteSwitches() {
        assertEquals(DownloadMethod.DELEGATED, oldLists("EXTERNAL_APP", "MUSIC_OWN"));
        assertEquals(DownloadMethod.DEVICE_FILES, oldLists("DEVICE_FILE", "DEVICE_FILES"));
    }

    @Test public void olderSwitchCombinationsResolveOneMethodForAllRoutes() {
        for (boolean files : new boolean[]{false, true}) {
            for (boolean copies : new boolean[]{false, true}) {
                for (boolean button : new boolean[]{false, true}) {
                    for (boolean menu : new boolean[]{false, true}) {
                        DownloadMethod expected = copies ? DownloadMethod.STREAM
                                : files ? DownloadMethod.DEVICE_FILES
                                : button || menu ? DownloadMethod.DELEGATED : DownloadMethod.STREAM;
                        assertEquals(expected, DownloadMethodMigration.resolve(null, false, null, null,
                                false, files, copies, button, menu));
                    }
                }
            }
        }
    }

    @Test public void globalChoiceIsAuthoritativeEvenWhenOldPreferencesReappear() {
        for (DownloadMethod method : DownloadMethod.values()) {
            assertEquals(method, DownloadMethodMigration.resolve(method, false,
                    "STREAM", "DEVICE_FILES", true, true, true, true, true));
            assertEquals(method, DownloadMethodMigration.resolve(method, true,
                    "EXTERNAL_APP", "MUSIC_OWN", true, false, false, false, false));
        }
        // Saving the default removes its preference; the migration marker must keep it authoritative.
        assertEquals(DownloadMethod.STREAM, DownloadMethodMigration.resolve(null, true,
                "DEVICE_FILE", "DEVICE_FILES", true, true, false, true, true));
    }

    @Test public void globalMethodControlsSongOverridesAndPlaylistWorkTogether() {
        for (boolean supported : new boolean[]{false, true}) {
            for (boolean external : new boolean[]{false, true}) {
                assertEquals(supported ? SongDownloadRoute.OURS : SongDownloadRoute.STOCK,
                        SongDownloadRoute.of(DownloadMethod.STREAM, supported, external));
                assertEquals(supported ? DownloadMode.STREAM_COPY : DownloadMode.OFF,
                        DownloadMode.of(DownloadMethod.STREAM, supported));
                assertEquals(SongDownloadRoute.OURS,
                        SongDownloadRoute.of(DownloadMethod.DEVICE_FILES, supported, external));
                assertEquals(DownloadMode.LOCAL_FILES, DownloadMode.of(DownloadMethod.DEVICE_FILES, supported));
                assertEquals(external ? SongDownloadRoute.EXTERNAL_APP : SongDownloadRoute.STOCK,
                        SongDownloadRoute.of(DownloadMethod.DELEGATED, supported, external));
                assertEquals(DownloadMode.OFF, DownloadMode.of(DownloadMethod.DELEGATED, supported));
            }
        }
    }
}
