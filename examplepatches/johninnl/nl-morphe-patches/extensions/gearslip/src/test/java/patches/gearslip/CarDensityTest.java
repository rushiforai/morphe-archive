package patches.gearslip;

import android.content.Context;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Robolectric;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 35)
public class CarDensityTest {
    private Context context;

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        context.getSharedPreferences("morphe_car_density", 0).edit().clear().commit();
        CarDensity.begin(160, "gearslip-preview");
    }

    @Test public void automaticPreservesEachOriginalDensity() {
        assertEquals(0, CarDensity.selected(context));
        assertEquals(180, CarDensity.begin(180, "gearslip-projection"));
        assertEquals(180, CarDensity.hosted(180));
        assertEquals(220, CarDensity.hosted(220));
    }

    @Test public void chosenDensityReachesProjectionAndBothHostedMetadataPaths() {
        for (int dpi : new int[]{160, 180, 200, 220, 240}) {
            CarDensity.save(context, dpi);
            assertEquals(dpi, CarDensity.selected(context));
            assertEquals(dpi, CarDensity.begin(160, "gearslip-projection"));
            assertEquals(dpi, CarDensity.hosted(160));
            assertEquals(dpi, CarDensity.hosted(180));
        }
    }

    @Test public void changingPreferenceWaitsForTheNextProjection() {
        CarDensity.save(context, 200);
        CarDensity.begin(160, "gearslip-preview");
        CarDensity.save(context, 240);
        assertEquals(200, CarDensity.hosted(160));
        assertEquals(240, CarDensity.begin(160, "gearslip-preview"));
        CarDensity.save(context, 0);
        assertEquals(240, CarDensity.hosted(160));
        assertEquals(160, CarDensity.begin(160, "gearslip-projection"));
        assertEquals(160, CarDensity.hosted(160));
    }

    @Test public void previewCaptionUsesTheChosenDensityBeforeTheDisplayStarts() {
        CarDensity.save(context, 200);
        CarDensity.begin(160, "gearslip-preview");
        CarDensity.save(context, 240);
        assertEquals(240, CarDensity.previewDpi(160));
        assertEquals(200, CarDensity.hosted(160));
        CarDensity.save(context, 0);
        assertEquals(180, CarDensity.previewDpi(180));
    }

    @Test public void clusterAndUnrelatedDisplaysDoNotChangeTheActiveSession() {
        CarDensity.save(context, 200);
        CarDensity.begin(160, "gearslip-projection");
        CarDensity.save(context, 240);
        assertEquals(120, CarDensity.begin(120, "gearslip-cluster"));
        assertEquals(420, CarDensity.begin(420, "other-display"));
        assertEquals(160, CarDensity.begin(160, null));
        assertEquals(200, CarDensity.hosted(160));
    }

    @Test public void invalidAndCorruptPreferencesFallBackToTheCar() {
        for (int dpi : new int[]{-1, 1, 159, 201, 320, Integer.MAX_VALUE}) {
            context.getSharedPreferences("morphe_car_density", 0).edit().putInt("dpi", dpi).commit();
            assertEquals(0, CarDensity.selected(context));
            assertEquals(160, CarDensity.begin(160, "gearslip-preview"));
        }
        context.getSharedPreferences("morphe_car_density", 0).edit().putString("dpi", "broken").commit();
        assertEquals(0, CarDensity.selected(context));
        assertThrows(IllegalArgumentException.class, () -> CarDensity.save(context, 201));
    }

    @Test public void phoneUiSavesAndRestoresTheChosenPreset() {
        CarDensity.save(context, 200);
        try (org.robolectric.android.controller.ActivityController<CarDensityActivity> controller =
                     Robolectric.buildActivity(CarDensityActivity.class).setup()) {
            CarDensityActivity activity = controller.get();
            android.view.ViewGroup content = activity.findViewById(android.R.id.content);
            android.widget.ScrollView scroll = (android.widget.ScrollView) content.getChildAt(0);
            android.widget.LinearLayout layout = (android.widget.LinearLayout) scroll.getChildAt(0);
            android.widget.RadioGroup choices = (android.widget.RadioGroup) layout.getChildAt(1);
            assertEquals(6, choices.getChildCount());
            assertTrue(((android.widget.RadioButton) choices.getChildAt(3)).isChecked());
            choices.getChildAt(5).performClick();
            assertEquals(240, CarDensity.selected(context));
            choices.getChildAt(0).performClick();
            assertEquals(0, CarDensity.selected(context));
        }
    }

    private enum Cards { SCREEN, NAV_BAR, MORPHE_APPS }

    @Test public void appsDisplayFirstWithoutChangingEnumOrderOrOrdinals() {
        java.util.List<Cards> original = java.util.Arrays.asList(Cards.values());
        java.util.Iterator<?> ordered = DrawerApps.orderedCards(original);
        assertEquals(Cards.MORPHE_APPS, ordered.next());
        assertEquals(Cards.SCREEN, ordered.next());
        assertEquals(Cards.NAV_BAR, ordered.next());
        assertFalse(ordered.hasNext());
        assertEquals(java.util.Arrays.asList(Cards.SCREEN, Cards.NAV_BAR, Cards.MORPHE_APPS), original);
        assertEquals(2, Cards.MORPHE_APPS.ordinal());
        assertEquals(Cards.SCREEN, DrawerApps.orderedCards(java.util.Arrays.asList(Cards.SCREEN)).next());
    }
}
