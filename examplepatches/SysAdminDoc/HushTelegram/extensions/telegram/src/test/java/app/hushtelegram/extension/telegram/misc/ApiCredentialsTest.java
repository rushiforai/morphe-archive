/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.Setting;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ApiCredentialsTest {
    /** A made-up pair with a real one's shape. No app has it. */
    private static final String ID = "1234567";
    private static final String HASH = "0123456789abcdef0123456789abcdef";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<String> written = new ArrayList<>();
    private Context context;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        ApiCredentials.prefs(context).edit().clear().commit();
        ApiCredentials.applied = false;
        ApiCredentials.appliedId = 0;
        ApiCredentials.telegram = (id, hash) -> written.add(id + " " + hash);
    }

    @After public void tearDown() {
        ApiCredentials.telegram = ApiCredentials.PATCHED;
        ApiCredentials.applied = false;
        ApiCredentials.appliedId = 0;
        ApiCredentials.prefs(context).edit().clear().commit();
    }

    @Test public void anIdIsAPositiveNumberThatFitsAnInt() {
        assertTrue(ApiCredentials.validId(ID));
        assertTrue("spaces from a paste are fine", ApiCredentials.validId(" 1234567 \n"));
        assertTrue(ApiCredentials.validId("2147483647"));
        assertFalse(ApiCredentials.validId("2147483648"));
        assertFalse(ApiCredentials.validId("0"));
        assertFalse(ApiCredentials.validId("-5"));
        assertFalse(ApiCredentials.validId("12 34"));
        assertFalse(ApiCredentials.validId("12345678901"));
        assertFalse(ApiCredentials.validId(""));
        assertFalse(ApiCredentials.validId(null));
    }

    @Test public void aHashIsThirtyTwoHexDigits() {
        assertTrue(ApiCredentials.validHash(HASH));
        assertTrue("capitals and spaces from a paste are fine", ApiCredentials.validHash(" 0123456789ABCDEF0123456789abcdef "));
        assertFalse(ApiCredentials.validHash(HASH.substring(1)));
        assertFalse(ApiCredentials.validHash(HASH + "0"));
        assertFalse(ApiCredentials.validHash("g123456789abcdef0123456789abcdef"));
        assertFalse(ApiCredentials.validHash(null));
    }

    @Test public void withNothingSavedTelegramKeepsItsOwnPair() {
        ApiCredentials.applySaved();
        assertTrue(written.isEmpty());
        assertTrue("it doesn't look again for the next account", ApiCredentials.applied);
        assertFalse(ApiCredentials.hasSaved(context));
    }

    @Test public void aSavedPairGoesInOnceBeforeTheFirstConnection() {
        assertTrue(ApiCredentials.save(context, " " + ID + " ", "0123456789ABCDEF0123456789ABCDEF"));
        assertTrue(ApiCredentials.hasSaved(context));
        ApiCredentials.applySaved();
        ApiCredentials.applySaved();
        assertEquals("saved trimmed and in lowercase, written once", List.of(ID + " " + HASH), written);
    }

    @Test public void whatIsntAPairIsLeftOut() {
        ApiCredentials.prefs(context).edit().putString(ApiCredentials.ID_KEY, ID).commit();
        assertNull("an ID alone", ApiCredentials.read(ApiCredentials.prefs(context)));
        ApiCredentials.prefs(context).edit().putString(ApiCredentials.HASH_KEY, "nothex").commit();
        assertNull(ApiCredentials.read(ApiCredentials.prefs(context)));
        ApiCredentials.applySaved();
        assertTrue(written.isEmpty());
    }

    @Test public void removeTakesItOut() {
        ApiCredentials.save(context, ID, HASH);
        assertTrue(ApiCredentials.clear(context));
        assertFalse(ApiCredentials.hasSaved(context));
        ApiCredentials.applySaved();
        assertTrue(written.isEmpty());
    }

    @Test public void beforeTheAppHasAContextItTriesAgainLater() {
        ApiCredentials.save(context, ID, HASH);
        ApiCredentials.applyFrom(null);
        assertFalse(ApiCredentials.applied);
        assertTrue(written.isEmpty());
        ApiCredentials.applySaved();
        assertEquals(List.of(ID + " " + HASH), written);
    }

    @Test public void aFailedWriteNeverThrowsIntoTelegram() {
        ApiCredentials.save(context, ID, HASH);
        ApiCredentials.telegram = (id, hash) -> { throw new NoSuchFieldException("APP_ID"); };
        ApiCredentials.applySaved();
        assertTrue(ApiCredentials.applied);
    }

    @Test public void withoutASavedPairTheBuildNumberIsTelegramsOwn() {
        ApiCredentials.applySaved();
        assertEquals(73461, ApiCredentials.nativeVersion(73461));
    }

    @Test public void aSavedPairGetsABuildNumberOfItsOwnSoTheServerHearsTheNewId() {
        ApiCredentials.save(context, ID, HASH);
        ApiCredentials.applySaved();
        int tagged = ApiCredentials.nativeVersion(73461);
        assertNotEquals("the connection sends the ID again", 73461, tagged);
        assertNotEquals("0 means not started yet", 0, tagged);
        assertEquals("the same pair keeps its number from launch to launch", tagged, ApiCredentials.nativeVersion(73461));
        ApiCredentials.appliedId = 7654321;
        assertNotEquals("another ID gets another number", tagged, ApiCredentials.nativeVersion(73461));
    }

    @Test public void aFailedWriteLeavesTheBuildNumberAlone() {
        ApiCredentials.save(context, ID, HASH);
        ApiCredentials.telegram = (id, hash) -> { throw new NoSuchFieldException("APP_ID"); };
        ApiCredentials.applySaved();
        assertEquals(73461, ApiCredentials.nativeVersion(73461));
    }

    @Test public void thePairStaysOutOfTheSettingsFile() {
        ApiCredentials.save(context, ID, HASH);
        assertNotEquals(Setting.PREFERENCES_NAME, ApiCredentials.PREFS);
        assertFalse("settings exports and reports read only this file",
                context.getSharedPreferences(Setting.PREFERENCES_NAME, Context.MODE_PRIVATE).getAll().containsValue(HASH));
        assertTrue(ApiCredentials.prefs(context).getAll().containsValue(HASH));
    }
}
