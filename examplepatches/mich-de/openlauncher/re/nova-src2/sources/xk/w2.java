package xk;

import java.util.Arrays;
import java.util.Objects;

/* loaded from: classes.dex */
public final class w2 extends x0 {

    /* renamed from: g, reason: collision with root package name */
    public static final w2 f96042g = new w2(null, new Object[0], 0);

    /* renamed from: d, reason: collision with root package name */
    public final transient Object f96043d;

    /* renamed from: e, reason: collision with root package name */
    public final transient Object[] f96044e;

    /* renamed from: f, reason: collision with root package name */
    public final transient int f96045f;

    public w2(Object obj, Object[] objArr, int i5) {
        this.f96043d = obj;
        this.f96044e = objArr;
        this.f96045f = i5;
    }

    public static w2 k(int i5, Object[] objArr, c30.c cVar) {
        if (i5 == 0) {
            return f96042g;
        }
        if (i5 == 1) {
            Objects.requireNonNull(objArr[0]);
            Objects.requireNonNull(objArr[1]);
            return new w2(null, objArr, 1);
        }
        vk.b0.h(i5, objArr.length >> 1);
        Object objL = l(objArr, i5, d1.k(i5), 0);
        if (objL instanceof Object[]) {
            Object[] objArr2 = (Object[]) objL;
            w0 w0Var = (w0) objArr2[2];
            if (cVar == null) {
                throw w0Var.a();
            }
            cVar.f19534d = w0Var;
            Object obj = objArr2[0];
            int iIntValue = ((Integer) objArr2[1]).intValue();
            objArr = Arrays.copyOf(objArr, iIntValue * 2);
            objL = obj;
            i5 = iIntValue;
        }
        return new w2(objL, objArr, i5);
    }

    public static Object l(Object[] objArr, int i5, int i11, int i12) {
        w0 w0Var = null;
        if (i5 == 1) {
            Objects.requireNonNull(objArr[i12]);
            Objects.requireNonNull(objArr[i12 ^ 1]);
            return null;
        }
        int i13 = i11 - 1;
        int i14 = 0;
        if (i11 <= 128) {
            byte[] bArr = new byte[i11];
            Arrays.fill(bArr, (byte) -1);
            int i15 = 0;
            while (i14 < i5) {
                int i16 = (i14 * 2) + i12;
                int i17 = (i15 * 2) + i12;
                Object obj = objArr[i16];
                Objects.requireNonNull(obj);
                Object obj2 = objArr[i16 ^ 1];
                Objects.requireNonNull(obj2);
                int iP = w20.h.p(obj.hashCode());
                while (true) {
                    int i18 = iP & i13;
                    int i19 = bArr[i18] & 255;
                    if (i19 == 255) {
                        bArr[i18] = (byte) i17;
                        if (i15 < i14) {
                            objArr[i17] = obj;
                            objArr[i17 ^ 1] = obj2;
                        }
                        i15++;
                    } else {
                        if (obj.equals(objArr[i19])) {
                            int i21 = i19 ^ 1;
                            Object obj3 = objArr[i21];
                            Objects.requireNonNull(obj3);
                            w0Var = new w0(obj, obj2, obj3);
                            objArr[i21] = obj2;
                            break;
                        }
                        iP = i18 + 1;
                    }
                }
                i14++;
            }
            return i15 == i5 ? bArr : new Object[]{bArr, Integer.valueOf(i15), w0Var};
        }
        if (i11 <= 32768) {
            short[] sArr = new short[i11];
            Arrays.fill(sArr, (short) -1);
            int i22 = 0;
            while (i14 < i5) {
                int i23 = (i14 * 2) + i12;
                int i24 = (i22 * 2) + i12;
                Object obj4 = objArr[i23];
                Objects.requireNonNull(obj4);
                Object obj5 = objArr[i23 ^ 1];
                Objects.requireNonNull(obj5);
                int iP2 = w20.h.p(obj4.hashCode());
                while (true) {
                    int i25 = iP2 & i13;
                    int i26 = sArr[i25] & 65535;
                    if (i26 == 65535) {
                        sArr[i25] = (short) i24;
                        if (i22 < i14) {
                            objArr[i24] = obj4;
                            objArr[i24 ^ 1] = obj5;
                        }
                        i22++;
                    } else {
                        if (obj4.equals(objArr[i26])) {
                            int i27 = i26 ^ 1;
                            Object obj6 = objArr[i27];
                            Objects.requireNonNull(obj6);
                            w0Var = new w0(obj4, obj5, obj6);
                            objArr[i27] = obj5;
                            break;
                        }
                        iP2 = i25 + 1;
                    }
                }
                i14++;
            }
            return i22 == i5 ? sArr : new Object[]{sArr, Integer.valueOf(i22), w0Var};
        }
        int[] iArr = new int[i11];
        Arrays.fill(iArr, -1);
        int i28 = 0;
        while (i14 < i5) {
            int i29 = (i14 * 2) + i12;
            int i31 = (i28 * 2) + i12;
            Object obj7 = objArr[i29];
            Objects.requireNonNull(obj7);
            Object obj8 = objArr[i29 ^ 1];
            Objects.requireNonNull(obj8);
            int iP3 = w20.h.p(obj7.hashCode());
            while (true) {
                int i32 = iP3 & i13;
                int i33 = iArr[i32];
                if (i33 == -1) {
                    iArr[i32] = i31;
                    if (i28 < i14) {
                        objArr[i31] = obj7;
                        objArr[i31 ^ 1] = obj8;
                    }
                    i28++;
                } else {
                    if (obj7.equals(objArr[i33])) {
                        int i34 = i33 ^ 1;
                        Object obj9 = objArr[i34];
                        Objects.requireNonNull(obj9);
                        w0Var = new w0(obj7, obj8, obj9);
                        objArr[i34] = obj8;
                        break;
                    }
                    iP3 = i32 + 1;
                }
            }
            i14++;
        }
        return i28 == i5 ? iArr : new Object[]{iArr, Integer.valueOf(i28), w0Var};
    }

    public static Object m(Object obj, Object[] objArr, int i5, int i11, Object obj2) {
        if (obj2 == null) {
            return null;
        }
        if (i5 == 1) {
            Object obj3 = objArr[i11];
            Objects.requireNonNull(obj3);
            if (!obj3.equals(obj2)) {
                return null;
            }
            Object obj4 = objArr[i11 ^ 1];
            Objects.requireNonNull(obj4);
            return obj4;
        }
        if (obj == null) {
            return null;
        }
        if (obj instanceof byte[]) {
            byte[] bArr = (byte[]) obj;
            int length = bArr.length - 1;
            int iP = w20.h.p(obj2.hashCode());
            while (true) {
                int i12 = iP & length;
                int i13 = bArr[i12] & 255;
                if (i13 == 255) {
                    return null;
                }
                if (obj2.equals(objArr[i13])) {
                    return objArr[i13 ^ 1];
                }
                iP = i12 + 1;
            }
        } else if (obj instanceof short[]) {
            short[] sArr = (short[]) obj;
            int length2 = sArr.length - 1;
            int iP2 = w20.h.p(obj2.hashCode());
            while (true) {
                int i14 = iP2 & length2;
                int i15 = sArr[i14] & 65535;
                if (i15 == 65535) {
                    return null;
                }
                if (obj2.equals(objArr[i15])) {
                    return objArr[i15 ^ 1];
                }
                iP2 = i14 + 1;
            }
        } else {
            int[] iArr = (int[]) obj;
            int length3 = iArr.length - 1;
            int iP3 = w20.h.p(obj2.hashCode());
            while (true) {
                int i16 = iP3 & length3;
                int i17 = iArr[i16];
                if (i17 == -1) {
                    return null;
                }
                if (obj2.equals(objArr[i17])) {
                    return objArr[i17 ^ 1];
                }
                iP3 = i16 + 1;
            }
        }
    }

    @Override // xk.x0
    public final d1 d() {
        return new t2(this, this.f96044e, 0, this.f96045f);
    }

    @Override // xk.x0
    public final d1 e() {
        return new u2(this, new v2(this.f96044e, 0, this.f96045f));
    }

    @Override // xk.x0
    public final q0 f() {
        return new v2(this.f96044e, 1, this.f96045f);
    }

    @Override // xk.x0, java.util.Map
    public final Object get(Object obj) {
        Object objM = m(this.f96043d, this.f96044e, this.f96045f, 0, obj);
        if (objM == null) {
            return null;
        }
        return objM;
    }

    @Override // xk.x0
    public final boolean h() {
        return false;
    }

    @Override // java.util.Map
    public final int size() {
        return this.f96045f;
    }
}
