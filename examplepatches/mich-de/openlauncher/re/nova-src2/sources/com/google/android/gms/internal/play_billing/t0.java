package com.google.android.gms.internal.play_billing;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class t0 implements Map, Serializable {

    /* renamed from: g, reason: collision with root package name */
    public static final t0 f33527g = new t0(null, new Object[0], 0);

    /* renamed from: a, reason: collision with root package name */
    public transient q0 f33528a;

    /* renamed from: b, reason: collision with root package name */
    public transient r0 f33529b;

    /* renamed from: c, reason: collision with root package name */
    public transient s0 f33530c;

    /* renamed from: d, reason: collision with root package name */
    public final transient Object f33531d;

    /* renamed from: e, reason: collision with root package name */
    public final transient Object[] f33532e;

    /* renamed from: f, reason: collision with root package name */
    public final transient int f33533f;

    public t0(Object obj, Object[] objArr, int i5) {
        this.f33531d = obj;
        this.f33532e = objArr;
        this.f33533f = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01be  */
    /* JADX WARN: Type inference failed for: r16v10 */
    /* JADX WARN: Type inference failed for: r16v11 */
    /* JADX WARN: Type inference failed for: r16v12 */
    /* JADX WARN: Type inference failed for: r16v13 */
    /* JADX WARN: Type inference failed for: r16v4 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v8, types: [java.lang.Object[]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static t0 a(int i5, Object[] objArr, c00.d dVar) {
        int iHighestOneBit;
        boolean z11;
        int i11;
        char c11;
        Object obj;
        char c12;
        short[] sArr;
        boolean z12;
        int i12;
        ?? r16;
        boolean z13;
        boolean z14;
        int i13 = i5;
        Object[] objArrCopyOf = objArr;
        if (i13 == 0) {
            return f33527g;
        }
        Object obj2 = null;
        boolean z15 = false;
        int i14 = 1;
        if (i13 == 1) {
            Objects.requireNonNull(objArrCopyOf[0]);
            Objects.requireNonNull(objArrCopyOf[1]);
            return new t0(null, objArrCopyOf, 1);
        }
        t2.c.V(i13, objArrCopyOf.length >> 1);
        char c13 = 2;
        int iMax = Math.max(i13, 2);
        if (iMax < 751619276) {
            iHighestOneBit = Integer.highestOneBit(iMax - 1);
            do {
                iHighestOneBit += iHighestOneBit;
            } while (iHighestOneBit * 0.7d < iMax);
        } else {
            iHighestOneBit = 1073741824;
            if (iMax >= 1073741824) {
                throw new IllegalArgumentException("collection too large");
            }
        }
        if (i13 == 1) {
            Objects.requireNonNull(objArrCopyOf[0]);
            Objects.requireNonNull(objArrCopyOf[1]);
            z14 = false;
            i13 = 1;
            i11 = 1;
        } else {
            int i15 = iHighestOneBit - 1;
            if (iHighestOneBit <= 128) {
                byte[] bArr = new byte[iHighestOneBit];
                Arrays.fill(bArr, (byte) -1);
                int i16 = 0;
                int i17 = 0;
                while (i16 < i13) {
                    int i18 = i17 + i17;
                    int i19 = i16 + i16;
                    Object obj3 = objArrCopyOf[i19];
                    Objects.requireNonNull(obj3);
                    Object obj4 = objArrCopyOf[i19 ^ i14];
                    Objects.requireNonNull(obj4);
                    int iB0 = wh.f.b0(obj3.hashCode());
                    while (true) {
                        int i21 = iB0 & i15;
                        z12 = z15;
                        i12 = i14;
                        int i22 = bArr[i21] & 255;
                        if (i22 == 255) {
                            bArr[i21] = (byte) i18;
                            if (i17 < i16) {
                                objArrCopyOf[i18] = obj3;
                                objArrCopyOf[i18 ^ 1] = obj4;
                            }
                            i17++;
                        } else {
                            if (obj3.equals(objArrCopyOf[i22])) {
                                int i23 = i22 ^ 1;
                                Object obj5 = objArrCopyOf[i23];
                                Objects.requireNonNull(obj5);
                                l0 l0Var = new l0(obj3, obj4, obj5);
                                objArrCopyOf[i23] = obj4;
                                obj2 = l0Var;
                                break;
                            }
                            iB0 = i21 + 1;
                            z15 = z12;
                            i14 = i12;
                        }
                    }
                    i16++;
                    z15 = z12;
                    i14 = i12;
                }
                z11 = z15;
                i11 = i14;
                if (i17 == i13) {
                    c11 = 2;
                    obj = bArr;
                    r16 = z11;
                    z13 = obj instanceof Object[];
                    Object obj6 = obj;
                    if (z13) {
                        Object[] objArr2 = (Object[]) obj;
                        l0 l0Var2 = (l0) objArr2[c11];
                        if (dVar == null) {
                            throw l0Var2.a();
                        }
                        dVar.f19046d = l0Var2;
                        Object obj7 = objArr2[r16];
                        int iIntValue = ((Integer) objArr2[i11]).intValue();
                        objArrCopyOf = Arrays.copyOf(objArrCopyOf, iIntValue + iIntValue);
                        obj6 = obj7;
                        i13 = iIntValue;
                    }
                    return new t0(obj6, objArrCopyOf, i13);
                }
                sArr = new Object[3];
                sArr[z11 ? 1 : 0] = bArr;
                sArr[i11] = Integer.valueOf(i17);
                sArr[2] = obj2;
                obj2 = sArr;
                z14 = z11;
            } else {
                z11 = false;
                i11 = 1;
                if (iHighestOneBit > 32768) {
                    int[] iArr = new int[iHighestOneBit];
                    Arrays.fill(iArr, -1);
                    int i24 = 0;
                    int i25 = 0;
                    while (i24 < i13) {
                        int i26 = i25 + i25;
                        int i27 = i24 + i24;
                        Object obj8 = objArrCopyOf[i27];
                        Objects.requireNonNull(obj8);
                        Object obj9 = objArrCopyOf[i27 ^ 1];
                        Objects.requireNonNull(obj9);
                        int iB02 = wh.f.b0(obj8.hashCode());
                        while (true) {
                            int i28 = iB02 & i15;
                            int i29 = iArr[i28];
                            if (i29 == -1) {
                                iArr[i28] = i26;
                                if (i25 < i24) {
                                    objArrCopyOf[i26] = obj8;
                                    objArrCopyOf[i26 ^ 1] = obj9;
                                }
                                i25++;
                                c12 = c13;
                            } else {
                                c12 = c13;
                                if (obj8.equals(objArrCopyOf[i29])) {
                                    int i31 = i29 ^ 1;
                                    Object obj10 = objArrCopyOf[i31];
                                    Objects.requireNonNull(obj10);
                                    l0 l0Var3 = new l0(obj8, obj9, obj10);
                                    objArrCopyOf[i31] = obj9;
                                    obj2 = l0Var3;
                                    break;
                                }
                                iB02 = i28 + 1;
                                c13 = c12;
                            }
                        }
                        i24++;
                        c13 = c12;
                    }
                    c11 = c13;
                    if (i25 == i13) {
                        obj = iArr;
                        r16 = z11;
                    } else {
                        Object[] objArr3 = new Object[3];
                        objArr3[0] = iArr;
                        objArr3[1] = Integer.valueOf(i25);
                        objArr3[c11] = obj2;
                        obj = objArr3;
                        r16 = z11;
                    }
                    z13 = obj instanceof Object[];
                    Object obj62 = obj;
                    if (z13) {
                    }
                    return new t0(obj62, objArrCopyOf, i13);
                }
                sArr = new short[iHighestOneBit];
                Arrays.fill(sArr, (short) -1);
                int i32 = 0;
                for (int i33 = 0; i33 < i13; i33++) {
                    int i34 = i32 + i32;
                    int i35 = i33 + i33;
                    Object obj11 = objArrCopyOf[i35];
                    Objects.requireNonNull(obj11);
                    Object obj12 = objArrCopyOf[i35 ^ 1];
                    Objects.requireNonNull(obj12);
                    int iB03 = wh.f.b0(obj11.hashCode());
                    while (true) {
                        int i36 = iB03 & i15;
                        char c14 = (char) sArr[i36];
                        if (c14 == 65535) {
                            sArr[i36] = (short) i34;
                            if (i32 < i33) {
                                objArrCopyOf[i34] = obj11;
                                objArrCopyOf[i34 ^ 1] = obj12;
                            }
                            i32++;
                        } else {
                            if (obj11.equals(objArrCopyOf[c14])) {
                                int i37 = c14 ^ 1;
                                Object obj13 = objArrCopyOf[i37];
                                Objects.requireNonNull(obj13);
                                l0 l0Var4 = new l0(obj11, obj12, obj13);
                                objArrCopyOf[i37] = obj12;
                                obj2 = l0Var4;
                                break;
                            }
                            iB03 = i36 + 1;
                        }
                    }
                }
                if (i32 == i13) {
                    obj2 = sArr;
                    z14 = z11;
                } else {
                    obj2 = new Object[]{sArr, Integer.valueOf(i32), obj2};
                    z14 = z11;
                }
            }
        }
        c11 = 2;
        obj = obj2;
        r16 = z14;
        z13 = obj instanceof Object[];
        Object obj622 = obj;
        if (z13) {
        }
        return new t0(obj622, objArrCopyOf, i13);
    }

    @Override // java.util.Map
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return get(obj) != null;
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        s0 s0Var = this.f33530c;
        if (s0Var == null) {
            s0Var = new s0(this.f33532e, 1, this.f33533f);
            this.f33530c = s0Var;
        }
        return s0Var.contains(obj);
    }

    @Override // java.util.Map
    public final Set entrySet() {
        q0 q0Var = this.f33528a;
        if (q0Var != null) {
            return q0Var;
        }
        q0 q0Var2 = new q0(this, this.f33532e, this.f33533f);
        this.f33528a = q0Var2;
        return q0Var2;
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Map) {
            return entrySet().equals(((Map) obj).entrySet());
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0003  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0003 A[EDGE_INSN: B:44:0x0003->B:4:0x0003 BREAK  A[LOOP:0: B:16:0x0038->B:22:0x004e], EDGE_INSN: B:46:0x0003->B:4:0x0003 BREAK  A[LOOP:1: B:26:0x0063->B:32:0x007a], EDGE_INSN: B:48:0x0003->B:4:0x0003 BREAK  A[LOOP:2: B:34:0x0089->B:43:0x00a0]] */
    @Override // java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object get(Object obj) {
        Object obj2;
        if (obj == null) {
            obj2 = null;
        } else {
            int i5 = this.f33533f;
            Object[] objArr = this.f33532e;
            if (i5 == 1) {
                Object obj3 = objArr[0];
                Objects.requireNonNull(obj3);
                if (obj3.equals(obj)) {
                    obj2 = objArr[1];
                    Objects.requireNonNull(obj2);
                }
            } else {
                Object obj4 = this.f33531d;
                if (obj4 != null) {
                    if (obj4 instanceof byte[]) {
                        byte[] bArr = (byte[]) obj4;
                        int length = bArr.length - 1;
                        int iB0 = wh.f.b0(obj.hashCode());
                        while (true) {
                            int i11 = iB0 & length;
                            int i12 = bArr[i11] & 255;
                            if (i12 == 255) {
                                break;
                            }
                            if (obj.equals(objArr[i12])) {
                                obj2 = objArr[i12 ^ 1];
                                break;
                            }
                            iB0 = i11 + 1;
                        }
                    } else if (obj4 instanceof short[]) {
                        short[] sArr = (short[]) obj4;
                        int length2 = sArr.length - 1;
                        int iB02 = wh.f.b0(obj.hashCode());
                        while (true) {
                            int i13 = iB02 & length2;
                            char c11 = (char) sArr[i13];
                            if (c11 == 65535) {
                                break;
                            }
                            if (obj.equals(objArr[c11])) {
                                obj2 = objArr[c11 ^ 1];
                                break;
                            }
                            iB02 = i13 + 1;
                        }
                    } else {
                        int[] iArr = (int[]) obj4;
                        int length3 = iArr.length - 1;
                        int iB03 = wh.f.b0(obj.hashCode());
                        while (true) {
                            int i14 = iB03 & length3;
                            int i15 = iArr[i14];
                            if (i15 == -1) {
                                break;
                            }
                            if (obj.equals(objArr[i15])) {
                                obj2 = objArr[i15 ^ 1];
                                break;
                            }
                            iB03 = i14 + 1;
                        }
                    }
                }
            }
        }
        if (obj2 == null) {
            return null;
        }
        return obj2;
    }

    @Override // java.util.Map
    public final Object getOrDefault(Object obj, Object obj2) {
        Object obj3 = get(obj);
        return obj3 != null ? obj3 : obj2;
    }

    @Override // java.util.Map
    public final int hashCode() {
        q0 q0Var = this.f33528a;
        if (q0Var == null) {
            q0Var = new q0(this, this.f33532e, this.f33533f);
            this.f33528a = q0Var;
        }
        Iterator it = q0Var.iterator();
        int iHashCode = 0;
        while (it.hasNext()) {
            Object next = it.next();
            iHashCode += next != null ? next.hashCode() : 0;
        }
        return iHashCode;
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return size() == 0;
    }

    @Override // java.util.Map
    public final Set keySet() {
        r0 r0Var = this.f33529b;
        if (r0Var != null) {
            return r0Var;
        }
        r0 r0Var2 = new r0(this, new s0(this.f33532e, 0, this.f33533f));
        this.f33529b = r0Var2;
        return r0Var2;
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final void putAll(Map map) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final int size() {
        return this.f33533f;
    }

    public final String toString() {
        int i5 = this.f33533f;
        if (i5 < 0) {
            throw new IllegalArgumentException(b.c0.h(i5, "size cannot be negative but was: "));
        }
        StringBuilder sb2 = new StringBuilder((int) Math.min(i5 * 8, 1073741824L));
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        Iterator it = ((q0) entrySet()).iterator();
        boolean z11 = true;
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            if (!z11) {
                sb2.append(", ");
            }
            sb2.append(entry.getKey());
            sb2.append('=');
            sb2.append(entry.getValue());
            z11 = false;
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }

    @Override // java.util.Map
    public final Collection values() {
        s0 s0Var = this.f33530c;
        if (s0Var != null) {
            return s0Var;
        }
        s0 s0Var2 = new s0(this.f33532e, 1, this.f33533f);
        this.f33530c = s0Var2;
        return s0Var2;
    }
}
