package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u17 {
    public static u56 a(long j, Object obj) {
        u56 u56Var = (u56) s2e.h(j, obj);
        if (((w7a) u56Var).a) {
            return u56Var;
        }
        w7a w7aVar = (w7a) u56Var;
        int i = w7aVar.c;
        w7a w7aVarF = w7aVar.f(i == 0 ? 10 : i * 2);
        s2e.o(j, obj, w7aVarF);
        return w7aVarF;
    }
}
