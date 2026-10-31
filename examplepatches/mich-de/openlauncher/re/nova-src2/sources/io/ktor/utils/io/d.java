package io.ktor.utils.io;

import kotlin.ExceptionsKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements e {

    /* renamed from: b, reason: collision with root package name */
    public final t70.m f66569b;

    /* renamed from: c, reason: collision with root package name */
    public final Throwable f66570c;

    public d(t70.m mVar) {
        this.f66569b = mVar;
        String property = System.getProperty("io.ktor.development");
        if (property == null || !Boolean.parseBoolean(property)) {
            return;
        }
        int iHashCode = mVar.hashCode();
        kotlin.text.a.a(16);
        String string = Integer.toString(iHashCode, 16);
        Intrinsics.f(string, "toString(...)");
        Throwable th2 = new Throwable("ReadTask 0x".concat(string));
        ExceptionsKt.b(th2);
        this.f66570c = th2;
    }

    @Override // io.ktor.utils.io.e
    public final void a(Throwable th2) {
        Object objA;
        Continuation continuationD = d();
        if (th2 != null) {
            int i5 = Result.f71687b;
            objA = ResultKt.a(th2);
        } else {
            g.f66579a.getClass();
            objA = b.f66554c;
        }
        ((t70.m) continuationD).resumeWith(objA);
    }

    @Override // io.ktor.utils.io.e
    public final void b() {
        Continuation continuationD = d();
        g.f66579a.getClass();
        ((t70.m) continuationD).resumeWith(b.f66554c);
    }

    @Override // io.ktor.utils.io.e
    public final Throwable c() {
        return this.f66570c;
    }

    public final Continuation d() {
        return this.f66569b;
    }
}
