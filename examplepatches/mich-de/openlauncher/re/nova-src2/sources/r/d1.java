package r;

import android.widget.AbsListView;

/* loaded from: classes2.dex */
public abstract class d1 {
    public static boolean a(AbsListView absListView) {
        return absListView.isSelectedChildViewEnabled();
    }

    public static void b(AbsListView absListView, boolean z11) {
        absListView.setSelectedChildViewEnabled(z11);
    }
}
