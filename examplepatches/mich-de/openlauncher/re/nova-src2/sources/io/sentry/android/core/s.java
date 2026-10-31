package io.sentry.android.core;

/* loaded from: classes4.dex */
public final class s implements io.sentry.hints.a, io.sentry.hints.k {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f67067a;

    public s(boolean z11) {
        this.f67067a = z11;
    }

    @Override // io.sentry.hints.a
    public final Long a() {
        return null;
    }

    @Override // io.sentry.hints.a
    public final boolean b() {
        return true;
    }

    @Override // io.sentry.hints.a
    public final String c() {
        return this.f67067a ? "anr_background" : "anr_foreground";
    }
}
