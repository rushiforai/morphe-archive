package com.google.android.libraries.places.internal;

import java.io.Closeable;
import kotlin.jvm.internal.SourceDebugExtension;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbwa implements Closeable {
    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        throw new IllegalStateException("not attached to a buffer");
    }
}
