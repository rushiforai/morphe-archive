package com.vungle.ads.internal;

import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f46738a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f46739b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c1 f46740c;

    public b1(c1 c1Var) {
        this.f46740c = c1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        z0 z0VarA;
        z0 z0VarA2;
        this.f46740c.f46759g = false;
        for (Map.Entry entry : this.f46740c.f46753a.entrySet()) {
            View view = (View) entry.getKey();
            if (c1.a(this.f46740c, view, ((a1) entry.getValue()).b())) {
                this.f46738a.add(view);
            } else {
                this.f46739b.add(view);
            }
        }
        Iterator it = this.f46738a.iterator();
        while (it.hasNext()) {
            View view2 = (View) it.next();
            a1 a1Var = (a1) this.f46740c.f46753a.get(view2);
            if (a1Var != null && (z0VarA2 = a1Var.a()) != null) {
                z0VarA2.onImpression(view2);
            }
            c1 c1Var = this.f46740c;
            Intrinsics.f(view2, "view");
            c1Var.a(view2);
        }
        this.f46738a.clear();
        Iterator it2 = this.f46739b.iterator();
        while (it2.hasNext()) {
            View view3 = (View) it2.next();
            a1 a1Var2 = (a1) this.f46740c.f46753a.get(view3);
            if (a1Var2 != null && (z0VarA = a1Var2.a()) != null) {
                z0VarA.onViewInvisible(view3);
            }
        }
        this.f46739b.clear();
        if (this.f46740c.f46753a.isEmpty() || this.f46740c.f46760h) {
            return;
        }
        c1.d(this.f46740c);
    }
}
