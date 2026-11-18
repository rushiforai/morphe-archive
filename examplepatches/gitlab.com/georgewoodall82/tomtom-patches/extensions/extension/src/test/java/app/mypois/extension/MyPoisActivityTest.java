package app.mypois.extension;

import static org.junit.Assert.assertNotNull;

import android.content.Intent;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class MyPoisActivityTest {

    @Test
    public void opensFolderList() {
        MyPoisActivity activity = Robolectric.buildActivity(MyPoisActivity.class).create().start().resume().get();
        assertNotNull(activity);
    }

    @Test
    public void opensAddFlow() {
        Intent intent = new Intent(Intent.ACTION_MAIN).setAction(MyPoisActivity.ACTION_ADD)
                .putExtra(MyPoisActivity.EXTRA_NAME, "Depot")
                .putExtra(MyPoisActivity.EXTRA_LAT, 51.5)
                .putExtra(MyPoisActivity.EXTRA_LON, -0.12);
        MyPoisActivity activity = Robolectric.buildActivity(MyPoisActivity.class, intent).create().start().resume().get();
        assertNotNull(activity);
    }
}
