package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Arrays;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivity;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class SystemCameraTest {
    static final byte[] PHOTO = {(byte) 0xFF, (byte) 0xD8, (byte) 0xFF, (byte) 0xE0, 1, 2, 3, (byte) 0xFF, (byte) 0xD9};
    Application app;
    CameraProvider provider;

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        provider = Robolectric.setupContentProvider(CameraProvider.class, app.getPackageName() + CameraProvider.AUTHORITY_SUFFIX);
    }

    @Test public void onlyItsOwnSwitchSendsTheCameraButtonToThePhonesCamera() {
        Intent stock = new Intent().setClassName(app.getPackageName(), "com.facebook.messaging.montage.composer.MontageComposerActivity");
        assertSame(stock, Settings.systemCamera(stock));
        assertEquals(7377, Settings.cameraRequestCode(stock, 7377));
        assertEquals(0, Settings.lastActive("system_camera"));
        Settings.preferences.edit().putBoolean("system_camera", true).commit();
        Intent capture = Settings.systemCamera(stock);
        assertEquals(new ComponentName(app.getPackageName(), CameraActivity.class.getName()), capture.getComponent());
        assertEquals("Messenger reads the photo back the way it reads one picked in another app", 1112, Settings.cameraRequestCode(capture, 7377));
        assertEquals(7377, Settings.cameraRequestCode(stock, 7377));
        assertTrue(Settings.lastActive("system_camera") > 0);
        assertNull(Settings.systemCamera(null));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertSame("Pause brings Messenger's camera back", stock, Settings.systemCamera(stock));
    }

    @Test public void thePhotoTheCameraAppSavesComesBackForMessengerToRead() throws Exception {
        try (ActivityController<CameraActivity> controller = Robolectric.buildActivity(CameraActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            Intent camera = screen.getNextStartedActivityForResult().intent;
            assertEquals(MediaStore.ACTION_IMAGE_CAPTURE, camera.getAction());
            Uri output = camera.getParcelableExtra(MediaStore.EXTRA_OUTPUT);
            assertEquals(app.getPackageName() + CameraProvider.AUTHORITY_SUFFIX, output.getAuthority());
            assertEquals(output, camera.getClipData().getItemAt(0).getUri());
            assertNotEquals(0, camera.getFlags() & Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
            // The camera app writes through the one URI it was given.
            try (ParcelFileDescriptor descriptor = provider.openFile(output, "w");
                 FileOutputStream out = new FileOutputStream(descriptor.getFileDescriptor())) {
                out.write(PHOTO);
            }
            screen.receiveResult(camera, Activity.RESULT_OK, null);
            assertTrue(controller.get().isFinishing());
            assertEquals(Activity.RESULT_OK, screen.getResultCode());
            Intent result = screen.getResultIntent();
            assertEquals(output, result.getData());
            assertEquals("image/jpeg", result.getType());
            assertEquals("image/jpeg", provider.getType(result.getData()));
            byte[] read = new byte[PHOTO.length + 1];
            try (ParcelFileDescriptor descriptor = provider.openFile(result.getData(), "r");
                 FileInputStream in = new FileInputStream(descriptor.getFileDescriptor())) {
                assertEquals(PHOTO.length, in.read(read));
            }
            assertArrayEquals(PHOTO, Arrays.copyOf(read, PHOTO.length));
        }
        // Nothing but a capture name in the provider's own folder opens.
        String authority = "content://" + app.getPackageName() + CameraProvider.AUTHORITY_SUFFIX;
        assertNull(CameraProvider.fileFor(app, Uri.parse(authority + "/..%2Fshared_prefs%2Fhushmessenger.xml")));
        assertNull(CameraProvider.fileFor(app, Uri.parse(authority + "/IMG_1.jpg/extra")));
        assertNull(CameraProvider.fileFor(app, Uri.parse("content://other.app" + CameraProvider.AUTHORITY_SUFFIX + "/IMG_1.jpg")));
    }

    @Test public void aCancelledPhotoLeavesTheChatAsItWasAndItsFileGoes() {
        try (ActivityController<CameraActivity> controller = Robolectric.buildActivity(CameraActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            Intent camera = screen.getNextStartedActivityForResult().intent;
            File folder = CameraProvider.directory(app);
            assertEquals(1, folder.listFiles().length);
            screen.receiveResult(camera, Activity.RESULT_CANCELED, null);
            assertTrue(controller.get().isFinishing());
            assertEquals(Activity.RESULT_CANCELED, screen.getResultCode());
            assertEquals(0, folder.listFiles().length);
        }
    }
}
