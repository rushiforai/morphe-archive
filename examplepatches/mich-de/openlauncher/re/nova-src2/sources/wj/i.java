package wj;

/* loaded from: classes3.dex */
public final class i extends ps.j {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f94441b;

    public /* synthetic */ i(int i5) {
        this.f94441b = i5;
    }

    @Override // ps.j
    public final float h(Object obj) {
        switch (this.f94441b) {
            case 0:
                return ((j) obj).o.f94460b * 10000.0f;
            case 1:
                return ((x9.m) obj).f95668d;
            case 2:
                return ((za.l) obj).n;
            default:
                return ((za.l) obj).f98462p;
        }
    }

    @Override // ps.j
    public final void n(Object obj, float f11) {
        switch (this.f94441b) {
            case 0:
                j jVar = (j) obj;
                jVar.o.f94460b = f11 / 10000.0f;
                jVar.invalidateSelf();
                break;
            case 1:
                x9.m mVar = (x9.m) obj;
                mVar.f95668d = f11;
                mVar.f95665a.invalidate();
                break;
            case 2:
                za.l lVar = (za.l) obj;
                lVar.n = f11;
                lVar.invalidate();
                break;
            default:
                za.l lVar2 = (za.l) obj;
                lVar2.f98462p = f11;
                lVar2.invalidate();
                break;
        }
    }
}
