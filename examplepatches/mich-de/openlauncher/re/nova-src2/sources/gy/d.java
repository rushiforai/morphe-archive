package gy;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.b3;

/* loaded from: classes4.dex */
public final class d implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final d f58267b = new d(0);

    /* renamed from: c, reason: collision with root package name */
    public static final d f58268c = new d(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58269a;

    public /* synthetic */ d(int i5) {
        this.f58269a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x005e  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58269a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        b3.b(ex.i.A(), x7.f.Y(oVar, 2132019020), null, ((l1.d1) ((p1.t) oVar).j(l1.g1.f73330a)).f73148a, oVar, 0, 4);
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
                        b3.b(vh.a.v(), x7.f.Y(oVar2, 2132019021), null, ((l1.d1) ((p1.t) oVar2).j(l1.g1.f73330a)).f73148a, oVar2, 0, 4);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
