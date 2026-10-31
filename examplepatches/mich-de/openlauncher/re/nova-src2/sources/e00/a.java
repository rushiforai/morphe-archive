package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50171a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p6.t f50172b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ cw.r3 f50173c;

    public /* synthetic */ a(p6.t tVar, cw.r3 r3Var, int i5, int i11) {
        this.f50171a = i11;
        this.f50172b = tVar;
        this.f50173c = r3Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f50171a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                p10.c0.a(this.f50172b, this.f50173c, oVar, p1.a0.l(385));
                break;
            case 1:
                r3.d(this.f50172b, this.f50173c, oVar, p1.a0.l(385));
                break;
            case 2:
                com.google.android.gms.internal.consent_sdk.k0.d(this.f50172b, this.f50173c, oVar, p1.a0.l(1));
                break;
            case 3:
                r00.o.b(this.f50172b, this.f50173c, oVar, p1.a0.l(385));
                break;
            case 4:
                u00.t.a(this.f50172b, this.f50173c, oVar, p1.a0.l(1));
                break;
            case 5:
                p50.i.c(this.f50172b, this.f50173c, oVar, p1.a0.l(1));
                break;
            default:
                x00.h.c(this.f50172b, this.f50173c, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
