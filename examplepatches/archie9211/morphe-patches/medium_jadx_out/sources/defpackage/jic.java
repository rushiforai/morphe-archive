package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class jic implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;
    public final /* synthetic */ oya c;
    public final /* synthetic */ xrb d;
    public final /* synthetic */ x45 e;

    public /* synthetic */ jic(float f, oya oyaVar, xrb xrbVar, x45 x45Var, int i) {
        this.a = i;
        this.b = f;
        this.c = oyaVar;
        this.d = xrbVar;
        this.e = x45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        float fA;
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.e;
        xrb xrbVar = this.d;
        oya oyaVar = this.c;
        float f = this.b;
        vw vwVar = (vw) obj;
        switch (i) {
            case 0:
                float fAbs = Math.abs(((Number) vwVar.e.getValue()).floatValue());
                float fAbs2 = Math.abs(f);
                k49 k49Var = vwVar.e;
                if (fAbs < fAbs2) {
                    en7.j(vwVar, xrbVar, x45Var, ((Number) k49Var.getValue()).floatValue() - oyaVar.a);
                    oyaVar.a = ((Number) k49Var.getValue()).floatValue();
                } else {
                    float fP = en7.p(((Number) k49Var.getValue()).floatValue(), f);
                    en7.j(vwVar, xrbVar, x45Var, fP - oyaVar.a);
                    vwVar.a();
                    oyaVar.a = fP;
                }
                break;
            default:
                float fP2 = en7.p(((Number) vwVar.e.getValue()).floatValue(), f);
                float f2 = fP2 - oyaVar.a;
                try {
                    fA = xrbVar.a(f2);
                } catch (CancellationException unused) {
                    vwVar.a();
                    fA = 0.0f;
                }
                x45Var.invoke(Float.valueOf(fA));
                if (Math.abs(f2 - fA) > 0.5f || fP2 != ((Number) vwVar.e.getValue()).floatValue()) {
                    vwVar.a();
                }
                oyaVar.a += fA;
                break;
        }
        return c1eVar;
    }
}
