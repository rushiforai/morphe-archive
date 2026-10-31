package a20;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.b3;
import l1.d1;
import l1.g1;
import l1.g9;
import p1.o;
import p1.t;

/* loaded from: classes4.dex */
public final class a implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f118b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f119c = new a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f120d = new a(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f121a;

    public /* synthetic */ a(int i5) {
        this.f121a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00a6  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f121a) {
            case 0:
                o oVar = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b(x7.f.Y(oVar, 2132017694), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
                    }
                }
                break;
            case 1:
                o oVar2 = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar2 = (t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        b3.b(ex.i.A(), x7.f.Y(oVar2, 2132019020), null, ((d1) ((t) oVar2).j(g1.f73330a)).f73148a, oVar2, 0, 4);
                    }
                }
                break;
            default:
                o oVar3 = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar3 = (t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        b3.b(vh.a.v(), x7.f.Y(oVar3, 2132019021), null, ((d1) ((t) oVar3).j(g1.f73330a)).f73148a, oVar3, 0, 4);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
