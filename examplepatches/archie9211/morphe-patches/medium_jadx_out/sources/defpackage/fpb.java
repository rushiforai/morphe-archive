package defpackage;

import android.os.Bundle;
import java.util.Arrays;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fpb {
    public final gpb a;
    public final epb b;

    public fpb(gpb gpbVar) {
        this.a = gpbVar;
        this.b = new epb(gpbVar);
    }

    public final void a(Bundle bundle) {
        gpb gpbVar = this.a;
        hpb hpbVar = gpbVar.a;
        if (!gpbVar.e) {
            gpbVar.a();
        }
        if (((ky6) hpbVar.getLifecycle()).d.isAtLeast(vx6.STARTED)) {
            lg8.m("performRestore cannot be called when owner is ", ((ky6) hpbVar.getLifecycle()).d);
            return;
        }
        if (gpbVar.g) {
            ygf.f("SavedStateRegistry was already restored.");
            return;
        }
        Bundle bundle2 = null;
        if (bundle != null && bundle.containsKey("androidx.lifecycle.BundlableSavedStateRegistry.key")) {
            Bundle bundle3 = bundle.getBundle("androidx.lifecycle.BundlableSavedStateRegistry.key");
            if (bundle3 == null) {
                wo7.q("androidx.lifecycle.BundlableSavedStateRegistry.key");
                throw null;
            }
            bundle2 = bundle3;
        }
        gpbVar.f = bundle2;
        gpbVar.g = true;
    }

    public final void b(Bundle bundle) {
        gpb gpbVar = this.a;
        Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
        Bundle bundle2 = gpbVar.f;
        if (bundle2 != null) {
            bundleE.putAll(bundle2);
        }
        synchronized (gpbVar.c) {
            for (Map.Entry entry : gpbVar.d.entrySet()) {
                String str = (String) entry.getKey();
                Bundle bundleA = ((dpb) entry.getValue()).a();
                str.getClass();
                bundleE.putBundle(str, bundleA);
            }
        }
        if (bundleE.isEmpty()) {
            return;
        }
        bundle.putBundle("androidx.lifecycle.BundlableSavedStateRegistry.key", bundleE);
    }
}
