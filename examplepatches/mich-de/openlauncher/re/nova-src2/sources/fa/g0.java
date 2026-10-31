package fa;

import java.util.function.Supplier;

/* loaded from: classes2.dex */
public final /* synthetic */ class g0 implements Supplier {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54410a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p0 f54411b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ga.e f54412c;

    public /* synthetic */ g0(p0 p0Var, ga.e eVar, int i5) {
        this.f54410a = i5;
        this.f54411b = p0Var;
        this.f54412c = eVar;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        switch (this.f54410a) {
            case 0:
                ya.b bVar = new ya.b(this.f54411b.f54455a);
                ga.e eVar = this.f54412c;
                bVar.h(Integer.valueOf(eVar.f57291c), "container");
                bVar.j("cellX", Float.valueOf(eVar.f57293e.a()));
                bVar.j("cellY", Float.valueOf(eVar.f57294f.a()));
                bVar.h(Integer.valueOf(eVar.f57299k), "rank");
                bVar.h(Integer.valueOf(eVar.f57292d), "screen");
                bVar.h(Integer.valueOf(eVar.f57302p), "zOrder");
                bVar.f(eVar.f57303q);
                return bVar;
            case 1:
                ya.b bVar2 = new ya.b(this.f54411b.f54455a);
                this.f54412c.C(bVar2);
                return bVar2;
            default:
                ya.b bVar3 = new ya.b(this.f54411b.f54455a);
                ga.e eVar2 = this.f54412c;
                bVar3.h(Integer.valueOf(eVar2.f57291c), "container");
                bVar3.j("cellX", Float.valueOf(eVar2.f57293e.a()));
                bVar3.j("cellY", Float.valueOf(eVar2.f57294f.a()));
                bVar3.h(Integer.valueOf(eVar2.f57299k), "rank");
                bVar3.j("spanX", Float.valueOf(eVar2.f57295g.a()));
                bVar3.j("spanY", Float.valueOf(eVar2.f57296h.a()));
                bVar3.h(Integer.valueOf(eVar2.f57292d), "screen");
                bVar3.f(eVar2.f57303q);
                return bVar3;
        }
    }
}
