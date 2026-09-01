package defpackage;

import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g3b extends vld {
    @Override // defpackage.vld
    public final void h(int i, String str, Throwable th) {
        str.getClass();
        if (i < 5) {
            return;
        }
        ak4 ak4VarA = ak4.a();
        ak4VarA.b(str);
        if (th != null) {
            nc2 nc2Var = ak4VarA.a;
            Map map = Collections.EMPTY_MAP;
            ((ud2) nc2Var.o.b).a(new ho(nc2Var, th));
        }
    }
}
