package rj;

/* loaded from: classes3.dex */
public final class g extends h {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f85983e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ j f85984f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g(j jVar, int i5) {
        super(jVar);
        this.f85983e = i5;
        this.f85984f = jVar;
    }

    @Override // rj.h
    public final float a() {
        float f11;
        float f12;
        switch (this.f85983e) {
            case 0:
                j jVar = this.f85984f;
                f11 = jVar.f85998g;
                f12 = jVar.f85999h;
                break;
            case 1:
                j jVar2 = this.f85984f;
                f11 = jVar2.f85998g;
                f12 = jVar2.f86000i;
                break;
            default:
                return this.f85984f.f85998g;
        }
        return f11 + f12;
    }
}
