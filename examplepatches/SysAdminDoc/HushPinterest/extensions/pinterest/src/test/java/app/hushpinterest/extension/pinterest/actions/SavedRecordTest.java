/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.shared.SettingsContextRule;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SavedRecordTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static SharedPreferences store() {
        return RuntimeEnvironment.getApplication().getSharedPreferences(SavedRecord.STORE, Context.MODE_PRIVATE);
    }

    @Test public void itKnowsOnlyWhatWasAdded() {
        assertFalse(SavedRecord.has("1"));
        SavedRecord.add("1");
        SavedRecord.add("2");
        assertTrue(SavedRecord.has("1"));
        assertTrue(SavedRecord.has("2"));
        assertFalse(SavedRecord.has("3"));
        assertFalse("an ID isn't matched by part of another", SavedRecord.has("11"));
    }

    @Test public void aNullIdIsLeftOut() {
        SavedRecord.add(null);
        assertFalse(SavedRecord.has(null));
        assertFalse(store().contains(SavedRecord.IDS));
    }

    @Test public void whatIsStoredIsReadBack() {
        store().edit().putString(SavedRecord.IDS, "7,8").commit();
        assertTrue(SavedRecord.has("7"));
        assertTrue(SavedRecord.has("8"));
        assertFalse(SavedRecord.has("7,8"));
    }

    @Test public void theOldestGoesPastTheLimitAndSavingAgainMakesAPinNew() {
        for (int id = 0; id < SavedRecord.LIMIT; id++) SavedRecord.add(Integer.toString(id));
        SavedRecord.add("0");
        SavedRecord.add("new");
        assertTrue("saved again, so it's newest", SavedRecord.has("0"));
        assertFalse("now the oldest", SavedRecord.has("1"));
        assertTrue(SavedRecord.has("2"));
        assertTrue(SavedRecord.has("new"));
        assertEquals(SavedRecord.LIMIT, store().getString(SavedRecord.IDS, "").split(",").length);
    }
}
