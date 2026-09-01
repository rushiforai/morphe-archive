package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class uu2 {
    public static final a1a a = new a1a(ymb.a);
    public static final z46 b = new z46();
    public static int c = Integer.MAX_VALUE;

    public static final l66 a(String str) {
        l66 l66Var;
        a1a a1aVar = a;
        synchronized (a1aVar) {
            if (str == null) {
                str = "_dd.sdk_core.default";
            }
            try {
                l66Var = (l66) ((LinkedHashMap) a1aVar.c).get(str);
                if (l66Var == null) {
                    f49.K(ymb.a, d66.WARN, e66.USER, new cn(str, 8, new Throwable().fillInStackTrace()), null, false, 56);
                    l66Var = sg8.a;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return l66Var;
    }
}
