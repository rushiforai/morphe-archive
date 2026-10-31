package h6;

import android.os.Bundle;
import android.view.View;
import b.i8;
import java.util.Arrays;
import java.util.LinkedHashMap;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;

/* loaded from: classes.dex */
public abstract class y0 {

    /* renamed from: a, reason: collision with root package name */
    public static final br.a f59469a = new br.a(7);

    /* renamed from: b, reason: collision with root package name */
    public static final br.c f59470b = new br.c();

    /* renamed from: c, reason: collision with root package name */
    public static final b50.d f59471c = new b50.d();

    public static final u0 a(k6.c cVar) {
        Intrinsics.g(cVar, "<this>");
        a7.h hVar = (a7.h) cVar.a(f59469a);
        if (hVar == null) {
            throw new IllegalArgumentException("CreationExtras must have a value by `SAVED_STATE_REGISTRY_OWNER_KEY`");
        }
        o1 o1Var = (o1) cVar.a(f59470b);
        if (o1Var == null) {
            throw new IllegalArgumentException("CreationExtras must have a value by `VIEW_MODEL_STORE_OWNER_KEY`");
        }
        Bundle bundle = (Bundle) cVar.a(f59471c);
        String str = (String) cVar.a(m1.f59408b);
        if (str == null) {
            throw new IllegalArgumentException("CreationExtras must have a value by `VIEW_MODEL_KEY`");
        }
        a7.d dVarB = hVar.getSavedStateRegistry().f437a.b();
        Bundle bundle2 = null;
        z0 z0Var = dVarB instanceof z0 ? (z0) dVarB : null;
        if (z0Var == null) {
            throw new IllegalStateException("enableSavedStateHandles() wasn't called prior to createSavedStateHandle() call");
        }
        LinkedHashMap linkedHashMap = e(o1Var).f59327a;
        u0 u0Var = (u0) linkedHashMap.get(str);
        if (u0Var != null) {
            return u0Var;
        }
        z0Var.b();
        Bundle bundle3 = z0Var.f59474c;
        if (bundle3 != null) {
            wh.f.D(bundle3);
            if (wh.f.E(str, bundle3)) {
                wh.f.D(bundle3);
                Bundle bundleS = wh.f.S(str, bundle3);
                if (bundleS == null) {
                    bundleS = w.b.a((Pair[]) Arrays.copyOf(new Pair[0], 0));
                    zg.a.r(bundleS);
                }
                zg.a.r(bundle3);
                zg.a.T(str, bundle3);
                wh.f.D(bundle3);
                if (wh.f.V(bundle3)) {
                    z0Var.f59474c = null;
                }
                bundle2 = bundleS;
            }
        }
        u0 u0VarD = g1.d(bundle2, bundle);
        linkedHashMap.put(str, u0VarD);
        return u0VarD;
    }

    public static final void b(a7.h hVar) {
        Intrinsics.g(hVar, "<this>");
        t tVarB = hVar.getLifecycle().b();
        if (tVarB != t.f59441b && tVarB != t.f59442c) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (hVar.getSavedStateRegistry().f437a.b() == null) {
            z0 z0Var = new z0(hVar.getSavedStateRegistry(), (o1) hVar);
            hVar.getSavedStateRegistry().b("androidx.lifecycle.internal.SavedStateHandlesProvider", z0Var);
            hVar.getLifecycle().a(new v0(z0Var));
        }
    }

    public static final a0 c(View view) {
        Intrinsics.g(view, "<this>");
        while (view != null) {
            Object tag = view.getTag(2131429158);
            a0 a0Var = tag instanceof a0 ? (a0) tag : null;
            if (a0Var != null) {
                return a0Var;
            }
            Object objF = zg.a.F(view);
            view = objF instanceof View ? (View) objF : null;
        }
        return null;
    }

    public static final o1 d(View view) {
        Intrinsics.g(view, "<this>");
        while (view != null) {
            Object tag = view.getTag(2131429161);
            o1 o1Var = tag instanceof o1 ? (o1) tag : null;
            if (o1Var != null) {
                return o1Var;
            }
            Object objF = zg.a.F(view);
            view = objF instanceof View ? (View) objF : null;
        }
        return null;
    }

    public static final a1 e(o1 o1Var) {
        Intrinsics.g(o1Var, "<this>");
        m1 m1VarT = i8.t(o1Var, new x0(), 4);
        KClass modelClass = Reflection.f71864a.getOrCreateKotlinClass(a1.class);
        Intrinsics.g(modelClass, "modelClass");
        return (a1) m1VarT.f59409a.m(modelClass, "androidx.lifecycle.internal.SavedStateHandlesVM");
    }

    public static final void f(View view, a0 a0Var) {
        Intrinsics.g(view, "<this>");
        view.setTag(2131429158, a0Var);
    }

    public static final void g(View view, o1 o1Var) {
        Intrinsics.g(view, "<this>");
        view.setTag(2131429161, o1Var);
    }
}
