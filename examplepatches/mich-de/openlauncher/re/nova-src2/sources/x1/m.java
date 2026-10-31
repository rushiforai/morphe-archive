package x1;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final int f94973a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f94974b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f94975c;

    public m(int i5, long[] jArr, Object[] objArr) {
        this.f94973a = i5;
        this.f94974b = jArr;
        this.f94975c = objArr;
    }

    public final int a(long j11) {
        int i5 = this.f94973a - 1;
        if (i5 != -1) {
            long[] jArr = this.f94974b;
            int i11 = 0;
            if (i5 != 0) {
                while (i11 <= i5) {
                    int i12 = (i11 + i5) >>> 1;
                    long j12 = jArr[i12] - j11;
                    if (j12 < 0) {
                        i11 = i12 + 1;
                    } else {
                        if (j12 <= 0) {
                            return i12;
                        }
                        i5 = i12 - 1;
                    }
                }
                return -(i11 + 1);
            }
            long j13 = jArr[0];
            if (j13 == j11) {
                return 0;
            }
            if (j13 > j11) {
                return -2;
            }
        }
        return -1;
    }

    public final m b(long j11, Object obj) {
        long[] jArr;
        int i5;
        Object[] objArr = this.f94975c;
        int i11 = 0;
        int i12 = 0;
        for (Object obj2 : objArr) {
            if (obj2 != null) {
                i12++;
            }
        }
        int i13 = i12 + 1;
        long[] jArr2 = new long[i13];
        Object[] objArr2 = new Object[i13];
        if (i13 > 1) {
            int i14 = 0;
            while (true) {
                jArr = this.f94974b;
                i5 = this.f94973a;
                if (i11 >= i13 || i14 >= i5) {
                    break;
                }
                long j12 = jArr[i14];
                Object obj3 = objArr[i14];
                if (j12 > j11) {
                    jArr2[i11] = j11;
                    objArr2[i11] = obj;
                    i11++;
                    break;
                }
                if (obj3 != null) {
                    jArr2[i11] = j12;
                    objArr2[i11] = obj3;
                    i11++;
                }
                i14++;
            }
            if (i14 == i5) {
                jArr2[i12] = j11;
                objArr2[i12] = obj;
            } else {
                while (i11 < i13) {
                    long j13 = jArr[i14];
                    Object obj4 = objArr[i14];
                    if (obj4 != null) {
                        jArr2[i11] = j13;
                        objArr2[i11] = obj4;
                        i11++;
                    }
                    i14++;
                }
            }
        } else {
            jArr2[0] = j11;
            objArr2[0] = obj;
        }
        return new m(i13, jArr2, objArr2);
    }
}
