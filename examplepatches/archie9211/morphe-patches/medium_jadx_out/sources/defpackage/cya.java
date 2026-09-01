package defpackage;

import android.util.Log;
import android.view.animation.BaseInterpolator;
import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cya {
    public int a;
    public int b;
    public int c;
    public int d;
    public BaseInterpolator e;
    public boolean f;
    public int g;

    public final void a(RecyclerView recyclerView) {
        int i = this.d;
        if (i >= 0) {
            this.d = -1;
            recyclerView.O(i);
            this.f = false;
            return;
        }
        if (!this.f) {
            this.g = 0;
            return;
        }
        BaseInterpolator baseInterpolator = this.e;
        if (baseInterpolator != null && this.c < 1) {
            ygf.f("If you provide an interpolator, you must set a positive duration");
            return;
        }
        int i2 = this.c;
        if (i2 < 1) {
            ygf.f("Scroll duration must be a positive number");
            return;
        }
        recyclerView.r0.c(this.a, this.b, i2, baseInterpolator);
        int i3 = this.g + 1;
        this.g = i3;
        if (i3 > 10) {
            Log.e("RecyclerView", "Smooth Scroll action is being updated too frequently. Make sure you are not changing it unless necessary");
        }
        this.f = false;
    }
}
