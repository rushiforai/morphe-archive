package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dl implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sl b;

    public /* synthetic */ dl(sl slVar, int i) {
        this.a = i;
        this.b = slVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        sl slVar = this.b;
        switch (i) {
            case 0:
                Object value = slVar.k.getValue();
                if (value != null) {
                    return value;
                }
                float fG = slVar.i.g();
                boolean zIsNaN = Float.isNaN(fG);
                k49 k49Var = slVar.g;
                return !zIsNaN ? slVar.c(fG, 0.0f, k49Var.getValue()) : k49Var.getValue();
            case 1:
                Object value2 = slVar.k.getValue();
                if (value2 != null) {
                    return value2;
                }
                float fG2 = slVar.i.g();
                boolean zIsNaN2 = Float.isNaN(fG2);
                k49 k49Var2 = slVar.g;
                if (zIsNaN2) {
                    return k49Var2.getValue();
                }
                Object value3 = k49Var2.getValue();
                hh7 hh7VarD = slVar.d();
                float fC = hh7VarD.c(value3);
                if (fC != fG2 && !Float.isNaN(fC)) {
                    if (fC < fG2) {
                        Object objB = hh7VarD.b(fG2, true);
                        if (objB != null) {
                            return objB;
                        }
                    } else {
                        Object objB2 = hh7VarD.b(fG2, false);
                        if (objB2 != null) {
                            return objB2;
                        }
                    }
                }
                return value3;
            case 2:
                return slVar.d();
            case 3:
                return new f09(slVar.d(), slVar.h.getValue());
            case 4:
                return Float.valueOf(slVar.f());
            default:
                Boolean bool = (Boolean) slVar.g.getValue();
                bool.getClass();
                return bool;
        }
    }
}
