package androidx.recyclerview.widget;

import android.util.Log;
import android.view.animation.Interpolator;

/* loaded from: classes2.dex */
public final class l2 {

    /* renamed from: a, reason: collision with root package name */
    public int f15043a;

    /* renamed from: b, reason: collision with root package name */
    public int f15044b;

    /* renamed from: c, reason: collision with root package name */
    public int f15045c;

    /* renamed from: d, reason: collision with root package name */
    public int f15046d;

    /* renamed from: e, reason: collision with root package name */
    public Interpolator f15047e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f15048f;

    /* renamed from: g, reason: collision with root package name */
    public int f15049g;

    public final void a(RecyclerView recyclerView) {
        int i5 = this.f15046d;
        if (i5 >= 0) {
            this.f15046d = -1;
            recyclerView.jumpToPositionForSmoothScroller(i5);
            this.f15048f = false;
            return;
        }
        if (!this.f15048f) {
            this.f15049g = 0;
            return;
        }
        Interpolator interpolator = this.f15047e;
        if (interpolator != null && this.f15045c < 1) {
            throw new IllegalStateException("If you provide an interpolator, you must set a positive duration");
        }
        int i11 = this.f15045c;
        if (i11 < 1) {
            throw new IllegalStateException("Scroll duration must be a positive number");
        }
        recyclerView.mViewFlinger.c(this.f15043a, this.f15044b, interpolator, i11);
        int i12 = this.f15049g + 1;
        this.f15049g = i12;
        if (i12 > 10) {
            Log.e("RecyclerView", "Smooth Scroll action is being updated too frequently. Make sure you are not changing it unless necessary");
        }
        this.f15048f = false;
    }

    public final void b(int i5, int i11, Interpolator interpolator, int i12) {
        this.f15043a = i5;
        this.f15044b = i11;
        this.f15045c = i12;
        this.f15047e = interpolator;
        this.f15048f = true;
    }
}
