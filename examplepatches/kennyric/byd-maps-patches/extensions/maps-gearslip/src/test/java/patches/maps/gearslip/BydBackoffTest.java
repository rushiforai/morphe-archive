package patches.maps.gearslip;

import static org.junit.Assert.assertEquals;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** A missing provider must not be probed every two seconds. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public class BydBackoffTest {

    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        prefs().edit().clear().commit();
    }

    @Test
    public void retriesAtTheConfiguredRefreshInterval() {
        prefs().edit().putInt("byd_refresh_minutes", 2).commit();
        assertEquals(2 * 60_000L, BydVehicle.failureBackoffMs(context));
    }

    @Test
    public void defaultsToFiveMinutes() {
        assertEquals(5 * 60_000L, BydVehicle.failureBackoffMs(context));
    }

    @Test
    public void offStillBacksOffFiveMinutes() {
        prefs().edit().putInt("byd_refresh_minutes", 0).commit();
        assertEquals(5 * 60_000L, BydVehicle.failureBackoffMs(context));
    }

    @Test
    public void neverBacksOffLessThanAMinute() {
        prefs().edit().putInt("byd_refresh_minutes", 1).commit();
        assertEquals(60_000L, BydVehicle.failureBackoffMs(context));
    }

    private SharedPreferences prefs() {
        return context.getSharedPreferences("ungoogled_ui", Context.MODE_PRIVATE);
    }
}
