/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License, version 3 or later.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.music.patches;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.music.patches.SettingsMenuFilterSelections.Saved;
import app.morphe.extension.shared.patches.BaseSettingsMenuFilter.DiscoveredNode;

public class SettingsMenuFilterSelectionsTest {
    private static final String PLAYBACK = "settings_header_playback";
    private static final String GENERAL = "settings_header_general";
    private static final String PARENT = "pref_key_parent_tools";

    @Test
    public void pickerKeySurvivesLocaleChangeWithoutHidingSameLabel() {
        Saved selected = selections("", "").toggle(row(PLAYBACK, "Playback"));
        SettingsMenuFilterSelections afterLocaleChange = new SettingsMenuFilterSelections(selected);

        assertEquals(new Saved("", PLAYBACK), selected);
        assertTrue(afterLocaleChange.isHidden(PLAYBACK, "Lecture"));
        assertFalse(afterLocaleChange.isHidden(GENERAL, "Lecture"));
        assertFalse(afterLocaleChange.isHidden(null, "Lecture"));
    }

    @Test
    public void migratesUniqueFormerLocaleButLeavesFreeFormAndUnobservedEntries() {
        Map<String, String> aliases = new HashMap<>();
        SettingsMenuFilterSelections.addAlias(aliases, "Playback", PLAYBACK);
        SettingsMenuFilterSelections.addAlias(aliases, "Lecture", PLAYBACK);
        SettingsMenuFilterSelections.addAlias(aliases, "General", GENERAL);

        Saved migrated = selections("Playback\nGeneral\n  Server label  ", "").migrate(
                aliases, List.of(row(PLAYBACK, "Lecture")));

        assertEquals(new Saved("General\n  Server label  ", PLAYBACK), migrated);
        SettingsMenuFilterSelections restored = new SettingsMenuFilterSelections(migrated);
        assertTrue(restored.isHidden(PLAYBACK, "Wiedergabe"));
        assertTrue(restored.isHidden(null, "SERVER LABEL"));
        assertFalse(restored.isHidden(null, "A server label"));
    }

    @Test
    public void ambiguousLocaleAliasIsNotCoercedButRowsCanBeToggledIndependently() {
        Map<String, String> aliases = new HashMap<>();
        SettingsMenuFilterSelections.addAlias(aliases, "Same", PLAYBACK);
        SettingsMenuFilterSelections.addAlias(aliases, "same", GENERAL);
        List<DiscoveredNode> rows = List.of(row(PLAYBACK, "Same"), row(GENERAL, "Same"));

        Saved ambiguous = selections("Same", "").migrate(aliases, rows);
        assertEquals(new Saved("Same", ""), ambiguous);

        SettingsMenuFilterSelections bothHidden = new SettingsMenuFilterSelections(ambiguous);
        assertTrue(bothHidden.isHidden(PLAYBACK, "Same"));
        assertTrue(bothHidden.isHidden(GENERAL, "Same"));

        Saved toggled = bothHidden.toggle(rows.get(0));
        assertEquals(new Saved("Same", "!" + PLAYBACK), toggled);
        SettingsMenuFilterSelections restored = new SettingsMenuFilterSelections(toggled);
        assertFalse(restored.isHidden(PLAYBACK, "Same"));
        assertTrue(restored.isHidden(GENERAL, "Same"));
        assertTrue(restored.isHidden(null, "Same"));
    }

    @Test
    public void stockAliasCollidingWithMountedDynamicTitleRemainsLiteral() {
        Map<String, String> aliases = Map.of("playback", PLAYBACK);
        Saved unresolved = selections("Playback", "").migrate(aliases,
                List.of(row(PLAYBACK, "Lecture"), row(null, "Playback")));

        assertEquals(new Saved("Playback", ""), unresolved);
        SettingsMenuFilterSelections restored = new SettingsMenuFilterSelections(unresolved);
        assertFalse(restored.isHidden(PLAYBACK, "Lecture"));
        assertTrue(restored.isHidden(null, "Playback"));
    }

    @Test
    public void lateLabelsUseExactTitleFallbackWithoutLosingKeyedSelection() {
        SettingsMenuFilterSelections restored = selections("Family settings", PARENT);

        assertTrue(restored.isHidden(PARENT, null));
        assertTrue(restored.isHidden(PARENT, "Parent tools loaded"));
        assertFalse(restored.isHidden(null, null));
        assertTrue(restored.isHidden(null, "Family settings"));
        assertFalse(restored.isHidden(null, "Family settings and tools"));
        assertFalse(restored.isHidden(null, "Renamed"));
    }

    @Test
    public void explicitVisibilityWinsWhenLegacyAliasLaterBecomesMigratable() {
        Saved migrated = selections("Lecture", "!" + PLAYBACK).migrate(
                Map.of("lecture", PLAYBACK), List.of(row(PLAYBACK, "Wiedergabe")));

        assertEquals(new Saved("", "!" + PLAYBACK), migrated);
        assertFalse(new SettingsMenuFilterSelections(migrated).isHidden(PLAYBACK, "Lecture"));
    }

    private static SettingsMenuFilterSelections selections(String titles, String keys) {
        return new SettingsMenuFilterSelections(new Saved(titles, keys));
    }

    private static DiscoveredNode row(String key, String title) {
        return new DiscoveredNode(null, title, null, key);
    }
}
