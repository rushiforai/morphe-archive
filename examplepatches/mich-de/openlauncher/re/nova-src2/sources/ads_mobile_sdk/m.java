package ads_mobile_sdk;

import b.q2;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final fn1 f6994a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f6995b;

    public /* synthetic */ m(fn1 fn1Var, int i5) {
        this.f6995b = i5;
        this.f6994a = fn1Var;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f6995b) {
            case 0:
                return new l((Map) this.f6994a.get());
            case 1:
                Map gmsgHandlers = (Map) this.f6994a.get();
                Intrinsics.g(gmsgHandlers, "gmsgHandlers");
                return new k02(3, gmsgHandlers);
            case 2:
                Map gmsgHandlers2 = (Map) this.f6994a.get();
                Intrinsics.g(gmsgHandlers2, "gmsgHandlers");
                return new dz1(5, gmsgHandlers2);
            case 3:
                Map gmsgHandlers3 = (Map) this.f6994a.get();
                Intrinsics.g(gmsgHandlers3, "gmsgHandlers");
                return new dz1(2, gmsgHandlers3);
            case 4:
                return new b.n3((Map) this.f6994a.get());
            case 5:
                return new h5((Map) this.f6994a.get());
            case 6:
                Map modifiers = (Map) this.f6994a.get();
                Intrinsics.g(modifiers, "modifiers");
                return new q2(modifiers);
            case 7:
                Map gmsgHandlers4 = (Map) this.f6994a.get();
                Intrinsics.g(gmsgHandlers4, "gmsgHandlers");
                return new k02(2, gmsgHandlers4);
            case 8:
                Map gmsgHandlers5 = (Map) this.f6994a.get();
                Intrinsics.g(gmsgHandlers5, "gmsgHandlers");
                return new k02(0, gmsgHandlers5);
            case 9:
                Map modifiers2 = (Map) this.f6994a.get();
                Intrinsics.g(modifiers2, "modifiers");
                return new q2(modifiers2);
            case 10:
                Map gmsgHandlers6 = (Map) this.f6994a.get();
                Intrinsics.g(gmsgHandlers6, "gmsgHandlers");
                return new k02(1, gmsgHandlers6);
            default:
                Map modifiers3 = (Map) this.f6994a.get();
                Intrinsics.g(modifiers3, "modifiers");
                return new q2(modifiers3);
        }
    }
}
