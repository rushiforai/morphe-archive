package ads_mobile_sdk;

import b.f9;
import b.o;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class bc1 implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final rg0 f1367a;

    /* renamed from: b, reason: collision with root package name */
    public final fn1 f1368b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f1369c;

    public /* synthetic */ bc1(rg0 rg0Var, fn1 fn1Var, int i5) {
        this.f1369c = i5;
        this.f1367a = rg0Var;
        this.f1368b = fn1Var;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f1369c) {
            case 0:
                t70.j0 backgroundScope = (t70.j0) this.f1367a.get();
                Map listeners = (Map) this.f1368b.get();
                Intrinsics.g(backgroundScope, "backgroundScope");
                Intrinsics.g(listeners, "listeners");
                return new o(backgroundScope, listeners);
            case 1:
                t70.j0 backgroundScope2 = (t70.j0) this.f1367a.get();
                Map listeners2 = (Map) this.f1368b.get();
                Intrinsics.g(backgroundScope2, "backgroundScope");
                Intrinsics.g(listeners2, "listeners");
                return new b.y7(backgroundScope2, listeners2);
            default:
                t70.j0 backgroundScope3 = (t70.j0) this.f1367a.get();
                Map listeners3 = (Map) this.f1368b.get();
                Intrinsics.g(backgroundScope3, "backgroundScope");
                Intrinsics.g(listeners3, "listeners");
                return new f9(backgroundScope3, listeners3);
        }
    }
}
