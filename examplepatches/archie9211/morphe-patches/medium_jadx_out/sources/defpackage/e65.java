package defpackage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e65 {
    public static final e65 b = new e65(d46.R(y55.c, b65.c, z55.c, a65.c));
    public final LinkedHashMap a;

    public e65(List list) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Object obj : list) {
            y05 y05Var = ((c65) obj).a;
            Object arrayList = linkedHashMap.get(y05Var);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(y05Var, arrayList);
            }
            ((List) arrayList).add(obj);
        }
        this.a = linkedHashMap;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005c A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0016 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.d65 a(defpackage.y05 r8, java.lang.String r9) {
        /*
            r7 = this;
            r8.getClass()
            r9.getClass()
            java.util.LinkedHashMap r7 = r7.a
            java.lang.Object r7 = r7.get(r8)
            java.util.List r7 = (java.util.List) r7
            r8 = 0
            if (r7 != 0) goto L12
            goto L65
        L12:
            java.util.Iterator r7 = r7.iterator()
        L16:
            boolean r0 = r7.hasNext()
            if (r0 == 0) goto L65
            java.lang.Object r0 = r7.next()
            c65 r0 = (defpackage.c65) r0
            java.lang.String r1 = r0.b
            r2 = 0
            boolean r1 = defpackage.tuc.N(r9, r1, r2)
            if (r1 == 0) goto L16
            java.lang.String r1 = r0.b
            int r1 = r1.length()
            java.lang.String r1 = r9.substring(r1)
            int r3 = r1.length()
            if (r3 != 0) goto L3d
        L3b:
            r1 = r8
            goto L5a
        L3d:
            int r3 = r1.length()
            r4 = r2
        L42:
            if (r2 >= r3) goto L56
            char r5 = r1.charAt(r2)
            int r5 = r5 + (-48)
            if (r5 < 0) goto L3b
            r6 = 10
            if (r5 >= r6) goto L3b
            int r4 = r4 * 10
            int r4 = r4 + r5
            int r2 = r2 + 1
            goto L42
        L56:
            java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
        L5a:
            if (r1 == 0) goto L16
            int r7 = r1.intValue()
            d65 r8 = new d65
            r8.<init>(r0, r7)
        L65:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.e65.a(y05, java.lang.String):d65");
    }
}
