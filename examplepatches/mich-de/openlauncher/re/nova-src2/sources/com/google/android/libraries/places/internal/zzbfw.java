package com.google.android.libraries.places.internal;

import java.io.Closeable;
import java.net.SocketAddress;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: classes3.dex */
public interface zzbfw extends Closeable {
    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close();

    zzbgf zza(SocketAddress socketAddress, zzbfv zzbfvVar, zzaym zzaymVar);

    ScheduledExecutorService zzb();
}
