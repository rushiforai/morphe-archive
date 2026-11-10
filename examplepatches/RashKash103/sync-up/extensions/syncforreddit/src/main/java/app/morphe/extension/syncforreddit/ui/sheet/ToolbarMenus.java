package app.morphe.extension.syncforreddit.ui.sheet;

import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;

import app.morphe.extension.shared.Logger;

/**
 * Keeping a menu opened from the toolbar from taking the app down with it.
 *
 * <p>A menu Sync opens from the toolbar is drawn as a sheet hanging from under the toolbar
 * rather than rising from the bottom, and to place it there Sync takes the behaviour off the
 * sheet's layout parameters. Material's own edge-to-edge handling then asks the same sheet for
 * that behaviour the first time the window hands it its insets, and what it does where there is
 * none is throw: {@code IllegalArgumentException: The view is not associated with
 * BottomSheetBehavior}, on the main thread, which closes the app the moment either toolbar
 * button is tapped. Whether the insets reach the sheet at all depends on the device, which is
 * why only some copies of Sync do this.
 *
 * <p>What is answered here is only that question — whether the sheet still carries a
 * {@code BottomSheetBehavior} — and where it does not, Material's edge-to-edge work is left
 * undone for that one sheet. Sync already leaves the navigation bar alone for these menus, so
 * there is nothing of it to miss. Every other sheet still has its behaviour and is untouched.
 *
 * @noinspection unused
 */
public final class ToolbarMenus {
    /** Material's own name for it, which survives the app's obfuscation. */
    private static final String THE_BEHAVIOUR =
            "com.google.android.material.bottomsheet.BottomSheetBehavior";

    private ToolbarMenus() {}

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * Called where Material is about to look the sheet's behaviour up.
     *
     * @return Whether the sheet has no {@code BottomSheetBehavior} on it, in which case the
     *         lookup would throw and Material's edge-to-edge handling must be skipped.
     */
    public static boolean theSheetHasNoBehaviour(View sheet) {
        try {
            if (!isPatchIncluded() || sheet == null) {
                return false;
            }

            ViewGroup.LayoutParams params = sheet.getLayoutParams();
            if (params == null) {
                return true;
            }

            // Asked by type rather than by name: the layout parameters belong to the app's own
            // copy of CoordinatorLayout, whose members are obfuscated and change with every
            // build of it, while the behaviour's own class keeps its name.
            Class<?> wanted = Class.forName(THE_BEHAVIOUR, false,
                    ToolbarMenus.class.getClassLoader());

            for (Class<?> each = params.getClass(); each != null; each = each.getSuperclass()) {
                for (Field field : each.getDeclaredFields()) {
                    if (field.getType().isPrimitive()) {
                        continue;
                    }
                    field.setAccessible(true);
                    if (wanted.isInstance(field.get(params))) {
                        return false;
                    }
                }
            }

            Logger.printDebug(() -> "sheet: no behaviour on this one, leaving its insets alone");
            return true;
        } catch (Throwable ex) {
            // Throwable rather than Exception: a missing class arrives as an Error, and saying
            // no here only leaves the app doing exactly what it did before.
            Logger.printInfo(() -> "sheet: could not read the sheet's behaviour: " + ex);
            return false;
        }
    }
}
