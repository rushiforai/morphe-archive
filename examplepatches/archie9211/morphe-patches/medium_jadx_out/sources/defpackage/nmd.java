package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nmd {
    public static final mmd Companion;
    public static final nmd SSL_3_0;
    public static final nmd TLS_1_0;
    public static final nmd TLS_1_1;
    public static final nmd TLS_1_2;
    public static final nmd TLS_1_3;
    public static final /* synthetic */ nmd[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    static {
        nmd nmdVar = new nmd("TLS_1_3", 0, "TLSv1.3");
        TLS_1_3 = nmdVar;
        nmd nmdVar2 = new nmd("TLS_1_2", 1, "TLSv1.2");
        TLS_1_2 = nmdVar2;
        nmd nmdVar3 = new nmd("TLS_1_1", 2, "TLSv1.1");
        TLS_1_1 = nmdVar3;
        nmd nmdVar4 = new nmd("TLS_1_0", 3, "TLSv1");
        TLS_1_0 = nmdVar4;
        nmd nmdVar5 = new nmd("SSL_3_0", 4, "SSLv3");
        SSL_3_0 = nmdVar5;
        nmd[] nmdVarArr = {nmdVar, nmdVar2, nmdVar3, nmdVar4, nmdVar5};
        b = nmdVarArr;
        c = new i04(nmdVarArr);
        Companion = new mmd();
    }

    public nmd(String str, int i, String str2) {
        this.a = str2;
    }

    public static final nmd forJavaName(String str) {
        Companion.getClass();
        return mmd.a(str);
    }

    public static g04 getEntries() {
        return c;
    }

    public static nmd valueOf(String str) {
        return (nmd) Enum.valueOf(nmd.class, str);
    }

    public static nmd[] values() {
        return (nmd[]) b.clone();
    }

    @z73
    /* JADX INFO: renamed from: -deprecated_javaName, reason: not valid java name */
    public final String m137deprecated_javaName() {
        return this.a;
    }

    public final String javaName() {
        return this.a;
    }
}
