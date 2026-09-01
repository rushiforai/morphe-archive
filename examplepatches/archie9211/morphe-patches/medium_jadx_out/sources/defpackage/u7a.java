package defpackage;

import androidx.datastore.preferences.protobuf.e;
import androidx.datastore.preferences.protobuf.g;
import androidx.datastore.preferences.protobuf.h;
import androidx.datastore.preferences.protobuf.i;
import androidx.datastore.preferences.protobuf.j;
import j$.util.concurrent.ConcurrentHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u7a {
    public static final u7a c = new u7a();
    public final ConcurrentHashMap b = new ConcurrentHashMap();
    public final zg7 a = new zg7(0);

    public final crb a(Class cls) {
        t74 t74Var;
        crb crbVarW;
        Class cls2;
        x56.a("messageType", cls);
        ConcurrentHashMap concurrentHashMap = this.b;
        crb crbVar = (crb) concurrentHashMap.get(cls);
        if (crbVar != null) {
            return crbVar;
        }
        Class cls3 = i.a;
        if (!e.class.isAssignableFrom(cls) && (cls2 = i.a) != null && !cls2.isAssignableFrom(cls)) {
            ay0.e("Message classes must extend GeneratedMessage or GeneratedMessageLite");
            return null;
        }
        tsa tsaVarA = ((yg7) this.a.b).a(cls);
        if ((tsaVarA.d & 2) == 2) {
            if (e.class.isAssignableFrom(cls)) {
                crbVarW = new h(i.c, v74.a, tsaVarA.a);
            } else {
                j jVar = i.b;
                t74 t74Var2 = v74.b;
                if (t74Var2 == null) {
                    ygf.f("Protobuf runtime is not correctly loaded.");
                    return null;
                }
                crbVarW = new h(jVar, t74Var2, tsaVarA.a);
            }
        } else if (e.class.isAssignableFrom(cls)) {
            crbVarW = g.w(tsaVarA, af8.b, v17.b, i.c, wg7.a[tsaVarA.a().ordinal()] != 1 ? v74.a : null, qh7.b);
        } else {
            ye8 ye8Var = af8.a;
            u17 u17Var = v17.a;
            j jVar2 = i.b;
            if (wg7.a[tsaVarA.a().ordinal()] != 1) {
                t74 t74Var3 = v74.b;
                if (t74Var3 == null) {
                    ygf.f("Protobuf runtime is not correctly loaded.");
                    return null;
                }
                t74Var = t74Var3;
            } else {
                t74Var = null;
            }
            crbVarW = g.w(tsaVarA, ye8Var, u17Var, jVar2, t74Var, qh7.a);
        }
        crb crbVar2 = (crb) concurrentHashMap.putIfAbsent(cls, crbVarW);
        return crbVar2 != null ? crbVar2 : crbVarW;
    }
}
