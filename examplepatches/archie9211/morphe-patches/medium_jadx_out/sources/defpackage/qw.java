package defpackage;

import android.animation.ValueAnimator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qw {
    public pw a;
    public final /* synthetic */ sw b;

    public qw(sw swVar) {
        this.b = swVar;
    }

    public final boolean a() {
        boolean zUnregisterDurationScaleChangeListener = ValueAnimator.unregisterDurationScaleChangeListener(this.a);
        this.a = null;
        return zUnregisterDurationScaleChangeListener;
    }
}
