package eb0;

import java.lang.reflect.Type;

/* loaded from: classes5.dex */
public final class i implements f {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52566a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f52567b;

    public /* synthetic */ i(int i5, Type type) {
        this.f52566a = i5;
        this.f52567b = type;
    }

    @Override // eb0.f
    public final Type c() {
        switch (this.f52566a) {
        }
        return this.f52567b;
    }

    @Override // eb0.f
    public final Object i(y yVar) {
        switch (this.f52566a) {
            case 0:
                j jVar = new j(yVar);
                yVar.s(new h(jVar, 0));
                return jVar;
            default:
                j jVar2 = new j(yVar);
                yVar.s(new h(jVar2, 1));
                return jVar2;
        }
    }
}
