package fa;

import java.util.function.Predicate;

/* loaded from: classes2.dex */
public final /* synthetic */ class k0 implements Predicate {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54429a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ya.v f54430b;

    public /* synthetic */ k0(ya.v vVar, int i5) {
        this.f54429a = i5;
        this.f54430b = vVar;
    }

    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        ya.v vVar;
        ga.e eVar;
        switch (this.f54429a) {
            case 0:
                vVar = this.f54430b;
                eVar = (ga.e) obj;
                break;
            default:
                vVar = this.f54430b;
                eVar = (ga.j) obj;
                break;
        }
        return vVar.a(eVar);
    }
}
