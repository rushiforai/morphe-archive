package defpackage;

import android.view.View;
import android.view.WindowInsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kte {
    public static WindowInsets a(View view, WindowInsets windowInsets) {
        int i = eue.a;
        return view.dispatchApplyWindowInsets(windowInsets);
    }
}
