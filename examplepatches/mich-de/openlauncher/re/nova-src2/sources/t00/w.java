package t00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class w implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88419a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h f88420b;

    public /* synthetic */ w(h hVar, int i5) {
        this.f88419a = i5;
        this.f88420b = hVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        v2.t tVar = (v2.t) obj;
        h2.b bVar = (h2.b) obj2;
        switch (this.f88419a) {
            case 0:
                tVar.a();
                this.f88420b.c(bVar.f59016a);
                break;
            default:
                tVar.a();
                this.f88420b.c(bVar.f59016a);
                break;
        }
        return Unit.f71706a;
    }
}
