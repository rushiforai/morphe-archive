package app.morphe.extension.hushthreads.coexist;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import android.app.Activity;

/** A tile the launcher refused opens the app it names, and only then (#16). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class ShareTilesTest {
    private static final String MESSENGER = "com.facebook.orca";

    private static Intent tile() {
        return new Intent(Intent.ACTION_SEND).setPackage(MESSENGER).setType("text/plain").putExtra(Intent.EXTRA_TEXT, "https://www.threads.com/");
    }

    private static Context app() {
        return RuntimeEnvironment.getApplication();
    }

    private static Intent started() {
        return Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity();
    }

    @Test
    public void aTileTheLauncherRefusedOpensTheAppItNames() {
        ShareTiles.openRefused(false, app(), tile());
        Intent opened = started();
        assertEquals(MESSENGER, opened.getPackage());
        assertEquals(Intent.ACTION_SEND, opened.getAction());
        assertEquals("https://www.threads.com/", opened.getStringExtra(Intent.EXTRA_TEXT));
    }

    @Test
    public void aTileNamingAnActivityOpensToo() {
        Intent facebook = new Intent(Intent.ACTION_SEND).setComponent(new ComponentName("com.facebook.katana", "Alias"));
        ShareTiles.openRefused(false, app(), facebook);
        assertEquals("com.facebook.katana", started().getComponent().getPackageName());
    }

    @Test
    public void aTileTheLauncherStartedDoesNotOpenTwice() {
        ShareTiles.openRefused(true, app(), tile());
        assertNull(started());
    }

    @Test
    public void anIntentNamingNoAppIsLeftAlone() {
        ShareTiles.openRefused(false, app(), new Intent(Intent.ACTION_SEND).setType("text/plain"));
        assertNull(started());
    }

    @Test
    public void nothingToOpenIsLeftAlone() {
        ShareTiles.openRefused(false, null, tile());
        ShareTiles.openRefused(false, app(), null);
        assertNull(started());
    }

    @Test
    public void anActivityKeepsTheTask() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        ShareTiles.openRefused(false, activity, tile());
        Intent opened = Shadows.shadowOf(activity).getNextStartedActivity();
        assertEquals(MESSENGER, opened.getPackage());
        assertEquals(0, opened.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    @Test
    public void anotherContextStartsItsOwnTask() {
        ShareTiles.openRefused(false, app(), tile());
        assertTrue((started().getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
    }

    @Test
    public void anAppThatIsGoneCostsTheTapNothing() {
        Context gone = new ContextWrapper(app()) {
            @Override
            public void startActivity(Intent intent) {
                throw new ActivityNotFoundException(intent.getPackage());
            }
        };
        ShareTiles.openRefused(false, gone, tile());
        assertNull(started());
    }
}
