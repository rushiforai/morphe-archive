package c7;

import a7.d;
import a7.f;
import a7.h;
import android.os.Bundle;
import b6.b;
import c3.m3;
import h6.t;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final h f19817a;

    /* renamed from: b, reason: collision with root package name */
    public final f f19818b;

    /* renamed from: e, reason: collision with root package name */
    public boolean f19821e;

    /* renamed from: f, reason: collision with root package name */
    public Bundle f19822f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f19823g;

    /* renamed from: c, reason: collision with root package name */
    public final b f19819c = new b();

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f19820d = new LinkedHashMap();

    /* renamed from: h, reason: collision with root package name */
    public boolean f19824h = true;

    public a(h hVar, f fVar) {
        this.f19817a = hVar;
        this.f19818b = fVar;
    }

    public final Bundle a(String key) {
        Intrinsics.g(key, "key");
        if (!this.f19823g) {
            throw new IllegalStateException("You can 'consumeRestoredStateForKey' only after the corresponding component has moved to the 'CREATED' state");
        }
        Bundle bundle = this.f19822f;
        if (bundle == null) {
            return null;
        }
        Bundle bundleR = bundle.containsKey(key) ? wh.f.R(key, bundle) : null;
        bundle.remove(key);
        if (bundle.isEmpty()) {
            this.f19822f = null;
        }
        return bundleR;
    }

    public final d b() {
        d dVar;
        synchronized (this.f19819c) {
            Iterator it = this.f19820d.entrySet().iterator();
            do {
                dVar = null;
                if (!it.hasNext()) {
                    break;
                }
                Map.Entry entry = (Map.Entry) it.next();
                String str = (String) entry.getKey();
                d dVar2 = (d) entry.getValue();
                if (Intrinsics.b(str, "androidx.lifecycle.internal.SavedStateHandlesProvider")) {
                    dVar = dVar2;
                }
            } while (dVar == null);
        }
        return dVar;
    }

    public final boolean c() {
        return this.f19824h;
    }

    public final void d() {
        h hVar = this.f19817a;
        if (hVar.getLifecycle().b() != t.f59441b) {
            throw new IllegalStateException("Restarter must be created only during owner's initialization stage");
        }
        if (this.f19821e) {
            throw new IllegalStateException("SavedStateRegistry was already attached.");
        }
        this.f19818b.invoke();
        hVar.getLifecycle().a(new m3(this, 1));
        this.f19821e = true;
    }

    public final void e(Bundle bundle) {
        if (!this.f19821e) {
            d();
        }
        h hVar = this.f19817a;
        if (hVar.getLifecycle().b().compareTo(t.f59443d) >= 0) {
            throw new IllegalStateException(("performRestore cannot be called when owner is " + hVar.getLifecycle().b()).toString());
        }
        if (this.f19823g) {
            throw new IllegalStateException("SavedStateRegistry was already restored.");
        }
        Bundle bundleR = null;
        if (bundle != null && bundle.containsKey("androidx.lifecycle.BundlableSavedStateRegistry.key")) {
            bundleR = wh.f.R("androidx.lifecycle.BundlableSavedStateRegistry.key", bundle);
        }
        this.f19822f = bundleR;
        this.f19823g = true;
    }

    public final void f(Bundle bundle) {
        Bundle bundleA = w.b.a((Pair[]) Arrays.copyOf(new Pair[0], 0));
        Bundle bundle2 = this.f19822f;
        if (bundle2 != null) {
            bundleA.putAll(bundle2);
        }
        synchronized (this.f19819c) {
            try {
                for (Map.Entry entry : this.f19820d.entrySet()) {
                    zg.a.R(bundleA, (String) entry.getKey(), ((d) entry.getValue()).a());
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (bundleA.isEmpty()) {
            return;
        }
        zg.a.R(bundle, "androidx.lifecycle.BundlableSavedStateRegistry.key", bundleA);
    }

    public final void g(String str, d provider) {
        Intrinsics.g(provider, "provider");
        synchronized (this.f19819c) {
            if (this.f19820d.containsKey(str)) {
                throw new IllegalArgumentException("SavedStateProvider with the given key is already registered");
            }
            this.f19820d.put(str, provider);
            Unit unit = Unit.f71706a;
        }
    }

    public final void h(String str) {
        synchronized (this.f19819c) {
        }
    }
}
