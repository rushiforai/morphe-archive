package app.morphe.extension.tiktok.share;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

import java.lang.ref.WeakReference;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ShareSheetToolsTest {
    private Context context;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        Settings.HIDE_SHARE_CONTACTS.save(false);
        Object cache = ReflectionHelpers.getStaticField(ShareSheetTools.class, "RESOURCE_IDS");
        Map<String, Integer> ids = ReflectionHelpers.getField(cache, "ids");
        ids.put(context.getPackageName() + ":47.0.3:ip5", 0x7f000201);
        ids.put(context.getPackageName() + ":ibc", 0x7f000101);
        ids.put(context.getPackageName() + ":47.0.3:v3j", 0x7f000301);
    }

    @After public void tearDown() {
        Settings.HIDE_SHARE_CONTACTS.resetToDefault();
        Settings.SHARE_HIDDEN_ITEMS.resetToDefault();
    }

    @Test public void recycledCellsRestoreTheirOriginalWidthAfterHiding() {
        FrameLayout cell = new FrameLayout(context);
        cell.setLayoutParams(new FrameLayout.LayoutParams(120, 48));

        ShareSheetTools.setCellHidden(cell, true);
        assertEquals(View.GONE, cell.getVisibility());
        assertEquals(0, cell.getLayoutParams().width);

        ShareSheetTools.setCellHidden(cell, false);
        assertEquals(View.VISIBLE, cell.getVisibility());
        assertEquals(120, cell.getLayoutParams().width);

        cell.getLayoutParams().width = 64;
        ShareSheetTools.setCellHidden(cell, true);
        ShareSheetTools.setCellHidden(cell, false);
        assertEquals("the recycled cell returns to its first measured width", 120,
                cell.getLayoutParams().width);
    }

    /**
     * One walk per root finds what findViewById finds: the first view with the id in pre-order,
     * never one inside a nested window root, where findViewById doesn't look.
     */
    @Test public void oneWalkPerRootFindsWhatFindViewByIdFinds() {
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            Activity activity = controller.get();
            FrameLayout root = new FrameLayout(activity);
            FrameLayout branch = new FrameLayout(activity);
            View deepFirst = new View(activity);
            deepFirst.setId(0x7f000501);
            branch.addView(deepFirst);
            View shallowLater = new View(activity);
            shallowLater.setId(0x7f000501);
            root.addView(branch);
            root.addView(shallowLater);
            // A dialog's window root, not shown, so it has no parent yet: the framework marks it
            // a root namespace, and findViewById from above never enters it.
            android.app.Dialog dialog = new android.app.Dialog(activity);
            ViewGroup decor = (ViewGroup) dialog.getWindow().getDecorView();
            View inside = new View(activity);
            inside.setId(0x7f000502);
            decor.addView(inside);
            root.addView(decor);
            View other = new View(activity);
            other.setId(0x7f000503);
            root.addView(other);

            java.util.Set<Integer> ids = java.util.Set.of(0x7f000501, 0x7f000502, 0x7f000503, 0x7f000504);
            java.util.List<Map<Integer, View>> index = ShareSheetTools.indexRoots(java.util.List.of(root), ids);
            assertSame("the first view in pre-order", deepFirst, root.findViewById(0x7f000501));
            assertNull("the control: findViewById skips the nested window root", root.findViewById(0x7f000502));
            for (int id : ids) {
                assertSame(Integer.toHexString(id), root.findViewById(id), index.get(0).get(id));
            }
        }
    }

    @Test public void theHiddenListSplitsOnLineBreaksAsWellAsCommas() {
        assertEquals(java.util.List.of("sam", "whatsapp", "copy link", "repost"),
                ShareSheetTools.entries("Sam\nWhatsApp, Copy link\r\n,,Repost\n"));
        assertTrue(ShareSheetTools.entries(null).isEmpty());
    }

    @Test public void current47ContactsSectionWinsWhenOlderResourceStillResolves() {
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            Activity activity = controller.get();
            FrameLayout root = new FrameLayout(activity);
            FrameLayout currentSection = new FrameLayout(activity);
            currentSection.setId(0x7f000201);
            root.addView(currentSection);
            activity.setContentView(root);

            Settings.HIDE_SHARE_CONTACTS.save(true);
            ReflectionHelpers.setStaticField(ShareSheetTools.class, "activityReference",
                    new WeakReference<>(activity));
            ReflectionHelpers.callStaticMethod(ShareSheetTools.class, "apply");

            assertEquals(View.GONE, currentSection.getVisibility());
        }
    }

    /**
     * 47.0.3 builds the panel in a window of its own, which the activity's layout listener doesn't
     * see being laid out, so a contact bind is what runs the hiding pass there.
     */
    @Test public void aContactBindRunsTheHidingPassOnTheSendToRow() {
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            Activity activity = controller.get();
            FrameLayout root = new FrameLayout(activity);
            FrameLayout contacts = new FrameLayout(activity);
            contacts.setId(0x7f000301);
            FrameLayout alice = new FrameLayout(activity);
            alice.setContentDescription("  Alice  ");
            alice.setLayoutParams(new FrameLayout.LayoutParams(120, 48));
            FrameLayout bob = new FrameLayout(activity);
            bob.setContentDescription("Bob");
            bob.setLayoutParams(new FrameLayout.LayoutParams(120, 48));
            contacts.addView(alice);
            contacts.addView(bob);
            root.addView(contacts);
            activity.setContentView(root);
            ReflectionHelpers.setStaticField(ShareSheetTools.class, "activityReference",
                    new WeakReference<>(activity));
            Settings.SHARE_HIDDEN_ITEMS.save("alice");
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("the control: nothing has run the pass yet", View.VISIBLE, alice.getVisibility());

            ShareSheetTools.contactBound();
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            assertEquals("Alice", ShareSheetTools.labelOf(alice));
            assertEquals(View.GONE, alice.getVisibility());
            assertEquals(View.VISIBLE, bob.getVisibility());
        }
    }

    public static final class TestActivity extends Activity {
    }
}
