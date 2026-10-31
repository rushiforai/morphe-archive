package r;

/* loaded from: classes2.dex */
public final class a0 extends i1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ f0 f84664j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ androidx.appcompat.widget.b f84665k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(androidx.appcompat.widget.b bVar, androidx.appcompat.widget.b bVar2, f0 f0Var) {
        super(bVar2);
        this.f84665k = bVar;
        this.f84664j = f0Var;
    }

    @Override // r.i1
    public final q.a0 b() {
        return this.f84664j;
    }

    @Override // r.i1
    public final boolean c() {
        androidx.appcompat.widget.b bVar = this.f84665k;
        g0 g0Var = bVar.f13836f;
        if (g0Var.isShowing()) {
            return true;
        }
        g0Var.h(bVar.getTextDirection(), bVar.getTextAlignment());
        return true;
    }
}
