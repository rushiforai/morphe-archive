package ads_mobile_sdk;

import b.k9;
import java.util.Optional;

/* loaded from: classes.dex */
public final class p80 implements b.m5 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f8127a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f8128b;

    public /* synthetic */ p80(r80 r80Var, int i5) {
        this.f8128b = i5;
        this.f8127a = r80Var;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f8128b) {
            case 0:
                return new u80(((r80) this.f8127a).f8952a);
            case 1:
                return new u80(((r80) this.f8127a).f8952a);
            default:
                return Optional.of(((b.m5) this.f8127a).get());
        }
    }

    public p80(b.m5 m5Var) {
        this.f8128b = 2;
        k9.y(m5Var);
        this.f8127a = m5Var;
    }
}
