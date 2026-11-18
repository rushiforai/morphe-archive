package org.ungoogled.ui;

import static org.junit.Assert.*;
import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=33,manifest=Config.NONE,qualifiers="w1280dp-h480dp-land-mdpi")
public final class ShapesCarNavigationControlsTest {
    private final List<ActivityController<Activity>> activities = new ArrayList<>();
    private final Object owner = new Object();
    private Context app;
    private Float previousZoom;
    private Object previousCamera;
    private boolean previousEnabled;

    @Before public void setup() {
        app = RuntimeEnvironment.getApplication();
        previousZoom = Shapes.navZoom; previousCamera = Shapes.NAV_CAM;
        previousEnabled = Shapes.NAV_ZOOM_BUTTONS;
    }
    @After public void cleanup() {
        ExternalTelemetry.carSurface(owner, null);
        Shapes.hideTiles();
        Shapes.navZoom = previousZoom; Shapes.NAV_CAM = previousCamera;
        Shapes.NAV_ZOOM_BUTTONS = previousEnabled;
        for (ActivityController<Activity> activity : activities) activity.pause().stop().destroy();
    }
    private ViewGroup window(int width,int height) {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();
        activities.add(controller);
        ViewGroup decor = (ViewGroup)controller.get().getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));
        decor.layout(0,0,width,height);
        assertTrue(decor.isShown());
        return decor;
    }
    private void carSurface(ViewGroup decor) {
        ExternalTelemetry.carSurface(owner, decor);
        Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
    }

    @Test public void thePhonePickerSkipsALargerKnownCarWindowAndKeepsTheRealPhoneWindow() {
        ViewGroup phone = window(400,800), car = window(1280,480);
        assertSame(car,Shapes.pickDecor(Arrays.asList(phone,car)));
        carSurface(car);
        assertSame(phone,Shapes.pickDecor(Arrays.asList(car,phone)));
        assertNull(Shapes.pickDecor(Arrays.asList(car)));
        carSurface(null);
        assertNull("Surface detachment cannot turn this old car decor into phone UI",Shapes.pickDecor(Arrays.asList(car)));
    }

    @Test public void registrationRemovesAnAlreadyAttachedPhoneColumnWithoutChangingPhoneSettingsOrZoom() {
        ViewGroup car = window(1280,480);
        FrameLayout oldColumn = new FrameLayout(car.getContext()); car.addView(oldColumn);
        Shapes.navTiles = oldColumn; Shapes.NAV_ZOOM_BUTTONS = true;
        Shapes.navZoom = 14f; Object camera = new Object(); Shapes.NAV_CAM = camera;
        app.getSharedPreferences(Shapes.PREFS,0).edit().putBoolean(Shapes.KEY_NAV_ZOOM,true).commit();
        carSurface(car);
        assertNull(oldColumn.getParent()); assertNull(Shapes.navTiles);
        assertEquals(Float.valueOf(14f),Shapes.navZoom); assertSame(camera,Shapes.NAV_CAM);
        assertTrue(Shapes.NAV_ZOOM_BUTTONS);
        assertTrue(app.getSharedPreferences(Shapes.PREFS,0).getBoolean(Shapes.KEY_NAV_ZOOM,false));
        int children = car.getChildCount(); Shapes.attachTiles(car);
        assertEquals("Direct attach must not reintroduce the duplicate column",children,car.getChildCount());
        assertNull(Shapes.navTiles);
    }

    @Test public void markingACarWindowNeverRemovesAnotherWindowsPhoneColumn() {
        ViewGroup phone = window(400,800), car = window(1280,480);
        FrameLayout phoneColumn = new FrameLayout(phone.getContext()); phone.addView(phoneColumn);
        Shapes.navTiles = phoneColumn;
        carSurface(car); Shapes.attachTiles(car);
        assertSame(phone,phoneColumn.getParent()); assertSame(phoneColumn,Shapes.navTiles);
    }
}
