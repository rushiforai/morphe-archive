package defpackage;

import android.content.Context;
import com.google.android.datatransport.cct.CctBackendFactory;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pz7 {
    public final hx4 a;
    public final m50 b;
    public final HashMap c;

    public pz7(Context context, m50 m50Var) {
        hx4 hx4Var = new hx4(context, 21);
        this.c = new HashMap();
        this.a = hx4Var;
        this.b = m50Var;
    }

    public final synchronized msd a(String str) {
        if (this.c.containsKey(str)) {
            return (msd) this.c.get(str);
        }
        CctBackendFactory cctBackendFactoryU0 = this.a.U0(str);
        if (cctBackendFactoryU0 == null) {
            return null;
        }
        m50 m50Var = this.b;
        msd msdVarCreate = cctBackendFactoryU0.create(new fj0((Context) m50Var.d, (dp1) m50Var.b, (dp1) m50Var.c, str));
        this.c.put(str, msdVarCreate);
        return msdVarCreate;
    }
}
