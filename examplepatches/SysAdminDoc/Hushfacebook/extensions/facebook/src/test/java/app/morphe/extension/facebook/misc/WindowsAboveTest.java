/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Dialog;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.util.List;

/** The windows a screen has open above its own, like Facebook's comment sheet, a dialog (#37). */
@RunWith(RobolectricTestRunner.class)
public class WindowsAboveTest {

    @Test
    public void theScreensShownWindowsAddedAfterItsOwnComeTopOneFirst() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        View decor = activity.getWindow().getDecorView();
        View before = shown(new Dialog(activity).getWindow().getDecorView());
        View sheet = shown(new Dialog(activity).getWindow().getDecorView());
        View menu = shown(new Dialog(activity).getWindow().getDecorView());
        View hidden = shown(new Dialog(activity).getWindow().getDecorView());
        hidden.setVisibility(View.GONE);
        View notLaidOut = new Dialog(activity).getWindow().getDecorView();
        View elsewhere = shown(new FrameLayout(RuntimeEnvironment.getApplication()));

        assertEquals(List.of(menu, sheet),
                WindowsAbove.of(activity, decor, List.of(before, decor, sheet, menu, hidden, notLaidOut, elsewhere), 2));
        View third = shown(new Dialog(activity).getWindow().getDecorView());
        assertEquals("up to the most asked for", List.of(third, menu),
                WindowsAbove.of(activity, decor, List.of(decor, sheet, menu, third), 2));
        assertTrue(WindowsAbove.of(activity, decor, List.of(decor), 2).isEmpty());
    }

    @Test
    public void aShownDialogIsFoundInTheAppsWindows() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        Dialog dialog = new Dialog(activity);
        dialog.setContentView(new FrameLayout(activity));
        dialog.show();
        shown(dialog.getWindow().getDecorView());

        assertEquals(List.of(dialog.getWindow().getDecorView()),
                WindowsAbove.of(activity, activity.getWindow().getDecorView(), 2));
        dialog.dismiss();
    }

    private static View shown(View root) {
        root.measure(View.MeasureSpec.makeMeasureSpec(1000, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(2000, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 1000, 2000);
        return root;
    }
}
