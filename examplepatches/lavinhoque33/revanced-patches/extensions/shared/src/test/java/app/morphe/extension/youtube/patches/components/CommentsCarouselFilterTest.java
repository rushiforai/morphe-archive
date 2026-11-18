/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.patches.components;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.util.List;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.NextResponseOuterClass.*;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class CommentsCarouselFilterTest {
    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.39.525";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, application);
        Settings.HIDE_COMMENTS_CAROUSEL.save(true);
    }

    private static byte[] carousel(String... titles) {
        Data.Builder data = Data.newBuilder();
        for (String title : titles) {
            data.addCarouselTitleDatas(CarouselTitleDatas.newBuilder().setTitle(title));
            data.addCarouselItemDatas(CarouselItemDatas.getDefaultInstance());
        }

        return NewElement.newBuilder()
                .setProperties(Properties.newBuilder().setIdentifierProperties(
                        IdentifierProperties.newBuilder().setIdentifier("video_metadata_carousel.eml")))
                .setType(Type.newBuilder().setComponentType(ComponentType.newBuilder().setModel(
                        Model.newBuilder().setVideoMetadataCarouselModel(
                                VideoMetadataCarouselModel.newBuilder().setData(data)))))
                .build().toByteArray();
    }

    private static void assertTitles(byte[] bytes, String... titles) throws Exception {
        Data data = NewElement.parseFrom(bytes).getType().getComponentType().getModel()
                .getVideoMetadataCarouselModel().getData();
        assertEquals(List.of(titles), data.getCarouselTitleDatasList().stream()
                .map(CarouselTitleDatas::getTitle).toList());
        assertEquals(titles.length, data.getCarouselItemDatasCount());
    }

    @Test
    public void defaultSubstringPreservesSavedListAndCase() throws Exception {
        assertTrue(Settings.HIDE_COMMENTS_CAROUSEL_FILTER_TYPE.get());
        String savedList = "community\n\nAsk";
        Settings.HIDE_COMMENTS_CAROUSEL_FILTER_STRINGS.save(savedList);

        byte[] filtered = CommentsFilter.onCommentsLoaded(carousel(
                "community", "Join the community", "Community", "Ask", "Ask more", "Hype"));

        assertTitles(filtered, "Community", "Hype");
        assertEquals(savedList, Settings.HIDE_COMMENTS_CAROUSEL_FILTER_STRINGS.get());
    }

    @Test
    public void exactMatchKeepsSubstringsAndWhitespace() throws Exception {
        Settings.HIDE_COMMENTS_CAROUSEL_FILTER_TYPE.save(false);
        Settings.HIDE_COMMENTS_CAROUSEL_FILTER_STRINGS.save("community\n\nAsk ");

        assertTitles(CommentsFilter.onCommentsLoaded(carousel(
                "community", "Join the community", "Community", "Ask", "Ask ")),
                "Join the community", "Community", "Ask");
    }

    @Test
    public void disabledOrBlankFilterReturnsOriginalBytes() {
        byte[] bytes = carousel("Ask");
        Settings.HIDE_COMMENTS_CAROUSEL_FILTER_STRINGS.save("\n ");
        assertSame(bytes, CommentsFilter.onCommentsLoaded(bytes));

        Settings.HIDE_COMMENTS_CAROUSEL_FILTER_STRINGS.save("Ask");
        Settings.HIDE_COMMENTS_CAROUSEL.save(false);
        assertSame(bytes, CommentsFilter.onCommentsLoaded(bytes));
    }
}
