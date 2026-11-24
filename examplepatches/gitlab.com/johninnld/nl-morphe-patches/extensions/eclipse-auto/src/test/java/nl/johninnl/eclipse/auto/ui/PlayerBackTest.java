package nl.johninnl.eclipse.auto.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import android.content.Context;
import android.content.res.Configuration;
import androidx.car.app.CarContext;
import androidx.car.app.Screen;
import androidx.car.app.ScreenManager;
import androidx.car.app.model.Template;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import java.lang.reflect.Method;
import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * Back on the player, through the Car App Library's own ScreenManager and back dispatcher. A host
 * reports every Back press to the app (CarContext's OnBackPressedDispatcher, whose fallback pops
 * the ScreenManager), and the session's onCreateScreen result is pushed on top of whatever it
 * pushed itself, as CarAppBinder.onAppCreate does.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class PlayerBackTest {
    private CarContext car;
    private ScreenManager screens;

    private static final class Page extends Screen {
        Page(CarContext context) { super(context); }
        @Override public Template onGetTemplate() { throw new UnsupportedOperationException(); }
    }

    @Before public void createSession() throws Exception {
        LifecycleOwner owner = () -> null;
        LifecycleRegistry lifecycle = LifecycleRegistry.createUnsafe(owner);
        lifecycle.setCurrentState(Lifecycle.State.CREATED);
        car = CarContext.create(lifecycle);
        Method attach = CarContext.class.getDeclaredMethod("attachBaseContext", Context.class, Configuration.class);
        attach.setAccessible(true);
        Context app = RuntimeEnvironment.getApplication();
        attach.invoke(car, app, app.getResources().getConfiguration());
        screens = car.getCarService(ScreenManager.class);
    }

    /** What a host does to start a session with SHOW_MEDIA_PLAYBACK, then Back. */
    private Screen openOnPlayerAndPressBack(Screen root, Screen player, boolean rootBeneath) {
        Screen top = rootBeneath
            ? Navigator.start(screens, Navigator.<Screen>startStack(true, () -> root, () -> player))
            : Navigator.start(screens, Collections.singletonList(player));
        screens.push(top);
        assertSame(player, screens.getTop());
        car.getOnBackPressedDispatcher().onBackPressed();
        return screens.getTop();
    }

    @Test public void backFromThePlayerReturnsToBrowse() {
        Screen root = new Page(car);
        Screen player = new Page(car);
        assertSame(root, openOnPlayerAndPressBack(root, player, true));
        assertEquals(1, screens.getStackSize());
    }

    /** The defect: a player that is the session's only screen stays on top whatever Back does. */
    @Test public void aPlayerAloneCannotBeLeft() {
        Screen player = new Page(car);
        assertSame(player, openOnPlayerAndPressBack(new Page(car), player, false));
        car.getOnBackPressedDispatcher().onBackPressed();
        assertSame(player, screens.getTop());
    }
}
