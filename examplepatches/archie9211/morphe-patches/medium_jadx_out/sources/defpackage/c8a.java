package defpackage;

import scalapb.options.hI.AEVqIoD;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c8a {
    public static final b8a Companion;
    public static final c8a H2_PRIOR_KNOWLEDGE;
    public static final c8a HTTP_1_0;
    public static final c8a HTTP_1_1;
    public static final c8a HTTP_2;
    public static final c8a HTTP_3;
    public static final c8a QUIC;

    @z73
    public static final c8a SPDY_3;
    public static final /* synthetic */ c8a[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    public c8a(String str, int i, String str2) {
        this.a = str2;
    }

    public static final c8a get(String str) {
        Companion.getClass();
        return b8a.a(str);
    }

    public static g04 getEntries() {
        return c;
    }

    public static c8a valueOf(String str) {
        return (c8a) Enum.valueOf(c8a.class, str);
    }

    public static c8a[] values() {
        return (c8a[]) b.clone();
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.a;
    }

    static {
        c8a c8aVar = new c8a("HTTP_1_0", 0, "http/1.0");
        HTTP_1_0 = c8aVar;
        c8a c8aVar2 = new c8a("HTTP_1_1", 1, "http/1.1");
        HTTP_1_1 = c8aVar2;
        c8a c8aVar3 = new c8a(AEVqIoD.bEZW, 2, "spdy/3.1");
        SPDY_3 = c8aVar3;
        c8a c8aVar4 = new c8a("HTTP_2", 3, "h2");
        HTTP_2 = c8aVar4;
        c8a c8aVar5 = new c8a("H2_PRIOR_KNOWLEDGE", 4, "h2_prior_knowledge");
        H2_PRIOR_KNOWLEDGE = c8aVar5;
        c8a c8aVar6 = new c8a("QUIC", 5, "quic");
        QUIC = c8aVar6;
        c8a c8aVar7 = new c8a("HTTP_3", 6, "h3");
        HTTP_3 = c8aVar7;
        c8a[] c8aVarArr = {c8aVar, c8aVar2, c8aVar3, c8aVar4, c8aVar5, c8aVar6, c8aVar7};
        b = c8aVarArr;
        c = new i04(c8aVarArr);
        Companion = new b8a();
    }
}
