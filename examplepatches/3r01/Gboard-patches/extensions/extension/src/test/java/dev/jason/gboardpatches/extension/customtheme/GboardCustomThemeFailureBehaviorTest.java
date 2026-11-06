package dev.jason.gboardpatches.extension.customtheme;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

@RunWith(RobolectricTestRunner.class)
public final class GboardCustomThemeFailureBehaviorTest {
    @Test
    public void committedInstallRequestsRestartAfterGalleryIsClosed() {
        RecordingHost host = new RecordingHost(RuntimeEnvironment.getApplication());
        GboardCustomThemeGalleryView gallery = new GboardCustomThemeGalleryView(host);
        gallery.close();

        gallery.handleCommittedInstall("theme");

        Assert.assertEquals(1, host.submittedIntents);
    }

    @Test
    public void recognizedImportResultIsConsumedWhenAdapterShapeIsInvalid() {
        Intent result = new Intent().setData(Uri.parse("content://test/theme.zip"));

        boolean consumed = GboardCustomThemeOfficialImportRuntime.handleActivityResult(
                new Object(), 0x67, Activity.RESULT_OK, result);

        Assert.assertTrue(consumed);
    }

    private static final class RecordingHost
            implements GboardPatchesSettingsContract.FeatureHost {
        private final Context context;
        int submittedIntents;

        RecordingHost(Context context) {
            this.context = context;
        }

        @Override
        public Context getContext() {
            return context;
        }

        @Override
        public void submit(GboardPatchesSettingsContract.Intent intent) {
            submittedIntents++;
        }
    }
}
