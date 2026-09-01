package defpackage;

import java.io.Serializable;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class s75 extends q1 implements Serializable {
    public static o75 e(q1 q1Var, q1 q1Var2, int i, k6f k6fVar, Class cls) {
        return new o75(q1Var, Collections.EMPTY_LIST, q1Var2, new m75(i, k6fVar, true), cls);
    }

    public static o75 f(q1 q1Var, Object obj, q1 q1Var2, int i, k6f k6fVar, Class cls) {
        return new o75(q1Var, obj, q1Var2, new m75(i, k6fVar, false), cls);
    }
}
