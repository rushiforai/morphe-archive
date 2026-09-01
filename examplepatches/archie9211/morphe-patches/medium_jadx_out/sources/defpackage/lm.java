package defpackage;

import android.graphics.Rect;
import android.util.SparseArray;
import android.view.autofill.AutofillId;
import android.view.autofill.AutofillValue;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lm extends tk0 implements uxb, kr4 {
    public final sk0 a;
    public final cyb b;
    public final mn c;
    public final cxa d;
    public final String e;
    public final Rect f = new Rect();
    public final AutofillId g;
    public final l68 h;
    public boolean i;

    public lm(sk0 sk0Var, cyb cybVar, mn mnVar, cxa cxaVar, String str) {
        this.a = sk0Var;
        this.b = cybVar;
        this.c = mnVar;
        this.d = cxaVar;
        this.e = str;
        mnVar.setImportantForAutofill(1);
        sk0 sk0VarI = fo7.I(mnVar);
        AutofillId autofillId = sk0VarI != null ? (AutofillId) sk0VarI.a : null;
        if (autofillId == null) {
            throw lv8.v("Required value was null.");
        }
        this.g = autofillId;
        this.h = new l68();
    }

    @Override // defpackage.kr4
    public final void a(es4 es4Var, es4 es4Var2) {
        aq6 aq6VarV0;
        txb txbVarX;
        aq6 aq6VarV02;
        txb txbVarX2;
        if (es4Var != null && (aq6VarV02 = flb.v0(es4Var)) != null && (txbVarX2 = aq6VarV02.x()) != null) {
            f78 f78Var = txbVarX2.a;
            if (f78Var.b(sxb.g) || f78Var.b(sxb.h)) {
                this.a.d(this.c, aq6VarV02.b);
            }
        }
        if (es4Var2 == null || (aq6VarV0 = flb.v0(es4Var2)) == null || (txbVarX = aq6VarV0.x()) == null) {
            return;
        }
        f78 f78Var2 = txbVarX.a;
        if (f78Var2.b(sxb.g) || f78Var2.b(sxb.h)) {
            int i = aq6VarV0.b;
            this.d.b.G(i, new jm(this, i));
        }
    }

    public final void b(SparseArray sparseArray) {
        txb txbVarX;
        x45 x45Var;
        x45 x45Var2;
        int size = sparseArray.size();
        for (int i = 0; i < size; i++) {
            int iKeyAt = sparseArray.keyAt(i);
            AutofillValue autofillValueA = j34.a(sparseArray.get(iKeyAt));
            aq6 aq6Var = (aq6) this.b.c.b(iKeyAt);
            if (aq6Var != null && (txbVarX = aq6Var.x()) != null) {
                f78 f78Var = txbVarX.a;
                Object objG = f78Var.g(sxb.g);
                if (objG == null) {
                    objG = null;
                }
                i4 i4Var = (i4) objG;
                if (i4Var != null && (x45Var2 = (x45) i4Var.b) != null) {
                }
                Object objG2 = f78Var.g(sxb.h);
                i4 i4Var2 = (i4) (objG2 != null ? objG2 : null);
                if (i4Var2 != null && (x45Var = (x45) i4Var2.b) != null) {
                }
            }
        }
    }
}
