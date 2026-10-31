package io.sentry.util;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public volatile Object f67826a = null;

    /* renamed from: b, reason: collision with root package name */
    public final b f67827b;

    public c(b bVar) {
        this.f67827b = bVar;
    }

    public final Object a() {
        if (this.f67826a == null) {
            synchronized (this) {
                try {
                    if (this.f67826a == null) {
                        this.f67826a = this.f67827b.a();
                    }
                } finally {
                }
            }
        }
        return this.f67826a;
    }
}
