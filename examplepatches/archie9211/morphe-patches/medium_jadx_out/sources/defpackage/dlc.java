package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dlc {
    public static flc a(View view) {
        view.getClass();
        return (view.getAlpha() == 0.0f && view.getVisibility() == 0) ? flc.INVISIBLE : b(view.getVisibility());
    }

    public static flc b(int i) {
        if (i == 0) {
            return flc.VISIBLE;
        }
        if (i == 4) {
            return flc.INVISIBLE;
        }
        if (i == 8) {
            return flc.GONE;
        }
        ay0.e(b09.w(i, "Unknown visibility "));
        return null;
    }
}
