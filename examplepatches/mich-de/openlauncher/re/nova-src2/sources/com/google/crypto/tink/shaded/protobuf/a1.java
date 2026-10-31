package com.google.crypto.tink.shaded.protobuf;

import com.google.crypto.tink.shaded.protobuf.InvalidProtocolBufferException;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class a1 {

    /* renamed from: f, reason: collision with root package name */
    public static final a1 f34568f = new a1(0, new int[0], new Object[0], false);

    /* renamed from: a, reason: collision with root package name */
    public int f34569a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f34570b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f34571c;

    /* renamed from: d, reason: collision with root package name */
    public int f34572d = -1;

    /* renamed from: e, reason: collision with root package name */
    public boolean f34573e;

    public a1(int i5, int[] iArr, Object[] objArr, boolean z11) {
        this.f34569a = i5;
        this.f34570b = iArr;
        this.f34571c = objArr;
        this.f34573e = z11;
    }

    public static a1 c() {
        return new a1(0, new int[8], new Object[8], true);
    }

    public final void a(int i5) {
        int[] iArr = this.f34570b;
        if (i5 > iArr.length) {
            int i11 = this.f34569a;
            int i12 = (i11 / 2) + i11;
            if (i12 >= i5) {
                i5 = i12;
            }
            if (i5 < 8) {
                i5 = 8;
            }
            this.f34570b = Arrays.copyOf(iArr, i5);
            this.f34571c = Arrays.copyOf(this.f34571c, i5);
        }
    }

    public final int b() {
        int iL0;
        int i5 = this.f34572d;
        if (i5 != -1) {
            return i5;
        }
        int iB = 0;
        for (int i11 = 0; i11 < this.f34569a; i11++) {
            int i12 = this.f34570b[i11];
            int iH = p10.c0.H(i12);
            int I = p10.c0.I(i12);
            if (I == 0) {
                iL0 = m.l0(iH, ((Long) this.f34571c[i11]).longValue());
            } else if (I == 1) {
                ((Long) this.f34571c[i11]).getClass();
                iL0 = m.f0(iH);
            } else if (I == 2) {
                iL0 = m.d0(iH, (i) this.f34571c[i11]);
            } else if (I == 3) {
                iB = ((a1) this.f34571c[i11]).b() + (m.j0(iH) * 2) + iB;
            } else {
                if (I != 5) {
                    int i13 = InvalidProtocolBufferException.f34567a;
                    throw new IllegalStateException(new InvalidProtocolBufferException.InvalidWireTypeException());
                }
                ((Integer) this.f34571c[i11]).getClass();
                iL0 = m.e0(iH);
            }
            iB = iL0 + iB;
        }
        this.f34572d = iB;
        return iB;
    }

    public final void d(int i5, Object obj) {
        if (!this.f34573e) {
            throw new UnsupportedOperationException();
        }
        a(this.f34569a + 1);
        int[] iArr = this.f34570b;
        int i11 = this.f34569a;
        iArr[i11] = i5;
        this.f34571c[i11] = obj;
        this.f34569a = i11 + 1;
    }

    public final void e(cm.f fVar) {
        if (this.f34569a == 0) {
            return;
        }
        fVar.getClass();
        for (int i5 = 0; i5 < this.f34569a; i5++) {
            int i11 = this.f34570b[i5];
            Object obj = this.f34571c[i5];
            int iH = p10.c0.H(i11);
            int I = p10.c0.I(i11);
            if (I == 0) {
                fVar.T(iH, ((Long) obj).longValue());
            } else if (I == 1) {
                fVar.R(iH, ((Long) obj).longValue());
            } else if (I == 2) {
                fVar.O(iH, (i) obj);
            } else if (I == 3) {
                fVar.V(iH);
                ((a1) obj).e(fVar);
                fVar.P(iH);
            } else {
                if (I != 5) {
                    int i12 = InvalidProtocolBufferException.f34567a;
                    throw new RuntimeException(new InvalidProtocolBufferException.InvalidWireTypeException());
                }
                fVar.Q(iH, ((Integer) obj).intValue());
            }
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof a1)) {
            return false;
        }
        a1 a1Var = (a1) obj;
        int i5 = this.f34569a;
        if (i5 == a1Var.f34569a) {
            int[] iArr = this.f34570b;
            int[] iArr2 = a1Var.f34570b;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    Object[] objArr = this.f34571c;
                    Object[] objArr2 = a1Var.f34571c;
                    int i12 = this.f34569a;
                    for (int i13 = 0; i13 < i12; i13++) {
                        if (objArr[i13].equals(objArr2[i13])) {
                        }
                    }
                    return true;
                }
                if (iArr[i11] != iArr2[i11]) {
                    break;
                }
                i11++;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = this.f34569a;
        int i11 = (527 + i5) * 31;
        int[] iArr = this.f34570b;
        int iHashCode = 17;
        int i12 = 17;
        for (int i13 = 0; i13 < i5; i13++) {
            i12 = (i12 * 31) + iArr[i13];
        }
        int i14 = (i11 + i12) * 31;
        Object[] objArr = this.f34571c;
        int i15 = this.f34569a;
        for (int i16 = 0; i16 < i15; i16++) {
            iHashCode = (iHashCode * 31) + objArr[i16].hashCode();
        }
        return i14 + iHashCode;
    }
}
