package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l02 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final b.gb f6027a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f6028b;

    public /* synthetic */ l02(b.gb gbVar, int i5) {
        this.f6028b = i5;
        this.f6027a = gbVar;
    }

    @Override // b.gb
    public final b.gb a() {
        switch (this.f6028b) {
            case 0:
                return this.f6027a.a();
            default:
                return (t23) this.f6027a;
        }
    }

    @Override // b.gb
    public final int b() {
        switch (this.f6028b) {
            case 0:
                return this.f6027a.b();
            default:
                return 48;
        }
    }

    @Override // b.gb
    public final boolean c() {
        switch (this.f6028b) {
            case 0:
                return this.f6027a.c();
            default:
                return false;
        }
    }

    @Override // b.gb
    public final String d() {
        switch (this.f6028b) {
            case 0:
                return this.f6027a.d();
            default:
                return null;
        }
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        switch (this.f6028b) {
            case 0:
                return this.f6027a.a(tx0Var, map, continuation);
            default:
                return ((t23) this.f6027a).a(tx0Var, map, continuation);
        }
    }

    @Override // b.gb
    public final void a(String adKey) {
        switch (this.f6028b) {
            case 0:
                Intrinsics.g(adKey, "adKey");
                this.f6027a.a(adKey);
                break;
            default:
                Intrinsics.g(adKey, "adKey");
                ((t23) this.f6027a).a(adKey);
                break;
        }
    }
}
