package io.sentry.exception;

import i30.j;
import io.sentry.protocol.k;
import org.jetbrains.annotations.ApiStatus;

@ApiStatus.Internal
/* loaded from: classes4.dex */
public final class ExceptionMechanismException extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final k f67213a;

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f67214b;

    /* renamed from: c, reason: collision with root package name */
    public final Thread f67215c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f67216d;

    public ExceptionMechanismException(k kVar, Throwable th2, Thread thread, boolean z11) {
        this.f67213a = kVar;
        j.Q(th2, "Throwable is required.");
        this.f67214b = th2;
        j.Q(thread, "Thread is required.");
        this.f67215c = thread;
        this.f67216d = z11;
    }
}
