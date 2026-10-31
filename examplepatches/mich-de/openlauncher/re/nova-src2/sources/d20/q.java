package d20;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;

/* loaded from: classes4.dex */
public final class q implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final q f48921b = new q(0);

    /* renamed from: c, reason: collision with root package name */
    public static final q f48922c = new q(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48923a;

    public /* synthetic */ q(int i5) {
        this.f48923a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0053  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f48923a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b(x7.f.Y(oVar, 2132018038), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
                    }
                }
                break;
            default:
                ((Number) obj).intValue();
                p1.o oVar2 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
