package a60;

import io.ktor.utils.io.p0;
import io.ktor.utils.io.q0;
import io.ktor.utils.io.t;
import java.io.IOException;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.i0;
import t70.m0;
import t70.q1;
import t70.r1;
import t70.s1;

/* loaded from: classes.dex */
public final class e implements t {

    /* renamed from: b, reason: collision with root package name */
    public final e80.c f422b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f423c;

    /* renamed from: d, reason: collision with root package name */
    public q0 f424d;

    /* renamed from: e, reason: collision with root package name */
    public final e80.a f425e;

    /* renamed from: f, reason: collision with root package name */
    public final s1 f426f;

    /* renamed from: g, reason: collision with root package name */
    public final CoroutineContext f427g;

    public e(e80.c cVar, CoroutineContext parent) {
        Intrinsics.g(parent, "parent");
        this.f422b = cVar;
        this.f423c = parent;
        this.f425e = new e80.a();
        s1 s1Var = new s1((r1) parent.get(q1.f88853a));
        this.f426f = s1Var;
        this.f427g = parent.plus(s1Var).plus(new i0("RawSourceChannel"));
    }

    @Override // io.ktor.utils.io.t
    public final void a(Throwable th2) {
        if (this.f424d != null) {
            return;
        }
        String message = th2.getMessage();
        if (message == null) {
            message = "Channel was cancelled";
        }
        m0.h(this.f426f, message, th2);
        this.f422b.close();
        String message2 = th2.getMessage();
        this.f424d = new q0(new IOException(message2 != null ? message2 : "Channel was cancelled", th2));
    }

    @Override // io.ktor.utils.io.t
    public final Throwable b() {
        q0 q0Var = this.f424d;
        if (q0Var != null) {
            return q0Var.a(p0.f66630d);
        }
        return null;
    }

    @Override // io.ktor.utils.io.t
    public final e80.a f() {
        return this.f425e;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.ktor.utils.io.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(int i5, ContinuationImpl continuationImpl) {
        c cVar;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i11 = cVar.f418w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                cVar.f418w = i11 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj = cVar.f416u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = cVar.f418w;
        if (i12 == 0) {
            ResultKt.b(obj);
            if (this.f424d != null) {
                return Boolean.TRUE;
            }
            d dVar = new d(this, i5, null, 0);
            cVar.f415t = i5;
            cVar.f418w = 1;
            if (m0.y(this.f427g, dVar, cVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = cVar.f415t;
            ResultKt.b(obj);
        }
        return Boolean.valueOf(v4.a.k(this.f425e) >= ((long) i5));
    }

    @Override // io.ktor.utils.io.t
    public final boolean h() {
        return this.f424d != null && this.f425e.N();
    }
}
