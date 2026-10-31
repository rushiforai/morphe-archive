package h6;

import android.os.Bundle;
import java.util.Arrays;
import java.util.Map;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class z0 implements a7.d {

    /* renamed from: a, reason: collision with root package name */
    public final a7.e f59472a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f59473b;

    /* renamed from: c, reason: collision with root package name */
    public Bundle f59474c;

    /* renamed from: d, reason: collision with root package name */
    public final a70.d f59475d;

    public z0(a7.e savedStateRegistry, o1 viewModelStoreOwner) {
        Intrinsics.g(savedStateRegistry, "savedStateRegistry");
        Intrinsics.g(viewModelStoreOwner, "viewModelStoreOwner");
        this.f59472a = savedStateRegistry;
        this.f59475d = LazyKt.a(new a7.f(viewModelStoreOwner, 16));
    }

    @Override // a7.d
    public final Bundle a() {
        Bundle bundleA = w.b.a((Pair[]) Arrays.copyOf(new Pair[0], 0));
        zg.a.r(bundleA);
        Bundle bundle = this.f59474c;
        if (bundle != null) {
            zg.a.Q(bundleA, bundle);
        }
        for (Map.Entry entry : ((a1) this.f59475d.getValue()).f59327a.entrySet()) {
            String str = (String) entry.getKey();
            Bundle bundleA2 = ((u0) entry.getValue()).c().a();
            wh.f.D(bundleA2);
            if (!wh.f.V(bundleA2)) {
                zg.a.R(bundleA, str, bundleA2);
            }
        }
        this.f59473b = false;
        return bundleA;
    }

    public final void b() {
        if (this.f59473b) {
            return;
        }
        Bundle bundleA = this.f59472a.a("androidx.lifecycle.internal.SavedStateHandlesProvider");
        Bundle bundleA2 = w.b.a((Pair[]) Arrays.copyOf(new Pair[0], 0));
        zg.a.r(bundleA2);
        Bundle bundle = this.f59474c;
        if (bundle != null) {
            zg.a.Q(bundleA2, bundle);
        }
        if (bundleA != null) {
            zg.a.Q(bundleA2, bundleA);
        }
        this.f59474c = bundleA2;
        this.f59473b = true;
    }
}
