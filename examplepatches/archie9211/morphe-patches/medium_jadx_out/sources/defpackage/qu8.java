package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qu8 extends zl4 {
    public static final qu8 d = new qu8(1, 0, 2);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        int[] iArr;
        k65 k65Var;
        int iC;
        int iH = ym0Var.h(0);
        if (igcVar.n != 0) {
            b22.a("Cannot move a group while inserting");
        }
        if (iH < 0) {
            b22.a("Parameter offset is out of bounds");
        }
        if (iH == 0) {
            return;
        }
        int i = igcVar.t;
        int i2 = igcVar.v;
        int i3 = igcVar.u;
        int i4 = i;
        while (true) {
            iArr = igcVar.b;
            if (iH <= 0) {
                break;
            }
            i4 += iArr[(igcVar.q(i4) * 5) + 3];
            if (i4 > i3) {
                b22.a("Parameter offset is out of bounds");
            }
            iH--;
        }
        int i5 = iArr[(igcVar.q(i4) * 5) + 3];
        int iF = igcVar.f(igcVar.q(igcVar.t), igcVar.b);
        int iF2 = igcVar.f(igcVar.q(i4), igcVar.b);
        int i6 = i4 + i5;
        int iF3 = igcVar.f(igcVar.q(i6), igcVar.b);
        int i7 = iF3 - iF2;
        igcVar.w(i7, Math.max(igcVar.t - 1, 0));
        igcVar.v(i5);
        int[] iArr2 = igcVar.b;
        int iQ = igcVar.q(i6) * 5;
        k80.h0(igcVar.q(i) * 5, iQ, iArr2, iArr2, (i5 * 5) + iQ);
        if (i7 > 0) {
            Object[] objArr = igcVar.c;
            int iG = igcVar.g(iF2 + i7);
            System.arraycopy(objArr, iG, objArr, iF, igcVar.g(iF3 + i7) - iG);
        }
        int i8 = iF2 + i7;
        int i9 = i8 - iF;
        int i10 = igcVar.k;
        int i11 = igcVar.l;
        int length = igcVar.c.length;
        int i12 = igcVar.m;
        int i13 = i + i5;
        int i14 = i;
        while (i14 < i13) {
            int iQ2 = igcVar.q(i14);
            int i15 = i9;
            int[] iArr3 = iArr2;
            iArr3[(iQ2 * 5) + 4] = igc.h(igc.h(igcVar.f(iQ2, iArr2) - i15, i12 < iQ2 ? 0 : i10, i11, length), igcVar.k, igcVar.l, igcVar.c.length);
            i14++;
            i9 = i15;
            iArr2 = iArr3;
            i10 = i10;
        }
        int i16 = i6 + i5;
        int iO = igcVar.o();
        int iB = hgc.b(igcVar.d, i6, iO);
        ArrayList arrayList = new ArrayList();
        if (iB >= 0) {
            while (iB < igcVar.d.size() && (iC = igcVar.c((k65Var = (k65) igcVar.d.get(iB)))) >= i6 && iC < i16) {
                arrayList.add(k65Var);
            }
        }
        int i17 = i - i6;
        int size = arrayList.size();
        for (int i18 = 0; i18 < size; i18++) {
            k65 k65Var2 = (k65) arrayList.get(i18);
            int iC2 = igcVar.c(k65Var2) + i17;
            if (iC2 >= igcVar.g) {
                k65Var2.a = -(iO - iC2);
            } else {
                k65Var2.a = iC2;
            }
            igcVar.d.add(hgc.b(igcVar.d, iC2, iO), k65Var2);
        }
        if (igcVar.H(i6, i5)) {
            b22.a("Unexpectedly removed anchors");
        }
        igcVar.l(i2, igcVar.u, i);
        if (i7 > 0) {
            igcVar.I(i8, i7, i6 - 1);
        }
    }
}
