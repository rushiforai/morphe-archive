package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.io.InterruptedIOException;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes3.dex */
public class zzbwv {

    @NotNull
    public static final zzbwu zzb = new zzbwu(null);

    @JvmField
    @NotNull
    public static final zzbwv zzc = new zzbwt();

    public static final void zzb() throws IOException {
        if (Thread.currentThread().isInterrupted()) {
            throw new InterruptedIOException("interrupted");
        }
    }
}
