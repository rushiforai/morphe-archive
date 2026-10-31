package k00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.b3;
import p1.o;
import p1.t;
import p10.c0;
import wh.f;

/* loaded from: classes4.dex */
public final class d implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final d f70787b = new d(0);

    /* renamed from: c, reason: collision with root package name */
    public static final d f70788c = new d(1);

    /* renamed from: d, reason: collision with root package name */
    public static final d f70789d = new d(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70790a;

    public /* synthetic */ d(int i5) {
        this.f70790a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0079  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f70790a) {
            case 0:
                o oVar = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        b3.b(f.K(), x7.f.Y(oVar, 2132017229), null, 0L, oVar, 0, 12);
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
                        zg.a.n(null, true, oVar2, 48, 1);
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
                        b3.b(c0.G(), x7.f.Y(oVar3, 2132019504), null, 0L, oVar3, 0, 12);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
