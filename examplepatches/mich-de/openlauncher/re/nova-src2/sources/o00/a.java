package o00;

import i2.s;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.b3;
import l1.g9;
import l1.s1;
import p1.o;
import p1.t;

/* loaded from: classes4.dex */
public final class a implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f78854b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f78855c = new a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f78856d = new a(2);

    /* renamed from: e, reason: collision with root package name */
    public static final a f78857e = new a(3);

    /* renamed from: f, reason: collision with root package name */
    public static final a f78858f = new a(4);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78859a;

    public /* synthetic */ a(int i5) {
        this.f78859a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0134  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f78859a) {
            case 0:
                o oVar = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b(x7.f.Y(oVar, 2132017791), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
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
                        g9.b("Body", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 6, 0, 131070);
                    }
                }
                break;
            case 2:
                o oVar3 = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar3 = (t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        t tVar4 = (t) oVar3;
                        g9.b("What's on your mind?", null, s.b(0.5f, ((s) tVar4.j(s1.f73932a)).f61148a), 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar4, 6, 0, 131066);
                    }
                }
                break;
            case 3:
                o oVar4 = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar5 = (t) oVar4;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        b3.a(ul.b.V(2131231457, oVar4, 0), null, null, 0L, oVar4, 48, 12);
                    }
                }
                break;
            default:
                o oVar5 = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar6 = (t) oVar5;
                    if (tVar6.E()) {
                        tVar6.V();
                    } else {
                        b3.b(ic.b.L(), x7.f.Y(oVar5, 2132019514), null, 0L, oVar5, 0, 12);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
