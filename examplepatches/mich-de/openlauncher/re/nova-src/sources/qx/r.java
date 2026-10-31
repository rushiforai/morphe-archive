package qx;

import android.content.Context;
import android.view.View;
import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public final l f84585a;

    /* renamed from: b, reason: collision with root package name */
    public final sx.j f84586b;

    /* renamed from: c, reason: collision with root package name */
    public final long f84587c = System.nanoTime();

    /* renamed from: d, reason: collision with root package name */
    public boolean f84588d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f84589e;

    /* renamed from: f, reason: collision with root package name */
    public String f84590f;

    /* renamed from: g, reason: collision with root package name */
    public Function0 f84591g;

    public r(l lVar, sx.j jVar) {
        this.f84585a = lVar;
        this.f84586b = jVar;
    }

    public final void a() {
        if (this.f84589e) {
            return;
        }
        this.f84589e = true;
        b();
    }

    public abstract void b();

    public boolean c() {
        return this.f84588d;
    }

    public abstract String d();

    public final boolean e() {
        return (System.nanoTime() - this.f84587c) / ((long) 1000000) > 3600000;
    }

    public final void f() {
        if (this.f84588d) {
            return;
        }
        this.f84588d = true;
        Function0 function0 = this.f84591g;
        if (function0 != null) {
            function0.invoke();
        }
    }

    public abstract View g(Context context, x0 x0Var, View view);
}
