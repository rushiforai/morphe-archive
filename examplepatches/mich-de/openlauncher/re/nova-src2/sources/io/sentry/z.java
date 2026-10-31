package io.sentry;

import b.h9;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes4.dex */
public final class z {

    /* renamed from: g, reason: collision with root package name */
    public static final long f67929g = TimeUnit.HOURS.toMillis(5);

    /* renamed from: h, reason: collision with root package name */
    public static final long f67930h = TimeUnit.SECONDS.toMillis(1);

    /* renamed from: i, reason: collision with root package name */
    public static z f67931i;

    /* renamed from: a, reason: collision with root package name */
    public final long f67932a;

    /* renamed from: b, reason: collision with root package name */
    public volatile String f67933b;

    /* renamed from: c, reason: collision with root package name */
    public volatile long f67934c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f67935d;

    /* renamed from: e, reason: collision with root package name */
    public final h9 f67936e;

    /* renamed from: f, reason: collision with root package name */
    public final ExecutorService f67937f;

    public z() throws ExecutionException, InterruptedException, TimeoutException {
        h9 h9Var = new h9(4);
        this.f67935d = new AtomicBoolean(false);
        this.f67937f = Executors.newSingleThreadExecutor(new y(0));
        this.f67932a = f67929g;
        this.f67936e = h9Var;
        a();
    }

    public final void a() throws ExecutionException, InterruptedException, TimeoutException {
        try {
            this.f67937f.submit(new ab.e(this, 9)).get(f67930h, TimeUnit.MILLISECONDS);
        } catch (InterruptedException unused) {
            Thread.currentThread().interrupt();
            this.f67934c = TimeUnit.SECONDS.toMillis(1L) + System.currentTimeMillis();
        } catch (RuntimeException | ExecutionException | TimeoutException unused2) {
            this.f67934c = TimeUnit.SECONDS.toMillis(1L) + System.currentTimeMillis();
        }
    }
}
