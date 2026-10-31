package y0;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function5;
import p1.t;

/* loaded from: classes2.dex */
public final class h implements Function5 {

    /* renamed from: b, reason: collision with root package name */
    public static final h f96523b = new h(0);

    /* renamed from: c, reason: collision with root package name */
    public static final h f96524c = new h(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96525a;

    public /* synthetic */ h(int i5) {
        this.f96525a = i5;
    }

    @Override // kotlin.jvm.functions.Function5
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        int i5;
        int i11;
        switch (this.f96525a) {
            case 0:
                w0.g gVar = (w0.g) obj;
                a1.k kVar = (a1.k) obj2;
                Function0 function0 = (Function0) obj3;
                p1.o oVar = (p1.o) obj4;
                int iIntValue = ((Number) obj5).intValue();
                if ((iIntValue & 6) == 0) {
                    i5 = ((iIntValue & 8) == 0 ? ((t) oVar).f(gVar) : ((t) oVar).h(gVar) ? 4 : 2) | iIntValue;
                } else {
                    i5 = iIntValue;
                }
                if ((iIntValue & 48) == 0) {
                    i5 |= (iIntValue & 64) == 0 ? ((t) oVar).f(kVar) : ((t) oVar).h(kVar) ? 32 : 16;
                }
                if ((iIntValue & 384) == 0) {
                    i5 |= ((t) oVar).h(function0) ? 256 : 128;
                }
                t tVar = (t) oVar;
                if (tVar.S(i5 & 1, (i5 & 1171) != 1170)) {
                    l.c(gVar, kVar, function0, tVar, i5 & 1022);
                } else {
                    tVar.V();
                }
                break;
            default:
                w0.g gVar2 = (w0.g) obj;
                a1.k kVar2 = (a1.k) obj2;
                Function0 function02 = (Function0) obj3;
                p1.o oVar2 = (p1.o) obj4;
                int iIntValue2 = ((Number) obj5).intValue();
                if ((iIntValue2 & 6) == 0) {
                    i11 = ((iIntValue2 & 8) == 0 ? ((t) oVar2).f(gVar2) : ((t) oVar2).h(gVar2) ? 4 : 2) | iIntValue2;
                } else {
                    i11 = iIntValue2;
                }
                if ((iIntValue2 & 48) == 0) {
                    i11 |= (iIntValue2 & 64) == 0 ? ((t) oVar2).f(kVar2) : ((t) oVar2).h(kVar2) ? 32 : 16;
                }
                if ((iIntValue2 & 384) == 0) {
                    i11 |= ((t) oVar2).h(function02) ? 256 : 128;
                }
                t tVar2 = (t) oVar2;
                if (tVar2.S(i11 & 1, (i11 & 1171) != 1170)) {
                    l.c(gVar2, kVar2, function02, tVar2, i11 & 1022);
                } else {
                    tVar2.V();
                }
                break;
        }
        return Unit.f71706a;
    }
}
