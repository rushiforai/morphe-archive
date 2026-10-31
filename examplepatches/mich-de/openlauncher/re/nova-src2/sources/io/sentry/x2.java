package io.sentry;

import java.util.concurrent.Callable;

/* loaded from: classes4.dex */
public final /* synthetic */ class x2 implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67908a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ io.sentry.internal.debugmeta.c f67909b;

    public /* synthetic */ x2(io.sentry.internal.debugmeta.c cVar, int i5) {
        this.f67908a = i5;
        this.f67909b = cVar;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.f67908a) {
            case 0:
                return Integer.valueOf(this.f67909b.v().length);
            case 1:
                return this.f67909b.v();
            case 2:
                return Integer.valueOf(this.f67909b.v().length);
            case 3:
                return this.f67909b.v();
            case 4:
                return Integer.valueOf(this.f67909b.v().length);
            case 5:
                return this.f67909b.v();
            case 6:
                return Integer.valueOf(this.f67909b.v().length);
            case 7:
                return this.f67909b.v();
            case 8:
                return Integer.valueOf(this.f67909b.v().length);
            case 9:
                return this.f67909b.v();
            case 10:
                return Integer.valueOf(this.f67909b.v().length);
            default:
                return this.f67909b.v();
        }
    }
}
