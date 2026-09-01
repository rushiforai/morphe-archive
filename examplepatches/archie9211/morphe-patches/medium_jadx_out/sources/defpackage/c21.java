package defpackage;

import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class c21 extends f21 {
    public final byte[] d;

    public c21(byte[] bArr) {
        this.a = 0;
        bArr.getClass();
        this.d = bArr;
    }

    @Override // defpackage.f21
    public byte d(int i) {
        return this.d[i];
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof f21) && size() == ((f21) obj).size()) {
            if (size() == 0) {
                return true;
            }
            if (!(obj instanceof c21)) {
                return obj.equals(this);
            }
            c21 c21Var = (c21) obj;
            int i = this.a;
            int i2 = c21Var.a;
            if (i == 0 || i2 == 0 || i == i2) {
                int size = size();
                if (size > c21Var.size()) {
                    ygf.h(size, size());
                    return false;
                }
                if (size > c21Var.size()) {
                    StringBuilder sbC = ev6.C("Ran off end of other: 0, ", size, ", ");
                    sbC.append(c21Var.size());
                    throw new IllegalArgumentException(sbC.toString());
                }
                byte[] bArr = c21Var.d;
                int iW = w() + size;
                int iW2 = w();
                int iW3 = c21Var.w();
                while (iW2 < iW) {
                    if (this.d[iW2] == bArr[iW3]) {
                        iW2++;
                        iW3++;
                    }
                }
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.f21
    public byte m(int i) {
        return this.d[i];
    }

    @Override // defpackage.f21
    public final boolean p() {
        int iW = w();
        return toe.a.s(this.d, iW, size() + iW);
    }

    @Override // defpackage.f21
    public final sp1 q() {
        return sp1.g(this.d, w(), size(), true);
    }

    @Override // defpackage.f21
    public final int r(int i, int i2) {
        int iW = w();
        Charset charset = v56.a;
        for (int i3 = iW; i3 < iW + i2; i3++) {
            i = (i * 31) + this.d[i3];
        }
        return i;
    }

    @Override // defpackage.f21
    public final f21 s(int i) {
        int iE = f21.e(0, i, size());
        return iE == 0 ? f21.b : new y11(this.d, w(), iE);
    }

    @Override // defpackage.f21
    public int size() {
        return this.d.length;
    }

    @Override // defpackage.f21
    public final String t(Charset charset) {
        return new String(this.d, w(), size(), charset);
    }

    @Override // defpackage.f21
    public final void v(aq1 aq1Var) {
        aq1Var.x(this.d, w(), size());
    }

    public int w() {
        return 0;
    }
}
