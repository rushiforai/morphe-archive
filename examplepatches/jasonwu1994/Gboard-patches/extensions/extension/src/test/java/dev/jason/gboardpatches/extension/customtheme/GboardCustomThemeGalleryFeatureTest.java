package dev.jason.gboardpatches.extension.customtheme;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.lang.reflect.Field;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

@RunWith(RobolectricTestRunner.class)
public final class GboardCustomThemeGalleryFeatureTest {
    @Test
    public void backgroundScreenBuildDefersGalleryUntilUiFactoryAndHiddenClosesIt()
            throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        GboardCustomThemeGalleryFeature feature = new GboardCustomThemeGalleryFeature(context);
        TestHost host = new TestHost(context);
        ExecutorService executor = Executors.newSingleThreadExecutor();
        GboardPatchesSettingsContract.Screen screen;
        try {
            Future<GboardPatchesSettingsContract.Screen> future = executor.submit(
                    () -> feature.buildScreen(host));
            screen = future.get();
        } finally {
            executor.shutdownNow();
        }

        Assert.assertNull(activeGallery(feature));
        GboardPatchesSettingsContract.CustomViewRow row =
                (GboardPatchesSettingsContract.CustomViewRow) screen.getRows().get(0);
        View galleryView = row.getViewFactory().create(host);
        GboardCustomThemeGalleryView gallery = activeGallery(feature);
        ViewGroup grid = (ViewGroup) objectField(gallery, "grid");
        grid.addView(new View(context));

        Assert.assertNotNull(galleryView);
        Assert.assertNotNull(gallery);
        Assert.assertSame(gallery.getView(), galleryView);
        Assert.assertEquals(1, grid.getChildCount());

        feature.onHidden(host);

        Assert.assertNull(activeGallery(feature));
        Assert.assertTrue(booleanField(gallery, "closed"));
        Assert.assertEquals(0, grid.getChildCount());
    }

    private static GboardCustomThemeGalleryView activeGallery(
            GboardCustomThemeGalleryFeature feature) throws Exception {
        Field field = GboardCustomThemeGalleryFeature.class.getDeclaredField("activeGallery");
        field.setAccessible(true);
        return (GboardCustomThemeGalleryView) field.get(feature);
    }

    private static boolean booleanField(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getBoolean(owner);
    }

    private static Object objectField(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(owner);
    }

    private static final class TestHost implements GboardPatchesSettingsContract.FeatureHost {
        private final Context context;

        TestHost(Context context) {
            this.context = context;
        }

        @Override
        public Context getContext() {
            return context;
        }

        @Override
        public void submit(GboardPatchesSettingsContract.Intent intent) {
            // Not needed by this lifecycle test.
        }
    }
}
