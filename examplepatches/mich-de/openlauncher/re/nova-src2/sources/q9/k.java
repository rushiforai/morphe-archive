package q9;

import androidx.recyclerview.widget.i0;

/* loaded from: classes.dex */
public final class k extends i0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ m f83847d;

    public k(m mVar) {
        this.f83847d = mVar;
        this.f15000c = true;
    }

    @Override // androidx.recyclerview.widget.i0
    public final int c(int i5) {
        m mVar = this.f83847d;
        int i11 = ((j) mVar.f83851d.f83886f.get(i5)).f83842b;
        int i12 = mVar.f83852e.f14828b;
        if (m.g(i11, 65538)) {
            return i12 / mVar.f83856i;
        }
        u uVarF = mVar.f(i11);
        return uVarF != null ? i12 / uVarF.a(mVar.f83856i) : i12;
    }
}
