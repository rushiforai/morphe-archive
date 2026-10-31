package h0;

import g0.n1;
import java.util.concurrent.CancellationException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;
import p1.s2;

/* loaded from: classes2.dex */
public final /* synthetic */ class i implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58744a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f58745b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f58746c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ n1 f58747d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f58748e;

    public /* synthetic */ i(float f11, Ref.FloatRef floatRef, n1 n1Var, Function1 function1, int i5) {
        this.f58744a = i5;
        this.f58745b = f11;
        this.f58746c = floatRef;
        this.f58747d = n1Var;
        this.f58748e = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        float fA;
        switch (this.f58744a) {
            case 0:
                c0.l lVar = (c0.l) obj;
                s2 s2Var = (s2) lVar.f18861e;
                float fAbs = Math.abs(((Number) s2Var.getValue()).floatValue());
                float f11 = this.f58745b;
                float fAbs2 = Math.abs(f11);
                Ref.FloatRef floatRef = this.f58746c;
                n1 n1Var = this.f58747d;
                Function1 function1 = this.f58748e;
                if (fAbs >= fAbs2) {
                    float fD = l.d(((Number) s2Var.getValue()).floatValue(), f11);
                    l.c(lVar, n1Var, function1, fD - floatRef.f71860a);
                    lVar.a();
                    floatRef.f71860a = fD;
                } else {
                    l.c(lVar, n1Var, function1, ((Number) s2Var.getValue()).floatValue() - floatRef.f71860a);
                    floatRef.f71860a = ((Number) s2Var.getValue()).floatValue();
                }
                break;
            default:
                n1 n1Var2 = this.f58747d;
                c0.l lVar2 = (c0.l) obj;
                float fD2 = l.d(((Number) ((s2) lVar2.f18861e).getValue()).floatValue(), this.f58745b);
                Ref.FloatRef floatRef2 = this.f58746c;
                float f12 = fD2 - floatRef2.f71860a;
                try {
                    fA = n1Var2.a(f12);
                } catch (CancellationException unused) {
                    lVar2.a();
                    fA = 0.0f;
                }
                this.f58748e.invoke(Float.valueOf(fA));
                if (Math.abs(f12 - fA) > 0.5f || fD2 != ((Number) ((s2) lVar2.f18861e).getValue()).floatValue()) {
                    lVar2.a();
                }
                floatRef2.f71860a += fA;
                break;
        }
        return Unit.f71706a;
    }
}
