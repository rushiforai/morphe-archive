package defpackage;

import j$.util.DesugarCollections;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zf4 {
    public static final zf4 c = new zf4(0);
    public final ngc a = new ngc(16);
    public boolean b;

    public zf4(int i) {
        f();
    }

    public static int c(k6f k6fVar, Object obj) {
        switch (wf4.b[k6fVar.ordinal()]) {
            case 1:
                ((Double) obj).getClass();
                return 8;
            case 2:
                ((Float) obj).getClass();
                return 4;
            case 3:
                return h30.i(((Long) obj).longValue());
            case 4:
                return h30.i(((Long) obj).longValue());
            case 5:
                return h30.e(((Integer) obj).intValue());
            case 6:
                ((Long) obj).getClass();
                return 8;
            case 7:
                ((Integer) obj).getClass();
                return 4;
            case 8:
                ((Boolean) obj).getClass();
                return 1;
            case 9:
                try {
                    byte[] bytes = ((String) obj).getBytes("UTF-8");
                    return h30.h(bytes.length) + bytes.length;
                } catch (UnsupportedEncodingException e) {
                    lg8.p("UTF-8 not supported.", e);
                    return 0;
                }
            case 10:
                if (obj instanceof g21) {
                    g21 g21Var = (g21) obj;
                    return g21Var.size() + h30.h(g21Var.size());
                }
                byte[] bArr = (byte[]) obj;
                return h30.h(bArr.length) + bArr.length;
            case 11:
                return h30.h(((Integer) obj).intValue());
            case 12:
                ((Integer) obj).getClass();
                return 4;
            case 13:
                ((Long) obj).getClass();
                return 8;
            case 14:
                int iIntValue = ((Integer) obj).intValue();
                return h30.h((iIntValue >> 31) ^ (iIntValue << 1));
            case 15:
                long jLongValue = ((Long) obj).longValue();
                return h30.i((jLongValue >> 63) ^ (jLongValue << 1));
            case 16:
                return ((q1) obj).a();
            case 17:
                return h30.g((q1) obj);
            case 18:
                return obj instanceof o56 ? h30.e(((o56) obj).getNumber()) : h30.e(((Integer) obj).intValue());
            default:
                ygf.i("There is no way to get here, but the compiler thinks otherwise.");
                return 0;
        }
    }

    public static int d(m75 m75Var, Object obj) {
        k6f k6fVar = m75Var.b;
        int i = m75Var.a;
        if (!m75Var.c) {
            int iJ = h30.j(i);
            if (k6fVar == k6f.GROUP) {
                iJ *= 2;
            }
            return c(k6fVar, obj) + iJ;
        }
        int iC = 0;
        for (Object obj2 : (List) obj) {
            int iJ2 = h30.j(i);
            if (k6fVar == k6f.GROUP) {
                iJ2 *= 2;
            }
            iC += c(k6fVar, obj2) + iJ2;
        }
        return iC;
    }

    public static boolean e(Map.Entry entry) {
        m75 m75Var = (m75) entry.getKey();
        if (m75Var.b.getJavaType() != n6f.MESSAGE) {
            return true;
        }
        if (m75Var.c) {
            Iterator it2 = ((List) entry.getValue()).iterator();
            while (it2.hasNext()) {
                if (!((q1) it2.next()).isInitialized()) {
                }
            }
            return true;
        }
        Object value = entry.getValue();
        if (!(value instanceof q1)) {
            ay0.e("Wrong object type used with protocol message reflection.");
            return false;
        }
        if (((q1) value).isInitialized()) {
            return true;
        }
        return false;
    }

    public static Object h(tp1 tp1Var, k6f k6fVar) {
        switch (wf4.b[k6fVar.ordinal()]) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;
            case 8:
                break;
            case 9:
                int iJ = tp1Var.j();
                int i = tp1Var.b;
                int i2 = tp1Var.d;
                if (iJ <= i - i2 && iJ > 0) {
                    String str = new String(tp1Var.a, i2, iJ, "UTF-8");
                    tp1Var.d += iJ;
                    break;
                } else if (iJ != 0) {
                    break;
                }
                break;
            case 10:
                break;
            case 11:
                break;
            case 12:
                break;
            case 13:
                break;
            case 14:
                int iJ2 = tp1Var.j();
                break;
            case 15:
                long jK = tp1Var.k();
                break;
            case 16:
                ay0.e("readPrimitiveField() cannot handle nested groups.");
                break;
            case 17:
                ay0.e("readPrimitiveField() cannot handle embedded messages.");
                break;
            case 18:
                ay0.e("readPrimitiveField() cannot handle enums.");
                break;
            default:
                ygf.i("There is no way to get here, but the compiler thinks otherwise.");
                break;
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void j(defpackage.k6f r2, java.lang.Object r3) {
        /*
            r3.getClass()
            int[] r0 = defpackage.wf4.a
            n6f r2 = r2.getJavaType()
            int r2 = r2.ordinal()
            r2 = r0[r2]
            r0 = 1
            r1 = 0
            switch(r2) {
                case 1: goto L3c;
                case 2: goto L39;
                case 3: goto L36;
                case 4: goto L33;
                case 5: goto L30;
                case 6: goto L2d;
                case 7: goto L24;
                case 8: goto L18;
                case 9: goto L15;
                default: goto L14;
            }
        L14:
            goto L3e
        L15:
            boolean r1 = r3 instanceof defpackage.q1
            goto L3e
        L18:
            boolean r2 = r3 instanceof java.lang.Integer
            if (r2 != 0) goto L22
            boolean r2 = r3 instanceof defpackage.o56
            if (r2 == 0) goto L21
            goto L22
        L21:
            r0 = r1
        L22:
            r1 = r0
            goto L3e
        L24:
            boolean r2 = r3 instanceof defpackage.g21
            if (r2 != 0) goto L22
            boolean r2 = r3 instanceof byte[]
            if (r2 == 0) goto L21
            goto L22
        L2d:
            boolean r1 = r3 instanceof java.lang.String
            goto L3e
        L30:
            boolean r1 = r3 instanceof java.lang.Boolean
            goto L3e
        L33:
            boolean r1 = r3 instanceof java.lang.Double
            goto L3e
        L36:
            boolean r1 = r3 instanceof java.lang.Float
            goto L3e
        L39:
            boolean r1 = r3 instanceof java.lang.Long
            goto L3e
        L3c:
            boolean r1 = r3 instanceof java.lang.Integer
        L3e:
            if (r1 == 0) goto L41
            return
        L41:
            java.lang.String r2 = "Wrong object type used with protocol message reflection."
            defpackage.ay0.e(r2)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zf4.j(k6f, java.lang.Object):void");
    }

    public static void k(h30 h30Var, k6f k6fVar, Object obj) {
        switch (wf4.b[k6fVar.ordinal()]) {
            case 1:
                double dDoubleValue = ((Double) obj).doubleValue();
                h30Var.getClass();
                h30Var.K(Double.doubleToRawLongBits(dDoubleValue));
                break;
            case 2:
                float fFloatValue = ((Float) obj).floatValue();
                h30Var.getClass();
                h30Var.J(Float.floatToRawIntBits(fFloatValue));
                break;
            case 3:
                h30Var.M(((Long) obj).longValue());
                break;
            case 4:
                h30Var.M(((Long) obj).longValue());
                break;
            case 5:
                h30Var.D(((Integer) obj).intValue());
                break;
            case 6:
                h30Var.K(((Long) obj).longValue());
                break;
            case 7:
                h30Var.J(((Integer) obj).intValue());
                break;
            case 8:
                h30Var.G(((Boolean) obj).booleanValue() ? 1 : 0);
                break;
            case 9:
                h30Var.getClass();
                byte[] bytes = ((String) obj).getBytes("UTF-8");
                h30Var.L(bytes.length);
                h30Var.I(bytes);
                break;
            case 10:
                if (!(obj instanceof g21)) {
                    byte[] bArr = (byte[]) obj;
                    h30Var.getClass();
                    h30Var.L(bArr.length);
                    h30Var.I(bArr);
                } else {
                    g21 g21Var = (g21) obj;
                    h30Var.getClass();
                    h30Var.L(g21Var.size());
                    h30Var.H(g21Var);
                }
                break;
            case 11:
                h30Var.L(((Integer) obj).intValue());
                break;
            case 12:
                h30Var.J(((Integer) obj).intValue());
                break;
            case 13:
                h30Var.K(((Long) obj).longValue());
                break;
            case 14:
                int iIntValue = ((Integer) obj).intValue();
                h30Var.L((iIntValue >> 31) ^ (iIntValue << 1));
                break;
            case 15:
                long jLongValue = ((Long) obj).longValue();
                h30Var.M((jLongValue >> 63) ^ (jLongValue << 1));
                break;
            case 16:
                h30Var.getClass();
                ((q1) obj).d(h30Var);
                break;
            case 17:
                h30Var.F((q1) obj);
                break;
            case 18:
                if (!(obj instanceof o56)) {
                    h30Var.D(((Integer) obj).intValue());
                } else {
                    h30Var.D(((o56) obj).getNumber());
                }
                break;
        }
    }

    public final void a(m75 m75Var, Object obj) {
        List arrayList;
        if (!m75Var.c) {
            ay0.e("addRepeatedField() can only be called on repeated fields.");
            return;
        }
        j(m75Var.b, obj);
        ngc ngcVar = this.a;
        Object obj2 = ngcVar.get(m75Var);
        if (obj2 == null) {
            arrayList = new ArrayList();
            ngcVar.put(m75Var, arrayList);
        } else {
            arrayList = (List) obj2;
        }
        arrayList.add(obj);
    }

    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public final zf4 clone() {
        ngc ngcVar;
        zf4 zf4Var = new zf4();
        int i = 0;
        while (true) {
            ngcVar = this.a;
            if (i >= ngcVar.b.size()) {
                break;
            }
            Map.Entry entry = (Map.Entry) ngcVar.b.get(i);
            zf4Var.i((m75) entry.getKey(), entry.getValue());
            i++;
        }
        for (Map.Entry entry2 : ngcVar.c()) {
            zf4Var.i((m75) entry2.getKey(), entry2.getValue());
        }
        return zf4Var;
    }

    public final void f() {
        if (this.b) {
            return;
        }
        ngc ngcVar = this.a;
        if (!ngcVar.d) {
            for (int i = 0; i < ngcVar.b.size(); i++) {
                Map.Entry entry = (Map.Entry) ngcVar.b.get(i);
                if (((m75) entry.getKey()).c) {
                    entry.setValue(DesugarCollections.unmodifiableList((List) entry.getValue()));
                }
            }
            for (Map.Entry entry2 : ngcVar.c()) {
                if (((m75) entry2.getKey()).c) {
                    entry2.setValue(DesugarCollections.unmodifiableList((List) entry2.getValue()));
                }
            }
        }
        if (!ngcVar.d) {
            ngcVar.c = ngcVar.c.isEmpty() ? Collections.EMPTY_MAP : DesugarCollections.unmodifiableMap(ngcVar.c);
            ngcVar.d = true;
        }
        this.b = true;
    }

    public final void g(Map.Entry entry) {
        m75 m75Var = (m75) entry.getKey();
        Object value = entry.getValue();
        boolean z = m75Var.c;
        ngc ngcVar = this.a;
        if (z) {
            Object arrayList = ngcVar.get(m75Var);
            if (arrayList == null) {
                arrayList = new ArrayList();
            }
            for (Object obj : (List) value) {
                List list = (List) arrayList;
                if (obj instanceof byte[]) {
                    byte[] bArr = (byte[]) obj;
                    byte[] bArr2 = new byte[bArr.length];
                    System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
                    obj = bArr2;
                }
                list.add(obj);
            }
            ngcVar.put(m75Var, arrayList);
            return;
        }
        if (m75Var.b.getJavaType() != n6f.MESSAGE) {
            if (value instanceof byte[]) {
                byte[] bArr3 = (byte[]) value;
                byte[] bArr4 = new byte[bArr3.length];
                System.arraycopy(bArr3, 0, bArr4, 0, bArr3.length);
                value = bArr4;
            }
            ngcVar.put(m75Var, value);
            return;
        }
        Object obj2 = ngcVar.get(m75Var);
        if (obj2 != null) {
            ngcVar.put(m75Var, ((q1) obj2).c().c((s75) ((q1) value)).a());
            return;
        }
        if (value instanceof byte[]) {
            byte[] bArr5 = (byte[]) value;
            byte[] bArr6 = new byte[bArr5.length];
            System.arraycopy(bArr5, 0, bArr6, 0, bArr5.length);
            value = bArr6;
        }
        ngcVar.put(m75Var, value);
    }

    public final void i(m75 m75Var, Object obj) {
        boolean z = m75Var.c;
        k6f k6fVar = m75Var.b;
        if (!z) {
            j(k6fVar, obj);
        } else {
            if (!(obj instanceof List)) {
                ay0.e("Wrong object type used with protocol message reflection.");
                return;
            }
            ArrayList arrayList = new ArrayList();
            arrayList.addAll((List) obj);
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                j(k6fVar, it2.next());
            }
            obj = arrayList;
        }
        this.a.put(m75Var, obj);
    }

    public zf4() {
    }
}
