package m00;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;
import m3.p0;

/* loaded from: classes4.dex */
public final class a implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f75516b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f75517c = new a(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75518a;

    public /* synthetic */ a(int i5) {
        this.f75518a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007f  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f75518a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        String strY = x7.f.Y(oVar, 2132017603);
                        p1.t tVar2 = (p1.t) oVar;
                        g9.b(strY, null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, p0.a((p0) tVar2.j(g9.f73360a), 0L, w20.h.j(14), q3.b0.f83533g, null, 0L, 0, 0L, null, null, 16777209), tVar2, 0, 0, 65534);
                    }
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar3 = (p1.t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b(x7.f.Y(oVar2, 2132019501), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
