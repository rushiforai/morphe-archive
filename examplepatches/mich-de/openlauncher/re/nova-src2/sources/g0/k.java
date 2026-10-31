package g0;

/* loaded from: classes.dex */
public final class k implements n1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l f56602a;

    public k(l lVar) {
        this.f56602a = lVar;
    }

    @Override // g0.n1
    public final float a(float f11) {
        if (Float.isNaN(f11)) {
            return 0.0f;
        }
        l lVar = this.f56602a;
        float fFloatValue = ((Number) lVar.f56613a.invoke(Float.valueOf(f11))).floatValue();
        ((p1.s2) lVar.f56617e).setValue(Boolean.valueOf(fFloatValue > 0.0f));
        ((p1.s2) lVar.f56618f).setValue(Boolean.valueOf(fFloatValue < 0.0f));
        return fFloatValue;
    }
}
