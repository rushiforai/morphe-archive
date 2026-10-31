package androidx.fragment.app;

/* loaded from: classes2.dex */
public final class c0 implements u.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14502a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f14503b;

    public /* synthetic */ c0(Object obj, int i5) {
        this.f14502a = i5;
        this.f14503b = obj;
    }

    @Override // u.a
    public final Object apply() {
        switch (this.f14502a) {
            case 0:
                h0 h0Var = (h0) this.f14503b;
                Object obj = h0Var.mHost;
                return obj instanceof j.j ? ((j.j) obj).getActivityResultRegistry() : h0Var.requireActivity().getActivityResultRegistry();
            default:
                return (j.i) this.f14503b;
        }
    }
}
