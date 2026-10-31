package rs;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class a implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f86146b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f86147c = new a(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86148a;

    public /* synthetic */ a(int i5) {
        this.f86148a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0044  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f86148a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        ps.c.d(o.f86244a, oVar, 6);
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
                        ps.c.d(o.f86244a, oVar2, 6);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
