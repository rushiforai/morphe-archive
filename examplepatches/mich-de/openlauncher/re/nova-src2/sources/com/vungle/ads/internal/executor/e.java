package com.vungle.ads.internal.executor;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends com.vungle.ads.internal.task.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Runnable f46829a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Runnable f46830b;

    public e(Runnable runnable, Runnable runnable2) {
        this.f46829a = runnable;
        this.f46830b = runnable2;
    }

    @Override // com.vungle.ads.internal.task.i
    public final int a() {
        return ((com.vungle.ads.internal.task.i) this.f46829a).a();
    }

    @Override // com.vungle.ads.internal.task.i, java.lang.Comparable
    public final int compareTo(Object other) {
        Intrinsics.g(other, "other");
        if (!(other instanceof com.vungle.ads.internal.task.i)) {
            return 0;
        }
        return Intrinsics.h(((com.vungle.ads.internal.task.i) other).a(), a());
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = j.f46834b;
        Runnable runnable = this.f46829a;
        Runnable runnable2 = this.f46830b;
        try {
            runnable.run();
        } catch (OutOfMemoryError unused) {
            runnable2.run();
        }
    }
}
