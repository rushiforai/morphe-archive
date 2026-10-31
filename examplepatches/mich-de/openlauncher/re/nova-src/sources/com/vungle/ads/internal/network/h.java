package com.vungle.ads.internal.network;

/* loaded from: classes4.dex */
public final class h {
    public static final void a(Throwable th2) throws Throwable {
        if ((th2 instanceof ThreadDeath) || (th2 instanceof LinkageError)) {
            throw th2;
        }
    }
}
