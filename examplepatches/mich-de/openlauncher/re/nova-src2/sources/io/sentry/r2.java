package io.sentry;

import io.sentry.exception.ExceptionMechanismException;
import java.util.AbstractMap;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/* loaded from: classes4.dex */
public abstract class r2 {

    /* renamed from: a, reason: collision with root package name */
    public io.sentry.protocol.u f67682a;

    /* renamed from: b, reason: collision with root package name */
    public final io.sentry.protocol.c f67683b;

    /* renamed from: c, reason: collision with root package name */
    public io.sentry.protocol.s f67684c;

    /* renamed from: d, reason: collision with root package name */
    public io.sentry.protocol.o f67685d;

    /* renamed from: e, reason: collision with root package name */
    public AbstractMap f67686e;

    /* renamed from: f, reason: collision with root package name */
    public String f67687f;

    /* renamed from: g, reason: collision with root package name */
    public String f67688g;

    /* renamed from: h, reason: collision with root package name */
    public String f67689h;

    /* renamed from: i, reason: collision with root package name */
    public io.sentry.protocol.f0 f67690i;

    /* renamed from: j, reason: collision with root package name */
    public transient Throwable f67691j;

    /* renamed from: k, reason: collision with root package name */
    public String f67692k;

    /* renamed from: l, reason: collision with root package name */
    public String f67693l;

    /* renamed from: m, reason: collision with root package name */
    public List f67694m;
    public io.sentry.protocol.e n;
    public AbstractMap o;

    public r2(io.sentry.protocol.u uVar) {
        this.f67683b = new io.sentry.protocol.c();
        this.f67682a = uVar;
    }

    public final Throwable a() {
        Throwable th2 = this.f67691j;
        return th2 instanceof ExceptionMechanismException ? ((ExceptionMechanismException) th2).f67214b : th2;
    }

    public final void b(String str, String str2) {
        if (this.f67686e == null) {
            this.f67686e = new HashMap();
        }
        this.f67686e.put(str, str2);
    }

    public r2() {
        this(new io.sentry.protocol.u((UUID) null));
    }
}
