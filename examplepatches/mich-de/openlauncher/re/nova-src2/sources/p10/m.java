package p10;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;

/* loaded from: classes4.dex */
public final class m implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final m f81833b = new m(0);

    /* renamed from: c, reason: collision with root package name */
    public static final m f81834c = new m(1);

    /* renamed from: d, reason: collision with root package name */
    public static final m f81835d = new m(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81836a;

    public /* synthetic */ m(int i5) {
        this.f81836a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00c8  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f81836a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b("Redeem", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 6, 0, 131070);
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        g9.b("Cancel", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 6, 0, 131070);
                    }
                }
                break;
            default:
                p1.o oVar3 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar3 = (p1.t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b("Coming soon", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 6, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
