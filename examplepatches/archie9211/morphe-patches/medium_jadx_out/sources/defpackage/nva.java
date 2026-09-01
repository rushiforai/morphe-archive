package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nva {
    public final cva a;
    public final ArrayList b;
    public final int c;
    public final zf3 d;
    public final kbb e;
    public final int f;
    public final int g;
    public final int h;
    public int i;

    public nva(cva cvaVar, ArrayList arrayList, int i, zf3 zf3Var, kbb kbbVar, int i2, int i3, int i4) {
        kbbVar.getClass();
        this.a = cvaVar;
        this.b = arrayList;
        this.c = i;
        this.d = zf3Var;
        this.e = kbbVar;
        this.f = i2;
        this.g = i3;
        this.h = i4;
    }

    public static nva a(nva nvaVar, int i, zf3 zf3Var, kbb kbbVar, int i2) {
        if ((i2 & 1) != 0) {
            i = nvaVar.c;
        }
        int i3 = i;
        if ((i2 & 2) != 0) {
            zf3Var = nvaVar.d;
        }
        zf3 zf3Var2 = zf3Var;
        if ((i2 & 4) != 0) {
            kbbVar = nvaVar.e;
        }
        kbb kbbVar2 = kbbVar;
        int i4 = nvaVar.f;
        int i5 = nvaVar.g;
        int i6 = nvaVar.h;
        kbbVar2.getClass();
        return new nva(nvaVar.a, nvaVar.b, i3, zf3Var2, kbbVar2, i4, i5, i6);
    }

    public final adb b(kbb kbbVar) {
        kbbVar.getClass();
        ArrayList arrayList = this.b;
        int size = arrayList.size();
        int i = this.c;
        if (i >= size) {
            ygf.f("Check failed.");
            return null;
        }
        this.i++;
        zf3 zf3Var = this.d;
        if (zf3Var != null) {
            rva rvaVarC = ((c44) zf3Var.b).c();
            qt5 qt5Var = kbbVar.a;
            rvaVarC.getClass();
            qt5Var.getClass();
            qt5 qt5Var2 = rvaVarC.i.h;
            if (qt5Var.e != qt5Var2.e || !g76.L(qt5Var.d, qt5Var2.d)) {
                z72.e("network interceptor ", arrayList.get(i - 1), " must retain the same host and port");
                return null;
            }
            if (this.i != 1) {
                z72.e("network interceptor ", arrayList.get(i - 1), " must call proceed() exactly once");
                return null;
            }
        }
        int i2 = i + 1;
        nva nvaVarA = a(this, i2, null, kbbVar, 58);
        j56 j56Var = (j56) arrayList.get(i);
        adb adbVarA = j56Var.a(nvaVarA);
        if (adbVarA == null) {
            throw new NullPointerException("interceptor " + j56Var + " returned null");
        }
        if (zf3Var == null || i2 >= arrayList.size() || nvaVarA.i == 1) {
            return adbVarA;
        }
        z72.e("network interceptor ", j56Var, " must call proceed() exactly once");
        return null;
    }
}
