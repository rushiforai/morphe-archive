package defpackage;

import j$.util.DesugarCollections;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rt5 {
    static {
        Pattern.compile("^(25[0-5]|2[0-4]\\d|[0-1]?\\d?\\d)(\\.(25[0-5]|2[0-4]\\d|[0-1]?\\d?\\d)){3}$");
        Pattern.compile("^(?:[0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$");
        Pattern.compile("^((?:[0-9A-Fa-f]{1,4}(?::[0-9A-Fa-f]{1,4})*)?)::((?:[0-9A-Fa-f]{1,4}(?::[0-9A-Fa-f]{1,4})*)?)$");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r1v1, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.util.HashMap] */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4 */
    public static Map a(URI uri) {
        ?? map = Collections.EMPTY_MAP;
        String rawQuery = uri.getRawQuery();
        if (rawQuery != null && rawQuery.length() > 0) {
            map = new HashMap();
            int i = 26;
            int i2 = 11;
            sv0 sv0Var = new sv0(new ujf(i, new j6g('=', 1)), false, i2);
            sv0 sv0Var2 = new sv0(new ujf(i, new j6g('&', 1 == true ? 1 : 0)), 1 == true ? 1 : 0, i2);
            lkg lkgVar = new lkg(sv0Var2, rawQuery, (j6g) ((ujf) sv0Var2.c).b);
            while (lkgVar.hasNext()) {
                String str = (String) lkgVar.next();
                str.getClass();
                lkg lkgVar2 = new lkg(sv0Var, str, (j6g) ((ujf) sv0Var.c).b);
                ArrayList arrayList = new ArrayList();
                while (lkgVar2.hasNext()) {
                    arrayList.add((String) lkgVar2.next());
                }
                List listUnmodifiableList = DesugarCollections.unmodifiableList(arrayList);
                String strDecode = null;
                if (listUnmodifiableList.isEmpty() || listUnmodifiableList.size() > 2) {
                    ay0.e("bad parameter");
                    return null;
                }
                try {
                    String strDecode2 = URLDecoder.decode((String) listUnmodifiableList.get(0), "UTF-8");
                    if (listUnmodifiableList.size() == 2) {
                        try {
                            strDecode = URLDecoder.decode((String) listUnmodifiableList.get(1), "UTF-8");
                        } catch (UnsupportedEncodingException e) {
                            throw new IllegalArgumentException(e);
                        }
                    }
                    map.put(strDecode2, strDecode);
                } catch (UnsupportedEncodingException e2) {
                    throw new IllegalArgumentException(e2);
                }
            }
        }
        return map;
    }
}
