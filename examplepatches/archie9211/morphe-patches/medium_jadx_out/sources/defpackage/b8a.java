package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b8a {
    public static c8a a(String str) throws IOException {
        str.getClass();
        c8a c8aVar = c8a.HTTP_1_0;
        if (str.equals(c8aVar.a)) {
            return c8aVar;
        }
        c8a c8aVar2 = c8a.HTTP_1_1;
        if (str.equals(c8aVar2.a)) {
            return c8aVar2;
        }
        c8a c8aVar3 = c8a.H2_PRIOR_KNOWLEDGE;
        if (str.equals(c8aVar3.a)) {
            return c8aVar3;
        }
        c8a c8aVar4 = c8a.HTTP_2;
        if (str.equals(c8aVar4.a)) {
            return c8aVar4;
        }
        c8a c8aVar5 = c8a.SPDY_3;
        if (str.equals(c8aVar5.a)) {
            return c8aVar5;
        }
        c8a c8aVar6 = c8a.QUIC;
        if (str.equals(c8aVar6.a)) {
            return c8aVar6;
        }
        c8a c8aVar7 = c8a.HTTP_3;
        if (tuc.N(str, c8aVar7.a, false)) {
            return c8aVar7;
        }
        ik4.g("Unexpected protocol: ".concat(str));
        return null;
    }
}
