package o7;

import android.text.TextUtils;
import java.util.Collections;
import java.util.List;
import kl.q0;

/* loaded from: classes.dex */
public abstract class d0 {
    public final y a(f0 f0Var) {
        List listSingletonList = Collections.singletonList(f0Var);
        p7.s sVar = (p7.s) this;
        if (listSingletonList.isEmpty()) {
            throw new IllegalArgumentException("enqueue needs at least one WorkRequest.");
        }
        p7.n nVar = new p7.n(sVar, null, 2, listSingletonList, 0);
        if (nVar.f82362h) {
            r.c().f(p7.n.f82355j, "Already enqueued work ids (" + TextUtils.join(", ", nVar.f82360f) + ")");
        } else {
            q0 q0Var = new q0(6);
            sVar.f82375d.a(new y7.f(nVar, q0Var));
            nVar.f82363i = q0Var;
        }
        return nVar.f82363i;
    }
}
