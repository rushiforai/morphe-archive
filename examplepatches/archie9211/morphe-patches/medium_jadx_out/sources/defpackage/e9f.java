package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e9f {
    public static final e9f b;
    public v60 a;

    static {
        e9f e9fVar = new e9f();
        e9fVar.a = null;
        b = e9fVar;
    }

    public static v60 a(Context context) {
        v60 v60Var;
        e9f e9fVar = b;
        synchronized (e9fVar) {
            try {
                v60Var = e9fVar.a;
                if (v60Var == null) {
                    if (context.getApplicationContext() != null) {
                        context = context.getApplicationContext();
                    }
                    v60Var = new v60(context);
                    e9fVar.a = v60Var;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return v60Var;
    }
}
