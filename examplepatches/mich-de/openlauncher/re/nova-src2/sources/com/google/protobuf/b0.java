package com.google.protobuf;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class b0 {

    /* renamed from: c, reason: collision with root package name */
    public static final b0 f34810c = new b0(0);

    /* renamed from: a, reason: collision with root package name */
    public final d2 f34811a = d2.f();

    /* renamed from: b, reason: collision with root package name */
    public boolean f34812b;

    public b0() {
    }

    public static int c(t2 t2Var, int i5, Object obj) {
        int iG = t.G(i5);
        if (t2Var == t2.f34974d) {
            iG *= 2;
        }
        return d(t2Var, obj) + iG;
    }

    public static int d(t2 t2Var, Object obj) {
        int size;
        int iH;
        switch (t2Var.ordinal()) {
            case 0:
                ((Double) obj).getClass();
                Logger logger = t.f34970b;
                return 8;
            case 1:
                ((Float) obj).getClass();
                Logger logger2 = t.f34970b;
                return 4;
            case 2:
                return t.I(((Long) obj).longValue());
            case 3:
                return t.I(((Long) obj).longValue());
            case 4:
                return t.I(((Integer) obj).intValue());
            case 5:
                ((Long) obj).getClass();
                Logger logger3 = t.f34970b;
                return 8;
            case 6:
                ((Integer) obj).getClass();
                Logger logger4 = t.f34970b;
                return 4;
            case 7:
                ((Boolean) obj).getClass();
                Logger logger5 = t.f34970b;
                return 1;
            case 8:
                if (!(obj instanceof l)) {
                    return t.F((String) obj);
                }
                Logger logger6 = t.f34970b;
                size = ((l) obj).size();
                iH = t.H(size);
                break;
            case 9:
                Logger logger7 = t.f34970b;
                return ((o1) obj).getSerializedSize();
            case 10:
                Logger logger8 = t.f34970b;
                size = ((o1) obj).getSerializedSize();
                iH = t.H(size);
                break;
            case 11:
                if (!(obj instanceof l)) {
                    Logger logger9 = t.f34970b;
                    size = ((byte[]) obj).length;
                    iH = t.H(size);
                    break;
                } else {
                    Logger logger10 = t.f34970b;
                    size = ((l) obj).size();
                    iH = t.H(size);
                    break;
                }
            case 12:
                return t.H(((Integer) obj).intValue());
            case 13:
                return obj instanceof r0 ? t.I(((r0) obj).getNumber()) : t.I(((Integer) obj).intValue());
            case 14:
                ((Integer) obj).getClass();
                Logger logger11 = t.f34970b;
                return 4;
            case 15:
                ((Long) obj).getClass();
                Logger logger12 = t.f34970b;
                return 8;
            case 16:
                return t.D(((Integer) obj).intValue());
            case 17:
                return t.E(((Long) obj).longValue());
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
        return iH + size;
    }

    public static int e(k0 k0Var, Object obj) {
        t2 t2Var = k0Var.f34881c;
        int i5 = k0Var.f34880b;
        if (!k0Var.f34882d) {
            return c(t2Var, i5, obj);
        }
        List list = (List) obj;
        int size = list.size();
        int i11 = 0;
        if (!k0Var.f34883e) {
            int iC = 0;
            while (i11 < size) {
                iC += c(t2Var, i5, list.get(i11));
                i11++;
            }
            return iC;
        }
        if (list.isEmpty()) {
            return 0;
        }
        int iD = 0;
        while (i11 < size) {
            iD += d(t2Var, list.get(i11));
            i11++;
        }
        return t.H(iD) + t.G(i5) + iD;
    }

    public static b0 f() {
        return f34810c;
    }

    public static int i(Map.Entry entry) {
        k0 k0Var = (k0) entry.getKey();
        Object value = entry.getValue();
        if (k0Var.f34881c.f34978a != u2.MESSAGE || k0Var.f34882d || k0Var.f34883e) {
            return e(k0Var, value);
        }
        int i5 = ((k0) entry.getKey()).f34880b;
        int iH = t.H(i5) + t.G(2) + (t.G(1) * 2);
        int iG = t.G(3);
        int serializedSize = ((o1) value).getSerializedSize();
        return a2.c.B(serializedSize, serializedSize, iG, iH);
    }

    public static int m(t2 t2Var, boolean z11) {
        if (z11) {
            return 2;
        }
        return t2Var.f34979b;
    }

    public static boolean r(Map.Entry entry) {
        k0 k0Var = (k0) entry.getKey();
        if (k0Var.f34881c.f34978a != u2.MESSAGE) {
            return true;
        }
        if (!k0Var.f34882d) {
            Object value = entry.getValue();
            if (value instanceof p1) {
                return ((p1) value).isInitialized();
            }
            throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
        }
        List list = (List) entry.getValue();
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            Object obj = list.get(i5);
            if (!(obj instanceof p1)) {
                throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
            }
            if (!((p1) obj).isInitialized()) {
                return false;
            }
        }
        return true;
    }

    public static Object w(p pVar, t2 t2Var) {
        switch (t2Var.ordinal()) {
            case 0:
                return Double.valueOf(pVar.n());
            case 1:
                return Float.valueOf(pVar.r());
            case 2:
                return Long.valueOf(pVar.u());
            case 3:
                return Long.valueOf(pVar.G());
            case 4:
                return Integer.valueOf(pVar.t());
            case 5:
                return Long.valueOf(pVar.q());
            case 6:
                return Integer.valueOf(pVar.p());
            case 7:
                return Boolean.valueOf(pVar.l());
            case 8:
                return com.google.android.gms.internal.measurement.k2.a(1, pVar);
            case 9:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle nested groups.");
            case 10:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle embedded messages.");
            case 11:
                return pVar.m();
            case 12:
                return Integer.valueOf(pVar.F());
            case 13:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle enums.");
            case 14:
                return Integer.valueOf(pVar.y());
            case 15:
                return Long.valueOf(pVar.z());
            case 16:
                return Integer.valueOf(pVar.A());
            case 17:
                return Long.valueOf(pVar.B());
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0012  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void y(k0 k0Var, Object obj) {
        t2 t2Var = k0Var.f34881c;
        Charset charset = a1.f34808a;
        obj.getClass();
        boolean z11 = true;
        switch (t2Var.f34978a) {
            case INT:
                z11 = obj instanceof Integer;
                break;
            case LONG:
                z11 = obj instanceof Long;
                break;
            case FLOAT:
                z11 = obj instanceof Float;
                break;
            case DOUBLE:
                z11 = obj instanceof Double;
                break;
            case BOOLEAN:
                z11 = obj instanceof Boolean;
                break;
            case STRING:
                z11 = obj instanceof String;
                break;
            case BYTE_STRING:
                if (!(obj instanceof l) && !(obj instanceof byte[])) {
                    z11 = false;
                    break;
                }
                break;
            case ENUM:
                if (!(obj instanceof Integer) && !(obj instanceof r0)) {
                }
                break;
            case MESSAGE:
                if (!(obj instanceof o1)) {
                }
                break;
        }
        if (!z11) {
            throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(k0Var.f34880b), k0Var.f34881c.f34978a, obj.getClass().getName()));
        }
    }

    public static void z(t tVar, t2 t2Var, int i5, Object obj) {
        if (t2Var == t2.f34974d) {
            tVar.b0(i5, 3);
            ((o1) obj).writeTo(tVar);
            tVar.b0(i5, 4);
        }
        tVar.b0(i5, t2Var.f34979b);
        switch (t2Var.ordinal()) {
            case 0:
                tVar.S(Double.doubleToRawLongBits(((Double) obj).doubleValue()));
                break;
            case 1:
                tVar.Q(Float.floatToRawIntBits(((Float) obj).floatValue()));
                break;
            case 2:
                tVar.f0(((Long) obj).longValue());
                break;
            case 3:
                tVar.f0(((Long) obj).longValue());
                break;
            case 4:
                tVar.U(((Integer) obj).intValue());
                break;
            case 5:
                tVar.S(((Long) obj).longValue());
                break;
            case 6:
                tVar.Q(((Integer) obj).intValue());
                break;
            case 7:
                tVar.K(((Boolean) obj).booleanValue() ? (byte) 1 : (byte) 0);
                break;
            case 8:
                if (!(obj instanceof l)) {
                    tVar.a0((String) obj);
                    break;
                } else {
                    tVar.O((l) obj);
                    break;
                }
            case 9:
                ((o1) obj).writeTo(tVar);
                break;
            case 10:
                tVar.W((o1) obj);
                break;
            case 11:
                if (!(obj instanceof l)) {
                    byte[] bArr = (byte[]) obj;
                    tVar.M(bArr.length, bArr);
                    break;
                } else {
                    tVar.O((l) obj);
                    break;
                }
            case 12:
                tVar.d0(((Integer) obj).intValue());
                break;
            case 13:
                if (!(obj instanceof r0)) {
                    tVar.U(((Integer) obj).intValue());
                    break;
                } else {
                    tVar.U(((r0) obj).getNumber());
                    break;
                }
            case 14:
                tVar.Q(((Integer) obj).intValue());
                break;
            case 15:
                tVar.S(((Long) obj).longValue());
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                tVar.d0((iIntValue >> 31) ^ (iIntValue << 1));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                tVar.f0((jLongValue >> 63) ^ (jLongValue << 1));
                break;
        }
    }

    public final void a(k0 k0Var, Object obj) {
        List arrayList;
        if (!k0Var.f34882d) {
            throw new IllegalArgumentException("addRepeatedField() can only be called on repeated fields.");
        }
        y(k0Var, obj);
        d2 d2Var = this.f34811a;
        Object obj2 = d2Var.get(k0Var);
        if (obj2 == null) {
            arrayList = new ArrayList();
            d2Var.put(k0Var, arrayList);
        } else {
            arrayList = (List) obj2;
        }
        arrayList.add(obj);
    }

    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final b0 clone() {
        b0 b0Var = new b0();
        d2 d2Var = this.f34811a;
        int size = d2Var.f34839a.size();
        for (int i5 = 0; i5 < size; i5++) {
            Map.Entry entryC = d2Var.c(i5);
            b0Var.x((k0) entryC.getKey(), entryC.getValue());
        }
        for (Map.Entry entry : d2Var.d()) {
            b0Var.x((k0) entry.getKey(), entry.getValue());
        }
        return b0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof b0) {
            return this.f34811a.equals(((b0) obj).f34811a);
        }
        return false;
    }

    public final Object g(k0 k0Var) {
        return this.f34811a.get(k0Var);
    }

    public final int h() {
        d2 d2Var = this.f34811a;
        int size = d2Var.f34839a.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            i5 += i(d2Var.c(i11));
        }
        Iterator it = d2Var.d().iterator();
        while (it.hasNext()) {
            i5 += i((Map.Entry) it.next());
        }
        return i5;
    }

    public final int hashCode() {
        return this.f34811a.hashCode();
    }

    public final Object j(k0 k0Var, int i5) {
        if (!k0Var.f34882d) {
            throw new IllegalArgumentException("getRepeatedField() can only be called on repeated fields.");
        }
        Object obj = this.f34811a.get(k0Var);
        if (obj != null) {
            return ((List) obj).get(i5);
        }
        throw new IndexOutOfBoundsException();
    }

    public final int k(k0 k0Var) {
        if (!k0Var.f34882d) {
            throw new IllegalArgumentException("getRepeatedField() can only be called on repeated fields.");
        }
        Object obj = this.f34811a.get(k0Var);
        if (obj == null) {
            return 0;
        }
        return ((List) obj).size();
    }

    public final int l() {
        d2 d2Var = this.f34811a;
        int size = d2Var.f34839a.size();
        int iE = 0;
        for (int i5 = 0; i5 < size; i5++) {
            Map.Entry entryC = d2Var.c(i5);
            iE += e((k0) entryC.getKey(), entryC.getValue());
        }
        for (Map.Entry entry : d2Var.d()) {
            iE += e((k0) entry.getKey(), entry.getValue());
        }
        return iE;
    }

    public final boolean n(k0 k0Var) {
        if (k0Var.f34882d) {
            throw new IllegalArgumentException("hasField() can only be called on non-repeated fields.");
        }
        return this.f34811a.get(k0Var) != null;
    }

    public final boolean o() {
        return this.f34811a.isEmpty();
    }

    public final boolean p() {
        return this.f34812b;
    }

    public final boolean q() {
        d2 d2Var = this.f34811a;
        int size = d2Var.f34839a.size();
        int i5 = 0;
        while (true) {
            if (i5 >= size) {
                Iterator it = d2Var.d().iterator();
                while (it.hasNext()) {
                    if (!r((Map.Entry) it.next())) {
                    }
                }
                return true;
            }
            if (!r(d2Var.c(i5))) {
                break;
            }
            i5++;
        }
        return false;
    }

    public final Iterator s() {
        d2 d2Var = this.f34811a;
        return d2Var.isEmpty() ? Collections.emptyIterator() : ((androidx.datastore.preferences.protobuf.e1) d2Var.entrySet()).iterator();
    }

    public final void t() {
        if (this.f34812b) {
            return;
        }
        d2 d2Var = this.f34811a;
        int size = d2Var.f34839a.size();
        for (int i5 = 0; i5 < size; i5++) {
            Map.Entry entryC = d2Var.c(i5);
            if (entryC.getValue() instanceof n0) {
                ((n0) entryC.getValue()).makeImmutable();
            }
        }
        if (!d2Var.f34841c) {
            for (int i11 = 0; i11 < d2Var.f34839a.size(); i11++) {
                Map.Entry entryC2 = d2Var.c(i11);
                if (((k0) entryC2.getKey()).f34882d) {
                    entryC2.setValue(Collections.unmodifiableList((List) entryC2.getValue()));
                }
            }
            for (Map.Entry entry : d2Var.d()) {
                if (((k0) entry.getKey()).f34882d) {
                    entry.setValue(Collections.unmodifiableList((List) entry.getValue()));
                }
            }
        }
        if (!d2Var.f34841c) {
            d2Var.f34840b = d2Var.f34840b.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(d2Var.f34840b);
            d2Var.f34843e = d2Var.f34843e.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(d2Var.f34843e);
            d2Var.f34841c = true;
        }
        this.f34812b = true;
    }

    public final void u(b0 b0Var) {
        d2 d2Var = b0Var.f34811a;
        int size = d2Var.f34839a.size();
        for (int i5 = 0; i5 < size; i5++) {
            v(d2Var.c(i5));
        }
        Iterator it = d2Var.d().iterator();
        while (it.hasNext()) {
            v((Map.Entry) it.next());
        }
    }

    public final void v(Map.Entry entry) {
        k0 k0Var = (k0) entry.getKey();
        Object value = entry.getValue();
        boolean z11 = k0Var.f34882d;
        d2 d2Var = this.f34811a;
        if (z11) {
            Object arrayList = d2Var.get(k0Var);
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
            d2Var.put(k0Var, arrayList);
            return;
        }
        if (k0Var.f34881c.f34978a != u2.MESSAGE) {
            if (value instanceof byte[]) {
                byte[] bArr3 = (byte[]) value;
                byte[] bArr4 = new byte[bArr3.length];
                System.arraycopy(bArr3, 0, bArr4, 0, bArr3.length);
                value = bArr4;
            }
            d2Var.put(k0Var, value);
            return;
        }
        Object obj2 = d2Var.get(k0Var);
        if (obj2 != null) {
            d2Var.put(k0Var, ((f0) ((o1) obj2).toBuilder()).mergeFrom((n0) ((o1) value)).build());
            return;
        }
        if (value instanceof byte[]) {
            byte[] bArr5 = (byte[]) value;
            byte[] bArr6 = new byte[bArr5.length];
            System.arraycopy(bArr5, 0, bArr6, 0, bArr5.length);
            value = bArr6;
        }
        d2Var.put(k0Var, value);
    }

    public final void x(k0 k0Var, Object obj) {
        if (!k0Var.f34882d) {
            y(k0Var, obj);
        } else {
            if (!(obj instanceof List)) {
                throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
            }
            ArrayList arrayList = new ArrayList();
            arrayList.addAll((List) obj);
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                y(k0Var, it.next());
            }
            obj = arrayList;
        }
        this.f34811a.put(k0Var, obj);
    }

    public b0(int i5) {
        t();
        t();
    }
}
