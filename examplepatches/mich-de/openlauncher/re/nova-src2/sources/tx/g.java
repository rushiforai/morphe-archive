package tx;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.g9;

/* loaded from: classes4.dex */
public final class g implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final g f89743b = new g(0);

    /* renamed from: c, reason: collision with root package name */
    public static final g f89744c = new g(1);

    /* renamed from: d, reason: collision with root package name */
    public static final g f89745d = new g(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f89746a;

    public /* synthetic */ g(int i5) {
        this.f89746a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0095  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f89746a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        l1.b3.b(p10.c0.G(), x7.f.Y(oVar, 2132018889), androidx.compose.foundation.layout.e.o(b2.r.f17024a, 22), i2.s.b(0.6f, i2.s.f61140f), oVar, 3456, 0);
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    }
                }
                break;
            default:
                p1.o oVar3 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar3 = (p1.t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b(x7.f.Y(oVar3, 2132018820), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
