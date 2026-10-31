package com.google.android.gms.internal.measurement;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class lf implements xe {

    /* renamed from: a, reason: collision with root package name */
    public boolean f32797a;

    static {
        new AtomicInteger();
    }

    @Override // com.google.android.gms.internal.measurement.xe
    public final Object a(we weVar) throws IOException {
        if (this.f32797a) {
            if (weVar.f33194b.isEmpty()) {
                return weVar.f33193a.c(weVar.f33196d);
            }
            throw new zzsk("Short circuit would skip transforms.");
        }
        Closeable closeableD = j1.d(weVar);
        try {
            if (!(closeableD instanceof ef)) {
                throw new IOException("Not convertible and fallback to pipe is disabled.");
            }
            File fileZza = ((ef) closeableD).zza();
            if (closeableD != null) {
                closeableD.close();
            }
            return fileZza;
        } catch (Throwable th2) {
            if (closeableD != null) {
                try {
                    closeableD.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
            }
            throw th2;
        }
    }
}
