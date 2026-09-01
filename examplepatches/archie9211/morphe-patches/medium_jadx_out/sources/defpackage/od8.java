package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public interface od8 {
    void onNestedPreScroll(View view, int i, int i2, int[] iArr, int i3);

    void onNestedScroll(View view, int i, int i2, int i3, int i4, int i5);

    void onNestedScrollAccepted(View view, View view2, int i, int i2);

    boolean onStartNestedScroll(View view, View view2, int i, int i2);

    void onStopNestedScroll(View view, int i);
}
