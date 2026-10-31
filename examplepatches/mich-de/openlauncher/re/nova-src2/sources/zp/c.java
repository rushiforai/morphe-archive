package zp;

/* loaded from: classes4.dex */
public final class c extends w.b {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ d f98586d;

    public c(d dVar) {
        this.f98586d = dVar;
    }

    @Override // w.b
    public final void onNavigationEvent(int i5) {
        if (i5 == 6) {
            d dVar = this.f98586d;
            if (dVar.f98592e) {
                dVar.dismiss();
            }
        }
    }
}
