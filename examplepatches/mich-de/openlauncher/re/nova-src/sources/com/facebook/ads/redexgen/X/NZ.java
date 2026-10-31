package com.facebook.ads.redexgen.X;

import android.system.ErrnoException;
import android.system.OsConstants;

/* loaded from: assets/audience_network/classes.dex */
public final class NZ {
    public static boolean A00(Throwable th2) {
        return (th2 instanceof ErrnoException) && ((ErrnoException) th2).errno == OsConstants.EACCES;
    }
}
