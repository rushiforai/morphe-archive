package ads_mobile_sdk;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ka implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final b.m5 f5620a;

    /* renamed from: b, reason: collision with root package name */
    public final fn1 f5621b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f5622c;

    public /* synthetic */ ka(b.m5 m5Var, fn1 fn1Var, int i5) {
        this.f5622c = i5;
        this.f5620a = m5Var;
        this.f5621b = fn1Var;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f5622c) {
            case 0:
                return new ja((t70.j0) this.f5620a.get(), (Map) this.f5621b.get());
            case 1:
                t70.j0 uiScope = (t70.j0) this.f5620a.get();
                Map listeners = (Map) this.f5621b.get();
                Intrinsics.g(uiScope, "uiScope");
                Intrinsics.g(listeners, "listeners");
                return new b.oa(uiScope, listeners);
            default:
                t70.j0 uiScope2 = (t70.j0) this.f5620a.get();
                Map listeners2 = (Map) this.f5621b.get();
                Intrinsics.g(uiScope2, "uiScope");
                Intrinsics.g(listeners2, "listeners");
                return new b.sb(uiScope2, listeners2);
        }
    }
}
