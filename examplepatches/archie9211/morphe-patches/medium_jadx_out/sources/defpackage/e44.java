package defpackage;

import android.graphics.Rect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e44 extends bxa {
    @Override // defpackage.bxa
    public final o78 I0() {
        o78 o78Var = new o78(new Rect[16]);
        o78Var.e(o78Var.c, guc.U(this).getSystemGestureExclusionRects());
        return o78Var;
    }

    @Override // defpackage.bxa
    public final void J0(o78 o78Var) {
        guc.U(this).setSystemGestureExclusionRects(o78Var.g());
    }
}
