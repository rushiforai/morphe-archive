package ky;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.b3;
import l1.g9;
import l1.s1;
import m3.p0;
import p1.t;
import p10.c0;

/* loaded from: classes4.dex */
public final class c implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final c f72764b = new c(0);

    /* renamed from: c, reason: collision with root package name */
    public static final c f72765c = new c(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72766a;

    public /* synthetic */ c(int i5) {
        this.f72766a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x007b  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f72766a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        o2.g gVarG = ic.b.G();
                        String strY = x7.f.Y(oVar, 2132019249);
                        t tVar2 = (t) oVar;
                        tVar2.b0(725624691);
                        long jB = ((p0) tVar2.j(g9.f73360a)).b();
                        if (jB == 16) {
                            jB = ((i2.s) tVar2.j(s1.f73932a)).f61148a;
                        }
                        long j11 = jB;
                        tVar2.p(false);
                        b3.b(gVarG, strY, null, j11, tVar2, 0, 4);
                    }
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar3 = (t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        o2.g gVarG2 = c0.G();
                        String strY2 = x7.f.Y(oVar2, 2132019504);
                        t tVar4 = (t) oVar2;
                        tVar4.b0(-554211147);
                        long jB2 = ((p0) tVar4.j(g9.f73360a)).b();
                        if (jB2 == 16) {
                            jB2 = ((i2.s) tVar4.j(s1.f73932a)).f61148a;
                        }
                        long j12 = jB2;
                        tVar4.p(false);
                        b3.b(gVarG2, strY2, null, j12, tVar4, 0, 4);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
