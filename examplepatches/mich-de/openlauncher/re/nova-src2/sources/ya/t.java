package ya;

import android.content.ComponentName;

/* loaded from: classes2.dex */
public final /* synthetic */ class t implements v {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f97210b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ v f97211c;

    public /* synthetic */ t(v vVar, int i5) {
        this.f97210b = i5;
        this.f97211c = vVar;
    }

    @Override // ya.v
    public final boolean b(ga.e eVar, ComponentName componentName) {
        switch (this.f97210b) {
            case 0:
                return (eVar instanceof ga.c) && ((ga.c) eVar).H.stream().anyMatch(new fa.k0(this.f97211c, 1));
            default:
                return !this.f97211c.b(eVar, componentName);
        }
    }
}
