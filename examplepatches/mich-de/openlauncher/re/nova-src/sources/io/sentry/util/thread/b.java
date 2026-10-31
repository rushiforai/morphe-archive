package io.sentry.util.thread;

/* loaded from: classes4.dex */
public final class b implements a {

    /* renamed from: a, reason: collision with root package name */
    public static final long f67835a = Thread.currentThread().getId();

    /* renamed from: b, reason: collision with root package name */
    public static final b f67836b = new b();

    @Override // io.sentry.util.thread.a
    public final boolean a() {
        return f67835a == Thread.currentThread().getId();
    }
}
