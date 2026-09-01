package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x16 extends jb9 {
    public final boolean l;

    public x16(String str, y16 y16Var) {
        super(str, y16Var, 1);
        this.l = true;
    }

    @Override // defpackage.jb9
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof x16) {
            xzb xzbVar = (xzb) obj;
            if (this.a.equals(xzbVar.a())) {
                x16 x16Var = (x16) obj;
                if (x16Var.l && Arrays.equals((xzb[]) this.j.getValue(), (xzb[]) x16Var.j.getValue())) {
                    int iE = xzbVar.e();
                    int i = this.c;
                    if (i == iE) {
                        for (int i2 = 0; i2 < i; i2++) {
                            if (g76.L(h(i2).a(), xzbVar.h(i2).a()) && g76.L(h(i2).j(), xzbVar.h(i2).j())) {
                            }
                        }
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // defpackage.jb9
    public final int hashCode() {
        return super.hashCode() * 31;
    }

    @Override // defpackage.jb9, defpackage.xzb
    public final boolean isInline() {
        return this.l;
    }
}
