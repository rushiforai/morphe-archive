package sprig.a;

import defpackage.ajb;
import defpackage.tuc;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class a {
    public static final JSONObject b(String str) {
        Object ajbVar;
        if (tuc.G(str, "undefined", true)) {
            str = null;
        }
        if (str == null) {
            return null;
        }
        try {
            ajbVar = new JSONObject(str);
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        return (JSONObject) (ajbVar instanceof ajb ? null : ajbVar);
    }
}
