package com.google.android.gms.internal.consent_sdk;

import java.io.IOException;

/* loaded from: classes3.dex */
public final class zzps extends IOException {
    public zzps() {
        super("CodedOutputStream was writing to a flat byte array and ran out of space.");
    }

    public zzps(IndexOutOfBoundsException indexOutOfBoundsException) {
        super("CodedOutputStream was writing to a flat byte array and ran out of space.", indexOutOfBoundsException);
    }
}
