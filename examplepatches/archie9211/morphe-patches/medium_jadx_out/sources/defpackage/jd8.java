package defpackage;

import androidx.core.widget.NestedScrollView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jd8 implements fc3 {
    public final /* synthetic */ NestedScrollView a;

    public jd8(NestedScrollView nestedScrollView) {
        this.a = nestedScrollView;
    }

    @Override // defpackage.fc3
    public final boolean d(float f) {
        if (f == 0.0f) {
            return false;
        }
        n();
        this.a.fling((int) f);
        return true;
    }

    @Override // defpackage.fc3
    public final float f() {
        return -this.a.getVerticalScrollFactorCompat();
    }

    @Override // defpackage.fc3
    public final void n() {
        this.a.mScroller.abortAnimation();
    }
}
