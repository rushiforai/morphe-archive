package defpackage;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kyb {
    public static final Comparator[] a;
    public static final dyb b;

    static {
        Comparator[] comparatorArr = new Comparator[2];
        int i = 0;
        while (i < 2) {
            comparatorArr[i] = new u23(6, new u23(i == 0 ? js4.f : js4.c));
            i++;
        }
        a = comparatorArr;
        b = dyb.j;
    }

    public static final void a(zxb zxbVar, ArrayList arrayList, ce ceVar, ce ceVar2, k68 k68Var) {
        txb txbVar = zxbVar.d;
        Object objG = txbVar.a.g(eyb.n);
        if (objG == null) {
            objG = Boolean.FALSE;
        }
        boolean zBooleanValue = ((Boolean) objG).booleanValue();
        if ((zBooleanValue || ((Boolean) ceVar2.invoke(zxbVar)).booleanValue()) && ((Boolean) ceVar.invoke(zxbVar)).booleanValue()) {
            arrayList.add(zxbVar);
        }
        if (zBooleanValue) {
            k68Var.i(zxbVar.f, b(zxbVar, ceVar, ceVar2, zxb.j(7, zxbVar)));
            return;
        }
        List listJ = zxb.j(7, zxbVar);
        int size = listJ.size();
        for (int i = 0; i < size; i++) {
            a((zxb) listJ.get(i), arrayList, ceVar, ceVar2, k68Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00d4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.util.ArrayList b(defpackage.zxb r18, defpackage.ce r19, defpackage.ce r20, java.util.List r21) {
        /*
            Method dump skipped, instruction units count: 362
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kyb.b(zxb, ce, ce, java.util.List):java.util.ArrayList");
    }
}
