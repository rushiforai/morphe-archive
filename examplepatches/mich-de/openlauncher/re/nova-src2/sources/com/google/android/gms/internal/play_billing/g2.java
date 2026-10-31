package com.google.android.gms.internal.play_billing;

import java.io.IOException;

/* loaded from: classes3.dex */
public abstract class g2 {
    protected transient int zza;

    public abstract void a(n2 n2Var);

    public final byte[] b() {
        try {
            int iD = d();
            byte[] bArr = new byte[iD];
            n2 n2Var = new n2(bArr, iD);
            a(n2Var);
            if (iD - n2Var.f33462f == 0) {
                return bArr;
            }
            throw new IllegalStateException("Did not write as much data as expected.");
        } catch (IOException e3) {
            throw new RuntimeException(b.c0.l("Serializing ", getClass().getName(), " to a byte array threw an IOException (should never happen)."), e3);
        }
    }

    public abstract int c(x3 x3Var);

    public abstract int d();
}
