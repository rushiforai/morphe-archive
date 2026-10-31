package x8;

import a5.e0;
import android.os.Looper;
import android.view.View;
import h6.z;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import t70.l1;
import t70.m0;
import t70.r1;
import t70.y0;

/* loaded from: classes.dex */
public final class u implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final View f95381a;

    /* renamed from: b, reason: collision with root package name */
    public e0 f95382b;

    /* renamed from: c, reason: collision with root package name */
    public r1 f95383c;

    /* renamed from: d, reason: collision with root package name */
    public t f95384d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f95385e;

    public u(View view) {
        this.f95381a = view;
    }

    public final synchronized void a() {
        try {
            r1 r1Var = this.f95383c;
            Continuation continuation = null;
            if (r1Var != null) {
                r1Var.c(null);
            }
            l1 l1Var = l1.f88818a;
            a80.e eVar = y0.f88884a;
            this.f95383c = m0.t(l1Var, y70.o.f96819a.f90673f, null, new x00.f(this, continuation, 1), 2);
            this.f95382b = null;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized e0 b() {
        e0 e0Var = this.f95382b;
        if (e0Var != null && Intrinsics.b(Looper.myLooper(), Looper.getMainLooper()) && this.f95385e) {
            this.f95385e = false;
            return e0Var;
        }
        r1 r1Var = this.f95383c;
        if (r1Var != null) {
            r1Var.c(null);
        }
        this.f95383c = null;
        e0 e0Var2 = new e0(this.f95381a);
        this.f95382b = e0Var2;
        return e0Var2;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        t tVar = this.f95384d;
        if (tVar == null) {
            return;
        }
        this.f95385e = true;
        tVar.f95376a.b(tVar.f95377b);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        t tVar = this.f95384d;
        if (tVar != null) {
            h6.u uVar = tVar.f95379d;
            tVar.f95380e.c(null);
            z8.c cVar = tVar.f95378c;
            if (cVar instanceof z) {
                uVar.c((z) cVar);
            }
            uVar.c(tVar);
        }
    }
}
