package com.google.android.gms.internal.play_billing;

import java.io.IOException;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class zzfa extends IOException {
    public zzfa() {
        super("CodedOutputStream was writing to a flat byte array and ran out of space.");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public zzfa(long j11, long j12, int i5, IndexOutOfBoundsException indexOutOfBoundsException) {
        Locale locale = Locale.US;
        StringBuilder sbU = b.c0.u(j11, "Pos: ", ", limit: ");
        sbU.append(j12);
        sbU.append(", len: ");
        sbU.append(i5);
        super("CodedOutputStream was writing to a flat byte array and ran out of space.: ".concat(sbU.toString()), indexOutOfBoundsException);
    }
}
