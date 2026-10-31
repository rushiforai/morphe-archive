package io.ktor.utils.io;

import java.io.IOException;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class w0 implements t {

    /* renamed from: b, reason: collision with root package name */
    public final e80.a f66673b;

    @Nullable
    private volatile q0 closed;

    public w0(e80.a aVar) {
        this.f66673b = aVar;
    }

    @Override // io.ktor.utils.io.t
    public final void a(Throwable th2) {
        if (this.closed != null) {
            return;
        }
        String message = th2.getMessage();
        if (message == null) {
            message = "Channel was cancelled";
        }
        this.closed = new q0(new IOException(message, th2));
    }

    @Override // io.ktor.utils.io.t
    public final Throwable b() {
        q0 q0Var = this.closed;
        if (q0Var != null) {
            return q0Var.a(p0.f66630d);
        }
        return null;
    }

    @Override // io.ktor.utils.io.t
    public final e80.a f() throws Throwable {
        Throwable thB = b();
        if (thB == null) {
            return this.f66673b;
        }
        throw thB;
    }

    @Override // io.ktor.utils.io.t
    public final Object g(int i5, ContinuationImpl continuationImpl) throws Throwable {
        Throwable thB = b();
        if (thB == null) {
            return Boolean.valueOf(this.f66673b.j(i5));
        }
        throw thB;
    }

    @Override // io.ktor.utils.io.t
    public final boolean h() {
        return this.f66673b.N();
    }
}
