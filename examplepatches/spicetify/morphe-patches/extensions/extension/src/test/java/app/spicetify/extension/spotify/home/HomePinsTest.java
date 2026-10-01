package app.spicetify.extension.spotify.home;

import static org.junit.Assert.*;

import android.app.Application;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class HomePinsTest {
    private static final String A = "spotify:playlist:a";
    private static final String B = "spotify:playlist:b";
    private static final String C = "spotify:album:c";
    private Application application;

    @Before public void initialize() {
        application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_home_pins");
        HomePins.initialize(application);
    }

    @Test public void firstRenderDiscoversChoicesBeforeAnyPinExists() {
        assertArrayEquals(new int[]{0, 1}, HomePins.captureAndOrder(
                new String[]{A, B}, new String[]{"One", "Two"}));
        assertEquals(2, HomePins.choices().size());
        assertFalse(HomePins.choices().get(0).pinned);
        HomePins.setPinned(Collections.singletonList(B));
        assertArrayEquals(new int[]{1, 0}, HomePins.captureAndOrder(
                new String[]{A, B}, new String[]{"One", "Two"}));
    }

    @Test public void duplicateLabelsUseUriIdentityAndRebindingUpdatesLabels() {
        HomePins.captureAndOrder(new String[]{A, B}, new String[]{"Same", "Same"});
        HomePins.setPinned(Collections.singletonList(B));
        HomePins.captureAndOrder(new String[]{B, C}, new String[]{"Renamed", "Same"});
        assertEquals(B, HomePins.choices().get(0).id);
        assertEquals("Renamed", HomePins.choices().get(0).label);
        assertTrue(HomePins.choices().get(0).pinned);
        assertFalse(HomePins.choices().get(1).pinned);
    }

    @Test public void absentPinsSurviveRestartAndReturnInTheirChosenOrder() {
        HomePins.captureAndOrder(new String[]{A, B, C}, new String[]{"A", "B", "C"});
        HomePins.setPinned(Arrays.asList(C, B));
        HomePins.initialize(application);
        assertEquals(2, HomePins.choices().size());
        assertEquals(C, HomePins.choices().get(0).id);
        HomePins.captureAndOrder(new String[]{A}, new String[]{"A"});
        assertEquals(3, HomePins.choices().size());
        assertArrayEquals(new int[]{2, 1, 0}, HomePins.captureAndOrder(
                new String[]{A, B, C}, new String[]{"A", "B", "C"}));
    }

    @Test public void unpinRestoresNativeOrderAndKeepsDuplicateNativeRows() {
        String[] ids = {A, B, A, C};
        String[] labels = {"A", "B", "A", "C"};
        HomePins.captureAndOrder(ids, labels);
        HomePins.setPinned(Arrays.asList(B, A));
        assertArrayEquals(new int[]{1, 0, 2, 3}, HomePins.captureAndOrder(ids, labels));
        HomePins.setPinned(Collections.emptyList());
        assertArrayEquals(new int[]{0, 1, 2, 3}, HomePins.captureAndOrder(ids, labels));
        assertArrayEquals(new String[]{A, B, A, C}, ids);
    }

    @Test public void invalidUrisAreNotOfferedAndUnknownSelectionsAreRejected() {
        HomePins.captureAndOrder(new String[]{null, "https://example.com", A},
                new String[]{"Missing", "Web", "A"});
        assertEquals(1, HomePins.choices().size());
        assertThrows(IllegalArgumentException.class,
                () -> HomePins.setPinned(Collections.singletonList(B)));
    }

    @Test public void pickerSelectionSurvivesAHomeRefreshWhileTheDialogIsOpen() {
        HomePins.captureAndOrder(new String[]{A, B}, new String[]{"A", "B"});
        HomePins.choices();
        HomePins.captureAndOrder(new String[]{C}, new String[]{"C"});
        HomePins.setPinned(Collections.singletonList(B));
        assertEquals(B, HomePins.choices().get(0).id);
        assertTrue(HomePins.choices().get(0).pinned);
    }

    @Test public void changedNativeObjectsFailClosedWithoutMutatingInput() {
        java.util.ArrayList<Object> nativeRows = new java.util.ArrayList<>();
        nativeRows.add(new Object());
        assertSame(nativeRows, HomePins.reorder(nativeRows));
        assertEquals(1, nativeRows.size());
        assertTrue(HomePins.choices().isEmpty());
    }

    @Test public void corruptSavedPinsDoNotBreakHome() {
        application.getSharedPreferences("spicetify_home_pins", 0).edit()
                .putString("pins", "not JSON").commit();
        HomePins.initialize(application);
        assertArrayEquals(new int[]{0}, HomePins.captureAndOrder(new String[]{A}, new String[]{"A"}));
        assertFalse(HomePins.choices().get(0).pinned);
    }
}
