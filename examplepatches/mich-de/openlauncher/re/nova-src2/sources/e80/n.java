package e80;

import b.c0;

/* loaded from: classes.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public static final char[] f52274a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public static final void a(long j11, long j12, long j13) {
        if (j12 >= 0 && j13 <= j11) {
            if (j12 > j13) {
                throw new IllegalArgumentException(a2.c.n(c0.u(j12, "startIndex (", ") > endIndex ("), j13, ')'));
            }
            return;
        }
        StringBuilder sbU = c0.u(j12, "startIndex (", ") and endIndex (");
        sbU.append(j13);
        sbU.append(") are not within the range [0..size(");
        sbU.append(j11);
        sbU.append("))");
        throw new IndexOutOfBoundsException(sbU.toString());
    }

    public static final void b(long j11, long j12) {
        if (0 > j11 || j11 < j12 || j12 < 0) {
            throw new IllegalArgumentException(a2.c.i(j11, "))", c0.u(j12, "offset (0) and byteCount (", ") are not within the range [0..size(")));
        }
    }

    public static final int c(h hVar, byte b11, int i5, int i11) {
        if (i5 < 0 || i5 >= hVar.a()) {
            throw new IllegalArgumentException(String.valueOf(i5).toString());
        }
        if (i5 > i11 || i11 > hVar.a()) {
            throw new IllegalArgumentException(String.valueOf(i11).toString());
        }
        int i12 = hVar.f52261b;
        byte[] bArr = hVar.f52260a;
        while (i5 < i11) {
            if (bArr[i12 + i5] == b11) {
                return i5;
            }
            i5++;
        }
        return -1;
    }
}
