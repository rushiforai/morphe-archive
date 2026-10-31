package io.sentry.cache;

import io.sentry.android.core.SentryAndroidOptions;
import io.sentry.i0;
import io.sentry.w3;

/* loaded from: classes4.dex */
public final class d implements i0 {

    /* renamed from: a, reason: collision with root package name */
    public final w3 f67163a;

    public d(SentryAndroidOptions sentryAndroidOptions) {
        this.f67163a = sentryAndroidOptions;
    }

    public final void a(String str) {
        a.a(this.f67163a, ".options-cache", str);
    }

    public final void b(Object obj, String str) {
        a.c(this.f67163a, obj, ".options-cache", str);
    }
}
