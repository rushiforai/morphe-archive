package com.vungle.ads.internal.network;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import x80.p0;

/* loaded from: classes4.dex */
public final class j extends p0 {

    /* renamed from: a, reason: collision with root package name */
    public final p0 f47252a;

    /* renamed from: b, reason: collision with root package name */
    public final m90.i f47253b;

    /* renamed from: c, reason: collision with root package name */
    public IOException f47254c;

    public j(p0 delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f47252a = delegate;
        this.f47253b = x7.f.r(new i(this, delegate.source()));
    }

    public final void a(IOException iOException) {
        this.f47254c = iOException;
    }

    @Override // x80.p0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f47252a.close();
    }

    @Override // x80.p0
    public final long contentLength() {
        return this.f47252a.contentLength();
    }

    @Override // x80.p0
    public final x80.a0 contentType() {
        return this.f47252a.contentType();
    }

    @Override // x80.p0
    public final m90.i source() {
        return this.f47253b;
    }

    public final void a() throws IOException {
        IOException iOException = this.f47254c;
        if (iOException != null) {
            throw iOException;
        }
    }
}
