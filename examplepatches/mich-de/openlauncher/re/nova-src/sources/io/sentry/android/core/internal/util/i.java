package io.sentry.android.core.internal.util;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes4.dex */
public final class i implements ViewTreeObserver.OnDrawListener {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f66959a = new Handler(Looper.getMainLooper());

    /* renamed from: b, reason: collision with root package name */
    public final AtomicReference f66960b;

    /* renamed from: c, reason: collision with root package name */
    public final io.sentry.android.core.d f66961c;

    public i(View view, io.sentry.android.core.d dVar) {
        this.f66960b = new AtomicReference(view);
        this.f66961c = dVar;
    }

    @Override // android.view.ViewTreeObserver.OnDrawListener
    public final void onDraw() {
        View view = (View) this.f66960b.getAndSet(null);
        if (view == null) {
            return;
        }
        view.getViewTreeObserver().addOnGlobalLayoutListener(new h(this, view));
        this.f66959a.postAtFrontOfQueue(this.f66961c);
    }
}
