package xk;

import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class k2 {

    /* renamed from: a, reason: collision with root package name */
    public transient Object[] f95952a;

    /* renamed from: b, reason: collision with root package name */
    public transient int[] f95953b;

    /* renamed from: c, reason: collision with root package name */
    public transient int f95954c;

    /* renamed from: d, reason: collision with root package name */
    public transient int f95955d;

    /* renamed from: e, reason: collision with root package name */
    public transient int[] f95956e;

    /* renamed from: f, reason: collision with root package name */
    public transient long[] f95957f;

    /* renamed from: g, reason: collision with root package name */
    public transient float f95958g;

    /* renamed from: h, reason: collision with root package name */
    public transient int f95959h;

    public k2(int i5) {
        d(i5);
    }

    public final int a(Object obj) {
        int iC = c(obj);
        if (iC == -1) {
            return 0;
        }
        return this.f95953b[iC];
    }

    public final int b(int i5) {
        vk.b0.e(i5, this.f95954c);
        return this.f95953b[i5];
    }

    public final int c(Object obj) {
        int iQ = w20.h.q(obj);
        int i5 = this.f95956e[(r1.length - 1) & iQ];
        while (i5 != -1) {
            long j11 = this.f95957f[i5];
            if (((int) (j11 >>> 32)) == iQ && ps.v.q(obj, this.f95952a[i5])) {
                return i5;
            }
            i5 = (int) j11;
        }
        return -1;
    }

    public final void d(int i5) {
        vk.b0.b("Initial capacity must be non-negative", i5 >= 0);
        int iMax = Math.max(i5, 2);
        int iHighestOneBit = Integer.highestOneBit(iMax);
        if (iMax > ((int) (1.0f * iHighestOneBit)) && (iHighestOneBit = iHighestOneBit << 1) <= 0) {
            iHighestOneBit = 1073741824;
        }
        int[] iArr = new int[iHighestOneBit];
        Arrays.fill(iArr, -1);
        this.f95956e = iArr;
        this.f95958g = 1.0f;
        this.f95952a = new Object[i5];
        this.f95953b = new int[i5];
        long[] jArr = new long[i5];
        Arrays.fill(jArr, -1L);
        this.f95957f = jArr;
        this.f95959h = Math.max(1, (int) (iHighestOneBit * 1.0f));
    }

    public final void e(int i5, Object obj) {
        long j11;
        if (i5 <= 0) {
            throw new IllegalArgumentException(b.c0.h(i5, "count must be positive but was: "));
        }
        long[] jArr = this.f95957f;
        Object[] objArr = this.f95952a;
        int[] iArr = this.f95953b;
        int iQ = w20.h.q(obj);
        int[] iArr2 = this.f95956e;
        int length = (iArr2.length - 1) & iQ;
        int i11 = this.f95954c;
        int i12 = iArr2[length];
        if (i12 == -1) {
            iArr2[length] = i11;
            j11 = 4294967295L;
        } else {
            while (true) {
                long j12 = jArr[i12];
                j11 = 4294967295L;
                if (((int) (j12 >>> 32)) == iQ && ps.v.q(obj, objArr[i12])) {
                    int i13 = iArr[i12];
                    iArr[i12] = i5;
                    return;
                } else {
                    int i14 = (int) j12;
                    if (i14 == -1) {
                        jArr[i12] = ((-4294967296L) & j12) | (i11 & 4294967295L);
                        break;
                    }
                    i12 = i14;
                }
            }
        }
        if (i11 == Integer.MAX_VALUE) {
            throw new IllegalStateException("Cannot contain more than Integer.MAX_VALUE elements!");
        }
        int i15 = i11 + 1;
        int length2 = this.f95957f.length;
        if (i15 > length2) {
            int iMax = Math.max(1, length2 >>> 1) + length2;
            if (iMax < 0) {
                iMax = Integer.MAX_VALUE;
            }
            if (iMax != length2) {
                this.f95952a = Arrays.copyOf(this.f95952a, iMax);
                this.f95953b = Arrays.copyOf(this.f95953b, iMax);
                long[] jArr2 = this.f95957f;
                int length3 = jArr2.length;
                long[] jArrCopyOf = Arrays.copyOf(jArr2, iMax);
                if (iMax > length3) {
                    Arrays.fill(jArrCopyOf, length3, iMax, -1L);
                }
                this.f95957f = jArrCopyOf;
            }
        }
        this.f95957f[i11] = (iQ << 32) | j11;
        this.f95952a[i11] = obj;
        this.f95953b[i11] = i5;
        this.f95954c = i15;
        if (i11 >= this.f95959h) {
            int[] iArr3 = this.f95956e;
            int length4 = iArr3.length * 2;
            if (iArr3.length >= 1073741824) {
                this.f95959h = LayoutNode.NotPlacedPlaceOrder;
            } else {
                int i16 = ((int) (length4 * this.f95958g)) + 1;
                int[] iArr4 = new int[length4];
                Arrays.fill(iArr4, -1);
                long[] jArr3 = this.f95957f;
                int i17 = length4 - 1;
                for (int i18 = 0; i18 < this.f95954c; i18++) {
                    int i19 = (int) (jArr3[i18] >>> 32);
                    int i21 = i19 & i17;
                    int i22 = iArr4[i21];
                    iArr4[i21] = i18;
                    jArr3[i18] = (i19 << 32) | (i22 & j11);
                }
                this.f95959h = i16;
                this.f95956e = iArr4;
            }
        }
        this.f95955d++;
    }

    public final int f(int i5) {
        char c11;
        int i11;
        long[] jArr;
        long j11;
        Object obj = this.f95952a[i5];
        char c12 = ' ';
        int i12 = (int) (this.f95957f[i5] >>> 32);
        int length = (r4.length - 1) & i12;
        int i13 = this.f95956e[length];
        if (i13 != -1) {
            int i14 = -1;
            while (true) {
                if (((int) (this.f95957f[i13] >>> c12)) == i12 && ps.v.q(obj, this.f95952a[i13])) {
                    int[] iArr = this.f95953b;
                    int i15 = iArr[i13];
                    if (i14 == -1) {
                        this.f95956e[length] = (int) this.f95957f[i13];
                        c11 = c12;
                        i11 = i15;
                    } else {
                        long[] jArr2 = this.f95957f;
                        c11 = c12;
                        i11 = i15;
                        jArr2[i14] = (((int) jArr2[i13]) & 4294967295L) | (jArr2[i14] & (-4294967296L));
                    }
                    int i16 = this.f95954c - 1;
                    if (i13 < i16) {
                        Object[] objArr = this.f95952a;
                        objArr[i13] = objArr[i16];
                        iArr[i13] = iArr[i16];
                        objArr[i16] = null;
                        iArr[i16] = 0;
                        long[] jArr3 = this.f95957f;
                        long j12 = jArr3[i16];
                        jArr3[i13] = j12;
                        jArr3[i16] = -1;
                        int[] iArr2 = this.f95956e;
                        int length2 = ((int) (j12 >>> c11)) & (iArr2.length - 1);
                        int i17 = iArr2[length2];
                        if (i17 == i16) {
                            iArr2[length2] = i13;
                        } else {
                            while (true) {
                                jArr = this.f95957f;
                                j11 = jArr[i17];
                                int i18 = (int) j11;
                                if (i18 == i16) {
                                    break;
                                }
                                i17 = i18;
                            }
                            jArr[i17] = (j11 & (-4294967296L)) | (i13 & 4294967295L);
                        }
                    } else {
                        this.f95952a[i13] = null;
                        iArr[i13] = 0;
                        this.f95957f[i13] = -1;
                    }
                    this.f95954c--;
                    this.f95955d++;
                    return i11;
                }
                char c13 = c12;
                int i19 = (int) this.f95957f[i13];
                if (i19 == -1) {
                    break;
                }
                i14 = i13;
                i13 = i19;
                c12 = c13;
            }
        }
        return 0;
    }
}
