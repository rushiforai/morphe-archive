package dev.twitchpatches.extension.ui;

import android.os.Build;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;

public final class UiWindowBars {
    private final UiSystemBars legacy = new UiSystemBars();
    private boolean status, navigation, savedStatus, savedNavigation;
    private int cutout, behavior;
    private Boolean hostStatus, hostNavigation;
    private boolean dirty, hostChanged;

    public void hostRequested(boolean hidden) { hostStatus = hostNavigation = hidden; dirty = hostChanged = true; }
    void hostRequestedFlags(int current, int flags) {
        if (!status || ((current ^ flags) & View.SYSTEM_UI_FLAG_FULLSCREEN) != 0)
            hostStatus = (flags & View.SYSTEM_UI_FLAG_FULLSCREEN) != 0;
        if (!navigation || ((current ^ flags) & View.SYSTEM_UI_FLAG_HIDE_NAVIGATION) != 0)
            hostNavigation = (flags & View.SYSTEM_UI_FLAG_HIDE_NAVIGATION) != 0;
    }
    void hostRequestedShow(int types) {
        if ((types & WindowInsets.Type.statusBars()) != 0) hostStatus = false;
        if ((types & WindowInsets.Type.navigationBars()) != 0) hostNavigation = false;
    }
    public void invalidate() { dirty = true; }

    public boolean apply(Window window, boolean hideStatus, boolean hideNavigation) {
        View decor = window.getDecorView();
        boolean changed = status != hideStatus || navigation != hideNavigation;
        WindowInsetsController controller = Build.VERSION.SDK_INT >= 30 ? window.getInsetsController() : null;
        if (controller != null) {
            WindowInsets insets = decor.getRootWindowInsets();
            if (hideStatus && !status) savedStatus = hostStatus != null ? hostStatus :
                    insets != null && !insets.isVisible(WindowInsets.Type.statusBars());
            if (hideNavigation && !navigation) savedNavigation = hostNavigation != null ? hostNavigation :
                    insets != null && !insets.isVisible(WindowInsets.Type.navigationBars());
            if (hostChanged || ((hideStatus || hideNavigation) && !status && !navigation))
                behavior = controller.getSystemBarsBehavior();
            if (changed || dirty) {
                int hide = (hideStatus ? WindowInsets.Type.statusBars() : 0) |
                        (hideNavigation ? WindowInsets.Type.navigationBars() : 0);
                int restore = (status && !hideStatus ? WindowInsets.Type.statusBars() : 0) |
                        (navigation && !hideNavigation ? WindowInsets.Type.navigationBars() : 0);
                int keep = (hostStatus != null ? hostStatus : savedStatus) ? WindowInsets.Type.statusBars() : 0;
                keep |= (hostNavigation != null ? hostNavigation : savedNavigation) ? WindowInsets.Type.navigationBars() : 0;
                if ((restore & ~keep) != 0) controller.show(restore & ~keep);
                if ((hide | (restore & keep)) != 0) controller.hide(hide | (restore & keep));
                if (hide != 0) controller.setSystemBarsBehavior(WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
                else if (status || navigation) controller.setSystemBarsBehavior(behavior);
            }
        } else {
            int requested = (hideStatus ? View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN : 0) |
                    (hideNavigation ? View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION |
                            View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY : 0);
            int current = decor.getSystemUiVisibility(), next = legacy.apply(current, requested);
            if (current != next) { decor.setSystemUiVisibility(next); changed = true; }
        }
        if (Build.VERSION.SDK_INT >= 28) {
            WindowManager.LayoutParams attributes = window.getAttributes();
            if (hideStatus && !status) cutout = attributes.layoutInDisplayCutoutMode;
            if (hideStatus || status) {
                int next = hideStatus ? WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES : cutout;
                if (attributes.layoutInDisplayCutoutMode != next) {
                    attributes.layoutInDisplayCutoutMode = next;
                    window.setAttributes(attributes);
                    changed = true;
                }
            }
        }
        status = hideStatus;
        navigation = hideNavigation;
        dirty = false;
        hostChanged = false;
        if (changed) decor.requestApplyInsets();
        return changed;
    }
}
