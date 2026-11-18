package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32)
public final class NativeCarSearchTest {
    private final Context app = RuntimeEnvironment.getApplication();
    @After public void cleanup() { LocalCarUiSession.detach(LocalCarUiSession.owner()); }

    @Test public void theCreatedCurrentCarWindowUsesTheExistingLocalEditorBranch() {
        Object owner = new Object(); Context window = new ContextWrapper(app);
        NativeCarScopes.window(owner, window);
        LocalCarUiSession.attach(owner, intent -> fail("Selecting an editor must not queue another redirect"), (text, duration) -> {});
        assertEquals(1, NativeCarSearch.target(new View(window)));
    }

    @Test public void anActiveCarSessionDoesNotChangeUnownedPhoneOrApplicationViews() {
        LocalCarUiSession.attach(new Object(), intent -> {}, (text, duration) -> {});
        assertEquals(0, NativeCarSearch.target(new View(app)));
        assertEquals(0, NativeCarSearch.target(new View(new ContextWrapper(app))));
        assertEquals(0, NativeCarSearch.target(null));
    }

    @Test public void oldWindowsCannotOpenSearchInAReplacementOrAnUnboundSession() {
        Object first = new Object(), second = new Object();
        Context oldWindow = new ContextWrapper(app), currentWindow = new ContextWrapper(app);
        NativeCarScopes.window(first, oldWindow); NativeCarScopes.window(second, currentWindow);
        LocalCarUiSession.attach(first, intent -> {}, (text, duration) -> {});
        LocalCarUiSession.attach(second, intent -> {}, (text, duration) -> {});
        assertEquals(2, NativeCarSearch.target(new View(oldWindow)));
        LocalCarUiSession.detach(first);
        assertEquals(1, NativeCarSearch.target(new View(currentWindow)));
        LocalCarUiSession.detach(second);
        assertEquals(2, NativeCarSearch.target(new View(currentWindow)));
    }
}
