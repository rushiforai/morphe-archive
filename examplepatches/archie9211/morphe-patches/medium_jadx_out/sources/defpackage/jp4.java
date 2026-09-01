package defpackage;

import androidx.work.impl.yX.VrhD;
import kotlinx.coroutines.flow.internal.AbortFlowException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class jp4 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rya b;

    public /* synthetic */ jp4(rya ryaVar, int i) {
        this.a = i;
        this.b = ryaVar;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        rya ryaVar = this.b;
        switch (i) {
            case 0:
                ryaVar.a = obj;
                throw new AbortFlowException(this);
            case 1:
                ryaVar.a = obj;
                throw new AbortFlowException(this);
            default:
                if (ryaVar.a == flb.i) {
                    ryaVar.a = obj;
                    return c1e.a;
                }
                ay0.e(VrhD.TzVoV);
                return null;
        }
    }
}
