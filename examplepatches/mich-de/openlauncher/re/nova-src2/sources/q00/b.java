package q00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.g9;
import p1.o;
import p1.t;

/* loaded from: classes4.dex */
public final class b implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final b f83327b = new b(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83328a;

    public /* synthetic */ b(int i5) {
        this.f83328a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0075  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f83328a) {
            case 0:
                o oVar = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        ky.l.j(2132019297, 0, null, oVar, 0, 6);
                    }
                }
                break;
            default:
                o oVar2 = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar2 = (t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        g9.b(x7.f.Y(oVar2, 2132019315), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
