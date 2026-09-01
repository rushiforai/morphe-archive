package defpackage;

import android.view.autofill.AutofillId;
import android.view.autofill.AutofillManager;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hm implements lk0 {
    public final mn a;
    public final uk0 b;
    public final AutofillManager c;
    public final AutofillId d;

    public hm(mn mnVar, uk0 uk0Var) {
        this.a = mnVar;
        this.b = uk0Var;
        AutofillManager autofillManager = (AutofillManager) mnVar.getContext().getSystemService(AutofillManager.class);
        if (autofillManager != null) {
            this.c = autofillManager;
            mnVar.setImportantForAutofill(1);
            sk0 sk0VarI = fo7.I(mnVar);
            AutofillId autofillId = sk0VarI != null ? (AutofillId) sk0VarI.a : null;
            if (autofillId != null) {
                this.d = autofillId;
                return;
            }
            throw lv8.v(fiHTiFJ.SnkViV);
        }
        ygf.f("Autofill service could not be located.");
        throw null;
    }
}
