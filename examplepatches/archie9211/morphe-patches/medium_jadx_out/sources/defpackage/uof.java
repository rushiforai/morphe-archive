package defpackage;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uof extends pmf {
    public static final int[] h = {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169, 63245986, 102334155, 165580141, 267914296, 433494437, 701408733, 1134903170, 1836311903, Integer.MAX_VALUE};
    public final int c;
    public final pmf d;
    public final pmf e;
    public final int f;
    public final int g;

    public uof(pmf pmfVar, pmf pmfVar2) {
        this.d = pmfVar;
        this.e = pmfVar2;
        int iM = pmfVar.m();
        this.f = iM;
        this.c = pmfVar2.m() + iM;
        this.g = Math.max(pmfVar.z(), pmfVar2.z()) + 1;
    }

    public static int F(int i) {
        if (i >= 47) {
            return Integer.MAX_VALUE;
        }
        return h[i];
    }

    @Override // defpackage.pmf
    public final boolean A() {
        return this.c >= F(this.g);
    }

    @Override // defpackage.pmf
    /* JADX INFO: renamed from: B */
    public final ugf iterator() {
        return new sof(this);
    }

    @Override // defpackage.pmf
    public final byte f(int i) {
        int i2 = this.f;
        return i < i2 ? this.d.f(i) : this.e.f(i - i2);
    }

    @Override // defpackage.pmf, java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new sof(this);
    }

    @Override // defpackage.pmf
    public final int m() {
        return this.c;
    }

    @Override // defpackage.pmf
    public final pmf p(int i, int i2) {
        return q(i, i2);
    }

    @Override // defpackage.pmf
    public final pmf q(int i, int i2) {
        int i3 = this.c;
        int iD = pmf.d(i, i2, i3);
        if (iD == 0) {
            return pmf.b;
        }
        if (iD == i3) {
            return this;
        }
        pmf pmfVar = this.d;
        int i4 = this.f;
        if (i2 <= i4) {
            return pmfVar.p(i, i2);
        }
        int i5 = i2 - i4;
        pmf pmfVar2 = this.e;
        return i >= i4 ? pmfVar2.p(i - i4, i5) : new uof(pmfVar.p(i, pmfVar.m()), pmfVar2.p(0, i5));
    }

    @Override // defpackage.pmf
    public final void r(int i, int i2, int i3, byte[] bArr) {
        int i4 = i + i3;
        pmf pmfVar = this.d;
        int i5 = this.f;
        if (i4 <= i5) {
            pmfVar.r(i, i2, i3, bArr);
            return;
        }
        pmf pmfVar2 = this.e;
        if (i >= i5) {
            pmfVar2.r(i - i5, i2, i3, bArr);
            return;
        }
        int i6 = i5 - i;
        pmfVar.r(i, i2, i6, bArr);
        pmfVar2.r(0, i2 + i6, i3 - i6, bArr);
    }

    @Override // defpackage.pmf
    public final void t(h30 h30Var) {
        this.d.t(h30Var);
        this.e.t(h30Var);
    }

    @Override // defpackage.pmf
    public final String u() {
        return new String(E(), StandardCharsets.UTF_8);
    }

    @Override // defpackage.pmf
    public final boolean v(pmf pmfVar) {
        rlb rlbVar = new rlb(this);
        nmf nmfVarB = rlbVar.b();
        rlb rlbVar2 = new rlb(pmfVar);
        nmf nmfVarB2 = rlbVar2.b();
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        while (true) {
            int iM = nmfVarB.m() - i;
            int iM2 = nmfVarB2.m() - i2;
            int iMin = Math.min(iM, iM2);
            if (!(i == 0 ? nmfVarB.F(nmfVarB2, i2, iMin) : nmfVarB2.F(nmfVarB, i, iMin))) {
                return false;
            }
            i3 += iMin;
            int i4 = this.c;
            if (i3 >= i4) {
                if (i3 == i4) {
                    return true;
                }
                lg8.d();
                return false;
            }
            if (iMin == iM) {
                i = 0;
                nmfVarB = rlbVar.b();
            } else {
                i += iMin;
                nmfVarB = nmfVarB;
            }
            if (iMin == iM2) {
                nmfVarB2 = rlbVar2.b();
                i2 = 0;
            } else {
                i2 += iMin;
            }
        }
    }

    @Override // defpackage.pmf
    public final int x(int i, int i2, int i3) {
        int i4 = i2 + i3;
        pmf pmfVar = this.d;
        int i5 = this.f;
        if (i4 <= i5) {
            return pmfVar.x(i, i2, i3);
        }
        pmf pmfVar2 = this.e;
        if (i2 >= i5) {
            return pmfVar2.x(i, i2 - i5, i3);
        }
        int i6 = i5 - i2;
        return pmfVar2.x(pmfVar.x(i, i2, i6), 0, i3 - i6);
    }

    @Override // defpackage.pmf
    public final up1 y() {
        ArrayList<ByteBuffer> arrayList = new ArrayList();
        ArrayDeque arrayDeque = new ArrayDeque(this.g);
        arrayDeque.push(this);
        pmf pmfVar = this.d;
        while (pmfVar instanceof uof) {
            uof uofVar = (uof) pmfVar;
            arrayDeque.push(uofVar);
            pmfVar = uofVar.d;
        }
        nmf nmfVar = (nmf) pmfVar;
        while (true) {
            if (!(nmfVar != null)) {
                wnf wnfVar = new wnf();
                wnfVar.a = arrayList.iterator();
                wnfVar.c = 0;
                for (ByteBuffer byteBuffer : arrayList) {
                    wnfVar.c++;
                }
                wnfVar.d = -1;
                if (!wnfVar.f()) {
                    wnfVar.b = tnf.b;
                    wnfVar.e = 0;
                }
                return new smf(wnfVar);
            }
            nmf nmfVar2 = null;
            if (nmfVar == null) {
                ywb.n();
                return null;
            }
            while (true) {
                if (arrayDeque.isEmpty()) {
                    break;
                }
                pmf pmfVar2 = ((uof) arrayDeque.pop()).e;
                while (pmfVar2 instanceof uof) {
                    uof uofVar2 = (uof) pmfVar2;
                    arrayDeque.push(uofVar2);
                    pmfVar2 = uofVar2.d;
                }
                nmf nmfVar3 = (nmf) pmfVar2;
                if (nmfVar3.m() != 0) {
                    nmfVar2 = nmfVar3;
                    break;
                }
            }
            arrayList.add(nmfVar.s());
            nmfVar = nmfVar2;
        }
    }

    @Override // defpackage.pmf
    public final int z() {
        return this.g;
    }
}
