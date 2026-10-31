package y7;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final p7.h f96753a;

    /* renamed from: b, reason: collision with root package name */
    public final p7.m f96754b;

    /* renamed from: c, reason: collision with root package name */
    public final x7.u f96755c;

    public n(p7.h processor, p7.m mVar, x7.u uVar) {
        Intrinsics.g(processor, "processor");
        this.f96753a = processor;
        this.f96754b = mVar;
        this.f96755c = uVar;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        this.f96753a.i(this.f96754b, this.f96755c);
    }
}
