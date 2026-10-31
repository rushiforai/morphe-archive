package x00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import ky.l;
import l1.b3;
import p1.o;
import p1.t;

/* loaded from: classes4.dex */
public final class b implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final b f94908b = new b(0);

    /* renamed from: c, reason: collision with root package name */
    public static final b f94909c = new b(1);

    /* renamed from: d, reason: collision with root package name */
    public static final b f94910d = new b(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94911a;

    public /* synthetic */ b(int i5) {
        this.f94911a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x007b  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f94911a) {
            case 0:
                o oVar = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        l.j(2132017701, 2132017702, null, oVar, 0, 4);
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
                        l.j(2132017190, 2132017703, null, oVar2, 0, 4);
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
                        b3.b(ic.b.L(), "Share", null, 0L, oVar3, 48, 12);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
