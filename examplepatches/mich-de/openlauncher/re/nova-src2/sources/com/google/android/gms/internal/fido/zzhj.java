package com.google.android.gms.internal.fido;

import java.io.IOException;

/* loaded from: classes3.dex */
public final class zzhj extends IOException {
    public zzhj(Exception exc) {
        super("Error in decoding CborValue from bytes", exc);
    }
}
