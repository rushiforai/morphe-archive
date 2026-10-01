package app.spicetify.extension.spotify.ads;

import app.spicetify.extension.spotify.settings.PatchSettings;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class BrandAdsTest {
    @Before public void initialize() {
        var app = RuntimeEnvironment.getApplication();
        app.deleteSharedPreferences("spicetify_patch_settings");
        PatchSettings.initialize(app);
    }

    @Test public void removesOnlyHomeBrandAdsWithoutMutatingTheInput() {
        var first = new com.spotify.casita.v1.resolved.Section(1);
        var unknown = new com.spotify.casita.v1.resolved.Section(999);
        var video = new com.spotify.casita.v1.resolved.Section(20);
        var image = new com.spotify.casita.v1.resolved.Section(21);
        List<?> input = List.of(first, video, unknown, image);
        List<?> filtered = BrandAds.home(input);
        assertEquals(List.of(first, unknown), filtered);
        assertSame(first, filtered.get(0));
        assertSame(unknown, filtered.get(1));
        assertEquals(List.of(first, video, unknown, image), input);
    }

    @Test public void removesOnlyBrowseBrandAds() {
        var regular = new com.spotify.browsita.v1.resolved.Section(20);
        var ad = new com.spotify.browsita.v1.resolved.Section(6);
        assertEquals(List.of(regular), BrandAds.browse(List.of(ad, regular, ad)));
        assertTrue(BrandAds.browse(List.of(ad)).isEmpty());
    }

    @Test public void disabledPreferenceRestoresTheOriginalListAndPersists() {
        List<?> input = List.of(new com.spotify.casita.v1.resolved.Section(20));
        PatchSettings.setHideBrandAdsEnabled(false);
        PatchSettings.initialize(RuntimeEnvironment.getApplication());
        assertSame(input, BrandAds.home(input));
        PatchSettings.setHideBrandAdsEnabled(true);
        assertTrue(BrandAds.home(input).isEmpty());
    }

    @Test public void unchangedOrUnexpectedModelsReturnTheOriginalList() {
        List<?> regular = List.of(new com.spotify.casita.v1.resolved.Section(1));
        List<?> wrongKind = List.of(new com.spotify.browsita.v1.resolved.Section(6));
        List<?> mixed = List.of(new com.spotify.casita.v1.resolved.Section(20), new Object());
        List<?> nullItem = Arrays.asList(new com.spotify.casita.v1.resolved.Section(20), null);
        assertSame(regular, BrandAds.home(regular));
        assertSame(wrongKind, BrandAds.home(wrongKind));
        assertSame(mixed, BrandAds.home(mixed));
        assertSame(nullItem, BrandAds.home(nullItem));
        assertNull(BrandAds.home(null));
        List<?> empty = Collections.emptyList();
        assertSame(empty, BrandAds.home(empty));
    }
}
