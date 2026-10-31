package ads_mobile_sdk;

import b.c0;
import java.io.IOException;
import java.util.Locale;

/* loaded from: classes.dex */
public final class wu extends IOException {
    /* JADX WARN: Illegal instructions before constructor call */
    public wu(long j11, long j12, int i5, IndexOutOfBoundsException indexOutOfBoundsException) {
        Locale locale = Locale.US;
        StringBuilder sbU = c0.u(j11, "Pos: ", ", limit: ");
        sbU.append(j12);
        sbU.append(", len: ");
        sbU.append(i5);
        super(c0.k("CodedOutputStream was writing to a flat byte array and ran out of space.: ", sbU.toString()), indexOutOfBoundsException);
    }

    public wu(IndexOutOfBoundsException indexOutOfBoundsException) {
        super("CodedOutputStream was writing to a flat byte array and ran out of space.", indexOutOfBoundsException);
    }
}
