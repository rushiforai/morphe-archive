package ads_mobile_sdk;

import java.util.Map;

/* loaded from: classes2.dex */
public final class aa implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final b.m5 f910a;

    /* renamed from: b, reason: collision with root package name */
    public final fn1 f911b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f912c;

    public /* synthetic */ aa(b.m5 m5Var, fn1 fn1Var, int i5) {
        this.f912c = i5;
        this.f910a = m5Var;
        this.f911b = fn1Var;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f912c) {
            case 0:
                return new z9((t70.j0) this.f910a.get(), (Map) this.f911b.get());
            case 1:
                return new is3((t70.j0) this.f910a.get(), (Map) this.f911b.get());
            default:
                return new ts3((t70.j0) this.f910a.get(), (Map) this.f911b.get());
        }
    }
}
