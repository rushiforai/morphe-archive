package com.vungle.ads.internal.executor;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f implements h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Runnable f46831a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Runnable f46832b;

    public f(Runnable runnable, Runnable runnable2) {
        this.f46831a = runnable;
        this.f46832b = runnable2;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object other) {
        Intrinsics.g(other, "other");
        Runnable runnable = this.f46831a;
        if (runnable instanceof com.vungle.ads.internal.task.i) {
            return ((com.vungle.ads.internal.task.i) runnable).compareTo(other);
        }
        return 0;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = j.f46834b;
        Runnable runnable = this.f46831a;
        Runnable runnable2 = this.f46832b;
        try {
            runnable.run();
        } catch (OutOfMemoryError unused) {
            runnable2.run();
        }
    }
}
