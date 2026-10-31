package androidx.fragment.app;

import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import java.util.LinkedHashMap;

/* loaded from: classes2.dex */
public final class y1 implements h6.n, a7.h, h6.o1 {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f14718a;

    /* renamed from: b, reason: collision with root package name */
    public final h6.n1 f14719b;

    /* renamed from: c, reason: collision with root package name */
    public final w f14720c;

    /* renamed from: d, reason: collision with root package name */
    public h6.j1 f14721d;

    /* renamed from: e, reason: collision with root package name */
    public h6.c0 f14722e = null;

    /* renamed from: f, reason: collision with root package name */
    public a7.g f14723f = null;

    public y1(h0 h0Var, h6.n1 n1Var, w wVar) {
        this.f14718a = h0Var;
        this.f14719b = n1Var;
        this.f14720c = wVar;
    }

    public final void a(h6.s sVar) {
        this.f14722e.f(sVar);
    }

    public final void b() {
        if (this.f14722e == null) {
            this.f14722e = new h6.c0(this);
            c7.a aVar = new c7.a(this, new a7.f(this, 0));
            this.f14723f = new a7.g(aVar);
            aVar.d();
            this.f14720c.run();
        }
    }

    public final boolean c() {
        return this.f14722e != null;
    }

    public final void d() {
        this.f14722e.h(h6.t.f59442c);
    }

    @Override // h6.n
    public final k6.c getDefaultViewModelCreationExtras() {
        Application application;
        h0 h0Var = this.f14718a;
        Context applicationContext = h0Var.requireContext().getApplicationContext();
        while (true) {
            if (!(applicationContext instanceof ContextWrapper)) {
                application = null;
                break;
            }
            if (applicationContext instanceof Application) {
                application = (Application) applicationContext;
                break;
            }
            applicationContext = ((ContextWrapper) applicationContext).getBaseContext();
        }
        k6.d dVar = new k6.d(0);
        LinkedHashMap linkedHashMap = dVar.f71150a;
        if (application != null) {
            linkedHashMap.put(h6.i1.f59383d, application);
        }
        linkedHashMap.put(h6.y0.f59469a, h0Var);
        linkedHashMap.put(h6.y0.f59470b, this);
        if (h0Var.getArguments() != null) {
            linkedHashMap.put(h6.y0.f59471c, h0Var.getArguments());
        }
        return dVar;
    }

    @Override // h6.n
    public final h6.j1 getDefaultViewModelProviderFactory() {
        Application application;
        h0 h0Var = this.f14718a;
        h6.j1 defaultViewModelProviderFactory = h0Var.getDefaultViewModelProviderFactory();
        if (!defaultViewModelProviderFactory.equals(h0Var.mDefaultFactory)) {
            this.f14721d = defaultViewModelProviderFactory;
            return defaultViewModelProviderFactory;
        }
        if (this.f14721d == null) {
            Context applicationContext = h0Var.requireContext().getApplicationContext();
            while (true) {
                if (!(applicationContext instanceof ContextWrapper)) {
                    application = null;
                    break;
                }
                if (applicationContext instanceof Application) {
                    application = (Application) applicationContext;
                    break;
                }
                applicationContext = ((ContextWrapper) applicationContext).getBaseContext();
            }
            this.f14721d = new h6.b1(application, h0Var, h0Var.getArguments());
        }
        return this.f14721d;
    }

    @Override // h6.a0
    public final h6.u getLifecycle() {
        b();
        return this.f14722e;
    }

    @Override // a7.h
    public final a7.e getSavedStateRegistry() {
        b();
        return this.f14723f.f442b;
    }

    @Override // h6.o1
    public final h6.n1 getViewModelStore() {
        b();
        return this.f14719b;
    }
}
