package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ir6 extends b2 {
    public final fr6 c;
    public final yt6 d;
    public final int e;
    public final /* synthetic */ yt6 f;
    public final /* synthetic */ ur6 g;
    public final /* synthetic */ int h;
    public final /* synthetic */ int i;
    public final /* synthetic */ long j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ir6(fr6 fr6Var, yt6 yt6Var, int i, ur6 ur6Var, int i2, int i3, long j) {
        super(3);
        this.f = yt6Var;
        this.g = ur6Var;
        this.h = i2;
        this.i = i3;
        this.j = j;
        this.c = fr6Var;
        this.d = yt6Var;
        this.e = i;
    }

    @Override // defpackage.b2
    public final zt6 m0(int i, int i2, int i3, long j) {
        return w0(i, j, i2, i3, this.e);
    }

    public final nr6 w0(int i, long j, int i2, int i3, int i4) {
        int i5;
        fr6 fr6Var = this.c;
        Object objC = fr6Var.c(i);
        Object objV = fr6Var.b.V(i);
        List listP0 = p0(this.d, i, j);
        if (f72.f(j)) {
            i5 = f72.j(j);
        } else {
            if (!f72.e(j)) {
                e26.a("does not have fixed height");
            }
            i5 = f72.i(j);
        }
        ip6 layoutDirection = this.f.b.getLayoutDirection();
        st6 st6Var = this.g.m;
        return new nr6(i, objC, i5, i4, layoutDirection, this.h, this.i, listP0, this.j, objV, st6Var, j, i2, i3);
    }
}
