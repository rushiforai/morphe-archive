package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ew6 extends b2 {
    public final boolean c;
    public final aw6 d;
    public final yt6 e;
    public final hx4 f;
    public final /* synthetic */ fw6 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ew6(fw6 fw6Var, boolean z, aw6 aw6Var, yt6 yt6Var, hx4 hx4Var) {
        super(3);
        this.g = fw6Var;
        this.c = z;
        this.d = aw6Var;
        this.e = yt6Var;
        this.f = hx4Var;
    }

    @Override // defpackage.b2
    public final zt6 m0(int i, int i2, int i3, long j) {
        aw6 aw6Var = this.d;
        Object objC = aw6Var.c(i);
        Object objV = aw6Var.b.V(i);
        List listP0 = p0(this.e, i, j);
        fw6 fw6Var = this.g;
        return new lw6(i, objC, listP0, fw6Var.f, fw6Var.l, i2, i3, fw6Var.j, fw6Var.k, objV, fw6Var.a.t, j);
    }

    public final lw6 w0(int i, long j) {
        int i2;
        long jH;
        aw6 aw6Var = this.d;
        Object objC = aw6Var.c(i);
        Object objV = aw6Var.b.V(i);
        hx4 hx4Var = this.f;
        int[] iArr = (int[]) hx4Var.c;
        int length = iArr.length;
        int i3 = (int) (j >> 32);
        int i4 = length - 1;
        if (i3 <= i4) {
            i4 = i3;
        }
        int i5 = ((int) (j & 4294967295L)) - i3;
        int i6 = length - i4;
        if (i5 > i6) {
            i5 = i6;
        }
        if (i5 == 1) {
            i2 = iArr[i4];
        } else {
            int[] iArr2 = (int[]) hx4Var.b;
            int i7 = (i4 + i5) - 1;
            i2 = (iArr2[i7] + iArr[i7]) - iArr2[i4];
        }
        if (this.c) {
            if (i2 < 0) {
                d26.a("width must be >= 0");
            }
            jH = h72.h(i2, i2, 0, Integer.MAX_VALUE);
        } else {
            if (i2 < 0) {
                d26.a("height must be >= 0");
            }
            jH = h72.h(0, Integer.MAX_VALUE, i2, i2);
        }
        long j2 = jH;
        List listP0 = p0(this.e, i, j2);
        fw6 fw6Var = this.g;
        return new lw6(i, objC, listP0, fw6Var.f, fw6Var.l, i4, i5, fw6Var.j, fw6Var.k, objV, fw6Var.a.t, j2);
    }
}
