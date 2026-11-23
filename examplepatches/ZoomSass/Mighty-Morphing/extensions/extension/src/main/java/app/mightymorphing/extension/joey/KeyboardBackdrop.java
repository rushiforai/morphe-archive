package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;

/**
 * Modern UI: while the keyboard is up in a comment editor, the window behind it takes the
 * colour of the formatting bar. A see-through keyboard then shows the bar's colour instead of
 * the window's. Nothing changes while the keyboard is closed, and a solid keyboard hides it.
 */
final class KeyboardBackdrop {
    private static final String TAG = "MightyMorphing";

    private KeyboardBackdrop() {
    }

    static void install(Activity activity) {
        try {
            final Window window = activity.getWindow();
            final View decor = window.getDecorView();
            final boolean[] shown = {false};
            final Drawable[] background = {null};
            ViewTreeObserver.OnGlobalLayoutListener listener = () -> {
                try {
                    boolean up = keyboardUp(decor);
                    if (up == shown[0]) return;
                    shown[0] = up;
                    if (up) {
                        background[0] = window.getDecorView().getBackground();
                        window.setBackgroundDrawable(new ColorDrawable(ModernUi.getPalette(activity).container));
                    } else {
                        if (background[0] != null) window.setBackgroundDrawable(background[0]);
                        background[0] = null;
                        ModernUi.paintSystemBars(activity);
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "keyboard backdrop", t);
                }
            };
            decor.getViewTreeObserver().addOnGlobalLayoutListener(listener);
        } catch (Throwable t) {
            Log.e(TAG, "keyboard backdrop install", t);
        }
    }

    private static boolean keyboardUp(View decor) {
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsets insets = decor.getRootWindowInsets();
            return insets != null && insets.isVisible(WindowInsets.Type.ime());
        }
        Rect frame = new Rect();
        decor.getWindowVisibleDisplayFrame(frame);
        int height = decor.getRootView().getHeight();
        return height > 0 && height - frame.bottom > height / 6;
    }
}
