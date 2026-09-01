package com.google.android.recaptcha.internal;

import defpackage.b09;
import java.io.IOException;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzacz extends IOException {
    /* JADX WARN: Illegal instructions before constructor call */
    public zzacz(long j, long j2, int i, IndexOutOfBoundsException indexOutOfBoundsException) {
        Locale locale = Locale.US;
        StringBuilder sbD = b09.D("Pos: ", ", limit: ", j);
        sbD.append(j2);
        sbD.append(", len: ");
        sbD.append(i);
        super("CodedOutputStream was writing to a flat byte array and ran out of space.: ".concat(sbD.toString()), indexOutOfBoundsException);
    }
}
