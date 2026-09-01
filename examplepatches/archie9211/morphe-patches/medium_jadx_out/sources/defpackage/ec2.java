package defpackage;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ec2 {
    public static final Set a = Collections.newSetFromMap(new WeakHashMap());
    public static boolean b;

    public static final void a(Object obj, Throwable th) {
        obj.getClass();
        if (b) {
            a.add(obj);
            f94 f94Var = f94.a;
            if (mme.c()) {
                flb.g0(th);
                vv2.u(th, x36.CrashShield).b();
            }
        }
    }
}
