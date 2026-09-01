package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tlb extends g21 {
    public static final int[] h;
    public final int b;
    public final g21 c;
    public final g21 d;
    public final int e;
    public final int f;
    public int g = 0;

    static {
        ArrayList arrayList = new ArrayList();
        int i = 1;
        int i2 = 1;
        while (i > 0) {
            arrayList.add(Integer.valueOf(i));
            int i3 = i2 + i;
            i2 = i;
            i = i3;
        }
        arrayList.add(Integer.MAX_VALUE);
        h = new int[arrayList.size()];
        int i4 = 0;
        while (true) {
            int[] iArr = h;
            if (i4 >= iArr.length) {
                return;
            }
            iArr[i4] = ((Integer) arrayList.get(i4)).intValue();
            i4++;
        }
    }

    public tlb(g21 g21Var, g21 g21Var2) {
        this.c = g21Var;
        this.d = g21Var2;
        int size = g21Var.size();
        this.e = size;
        this.b = g21Var2.size() + size;
        this.f = Math.max(g21Var.p(), g21Var2.p()) + 1;
    }

    public final boolean equals(Object obj) {
        int iV;
        if (obj == this) {
            return true;
        }
        if (obj instanceof g21) {
            g21 g21Var = (g21) obj;
            int size = g21Var.size();
            int i = this.b;
            if (i == size) {
                if (i == 0) {
                    return true;
                }
                if (this.g == 0 || (iV = g21Var.v()) == 0 || this.g == iV) {
                    rlb rlbVar = new rlb(this);
                    c57 c57VarA = rlbVar.a();
                    rlb rlbVar2 = new rlb(g21Var);
                    c57 c57VarA2 = rlbVar2.a();
                    int i2 = 0;
                    int i3 = 0;
                    int i4 = 0;
                    while (true) {
                        int length = c57VarA.b.length - i2;
                        int length2 = c57VarA2.b.length - i3;
                        int iMin = Math.min(length, length2);
                        if (!(i2 == 0 ? c57VarA.z(c57VarA2, i3, iMin) : c57VarA2.z(c57VarA, i2, iMin))) {
                            break;
                        }
                        i4 += iMin;
                        if (i4 >= i) {
                            if (i4 == i) {
                                return true;
                            }
                            lg8.d();
                            return false;
                        }
                        if (iMin == length) {
                            c57VarA = rlbVar.a();
                            i2 = 0;
                        } else {
                            i2 += iMin;
                        }
                        if (iMin == length2) {
                            c57VarA2 = rlbVar2.a();
                            i3 = 0;
                        } else {
                            i3 += iMin;
                        }
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        int iT = this.g;
        if (iT == 0) {
            int i = this.b;
            iT = t(i, 0, i);
            if (iT == 0) {
                iT = 1;
            }
            this.g = iT;
        }
        return iT;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new slb(this);
    }

    @Override // defpackage.g21
    public final void m(int i, int i2, int i3, byte[] bArr) {
        int i4 = i + i3;
        g21 g21Var = this.c;
        int i5 = this.e;
        if (i4 <= i5) {
            g21Var.m(i, i2, i3, bArr);
            return;
        }
        g21 g21Var2 = this.d;
        if (i >= i5) {
            g21Var2.m(i - i5, i2, i3, bArr);
            return;
        }
        int i6 = i5 - i;
        g21Var.m(i, i2, i6, bArr);
        g21Var2.m(0, i2 + i6, i3 - i6, bArr);
    }

    @Override // defpackage.g21
    public final int p() {
        return this.f;
    }

    @Override // defpackage.g21
    public final boolean q() {
        return this.b >= h[this.f];
    }

    @Override // defpackage.g21
    public final boolean r() {
        int iU = this.c.u(0, 0, this.e);
        g21 g21Var = this.d;
        return g21Var.u(iU, 0, g21Var.size()) == 0;
    }

    @Override // defpackage.g21
    public final int size() {
        return this.b;
    }

    @Override // defpackage.g21
    public final int t(int i, int i2, int i3) {
        int i4 = i2 + i3;
        g21 g21Var = this.c;
        int i5 = this.e;
        if (i4 <= i5) {
            return g21Var.t(i, i2, i3);
        }
        g21 g21Var2 = this.d;
        if (i2 >= i5) {
            return g21Var2.t(i, i2 - i5, i3);
        }
        int i6 = i5 - i2;
        return g21Var2.t(g21Var.t(i, i2, i6), 0, i3 - i6);
    }

    @Override // defpackage.g21
    public final int u(int i, int i2, int i3) {
        int i4 = i2 + i3;
        g21 g21Var = this.c;
        int i5 = this.e;
        if (i4 <= i5) {
            return g21Var.u(i, i2, i3);
        }
        g21 g21Var2 = this.d;
        if (i2 >= i5) {
            return g21Var2.u(i, i2 - i5, i3);
        }
        int i6 = i5 - i2;
        return g21Var2.u(g21Var.u(i, i2, i6), 0, i3 - i6);
    }

    @Override // defpackage.g21
    public final int v() {
        return this.g;
    }

    @Override // defpackage.g21
    public final void y(OutputStream outputStream, int i, int i2) {
        int i3 = i + i2;
        g21 g21Var = this.c;
        int i4 = this.e;
        if (i3 <= i4) {
            g21Var.y(outputStream, i, i2);
            return;
        }
        g21 g21Var2 = this.d;
        if (i >= i4) {
            g21Var2.y(outputStream, i - i4, i2);
            return;
        }
        int i5 = i4 - i;
        g21Var.y(outputStream, i, i5);
        g21Var2.y(outputStream, 0, i2 - i5);
    }

    @Override // defpackage.g21
    public final String w() {
        byte[] bArr;
        int i = this.b;
        if (i == 0) {
            bArr = w56.a;
        } else {
            byte[] bArr2 = new byte[i];
            m(0, 0, i, bArr2);
            bArr = bArr2;
        }
        return new String(bArr, peNPu.tJJbXqEvcS);
    }
}
