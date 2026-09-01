package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qt6 {
    public f72 b;
    public int c;
    public int d;
    public int f;
    public int g;
    public final /* synthetic */ st6 h;
    public mt6[] a = k40.j;
    public int e = 1;

    public qt6(st6 st6Var) {
        this.h = st6Var;
    }

    public static void b(qt6 qt6Var, zt6 zt6Var, sb2 sb2Var, lf5 lf5Var, int i, int i2) {
        qt6Var.h.getClass();
        long jH = zt6Var.h(0);
        qt6Var.a(zt6Var, sb2Var, lf5Var, i, i2, (int) (!zt6Var.f() ? jH & 4294967295L : jH >> 32));
    }

    public final void a(zt6 zt6Var, sb2 sb2Var, lf5 lf5Var, int i, int i2, int i3) {
        mt6[] mt6VarArr;
        mt6[] mt6VarArr2 = this.a;
        int length = mt6VarArr2.length;
        int i4 = 0;
        while (true) {
            if (i4 >= length) {
                this.f = i;
                this.g = i2;
                break;
            } else {
                mt6 mt6Var = mt6VarArr2[i4];
                if (mt6Var != null && mt6Var.g) {
                    break;
                } else {
                    i4++;
                }
            }
        }
        int iA = zt6Var.a();
        int length2 = this.a.length;
        while (true) {
            mt6VarArr = this.a;
            if (iA >= length2) {
                break;
            }
            mt6 mt6Var2 = mt6VarArr[iA];
            if (mt6Var2 != null) {
                mt6Var2.d();
            }
            iA++;
        }
        if (mt6VarArr.length != zt6Var.a()) {
            this.a = (mt6[]) Arrays.copyOf(this.a, zt6Var.a());
        }
        this.b = new f72(zt6Var.e());
        this.c = i3;
        this.d = zt6Var.i();
        this.e = zt6Var.c();
        int iA2 = zt6Var.a();
        for (int i5 = 0; i5 < iA2; i5++) {
            Object objD = zt6Var.d(i5);
            at6 at6Var = objD instanceof at6 ? (at6) objD : null;
            mt6[] mt6VarArr3 = this.a;
            if (at6Var == null) {
                mt6 mt6Var3 = mt6VarArr3[i5];
                if (mt6Var3 != null) {
                    mt6Var3.d();
                }
                this.a[i5] = null;
            } else {
                mt6 mt6Var4 = mt6VarArr3[i5];
                if (mt6Var4 == null) {
                    mt6Var4 = new mt6(sb2Var, lf5Var, new em4(14, this.h));
                    this.a[i5] = mt6Var4;
                }
                mt6Var4.d = at6Var.o;
                mt6Var4.e = at6Var.p;
                mt6Var4.f = at6Var.q;
            }
        }
    }
}
