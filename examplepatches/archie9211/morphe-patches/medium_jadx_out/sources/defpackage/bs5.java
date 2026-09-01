package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class bs5 {
    public static final vi5[] a;
    public static final Map b;

    public static void a(h21 h21Var) throws IOException {
        h21Var.getClass();
        int iE = h21Var.e();
        for (int i = 0; i < iE; i++) {
            byte bJ = h21Var.j(i);
            if (65 <= bJ && bJ < 91) {
                ik4.g("PROTOCOL_ERROR response malformed: mixed case name: ".concat(h21Var.t()));
                return;
            }
        }
    }

    static {
        vi5 vi5Var = new vi5("", vi5.i);
        h21 h21Var = vi5.f;
        vi5 vi5Var2 = new vi5("GET", h21Var);
        vi5 vi5Var3 = new vi5("POST", h21Var);
        h21 h21Var2 = vi5.g;
        vi5 vi5Var4 = new vi5("/", h21Var2);
        vi5 vi5Var5 = new vi5("/index.html", h21Var2);
        h21 h21Var3 = vi5.h;
        vi5 vi5Var6 = new vi5("http", h21Var3);
        vi5 vi5Var7 = new vi5("https", h21Var3);
        h21 h21Var4 = vi5.e;
        vi5[] vi5VarArr = {vi5Var, vi5Var2, vi5Var3, vi5Var4, vi5Var5, vi5Var6, vi5Var7, new vi5("200", h21Var4), new vi5("204", h21Var4), new vi5("206", h21Var4), new vi5("304", h21Var4), new vi5("400", h21Var4), new vi5("404", h21Var4), new vi5("500", h21Var4), new vi5("accept-charset", ""), new vi5("accept-encoding", "gzip, deflate"), new vi5("accept-language", ""), new vi5("accept-ranges", ""), new vi5("accept", ""), new vi5("access-control-allow-origin", ""), new vi5("age", ""), new vi5("allow", ""), new vi5("authorization", ""), new vi5("cache-control", ""), new vi5("content-disposition", ""), new vi5("content-encoding", ""), new vi5("content-language", ""), new vi5("content-length", ""), new vi5("content-location", ""), new vi5("content-range", ""), new vi5("content-type", ""), new vi5("cookie", ""), new vi5("date", ""), new vi5("etag", ""), new vi5("expect", ""), new vi5("expires", ""), new vi5("from", ""), new vi5("host", ""), new vi5("if-match", ""), new vi5("if-modified-since", ""), new vi5("if-none-match", ""), new vi5("if-range", ""), new vi5("if-unmodified-since", ""), new vi5("last-modified", ""), new vi5("link", ""), new vi5("location", ""), new vi5("max-forwards", ""), new vi5("proxy-authenticate", ""), new vi5("proxy-authorization", ""), new vi5("range", ""), new vi5("referer", ""), new vi5("refresh", ""), new vi5("retry-after", ""), new vi5("server", ""), new vi5("set-cookie", ""), new vi5("strict-transport-security", ""), new vi5("transfer-encoding", ""), new vi5(kSWQKWZ.aJoBERHS, ""), new vi5("vary", ""), new vi5("via", ""), new vi5("www-authenticate", "")};
        a = vi5VarArr;
        LinkedHashMap linkedHashMap = new LinkedHashMap(61, 1.0f);
        for (int i = 0; i < 61; i++) {
            if (!linkedHashMap.containsKey(vi5VarArr[i].a)) {
                linkedHashMap.put(vi5VarArr[i].a, Integer.valueOf(i));
            }
        }
        Map mapUnmodifiableMap = DesugarCollections.unmodifiableMap(linkedHashMap);
        mapUnmodifiableMap.getClass();
        b = mapUnmodifiableMap;
    }
}
