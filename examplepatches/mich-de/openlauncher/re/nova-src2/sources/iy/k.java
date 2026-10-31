package iy;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;

/* loaded from: classes4.dex */
public final class k implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final k f68291b = new k(0);

    /* renamed from: c, reason: collision with root package name */
    public static final k f68292c = new k(1);

    /* renamed from: d, reason: collision with root package name */
    public static final k f68293d = new k(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68294a;

    public /* synthetic */ k(int i5) {
        this.f68294a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00e7  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f68294a) {
            case 0:
                long j11 = ((i2.s) obj).f61148a;
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p1.t) oVar).e(j11) ? 4 : 2;
                }
                if ((iIntValue & 19) == 18) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b("A", null, j11, w20.h.j(20), null, q3.b0.f83535i, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, ((iIntValue << 6) & 896) | 199686, 0, 131026);
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
                        g9.b(x7.f.Y(oVar2, 17039360), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 0, 0, 131070);
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
                        g9.b(x7.f.Y(oVar3, 17039370), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
