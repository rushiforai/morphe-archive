/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.pm.PackageInfo;
import android.view.Menu;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.PopupMenu;

import com.google.protobuf.MessageLite;
import com.google.protobuf.InvalidProtocolBufferException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.StreamSupport;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.BrowseResponseOuterClass.BrowseTab;
import app.morphe.extension.youtube.patches.components.LayoutComponentsFilter;
import app.morphe.extension.youtube.patches.components.ShortsButtonFilter;
import app.morphe.extension.youtube.patches.feed.FeedPatch;
import app.morphe.extension.youtube.patches.general.ChangeFormFactorPatch;
import app.morphe.extension.youtube.patches.utils.PlayerTypeHookPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.ShortsPlayerState;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class UiFixesTest {
    private ActivityController<Activity> activity;

    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = application.getPackageName();
        info.versionName = "21.45.90";
        info.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(info);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, application);
        Settings.HIDE_SHORTS_PREVIEW_COMMENT.save(true);
        Settings.HIDE_FEED_FLYOUT_MENU.save(true);
        Settings.HIDE_FEED_FLYOUT_MENU_FILTER_STRINGS.save("Hidden");
        Settings.HIDE_FEED_FLYOUT_MENU_FILTER_TYPE.save(false);
        Settings.CHANGE_FORM_FACTOR.save(ChangeFormFactorPatch.FormFactor.SMALL);
        activity = Robolectric.buildActivity(Activity.class).setup().visible();
    }

    @After
    public void tearDown() {
        activity.close();
    }

    private record Item(String title) implements FeedPatch.FlyoutMenuItem {
        @Override
        public CharSequence patch_getFlyoutMenuItemTitle() {
            return title;
        }
    }

    private static List<?> items(Iterable<?> source) {
        return StreamSupport.stream(source.spliterator(), false).toList();
    }

    @Test
    public void popupFilteringPreservesOrderUnknownAndUntitledItems() {
        Item hidden = new Item("Hidden");
        Item visible = new Item("Visible");
        Item untitled = new Item(null);
        Object customAction = new Object();
        var input = List.of(hidden, visible, untitled, customAction);
        assertEquals(List.of(visible, untitled, customAction), items(FeedPatch.hideFlyoutMenuItems(input)));

        Settings.HIDE_FEED_FLYOUT_MENU.save(false);
        assertSame(input, FeedPatch.hideFlyoutMenuItems(input));
    }

    @Test
    public void popupAndToolbarHonorSubstringFiltering() {
        Settings.HIDE_FEED_FLYOUT_MENU_FILTER_TYPE.save(true);
        assertEquals(List.of(new Item("Visible")), items(FeedPatch.hideFlyoutMenuItems(
                List.of(new Item("Hidden entry"), new Item("Visible")))));

        Menu menu = new PopupMenu(activity.get(), new View(activity.get())).getMenu();
        menu.add(0, 1, 0, "Hidden entry");
        menu.add(0, 2, 1, "Visible");
        FeedPatch.hideFlyoutMenu(menu, 1, "Hidden entry");
        FeedPatch.hideFlyoutMenu(menu, 2, "Visible");
        assertNull(menu.findItem(1));
        assertNotNull(menu.findItem(2));
    }

    @Test
    public void metadataCollapsesOnlyWhenEveryExistingChildIsFiltered() {
        FrameLayout box = new FrameLayout(activity.get());
        assertFalse(LayoutComponentsFilter.isEngagementPanelBoxEmpty(box));
        View child = new View(activity.get());
        box.addView(child);
        assertTrue(LayoutComponentsFilter.isEngagementPanelBoxEmpty(box));
        child.measure(View.MeasureSpec.makeMeasureSpec(40, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(40, View.MeasureSpec.EXACTLY));
        assertFalse(LayoutComponentsFilter.isEngagementPanelBoxEmpty(box));
        child.setVisibility(View.GONE);
        assertTrue(LayoutComponentsFilter.isEngagementPanelBoxEmpty(box));
    }

    private static MessageLite reelConfig(byte[] bytes) throws InvalidProtocolBufferException {
        // A real lite message retains the unknown Shorts configuration fields on serialization.
        return BrowseTab.parseFrom(bytes);
    }

    @Test
    public void hiddenPreviewCommentRestoresNavigationOnlyForEnabledBottomBars() throws Exception {
        ShortsButtonFilter.setReelWatchConfig(reelConfig(new byte[]{0x42, 2, 8, 1}));
        assertEquals(1, ShortsButtonFilter.getNavigationBarMode(2));
        assertEquals(1, ShortsButtonFilter.getNavigationBarMode(3));
        assertEquals(0, ShortsButtonFilter.getNavigationBarMode(0));

        ShortsButtonFilter.setReelWatchConfig(reelConfig(new byte[]{0x42, 2, 8, 0}));
        assertEquals(2, ShortsButtonFilter.getNavigationBarMode(2));
        ShortsButtonFilter.setReelWatchConfig(null);
        assertEquals(3, ShortsButtonFilter.getNavigationBarMode(3));

        Settings.HIDE_SHORTS_PREVIEW_COMMENT.save(false);
        ShortsButtonFilter.setReelWatchConfig(reelConfig(new byte[]{0x42, 2, 8, 1}));
        assertEquals(2, ShortsButtonFilter.getNavigationBarMode(2));
    }

    @Test
    public void closingOneOfTwoAttachedShortsPlayersKeepsStateOpen() {
        FrameLayout container = new FrameLayout(activity.get());
        activity.get().setContentView(container);
        View first = new View(activity.get());
        View second = new View(activity.get());
        PlayerTypeHookPatch.onShortsCreate(first);
        PlayerTypeHookPatch.onShortsCreate(second);
        container.addView(first);
        container.addView(second);
        assertEquals(ShortsPlayerState.OPEN, ShortsPlayerState.getCurrent());
        container.removeView(first);
        assertEquals(ShortsPlayerState.OPEN, ShortsPlayerState.getCurrent());
        container.removeView(second);
        assertEquals(ShortsPlayerState.CLOSED, ShortsPlayerState.getCurrent());
    }

    @Test
    public void emptyBottomBarCollapsesWithoutHidingVisibleNativeActions() {
        FrameLayout root = new FrameLayout(activity.get());
        FrameLayout empty = new FrameLayout(activity.get());
        FrameLayout populated = new FrameLayout(activity.get());
        populated.addView(new View(activity.get()));
        root.addView(empty);
        root.addView(populated);
        ShortsButtonFilter.hideEmptyBottomActionBar(empty);
        ShortsButtonFilter.hideEmptyBottomActionBar(populated);
        activity.get().setContentView(root);
        root.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals(View.GONE, empty.getVisibility());
        assertEquals(View.VISIBLE, populated.getVisibility());
    }

    @Test
    public void responsivePhoneWidthDoesNotGrowPastCompactClass() {
        int compactWidth = Math.round(599 * activity.get().getResources().getDisplayMetrics().density);
        assertEquals(compactWidth, ChangeFormFactorPatch.getResponsiveContainerWidth(compactWidth + 200));
        assertEquals(compactWidth - 100, ChangeFormFactorPatch.getResponsiveContainerWidth(compactWidth - 100));
    }
}
