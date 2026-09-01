package defpackage;

import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Bundle;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w25 implements pi5, hpb, wue {
    public final j15 a;
    public final vue b;
    public final v0 c;
    public uue d;
    public ky6 e = null;
    public fpb f = null;

    public w25(j15 j15Var, vue vueVar, v0 v0Var) {
        this.a = j15Var;
        this.b = vueVar;
        this.c = v0Var;
    }

    public final void a(ux6 ux6Var) {
        this.e.e(ux6Var);
    }

    public final void b() {
        if (this.e == null) {
            this.e = new ky6(this, true);
            gpb gpbVar = new gpb(this, new i5b(14, this));
            this.f = new fpb(gpbVar);
            gpbVar.a();
            this.c.run();
        }
    }

    @Override // defpackage.pi5
    public final qg2 getDefaultViewModelCreationExtras() {
        Application application;
        j15 j15Var = this.a;
        Context applicationContext = j15Var.S().getApplicationContext();
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
        g68 g68Var = new g68(0);
        LinkedHashMap linkedHashMap = g68Var.a;
        if (application != null) {
            linkedHashMap.put(tue.f, application);
        }
        linkedHashMap.put(kyd.i, j15Var);
        linkedHashMap.put(kyd.j, this);
        Bundle bundle = j15Var.f;
        if (bundle != null) {
            linkedHashMap.put(kyd.k, bundle);
        }
        return g68Var;
    }

    @Override // defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        Application application;
        j15 j15Var = this.a;
        uue defaultViewModelProviderFactory = j15Var.getDefaultViewModelProviderFactory();
        if (!defaultViewModelProviderFactory.equals(j15Var.R)) {
            this.d = defaultViewModelProviderFactory;
            return defaultViewModelProviderFactory;
        }
        uue uueVar = this.d;
        if (uueVar != null) {
            return uueVar;
        }
        Context applicationContext = j15Var.S().getApplicationContext();
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
        ipb ipbVar = new ipb(application, j15Var, j15Var.f);
        this.d = ipbVar;
        return ipbVar;
    }

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        b();
        return this.e;
    }

    @Override // defpackage.hpb
    public final epb getSavedStateRegistry() {
        b();
        return this.f.b;
    }

    @Override // defpackage.wue
    public final vue getViewModelStore() {
        b();
        return this.b;
    }
}
