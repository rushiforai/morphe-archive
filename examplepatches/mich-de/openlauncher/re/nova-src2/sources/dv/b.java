package dv;

import f1.e2;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class b implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final b f49593b = new b(0);

    /* renamed from: c, reason: collision with root package name */
    public static final b f49594c = new b(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49595a;

    public /* synthetic */ b(int i5) {
        this.f49595a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f49595a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    }
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        e2.a(ul.b.V(2131232199, oVar2, 0), x7.f.Y(oVar2, 2132019706), null, 0L, oVar2, 0, 12);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
