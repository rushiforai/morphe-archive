package e80;

import h6.c1;
import java.io.EOFException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class l {
    public static final byte[] a(k kVar, int i5) {
        Intrinsics.g(kVar, "<this>");
        long j11 = i5;
        if (j11 >= 0) {
            return b(kVar, i5);
        }
        throw new IllegalArgumentException(c1.o(j11, "byteCount (", ") < 0").toString());
    }

    public static final byte[] b(k kVar, int i5) {
        if (i5 == -1) {
            for (long j11 = 2147483647L; kVar.i().f52247c < 2147483647L && kVar.j(j11); j11 *= 2) {
            }
            if (kVar.i().f52247c >= 2147483647L) {
                throw new IllegalStateException(("Can't create an array of size " + kVar.i().f52247c).toString());
            }
            i5 = (int) kVar.i().f52247c;
        } else {
            kVar.m(i5);
        }
        byte[] bArr = new byte[i5];
        a aVarI = kVar.i();
        Intrinsics.g(aVarI, "<this>");
        long j12 = i5;
        int i11 = 0;
        n.a(j12, 0, j12);
        while (i11 < i5) {
            int iB = aVarI.b(i11, i5, bArr);
            if (iB == -1) {
                throw new EOFException(c1.n(i5, "Source exhausted before reading ", " bytes. Only ", iB, " bytes were read."));
            }
            i11 += iB;
        }
        return bArr;
    }
}
