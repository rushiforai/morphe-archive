package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ai2 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public Object f997a;

    /* renamed from: b, reason: collision with root package name */
    public final b.gb f998b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f999c;

    public ai2(z1 adConfiguration, b.gb gbVar, int i5) {
        this.f999c = i5;
        switch (i5) {
            case 1:
                Intrinsics.g(adConfiguration, "adConfiguration");
                this.f998b = gbVar;
                k61 k61Var = adConfiguration.I;
                this.f997a = k61Var != null ? k61Var.f5523e : null;
                break;
            default:
                this.f997a = adConfiguration;
                this.f998b = gbVar;
                break;
        }
    }

    @Override // b.gb
    public final b.gb a() {
        switch (this.f999c) {
        }
        return this.f998b.a();
    }

    @Override // b.gb
    public final int b() {
        switch (this.f999c) {
        }
        return this.f998b.b();
    }

    @Override // b.gb
    public final boolean c() {
        switch (this.f999c) {
        }
        return this.f998b.c();
    }

    @Override // b.gb
    public final String d() {
        switch (this.f999c) {
            case 0:
                k61 k61Var = ((z1) this.f997a).I;
                if (k61Var != null) {
                    return k61Var.f5523e;
                }
                return null;
            default:
                return (String) this.f997a;
        }
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        switch (this.f999c) {
        }
        return this.f998b.a(tx0Var, map, continuation);
    }

    @Override // b.gb
    public final void a(String adKey) {
        switch (this.f999c) {
            case 0:
                Intrinsics.g(adKey, "adKey");
                this.f998b.a(adKey);
                break;
            default:
                Intrinsics.g(adKey, "adKey");
                this.f997a = adKey;
                break;
        }
    }
}
