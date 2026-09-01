package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class nwd {
    public static final nwd ACCEPT_NULL;
    public static final nwd NOT_NULL;
    public static final nwd START;
    public static final nwd UNKNOWN;
    public static final /* synthetic */ nwd[] a;

    static {
        lwd lwdVar = new lwd("START", 0, null);
        START = lwdVar;
        jwd jwdVar = new jwd("ACCEPT_NULL", 1, null);
        ACCEPT_NULL = jwdVar;
        mwd mwdVar = new mwd("UNKNOWN", 2, null);
        UNKNOWN = mwdVar;
        kwd kwdVar = new kwd("NOT_NULL", 3, null);
        NOT_NULL = kwdVar;
        a = new nwd[]{lwdVar, jwdVar, mwdVar, kwdVar};
    }

    public nwd(String str, int i, gy2 gy2Var) {
    }

    public static nwd a(o3e o3eVar) {
        return o3eVar.k0() ? ACCEPT_NULL : pwd.O(h1c.j.c1(), f49.N(o3eVar), wvd.e) ? NOT_NULL : UNKNOWN;
    }

    public static nwd valueOf(String str) {
        return (nwd) Enum.valueOf(nwd.class, str);
    }

    public static nwd[] values() {
        return (nwd[]) a.clone();
    }

    public abstract nwd combine(o3e o3eVar);
}
