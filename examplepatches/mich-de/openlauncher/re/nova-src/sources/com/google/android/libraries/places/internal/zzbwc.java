package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.nio.channels.WritableByteChannel;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public interface zzbwc extends WritableByteChannel, zzbwq {
    @Override // com.google.android.libraries.places.internal.zzbwq, java.io.Flushable
    void flush() throws IOException;

    @NotNull
    zzbwc zzv(int i5) throws IOException;

    @NotNull
    zzbwc zzw(int i5) throws IOException;

    @NotNull
    zzbwc zzx(@NotNull String str) throws IOException;
}
