/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */
package app.morphe.extension.youtube.patches.components;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import com.google.protobuf.ByteString;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;

import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.Filter.FilterContentType;
import app.morphe.extension.shared.patches.components.LazyBufferFilter.Buffer;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ComponentType;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.Element;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ElementModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ElementType;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupInlinePlayback;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupViewModelHolder;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.NavigationBar.NavigationButton;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class ShortsShelfFilterTest {
    private static final String CARD_ID = "lockup.eml-fe|8c3f407b04ae7a1f";
    private static final String CARD_ROOT = CARD_ID + "|CellType|";
    private static final Buffer UNEXPECTED_BUFFER = () -> {
        throw new AssertionError("Only an enabled outer card can request the element bytes");
    };

    private ShortsShelfFilter filter;
    private StringFilterGroup cardGroup;

    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, application);

        Field navigation = NavigationButton.class.getDeclaredField("selectedNavigationButton");
        navigation.setAccessible(true);
        navigation.set(null, NavigationButton.HOME);
        Settings.HIDE_SHORTS_SHELF.save(true);
        Settings.HIDE_SHORTS_SHELF_HOME_RELATED_VIDEOS.save(true);

        filter = new ShortsShelfFilter();
        Field paths = Filter.class.getDeclaredField("pathCallbacks");
        paths.setAccessible(true);
        cardGroup = ((List<?>) paths.get(filter)).stream()
                .map(StringFilterGroup.class::cast)
                .filter(group -> Arrays.asList(group.filters).contains("lockup.eml"))
                .findFirst().orElseThrow();
    }

    @Test
    public void hidesTypedShortOnlyAtItsOuterCard() {
        byte[] shortCard = lockup(3, ByteString.EMPTY);
        assertTrue(filterCard(CARD_ROOT, () -> shortCard));
        assertTrue(filterCard("lockup.eml-js|a10a05c2e4d51bc1|CellType|", () -> shortCard));
        assertFalse(filterCard(CARD_ROOT + "ContainerType|lockup_thumbnail.eml|0abc|", UNEXPECTED_BUFFER));
        assertFalse(filterCard("horizontal_shelf.eml|0abc|CellType|" + CARD_ROOT, UNEXPECTED_BUFFER));
        assertFalse(filterCard(CARD_ROOT + CARD_ROOT, UNEXPECTED_BUFFER));
    }

    @Test
    public void keepsOrdinaryCardsEvenWithNestedShortMetadata() {
        ByteString nestedShort = ByteString.copyFrom(lockup(3, ByteString.EMPTY));
        assertFalse(filterCard(CARD_ROOT, () -> lockup(1, nestedShort)));
        assertFalse(filterCard(CARD_ROOT, () -> lockup(0, nestedShort)));
        assertFalse(filterCard(CARD_ROOT, () -> lockup(2, ByteString.EMPTY)));

        byte[] shortCard = lockup(3, ByteString.EMPTY);
        assertFalse(filterCard(CARD_ROOT, () -> Arrays.copyOf(shortCard, shortCard.length - 1)));
    }

    @Test
    public void respectsHomeAndMasterTogglesBeforeReadingBytes() {
        Settings.HIDE_SHORTS_SHELF_HOME_RELATED_VIDEOS.save(false);
        assertFalse(filterCard(CARD_ROOT, UNEXPECTED_BUFFER));

        Settings.HIDE_SHORTS_SHELF_HOME_RELATED_VIDEOS.save(true);
        Settings.HIDE_SHORTS_SHELF.save(false);
        assertFalse(filterCard(CARD_ROOT, UNEXPECTED_BUFFER));
    }

    @Test
    public void doesNotUseTheLegacySharedBuffer() {
        assertFalse(filter.isFilteredLazy(CARD_ROOT, CARD_ID, "", UNEXPECTED_BUFFER,
                cardGroup, FilterContentType.PATH, 0));
    }

    private boolean filterCard(String path, Buffer buffer) {
        var match = cardGroup.check(path);
        return match.isFiltered() && filter.isFilteredLazy(null, CARD_ID, "", path, buffer,
                cardGroup, FilterContentType.PATH, match.getMatchedIndex());
    }

    private static byte[] lockup(int contentType, ByteString inlinePlayback) {
        var viewModel = LockupViewModel.newBuilder().setContentType(contentType)
                .setInlinePlayback(LockupInlinePlayback.newBuilder().setInlinePlayback(inlinePlayback));
        var model = LockupModel.newBuilder().setViewModel(
                LockupViewModelHolder.newBuilder().setLockupViewModel(viewModel));
        var component = ComponentType.newBuilder().setModel(ElementModel.newBuilder().setLockupModel(model));
        return Element.newBuilder().setType(ElementType.newBuilder().setComponentType(component))
                .build().toByteArray();
    }
}
