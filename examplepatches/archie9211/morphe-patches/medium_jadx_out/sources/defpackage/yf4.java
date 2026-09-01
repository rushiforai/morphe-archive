package defpackage;

import com.google.protobuf.e;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yf4 {
    public final mgc a = new mgc(16);
    public boolean b;

    static {
        new yf4(0);
    }

    public yf4(int i) {
        b();
        b();
    }

    public static int a(j6f j6fVar, int i, Object obj) {
        int serializedSize;
        int iJ;
        int iH = aq1.h(i);
        if (j6fVar == j6f.GROUP) {
            iH *= 2;
        }
        int iK = 1;
        switch (vf4.b[j6fVar.ordinal()]) {
            case 1:
                ((Double) obj).getClass();
                Logger logger = aq1.b;
                iK = 8;
                break;
            case 2:
                ((Float) obj).getClass();
                Logger logger2 = aq1.b;
                iK = 4;
                break;
            case 3:
                iK = aq1.k(((Long) obj).longValue());
                break;
            case 4:
                iK = aq1.k(((Long) obj).longValue());
                break;
            case 5:
                iK = aq1.f(((Integer) obj).intValue());
                break;
            case 6:
                ((Long) obj).getClass();
                Logger logger3 = aq1.b;
                iK = 8;
                break;
            case 7:
                ((Integer) obj).getClass();
                Logger logger4 = aq1.b;
                iK = 4;
                break;
            case 8:
                ((Boolean) obj).getClass();
                Logger logger5 = aq1.b;
                break;
            case 9:
                Logger logger6 = aq1.b;
                iK = ((cz7) obj).getSerializedSize();
                break;
            case 10:
                Logger logger7 = aq1.b;
                serializedSize = ((cz7) obj).getSerializedSize();
                iJ = aq1.j(serializedSize);
                iK = iJ + serializedSize;
                break;
            case 11:
                if (!(obj instanceof f21)) {
                    iK = aq1.g((String) obj);
                } else {
                    Logger logger8 = aq1.b;
                    serializedSize = ((f21) obj).size();
                    iJ = aq1.j(serializedSize);
                    iK = iJ + serializedSize;
                }
                break;
            case 12:
                if (obj instanceof f21) {
                    Logger logger9 = aq1.b;
                    serializedSize = ((f21) obj).size();
                    iJ = aq1.j(serializedSize);
                } else {
                    Logger logger10 = aq1.b;
                    serializedSize = ((byte[]) obj).length;
                    iJ = aq1.j(serializedSize);
                }
                iK = iJ + serializedSize;
                break;
            case 13:
                iK = aq1.j(((Integer) obj).intValue());
                break;
            case 14:
                ((Integer) obj).getClass();
                Logger logger11 = aq1.b;
                iK = 4;
                break;
            case 15:
                ((Long) obj).getClass();
                Logger logger12 = aq1.b;
                iK = 8;
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                iK = aq1.j((iIntValue >> 31) ^ (iIntValue << 1));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                iK = aq1.k((jLongValue >> 63) ^ (jLongValue << 1));
                break;
            case 18:
                iK = aq1.f(((Integer) obj).intValue());
                break;
            default:
                ygf.i("There is no way to get here, but the compiler thinks otherwise.");
                iK = 0;
                break;
        }
        return iK + iH;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void d(defpackage.n75 r4, java.lang.Object r5) {
        /*
            j6f r0 = r4.b
            java.nio.charset.Charset r1 = defpackage.v56.a
            r5.getClass()
            int[] r1 = defpackage.vf4.a
            m6f r0 = r0.getJavaType()
            int r0 = r0.ordinal()
            r0 = r1[r0]
            r1 = 1
            r2 = 0
            switch(r0) {
                case 1: goto L3e;
                case 2: goto L3b;
                case 3: goto L38;
                case 4: goto L35;
                case 5: goto L32;
                case 6: goto L2f;
                case 7: goto L26;
                case 8: goto L21;
                case 9: goto L1a;
                default: goto L18;
            }
        L18:
            r0 = r2
            goto L40
        L1a:
            boolean r0 = r5 instanceof defpackage.cz7
            if (r0 != 0) goto L1f
            goto L18
        L1f:
            r0 = r1
            goto L40
        L21:
            boolean r0 = r5 instanceof java.lang.Integer
            if (r0 != 0) goto L1f
            goto L18
        L26:
            boolean r0 = r5 instanceof defpackage.f21
            if (r0 != 0) goto L1f
            boolean r0 = r5 instanceof byte[]
            if (r0 == 0) goto L18
            goto L1f
        L2f:
            boolean r0 = r5 instanceof java.lang.String
            goto L40
        L32:
            boolean r0 = r5 instanceof java.lang.Boolean
            goto L40
        L35:
            boolean r0 = r5 instanceof java.lang.Double
            goto L40
        L38:
            boolean r0 = r5 instanceof java.lang.Float
            goto L40
        L3b:
            boolean r0 = r5 instanceof java.lang.Long
            goto L40
        L3e:
            boolean r0 = r5 instanceof java.lang.Integer
        L40:
            if (r0 == 0) goto L43
            return
        L43:
            int r0 = r4.a
            java.lang.Integer r0 = java.lang.Integer.valueOf(r0)
            j6f r4 = r4.b
            m6f r4 = r4.getJavaType()
            java.lang.Class r5 = r5.getClass()
            java.lang.String r5 = r5.getName()
            r3 = 3
            java.lang.Object[] r3 = new java.lang.Object[r3]
            r3[r2] = r0
            r3[r1] = r4
            r4 = 2
            r3[r4] = r5
            java.lang.String r4 = "Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n"
            defpackage.fm3.e(r4, r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yf4.d(n75, java.lang.Object):void");
    }

    public static void e(aq1 aq1Var, j6f j6fVar, int i, Object obj) {
        if (j6fVar == j6f.GROUP) {
            aq1Var.C(i, 3);
            ((cz7) obj).writeTo(aq1Var);
            aq1Var.C(i, 4);
        }
        aq1Var.C(i, j6fVar.getWireType());
        switch (vf4.b[j6fVar.ordinal()]) {
            case 1:
                aq1Var.u(Double.doubleToRawLongBits(((Double) obj).doubleValue()));
                break;
            case 2:
                aq1Var.s(Float.floatToRawIntBits(((Float) obj).floatValue()));
                break;
            case 3:
                aq1Var.G(((Long) obj).longValue());
                break;
            case 4:
                aq1Var.G(((Long) obj).longValue());
                break;
            case 5:
                aq1Var.w(((Integer) obj).intValue());
                break;
            case 6:
                aq1Var.u(((Long) obj).longValue());
                break;
            case 7:
                aq1Var.s(((Integer) obj).intValue());
                break;
            case 8:
                aq1Var.m(((Boolean) obj).booleanValue() ? (byte) 1 : (byte) 0);
                break;
            case 9:
                ((cz7) obj).writeTo(aq1Var);
                break;
            case 10:
                aq1Var.z((cz7) obj);
                break;
            case 11:
                if (!(obj instanceof f21)) {
                    aq1Var.B((String) obj);
                } else {
                    aq1Var.q((f21) obj);
                }
                break;
            case 12:
                if (!(obj instanceof f21)) {
                    byte[] bArr = (byte[]) obj;
                    aq1Var.o(bArr.length, bArr);
                } else {
                    aq1Var.q((f21) obj);
                }
                break;
            case 13:
                aq1Var.E(((Integer) obj).intValue());
                break;
            case 14:
                aq1Var.s(((Integer) obj).intValue());
                break;
            case 15:
                aq1Var.u(((Long) obj).longValue());
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                aq1Var.E((iIntValue >> 31) ^ (iIntValue << 1));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                aq1Var.G((jLongValue >> 63) ^ (jLongValue << 1));
                break;
            case 18:
                aq1Var.w(((Integer) obj).intValue());
                break;
        }
    }

    public final void b() {
        mgc mgcVar;
        if (this.b) {
            return;
        }
        int i = 0;
        while (true) {
            mgcVar = this.a;
            if (i >= mgcVar.b.size()) {
                break;
            }
            Map.Entry entryC = mgcVar.c(i);
            if (entryC.getValue() instanceof e) {
                ((e) entryC.getValue()).makeImmutable();
            }
            i++;
        }
        if (!mgcVar.d) {
            for (int i2 = 0; i2 < mgcVar.b.size(); i2++) {
                Map.Entry entryC2 = mgcVar.c(i2);
                if (((n75) entryC2.getKey()).c) {
                    entryC2.setValue(DesugarCollections.unmodifiableList((List) entryC2.getValue()));
                }
            }
            for (Map.Entry entry : mgcVar.d()) {
                if (((n75) entry.getKey()).c) {
                    entry.setValue(DesugarCollections.unmodifiableList((List) entry.getValue()));
                }
            }
        }
        if (!mgcVar.d) {
            mgcVar.c = mgcVar.c.isEmpty() ? Collections.EMPTY_MAP : DesugarCollections.unmodifiableMap(mgcVar.c);
            mgcVar.f = mgcVar.f.isEmpty() ? Collections.EMPTY_MAP : DesugarCollections.unmodifiableMap(mgcVar.f);
            mgcVar.d = true;
        }
        this.b = true;
    }

    public final void c(n75 n75Var, Object obj) {
        if (!n75Var.c) {
            d(n75Var, obj);
        } else {
            if (!(obj instanceof List)) {
                ay0.e("Wrong object type used with protocol message reflection.");
                return;
            }
            ArrayList arrayList = new ArrayList();
            arrayList.addAll((List) obj);
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                d(n75Var, it2.next());
            }
            obj = arrayList;
        }
        this.a.put(n75Var, obj);
    }

    public final Object clone() {
        mgc mgcVar;
        yf4 yf4Var = new yf4();
        int i = 0;
        while (true) {
            mgcVar = this.a;
            if (i >= mgcVar.b.size()) {
                break;
            }
            Map.Entry entryC = mgcVar.c(i);
            yf4Var.c((n75) entryC.getKey(), entryC.getValue());
            i++;
        }
        for (Map.Entry entry : mgcVar.d()) {
            yf4Var.c((n75) entry.getKey(), entry.getValue());
        }
        return yf4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof yf4) {
            return this.a.equals(((yf4) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public yf4() {
    }
}
