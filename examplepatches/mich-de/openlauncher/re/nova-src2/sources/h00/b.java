package h00;

import cl.l0;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.b3;
import l1.g9;
import p1.t;

/* loaded from: classes4.dex */
public final class b implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final b f58763b = new b(0);

    /* renamed from: c, reason: collision with root package name */
    public static final b f58764c = new b(1);

    /* renamed from: d, reason: collision with root package name */
    public static final b f58765d = new b(2);

    /* renamed from: e, reason: collision with root package name */
    public static final b f58766e = new b(3);

    /* renamed from: f, reason: collision with root package name */
    public static final b f58767f = new b(4);

    /* renamed from: g, reason: collision with root package name */
    public static final b f58768g = new b(5);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58769a;

    public /* synthetic */ b(int i5) {
        this.f58769a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0175  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58769a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        b3.b(wh.f.K(), null, null, 0L, oVar, 48, 12);
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar2 = (t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        ky.l.j(2132017238, 0, null, oVar2, 0, 6);
                    }
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar3 = (t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b(x7.f.Y(oVar3, 2132018103), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 0, 0, 131070);
                    }
                }
                break;
            case 3:
                p1.o oVar4 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar4 = (t) oVar4;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        g9.b(x7.f.Y(oVar4, 2132018103), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar4, 0, 0, 131070);
                    }
                }
                break;
            case 4:
                p1.o oVar5 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar5 = (t) oVar5;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        b3.b(l0.D(), x7.f.Y(oVar5, 2132017718), null, 0L, oVar5, 0, 12);
                    }
                }
                break;
            default:
                p1.o oVar6 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar6 = (t) oVar6;
                    if (tVar6.E()) {
                        tVar6.V();
                    } else {
                        g9.b(x7.f.Y(oVar6, 2132017747), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar6, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
