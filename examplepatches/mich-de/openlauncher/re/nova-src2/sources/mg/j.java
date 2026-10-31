package mg;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import sg.w;

/* loaded from: classes3.dex */
public abstract class j extends BasePendingResult {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(qg.i iVar) {
        super(iVar);
        w.i(iVar, "GoogleApiClient must not be null");
        w.i(jg.a.f69554a, "Api must not be null");
    }

    public abstract void E(qg.c cVar);

    public final void F(Status status) {
        w.a("Failed result must not be success", !status.d());
        C(z(status));
    }
}
