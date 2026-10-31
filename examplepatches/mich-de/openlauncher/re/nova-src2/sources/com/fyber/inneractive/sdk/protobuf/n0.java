package com.fyber.inneractive.sdk.protobuf;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class n0 {

    /* renamed from: d, reason: collision with root package name */
    public static final n0 f30855d = new n0(0);

    /* renamed from: a, reason: collision with root package name */
    public final e3 f30856a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f30857b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f30858c;

    public n0() {
        int i5 = e3.f30788h;
        this.f30856a = new v2(16);
    }

    public static boolean b(Map.Entry entry) {
        w0 w0Var = (w0) entry.getKey();
        if (w0Var.f30934c.a() != k4.MESSAGE) {
            return true;
        }
        if (!w0Var.f30935d) {
            Object value = entry.getValue();
            if (value instanceof d2) {
                return ((d2) value).isInitialized();
            }
            throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
        }
        Iterator it = ((List) entry.getValue()).iterator();
        while (it.hasNext()) {
            if (!((d2) it.next()).isInitialized()) {
                return false;
            }
        }
        return true;
    }

    public final void a(n0 n0Var) {
        for (int i5 = 0; i5 < n0Var.f30856a.f30790b.size(); i5++) {
            c((Map.Entry) n0Var.f30856a.f30790b.get(i5));
        }
        Iterator it = n0Var.f30856a.b().iterator();
        while (it.hasNext()) {
            c((Map.Entry) it.next());
        }
    }

    public final boolean c() {
        for (int i5 = 0; i5 < this.f30856a.f30790b.size(); i5++) {
            if (!b((Map.Entry) this.f30856a.f30790b.get(i5))) {
                return false;
            }
        }
        Iterator it = this.f30856a.b().iterator();
        while (it.hasNext()) {
            if (!b((Map.Entry) it.next())) {
                return false;
            }
        }
        return true;
    }

    public final Iterator d() {
        return this.f30858c ? new o1(this.f30856a.entrySet().iterator()) : this.f30856a.entrySet().iterator();
    }

    public final void e() {
        if (this.f30857b) {
            return;
        }
        v2 v2Var = (v2) this.f30856a;
        if (!v2Var.f30792d) {
            for (int i5 = 0; i5 < v2Var.f30790b.size(); i5++) {
                Map.Entry entry = (Map.Entry) v2Var.f30790b.get(i5);
                if (((w0) entry.getKey()).f30935d) {
                    entry.setValue(Collections.unmodifiableList((List) entry.getValue()));
                }
            }
            for (Map.Entry entry2 : v2Var.b()) {
                if (((w0) entry2.getKey()).f30935d) {
                    entry2.setValue(Collections.unmodifiableList((List) entry2.getValue()));
                }
            }
        }
        if (!v2Var.f30792d) {
            v2Var.f30791c = v2Var.f30791c.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(v2Var.f30791c);
            v2Var.f30794f = v2Var.f30794f.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(v2Var.f30794f);
            v2Var.f30792d = true;
        }
        this.f30857b = true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof n0) {
            return this.f30856a.equals(((n0) obj).f30856a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f30856a.hashCode();
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public final n0 m149clone() {
        n0 n0Var = new n0();
        for (int i5 = 0; i5 < this.f30856a.f30790b.size(); i5++) {
            Map.Entry entry = (Map.Entry) this.f30856a.f30790b.get(i5);
            n0Var.c((w0) entry.getKey(), entry.getValue());
        }
        for (Map.Entry entry2 : this.f30856a.b()) {
            n0Var.c((w0) entry2.getKey(), entry2.getValue());
        }
        n0Var.f30858c = this.f30858c;
        return n0Var;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:16:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x002e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void d(w0 w0Var, Object obj) {
        boolean z11;
        j4 j4Var = w0Var.f30934c;
        Charset charset = l1.f30847a;
        obj.getClass();
        switch (m0.f30851a[j4Var.a().ordinal()]) {
            case 1:
                z11 = obj instanceof Integer;
                break;
            case 2:
                z11 = obj instanceof Long;
                break;
            case 3:
                z11 = obj instanceof Float;
                break;
            case 4:
                z11 = obj instanceof Double;
                break;
            case 5:
                z11 = obj instanceof Boolean;
                break;
            case 6:
                z11 = obj instanceof String;
                break;
            case 7:
                if (!(obj instanceof s) && !(obj instanceof byte[])) {
                    z11 = false;
                    break;
                } else {
                    z11 = true;
                    break;
                }
            case 8:
                if ((obj instanceof Integer) || (obj instanceof d1)) {
                }
                break;
            case 9:
                z11 = obj instanceof d2;
                break;
        }
        if (!z11) {
            throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(w0Var.f30933b), w0Var.f30934c.a(), obj.getClass().getName()));
        }
    }

    public n0(int i5) {
        int i11 = e3.f30788h;
        this.f30856a = new v2(0);
        e();
        e();
    }

    public final int a() {
        int iA = 0;
        for (int i5 = 0; i5 < this.f30856a.f30790b.size(); i5++) {
            iA += a((Map.Entry) this.f30856a.f30790b.get(i5));
        }
        Iterator it = this.f30856a.b().iterator();
        while (it.hasNext()) {
            iA += a((Map.Entry) it.next());
        }
        return iA;
    }

    public final void c(Map.Entry entry) {
        w0 w0Var = (w0) entry.getKey();
        Object value = entry.getValue();
        if (w0Var.f30935d) {
            Object arrayList = this.f30856a.get(w0Var);
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
            this.f30856a.a(w0Var, arrayList);
            return;
        }
        if (w0Var.f30934c.a() == k4.MESSAGE) {
            Object obj2 = this.f30856a.get(w0Var);
            if (obj2 == null) {
                e3 e3Var = this.f30856a;
                if (value instanceof byte[]) {
                    byte[] bArr3 = (byte[]) value;
                    byte[] bArr4 = new byte[bArr3.length];
                    System.arraycopy(bArr3, 0, bArr4, 0, bArr3.length);
                    value = bArr4;
                }
                e3Var.a(w0Var, value);
                return;
            }
            t0 t0Var = (t0) ((d2) obj2).toBuilder();
            t0Var.c();
            t0.a(t0Var.f30901b, (z0) ((d2) value));
            this.f30856a.a(w0Var, t0Var.a());
            return;
        }
        e3 e3Var2 = this.f30856a;
        if (value instanceof byte[]) {
            byte[] bArr5 = (byte[]) value;
            byte[] bArr6 = new byte[bArr5.length];
            System.arraycopy(bArr5, 0, bArr6, 0, bArr5.length);
            value = bArr6;
        }
        e3Var2.a(w0Var, value);
    }

    public final int b() {
        int iB = 0;
        for (int i5 = 0; i5 < this.f30856a.f30790b.size(); i5++) {
            Map.Entry entry = (Map.Entry) this.f30856a.f30790b.get(i5);
            iB += b((w0) entry.getKey(), entry.getValue());
        }
        for (Map.Entry entry2 : this.f30856a.b()) {
            iB += b((w0) entry2.getKey(), entry2.getValue());
        }
        return iB;
    }

    public static int a(Map.Entry entry) {
        w0 w0Var = (w0) entry.getKey();
        Object value = entry.getValue();
        if (w0Var.f30934c.a() == k4.MESSAGE && !w0Var.f30935d && !w0Var.f30936e) {
            int i5 = ((w0) entry.getKey()).f30933b;
            int iC = b0.c(i5) + b0.b(2) + (b0.b(1) * 2);
            int iB = b0.b(3);
            int serializedSize = ((d2) value).getSerializedSize();
            return l0.a(serializedSize, serializedSize, iB, iC);
        }
        return b(w0Var, value);
    }

    public static int b(w0 w0Var, Object obj) {
        int iB;
        int iA;
        j4 j4Var = w0Var.f30934c;
        int i5 = w0Var.f30933b;
        if (w0Var.f30935d) {
            int iA2 = 0;
            if (w0Var.f30936e) {
                Iterator it = ((List) obj).iterator();
                while (it.hasNext()) {
                    iA2 += a(j4Var, it.next());
                }
                iB = b0.b(i5) + iA2;
                iA = b0.c(iA2);
            } else {
                for (Object obj2 : (List) obj) {
                    int iB2 = b0.b(i5);
                    if (j4Var == j4.GROUP) {
                        iB2 *= 2;
                    }
                    iA2 += a(j4Var, obj2) + iB2;
                }
                return iA2;
            }
        } else {
            iB = b0.b(i5);
            if (j4Var == j4.GROUP) {
                iB *= 2;
            }
            iA = a(j4Var, obj);
        }
        return iA + iB;
    }

    public static int a(j4 j4Var, Object obj) {
        int serializedSize;
        int iC;
        switch (m0.f30852b[j4Var.ordinal()]) {
            case 1:
                ((Double) obj).getClass();
                Logger logger = b0.f30768b;
                return 8;
            case 2:
                ((Float) obj).getClass();
                Logger logger2 = b0.f30768b;
                return 4;
            case 3:
                return b0.a(((Long) obj).longValue());
            case 4:
                return b0.a(((Long) obj).longValue());
            case 5:
                int iIntValue = ((Integer) obj).intValue();
                if (iIntValue >= 0) {
                    return b0.c(iIntValue);
                }
                Logger logger3 = b0.f30768b;
                return 10;
            case 6:
                ((Long) obj).getClass();
                Logger logger4 = b0.f30768b;
                return 8;
            case 7:
                ((Integer) obj).getClass();
                Logger logger5 = b0.f30768b;
                return 4;
            case 8:
                ((Boolean) obj).getClass();
                Logger logger6 = b0.f30768b;
                return 1;
            case 9:
                Logger logger7 = b0.f30768b;
                return ((d2) obj).getSerializedSize();
            case 10:
                Logger logger8 = b0.f30768b;
                serializedSize = ((d2) obj).getSerializedSize();
                iC = b0.c(serializedSize);
                break;
            case 11:
                if (obj instanceof s) {
                    return b0.a((s) obj);
                }
                return b0.a((String) obj);
            case 12:
                if (obj instanceof s) {
                    return b0.a((s) obj);
                }
                Logger logger9 = b0.f30768b;
                serializedSize = ((byte[]) obj).length;
                iC = b0.c(serializedSize);
                break;
            case 13:
                return b0.c(((Integer) obj).intValue());
            case 14:
                ((Integer) obj).getClass();
                Logger logger10 = b0.f30768b;
                return 4;
            case 15:
                ((Long) obj).getClass();
                Logger logger11 = b0.f30768b;
                return 8;
            case 16:
                return b0.c(b0.d(((Integer) obj).intValue()));
            case 17:
                return b0.a(b0.b(((Long) obj).longValue()));
            case 18:
                if (obj instanceof d1) {
                    return b0.a(((d1) obj).a());
                }
                return b0.a(((Integer) obj).intValue());
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
        return iC + serializedSize;
    }

    public final void c(w0 w0Var, Object obj) {
        if (w0Var.f30935d) {
            if (obj instanceof List) {
                ArrayList arrayList = new ArrayList();
                arrayList.addAll((List) obj);
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    d(w0Var, it.next());
                }
                obj = arrayList;
            } else {
                throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
            }
        } else {
            d(w0Var, obj);
        }
        this.f30856a.a(w0Var, obj);
    }

    public final void a(w0 w0Var, Object obj) {
        List arrayList;
        if (w0Var.f30935d) {
            d(w0Var, obj);
            Object obj2 = this.f30856a.get(w0Var);
            if (obj2 == null) {
                arrayList = new ArrayList();
                this.f30856a.a(w0Var, arrayList);
            } else {
                arrayList = (List) obj2;
            }
            arrayList.add(obj);
            return;
        }
        throw new IllegalArgumentException("addRepeatedField() can only be called on repeated fields.");
    }
}
