package app.voidhack.extension.applemusic;

import android.view.View;

/** Implemented by the host's CoordinatorLayout.LayoutParams in the patch. */
public interface GlassPlayerSheet {
    int EXPANDED = 3;
    int COLLAPSED = 4;

    boolean glassPlayerCanDrag(View sheet);
    int glassPlayerTop(View sheet, int state);
    void glassPlayerDrag(View sheet, int top);
    void glassPlayerSettle(View sheet, boolean collapse);
}
