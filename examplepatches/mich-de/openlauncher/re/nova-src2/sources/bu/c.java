package bu;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18524a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f18525b;

    public /* synthetic */ c(Object obj, int i5) {
        this.f18524a = i5;
        this.f18525b = obj;
    }

    public final d a() {
        switch (this.f18524a) {
            case 0:
                b bVar = (b) this.f18525b;
                d dVar = new d(0);
                dVar.f18527b = s40.c.b(new au.e(bVar.f18503e0, 7));
                return dVar;
            case 1:
                vu.m mVar = (vu.m) this.f18525b;
                d dVar2 = new d(2);
                dVar2.f18527b = s40.c.b(new au.e(mVar.F, 7));
                return dVar2;
            default:
                vu.p pVar = (vu.p) this.f18525b;
                d dVar3 = new d(3);
                dVar3.f18527b = s40.c.b(new au.e(pVar.f93244n0, 7));
                return dVar3;
        }
    }
}
