/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24
 */
package app.morphe.extension.youtube.patches.queue;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.pm.PackageInfo;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;

import com.google.protobuf.ByteString;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ContentImage;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ThumbnailViewModel;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = {28, 34})
@SuppressWarnings("deprecation")
public class ThumbnailQueueAccessibilityTest {
    private static final String FIRST_VIDEO = "AbCd-_01234";
    private static final String SECOND_VIDEO = "Zyxwv987654";
    private static final String CARD_TITLE = "Same title - play video";
    private static final String ACTION_LABEL = "Add to queue";

    @Before
    public void installTargetVersion() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "21.13.164";
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
    }

    @Test
    public void classicCardAddsOneCustomActionWithoutTakingStockActionsOrChildren() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            View host = new View(controller.get());
            attach(controller.get(), host);
            var source = LockupViewModel.newBuilder().setContentType(1).setContentId(FIRST_VIDEO)
                    .setContentImage(ContentImage.newBuilder().setThumbnailViewModel(
                            ThumbnailViewModel.newBuilder().setImage(ByteString.copyFromUtf8("thumbnail"))))
                    .build();
            host.setContentDescription(ThumbnailQueuePatch.markLockupLabel(source, CARD_TITLE, true, false));
            var button = ThumbnailQueueButton.createBound(host);
            assertNotNull(button);
            var invoked = new ArrayList<ThumbnailQueuePatch.Binding>();
            var node = AccessibilityNodeInfo.obtain(host);
            node.addAction(AccessibilityAction.ACTION_CLICK);
            node.addAction(AccessibilityAction.ACTION_LONG_CLICK);
            node.addChild(host, 7);
            int childCount = node.getChildCount();

            button.addAccessibilityAction(host, node, ACTION_LABEL);
            button.addAccessibilityAction(host, node, ACTION_LABEL);
            int actionId = queueActionId(node);
            assertTrue(node.getActionList().contains(AccessibilityAction.ACTION_CLICK));
            assertTrue(node.getActionList().contains(AccessibilityAction.ACTION_LONG_CLICK));
            assertEquals(childCount, node.getChildCount());
            assertFalse(button.performAccessibilityAction(host, AccessibilityNodeInfo.ACTION_CLICK, invoked::add));
            assertFalse(button.performAccessibilityAction(host, AccessibilityNodeInfo.ACTION_LONG_CLICK, invoked::add));
            assertTrue(button.performAccessibilityAction(host, actionId, invoked::add));
            assertEquals(List.of(new ThumbnailQueuePatch.Binding(FIRST_VIDEO, false)), invoked);
            node.recycle();
        }
    }

    @Test
    public void cachedActionCannotQueueEitherVideoAfterTheHostIsRecycled() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            View host = new View(controller.get());
            attach(controller.get(), host);
            ThumbnailQueueButton first = bind(host, FIRST_VIDEO);
            int firstId = actionId(host, first);
            var invoked = new ArrayList<ThumbnailQueuePatch.Binding>();

            ThumbnailQueueButton second = bind(host, SECOND_VIDEO);
            assertFalse(first.performAccessibilityAction(host, firstId, invoked::add));
            int secondId = actionId(host, second);
            assertNotEquals(firstId, secondId);
            assertFalse(second.performAccessibilityAction(host, firstId, invoked::add));
            assertTrue(second.performAccessibilityAction(host, secondId, invoked::add));

            host.setContentDescription("Playlist");
            assertNull(ThumbnailQueueButton.createBound(host));
            assertNoAction(host, second);
            assertFalse(second.performAccessibilityAction(host, secondId, invoked::add));
            assertEquals(List.of(new ThumbnailQueuePatch.Binding(SECOND_VIDEO, false)), invoked);
        }
    }

    @Test
    public void rejectsUnboundNodesHiddenHostsAndCardsInsideHorizontalShelves() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            var container = new FrameLayout(activity);
            View host = new View(activity);
            container.addView(host);
            attach(activity, container);
            ThumbnailQueueButton button = bind(host, FIRST_VIDEO);
            int id = actionId(host, button);
            var invoked = new ArrayList<ThumbnailQueuePatch.Binding>();

            assertNoAction(container, button);
            assertFalse(button.performAccessibilityAction(container, id, invoked::add));
            host.setVisibility(View.GONE);
            assertNoAction(host, button);
            assertFalse(button.performAccessibilityAction(host, id, invoked::add));

            host.setVisibility(View.VISIBLE);
            container.removeView(host);
            assertNoAction(host, button);
            assertFalse(button.performAccessibilityAction(host, id, invoked::add));

            var shelf = new HorizontalScrollView(activity);
            container.addView(shelf);
            shelf.addView(host);
            assertTrue(host.isAttachedToWindow());
            assertNoAction(host, button);
            assertFalse(button.performAccessibilityAction(host, id, invoked::add));
            assertTrue(invoked.isEmpty());
        }
    }

    private static void attach(Activity activity, View view) {
        Utils.setContext(activity.getApplicationContext());
        activity.setContentView(view);
        assertTrue(view.isAttachedToWindow());
    }

    private static ThumbnailQueueButton bind(View host, String id) {
        host.setContentDescription(ThumbnailQueuePatch.boundLabel(CARD_TITLE, id, false));
        ThumbnailQueueButton button = ThumbnailQueueButton.createBound(host);
        assertNotNull(button);
        return button;
    }

    private static int actionId(View host, ThumbnailQueueButton button) {
        var node = AccessibilityNodeInfo.obtain(host);
        button.addAccessibilityAction(host, node, ACTION_LABEL);
        int id = queueActionId(node);
        node.recycle();
        return id;
    }

    private static int queueActionId(AccessibilityNodeInfo node) {
        var actions = node.getActionList().stream()
                .filter(action -> ThumbnailQueueButton.isQueueActionId(action.getId())).toList();
        assertEquals(1, actions.size());
        assertEquals(ACTION_LABEL, actions.get(0).getLabel());
        return actions.get(0).getId();
    }

    private static void assertNoAction(View host, ThumbnailQueueButton button) {
        var node = AccessibilityNodeInfo.obtain(host);
        button.addAccessibilityAction(host, node, ACTION_LABEL);
        assertTrue(node.getActionList().isEmpty());
        node.recycle();
    }
}
