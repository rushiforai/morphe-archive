package ads_mobile_sdk;

import b.o0;
import b.q6;
import b.t1;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class f00 implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final fn1 f3118a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f3119b;

    public /* synthetic */ f00(fn1 fn1Var, int i5) {
        this.f3119b = i5;
        this.f3118a = fn1Var;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f3119b) {
            case 0:
                Map modifiers = (Map) this.f3118a.get();
                Intrinsics.g(modifiers, "modifiers");
                return new t1(modifiers);
            case 1:
                Map modifiers2 = (Map) this.f3118a.get();
                Intrinsics.g(modifiers2, "modifiers");
                return new o0(modifiers2);
            case 2:
                Map gmsgHandlers = (Map) this.f3118a.get();
                Intrinsics.g(gmsgHandlers, "gmsgHandlers");
                return new dz1(0, gmsgHandlers);
            case 3:
                Map gmsgHandlers2 = (Map) this.f3118a.get();
                Intrinsics.g(gmsgHandlers2, "gmsgHandlers");
                return new dz1(1, gmsgHandlers2);
            case 4:
                Map gmsgHandlers3 = (Map) this.f3118a.get();
                Intrinsics.g(gmsgHandlers3, "gmsgHandlers");
                return new dz1(3, gmsgHandlers3);
            case 5:
                Map modifiers3 = (Map) this.f3118a.get();
                Intrinsics.g(modifiers3, "modifiers");
                return new o0(modifiers3);
            case 6:
                Map modifiers4 = (Map) this.f3118a.get();
                Intrinsics.g(modifiers4, "modifiers");
                return new q6(modifiers4);
            default:
                Map modifiers5 = (Map) this.f3118a.get();
                Intrinsics.g(modifiers5, "modifiers");
                return new o0(modifiers5);
        }
    }
}
