package defpackage;

import com.google.protobuf.e;
import com.google.protobuf.g;
import com.google.protobuf.h;
import com.google.protobuf.i;
import com.google.protobuf.j;
import j$.util.concurrent.ConcurrentHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t7a {
    public static final t7a c = new t7a();
    public final ConcurrentHashMap b = new ConcurrentHashMap();
    public final olb a = new olb(1);

    public final brb a(Class cls) {
        brb brbVarZ;
        Class cls2;
        v56.a("messageType", cls);
        ConcurrentHashMap concurrentHashMap = this.b;
        brb brbVar = (brb) concurrentHashMap.get(cls);
        if (brbVar != null) {
            return brbVar;
        }
        Class cls3 = i.a;
        if (!e.class.isAssignableFrom(cls) && (cls2 = i.a) != null && !cls2.isAssignableFrom(cls)) {
            ay0.e("Message classes must extend GeneratedMessageV3 or GeneratedMessageLite");
            return null;
        }
        ssa ssaVarA = ((xg7) this.a.b).a(cls);
        if ((ssaVarA.d & 2) == 2) {
            if (e.class.isAssignableFrom(cls)) {
                brbVarZ = new h(i.d, u74.a, ssaVarA.a);
            } else {
                j jVar = i.b;
                s74 s74Var = u74.b;
                if (s74Var == null) {
                    ygf.f("Protobuf runtime is not correctly loaded.");
                    return null;
                }
                brbVarZ = new h(jVar, s74Var, ssaVarA.a);
            }
        } else if (e.class.isAssignableFrom(cls)) {
            brbVarZ = ((ssaVarA.d & 1) == 1 ? p7a.PROTO2 : p7a.PROTO3) == p7a.PROTO2 ? g.z(ssaVarA, ze8.b, t17.b, i.d, u74.a, ph7.b) : g.z(ssaVarA, ze8.b, t17.b, i.d, null, ph7.b);
        } else {
            if (((ssaVarA.d & 1) == 1 ? p7a.PROTO2 : p7a.PROTO3) == p7a.PROTO2) {
                xe8 xe8Var = ze8.a;
                r17 r17Var = t17.a;
                j jVar2 = i.b;
                s74 s74Var2 = u74.b;
                if (s74Var2 == null) {
                    ygf.f("Protobuf runtime is not correctly loaded.");
                    return null;
                }
                brbVarZ = g.z(ssaVarA, xe8Var, r17Var, jVar2, s74Var2, ph7.a);
            } else {
                brbVarZ = g.z(ssaVarA, ze8.a, t17.a, i.c, null, ph7.a);
            }
        }
        brb brbVar2 = (brb) concurrentHashMap.putIfAbsent(cls, brbVarZ);
        return brbVar2 != null ? brbVar2 : brbVarZ;
    }
}
