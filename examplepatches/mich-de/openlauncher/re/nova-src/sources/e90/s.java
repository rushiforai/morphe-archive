package e90;

import java.io.IOException;

/* loaded from: classes.dex */
public abstract class s {
    public static int a(int i5, int i11, int i12) throws IOException {
        if ((i11 & 8) != 0) {
            i5--;
        }
        if (i12 <= i5) {
            return i5 - i12;
        }
        throw new IOException(b.c0.g(i12, i5, "PROTOCOL_ERROR padding ", " > remaining length "));
    }
}
