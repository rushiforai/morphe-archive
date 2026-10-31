package io.sentry.android.core.internal.util;

import android.os.Looper;

/* loaded from: classes4.dex */
public final class d implements io.sentry.util.thread.a {

    /* renamed from: a, reason: collision with root package name */
    public static final d f66948a = new d();

    @Override // io.sentry.util.thread.a
    public final boolean a() {
        return Looper.getMainLooper().getThread().getId() == Thread.currentThread().getId();
    }
}
