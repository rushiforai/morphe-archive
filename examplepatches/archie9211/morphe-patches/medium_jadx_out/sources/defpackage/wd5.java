package defpackage;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Scope;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wd5 extends mn0 {
    public final Set y;

    public wd5(Context context, Looper looper, int i, uz5 uz5Var, ce5 ce5Var, de5 de5Var) {
        rig rigVar;
        synchronized (rig.g) {
            try {
                rig rigVar2 = rig.h;
                if (rigVar2 == null) {
                    rigVar2 = new rig(context.getApplicationContext(), context.getMainLooper());
                    rig.h = rigVar2;
                }
                rigVar = rigVar2;
            } catch (Throwable th) {
                throw th;
            }
        }
        Object obj = ae5.d;
        vp7.p(ce5Var);
        vp7.p(de5Var);
        super(context, looper, rigVar, i, new eoc(ce5Var), new qlb(de5Var), (String) uz5Var.d);
        Set set = (Set) uz5Var.b;
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            if (!set.contains((Scope) it2.next())) {
                ygf.f("Expanding scopes is not permitted, use implied scopes instead");
                throw null;
            }
        }
        this.y = set;
    }
}
