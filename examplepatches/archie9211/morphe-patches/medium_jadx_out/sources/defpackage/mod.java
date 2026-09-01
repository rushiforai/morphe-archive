package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mod implements gd9 {
    public final int a;

    public mod(int i) {
        this.a = i;
    }

    @Override // defpackage.gd9
    public final long C(o46 o46Var, long j, ip6 ip6Var, long j2) {
        int i = (int) (j2 >> 32);
        int iD = ((o46Var.d() - i) / 2) + o46Var.a;
        if (iD < 0) {
            iD = o46Var.a;
        } else if (iD + i > ((int) (j >> 32))) {
            iD = o46Var.c - i;
        }
        int i2 = o46Var.b - ((int) (j2 & 4294967295L));
        int i3 = this.a;
        int i4 = i2 - i3;
        if (i4 < 0) {
            i4 = o46Var.d + i3;
        }
        return (((long) iD) << 32) | (4294967295L & ((long) i4));
    }
}
