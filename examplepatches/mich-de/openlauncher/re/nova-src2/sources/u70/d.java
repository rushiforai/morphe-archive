package u70;

import android.os.Handler;
import android.os.Looper;
import b.c0;
import java.util.concurrent.CancellationException;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import pu.f0;
import s90.s0;
import t70.a1;
import t70.a2;
import t70.d2;
import t70.m;
import t70.m0;
import t70.r0;
import t70.y0;
import y70.o;

/* loaded from: classes.dex */
public final class d extends a2 implements r0 {

    /* renamed from: c, reason: collision with root package name */
    public final Handler f90670c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90671d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f90672e;

    /* renamed from: f, reason: collision with root package name */
    public final d f90673f;

    public d(Handler handler, String str, boolean z11) {
        this.f90670c = handler;
        this.f90671d = str;
        this.f90672e = z11;
        this.f90673f = z11 ? this : new d(handler, str, true);
    }

    @Override // t70.r0
    public final void V(long j11, m mVar) {
        s0 s0Var = new s0(5, mVar, this);
        if (j11 > 4611686018427387903L) {
            j11 = 4611686018427387903L;
        }
        if (this.f90670c.postDelayed(s0Var, j11)) {
            mVar.v(new f0(15, this, s0Var));
        } else {
            g0(mVar.f88824e, s0Var);
        }
    }

    @Override // t70.r0
    public final a1 a(long j11, final Runnable runnable, CoroutineContext coroutineContext) {
        if (j11 > 4611686018427387903L) {
            j11 = 4611686018427387903L;
        }
        if (this.f90670c.postDelayed(runnable, j11)) {
            return new a1() { // from class: u70.c
                @Override // t70.a1
                public final void dispose() {
                    this.f90668a.f90670c.removeCallbacks(runnable);
                }
            };
        }
        g0(coroutineContext, runnable);
        return d2.f88784a;
    }

    @Override // t70.c0
    public final void c0(CoroutineContext coroutineContext, Runnable runnable) {
        if (this.f90670c.post(runnable)) {
            return;
        }
        g0(coroutineContext, runnable);
    }

    @Override // t70.c0
    public final boolean e0(CoroutineContext coroutineContext) {
        return (this.f90672e && Intrinsics.b(Looper.myLooper(), this.f90670c.getLooper())) ? false : true;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return dVar.f90670c == this.f90670c && dVar.f90672e == this.f90672e;
    }

    public final void g0(CoroutineContext coroutineContext, Runnable runnable) {
        m0.g(coroutineContext, new CancellationException("The task was rejected, the handler underlying the dispatcher '" + this + "' was closed"));
        a80.e eVar = y0.f88884a;
        a80.d.f488c.c0(coroutineContext, runnable);
    }

    public final int hashCode() {
        return System.identityHashCode(this.f90670c) ^ (this.f90672e ? 1231 : 1237);
    }

    @Override // t70.c0
    public final String toString() {
        d dVar;
        String str;
        a80.e eVar = y0.f88884a;
        d dVar2 = o.f96819a;
        if (this == dVar2) {
            str = "Dispatchers.Main";
        } else {
            try {
                dVar = dVar2.f90673f;
            } catch (UnsupportedOperationException unused) {
                dVar = null;
            }
            str = this == dVar ? "Dispatchers.Main.immediate" : null;
        }
        if (str != null) {
            return str;
        }
        String string = this.f90671d;
        if (string == null) {
            string = this.f90670c.toString();
        }
        return this.f90672e ? c0.E(string, ".immediate") : string;
    }

    public d(Handler handler) {
        this(handler, null, false);
    }
}
