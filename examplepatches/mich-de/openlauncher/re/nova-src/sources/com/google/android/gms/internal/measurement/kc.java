package com.google.android.gms.internal.measurement;

import java.io.Closeable;
import java.util.zip.Inflater;

/* loaded from: classes3.dex */
public final class kc implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final Inflater f32732a = new Inflater(true);

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f32732a.end();
    }
}
