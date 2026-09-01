package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class el implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ tl b;

    public /* synthetic */ el(tl tlVar, int i) {
        this.a = i;
        this.b = tlVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        tl tlVar = this.b;
        switch (i) {
            case 0:
                Object value = ((k49) tlVar.h).getValue();
                if (value != null) {
                    return value;
                }
                float fG = ((g49) tlVar.k).g();
                boolean zIsNaN = Float.isNaN(fG);
                k49 k49Var = (k49) tlVar.g;
                return !zIsNaN ? tlVar.d(fG, 0.0f, k49Var.getValue()) : k49Var.getValue();
            case 1:
                Object value2 = ((k49) tlVar.h).getValue();
                if (value2 != null) {
                    return value2;
                }
                float fG2 = ((g49) tlVar.k).g();
                boolean zIsNaN2 = Float.isNaN(fG2);
                k49 k49Var2 = (k49) tlVar.g;
                if (zIsNaN2) {
                    return k49Var2.getValue();
                }
                Object value3 = k49Var2.getValue();
                gh7 gh7VarG = tlVar.g();
                float fD = gh7VarG.d(value3);
                if (fD != fG2 && !Float.isNaN(fD)) {
                    if (fD < fG2) {
                        Object objB = gh7VarG.b(fG2, true);
                        if (objB != null) {
                            return objB;
                        }
                    } else {
                        Object objB2 = gh7VarG.b(fG2, false);
                        if (objB2 != null) {
                            return objB2;
                        }
                    }
                }
                return value3;
            case 2:
                return tlVar.g();
            default:
                return new f09(tlVar.g(), ((j83) tlVar.j).getValue());
        }
    }
}
