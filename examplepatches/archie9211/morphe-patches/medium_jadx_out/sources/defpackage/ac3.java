package defpackage;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ac3 {
    public final ArrayList a;
    public final int[] b;
    public final int[] c;
    public final h30 d;
    public final int e;
    public final int f;
    public final boolean g;

    public ac3(h30 h30Var, ArrayList arrayList, int[] iArr, int[] iArr2) {
        int i;
        zb3 zb3Var;
        int i2;
        ArrayList arrayList2 = (ArrayList) h30Var.e;
        ArrayList arrayList3 = (ArrayList) h30Var.d;
        this.a = arrayList;
        this.b = iArr;
        this.c = iArr2;
        Arrays.fill(iArr, 0);
        Arrays.fill(iArr2, 0);
        this.d = h30Var;
        int i3 = h30Var.b;
        this.e = i3;
        int i4 = h30Var.c;
        this.f = i4;
        this.g = true;
        zb3 zb3Var2 = arrayList.isEmpty() ? null : (zb3) arrayList.get(0);
        if (zb3Var2 == null || zb3Var2.a != 0 || zb3Var2.b != 0) {
            arrayList.add(0, new zb3(0, 0, 0));
        }
        arrayList.add(new zb3(i3, i4, 0));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            zb3 zb3Var3 = (zb3) it2.next();
            for (int i5 = 0; i5 < zb3Var3.c; i5++) {
                int i6 = zb3Var3.a + i5;
                int i7 = zb3Var3.b + i5;
                int i8 = op8.X(i7, arrayList2).f(op8.X(i6, arrayList3)) ? 1 : 2;
                iArr[i6] = (i7 << 4) | i8;
                iArr2[i7] = (i6 << 4) | i8;
            }
        }
        if (this.g) {
            Iterator it3 = arrayList.iterator();
            int i9 = 0;
            while (it3.hasNext()) {
                zb3 zb3Var4 = (zb3) it3.next();
                while (true) {
                    i = zb3Var4.a;
                    if (i9 < i) {
                        if (iArr[i9] == 0) {
                            int size = arrayList.size();
                            int i10 = 0;
                            int i11 = 0;
                            while (true) {
                                if (i10 < size) {
                                    zb3Var = (zb3) arrayList.get(i10);
                                    while (true) {
                                        i2 = zb3Var.b;
                                        if (i11 < i2) {
                                            if (iArr2[i11] == 0) {
                                                if (op8.X(i11, arrayList2).h(op8.X(i9, arrayList3))) {
                                                    int i12 = op8.X(i11, arrayList2).f(op8.X(i9, arrayList3)) ? 8 : 4;
                                                    iArr[i9] = (i11 << 4) | i12;
                                                    iArr2[i11] = i12 | (i9 << 4);
                                                }
                                            }
                                            i11++;
                                        }
                                    }
                                }
                                i11 = zb3Var.c + i2;
                                i10++;
                            }
                        }
                        i9++;
                    }
                }
                i9 = zb3Var4.c + i;
            }
        }
    }

    public static bc3 b(ArrayDeque arrayDeque, int i, boolean z) {
        bc3 bc3Var;
        Iterator it2 = arrayDeque.iterator();
        while (true) {
            if (!it2.hasNext()) {
                bc3Var = null;
                break;
            }
            bc3Var = (bc3) it2.next();
            if (bc3Var.a == i && bc3Var.c == z) {
                it2.remove();
                break;
            }
        }
        while (it2.hasNext()) {
            bc3 bc3Var2 = (bc3) it2.next();
            if (z) {
                bc3Var2.b--;
            } else {
                bc3Var2.b++;
            }
        }
        return bc3Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a(y27 y27Var) {
        int[] iArr;
        ArrayList arrayList;
        int i;
        int i2;
        int i3;
        ac3 ac3Var = this;
        h30 h30Var = ac3Var.d;
        ArrayList arrayList2 = (ArrayList) h30Var.e;
        ArrayList arrayList3 = (ArrayList) h30Var.d;
        hq0 hq0Var = y27Var instanceof hq0 ? (hq0) y27Var : new hq0(y27Var);
        ArrayDeque arrayDeque = new ArrayDeque();
        ArrayList arrayList4 = ac3Var.a;
        int i4 = 1;
        int size = arrayList4.size() - 1;
        int i5 = ac3Var.e;
        int i6 = ac3Var.f;
        int i7 = i5;
        while (size >= 0) {
            zb3 zb3Var = (zb3) arrayList4.get(size);
            int i8 = zb3Var.a;
            int i9 = zb3Var.c;
            int i10 = i8 + i9;
            int i11 = zb3Var.b;
            int i12 = i11 + i9;
            int i13 = i4;
            while (true) {
                iArr = ac3Var.b;
                arrayList = arrayList4;
                i = 0;
                if (i7 <= i10) {
                    break;
                }
                i7--;
                int i14 = iArr[i7];
                if ((i14 & 12) != 0) {
                    i3 = size;
                    int i15 = i14 >> 4;
                    bc3 bc3VarB = b(arrayDeque, i15, false);
                    if (bc3VarB != null) {
                        int i16 = (i5 - bc3VarB.b) - 1;
                        hq0Var.e(i7, i16);
                        if ((i14 & 4) != 0) {
                            op8.X(i7, arrayList3);
                            op8.X(i15, arrayList2);
                            hq0Var.F(i16, i13);
                        }
                    } else {
                        boolean z = i13;
                        arrayDeque.add(new bc3(i7, (i5 - i7) - (z ? 1 : 0), z));
                    }
                } else {
                    i3 = size;
                    hq0Var.w(i7, i13);
                    i5--;
                }
                arrayList4 = arrayList;
                size = i3;
                i13 = 1;
            }
            int i17 = size;
            while (i6 > i12) {
                i6--;
                int i18 = ac3Var.c[i6];
                if ((i18 & 12) != 0) {
                    int i19 = i18 >> 4;
                    bc3 bc3VarB2 = b(arrayDeque, i19, true);
                    if (bc3VarB2 == null) {
                        arrayDeque.add(new bc3(i6, i5 - i7, false));
                        i2 = 0;
                    } else {
                        i2 = 0;
                        hq0Var.e((i5 - bc3VarB2.b) - 1, i7);
                        if ((i18 & 4) != 0) {
                            op8.X(i19, arrayList3);
                            op8.X(i6, arrayList2);
                            hq0Var.F(i7, 1);
                        }
                    }
                } else {
                    i2 = i;
                    hq0Var.l(i7, 1);
                    i5++;
                }
                ac3Var = this;
                i = i2;
            }
            int i20 = i11;
            int i21 = i8;
            while (i < i9) {
                if ((iArr[i21] & 15) == 2) {
                    op8.X(i21, arrayList3);
                    op8.X(i20, arrayList2);
                    hq0Var.F(i21, 1);
                }
                i21++;
                i20++;
                i++;
            }
            size = i17 - 1;
            ac3Var = this;
            i4 = 1;
            i6 = i11;
            i7 = i8;
            arrayList4 = arrayList;
        }
        hq0Var.a();
    }
}
