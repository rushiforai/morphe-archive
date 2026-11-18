/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.patches.components;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.pm.PackageInfo;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

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
import org.robolectric.annotation.LooperMode;

import java.lang.reflect.Field;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.EngagementPanel;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@LooperMode(LooperMode.Mode.PAUSED)
public class CommentsSearchFilterTest {
    private ActivityController<Activity> activity;
    private LinearLayout header;
    private View closeButton;
    private View searchButton;

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
        Settings.SEARCH_COMMENTS.save(true);
        EngagementPanel.hide();

        activity = Robolectric.buildActivity(Activity.class).setup().visible();
        header = new LinearLayout(activity.get());
        searchButton = new FrameLayout(activity.get());
        searchButton.setTag("morphe_search_comments_button");
        closeButton = new View(activity.get());
        header.addView(searchButton);
        header.addView(closeButton);
        activity.get().setContentView(header);
    }

    @After
    public void tearDown() {
        EngagementPanel.hide();
        Settings.SEARCH_COMMENTS.save(false);
        activity.close();
    }

    private static void dispatchHeaderUpdate() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    @Test
    public void onlyExistingTopLevelCommentPanelIdsAreSearchable() {
        for (String panelId : new String[] {
                "comment-item-section", "engagement-panel-comments-section",
                "post-comments-UgExample", "shorts-comments-panel"
        }) {
            assertTrue(panelId, CommentsSearchFilter.isCommentsPanel(panelId));
        }

        assertFalse(CommentsSearchFilter.isCommentsPanel(null));
        for (String panelId : new String[] {
                "", "video-description-ep-identifier", "engagement-panel-macro-markers-description-chapters",
                "engagement-panel-searchable-transcript", "live-chat-panel",
                "comment-replies-item-section", "engagement-panel-comment-replies-section",
                "description-comment-item-section", "unknown-panel"
        }) {
            assertFalse(panelId, CommentsSearchFilter.isCommentsPanel(panelId));
        }
    }

    @Test
    public void reusedHeaderWithoutSubheaderHidesSearchAndRestoresItForComments() {
        EngagementPanel.setId("engagement-panel-comments-section");
        CommentsSearchFilter.onPanelHeaderBound(closeButton);
        dispatchHeaderUpdate();
        assertEquals(View.VISIBLE, searchButton.getVisibility());

        for (String panelId : new String[] {
                "video-description-ep-identifier", "engagement-panel-macro-markers-description-chapters",
                "engagement-panel-searchable-transcript", "live-chat-panel", "comment-replies-item-section"
        }) {
            CommentsSearchFilter.onPanelHeaderBound(closeButton);
            assertEquals(View.GONE, searchButton.getVisibility());
            EngagementPanel.setId(panelId);
            dispatchHeaderUpdate();
            assertEquals(panelId, View.GONE, searchButton.getVisibility());

            CommentsSearchFilter.onPanelHeaderBound(closeButton);
            EngagementPanel.setId("engagement-panel-comments-section");
            dispatchHeaderUpdate();
            assertEquals(View.VISIBLE, searchButton.getVisibility());
            assertEquals(2, header.getChildCount());
        }
    }

    @Test
    public void deferredUpdateUsesCurrentPanelInsteadOfCommentsAtBindTime() {
        EngagementPanel.setId("engagement-panel-comments-section");
        CommentsSearchFilter.onPanelHeaderBound(closeButton);
        EngagementPanel.setId("video-description-ep-identifier");
        dispatchHeaderUpdate();
        assertEquals(View.GONE, searchButton.getVisibility());
    }

    @Test
    public void closingPanelOrDisablingSettingKeepsReboundButtonHidden() {
        EngagementPanel.setId("engagement-panel-comments-section");
        CommentsSearchFilter.onPanelHeaderBound(closeButton);
        EngagementPanel.hide();
        dispatchHeaderUpdate();
        assertEquals(View.GONE, searchButton.getVisibility());

        EngagementPanel.setId("engagement-panel-comments-section");
        CommentsSearchFilter.onPanelHeaderBound(closeButton);
        Settings.SEARCH_COMMENTS.save(false);
        dispatchHeaderUpdate();
        assertEquals(View.GONE, searchButton.getVisibility());
    }

    @Test
    public void disabledSettingStillCleansUpExistingButtonAtBindTime() {
        Settings.SEARCH_COMMENTS.save(false);
        CommentsSearchFilter.onPanelHeaderBound(closeButton);
        assertEquals(View.GONE, searchButton.getVisibility());
        dispatchHeaderUpdate();
        assertEquals(View.GONE, searchButton.getVisibility());
    }

    @Test
    public void nonCommentPanelDoesNotAllocateSearchButton() {
        header.removeView(searchButton);
        EngagementPanel.setId("video-description-ep-identifier");
        CommentsSearchFilter.onPanelHeaderBound(closeButton);
        dispatchHeaderUpdate();
        assertEquals(1, header.getChildCount());
    }
}
