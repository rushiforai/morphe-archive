package defpackage;

import android.content.Context;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yec {
    public static final /* synthetic */ AtomicReference a = new AtomicReference(null);

    public static final gx5 a(Context context) {
        gx5 gx5Var;
        gx5 gx5Var2;
        AtomicReference atomicReference = a;
        Object obj = atomicReference.get();
        gx5 gx5Var3 = obj instanceof gx5 ? (gx5) obj : null;
        if (gx5Var3 != null) {
            return gx5Var3;
        }
        gx5 gx5VarA = null;
        while (true) {
            Object obj2 = atomicReference.get();
            if (obj2 instanceof gx5) {
                gx5Var = (gx5) obj2;
                gx5Var2 = gx5VarA;
            } else {
                if (gx5VarA == null) {
                    xec xecVar = obj2 instanceof xec ? (xec) obj2 : null;
                    if (xecVar != null) {
                        gx5VarA = xecVar.a(context);
                    } else {
                        Object applicationContext = context.getApplicationContext();
                        xec xecVar2 = applicationContext instanceof xec ? (xec) applicationContext : null;
                        gx5VarA = xecVar2 != null ? xecVar2.a(context) : afc.a.a(context);
                    }
                }
                gx5Var = gx5VarA;
                gx5Var2 = gx5Var;
            }
            while (!atomicReference.compareAndSet(obj2, gx5Var)) {
                if (atomicReference.get() != obj2) {
                    break;
                }
            }
            return gx5Var;
            gx5VarA = gx5Var2;
        }
    }
}
