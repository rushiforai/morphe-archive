package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzzx;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gwf {
    public static final xp a = new xp("GetTokenResultFactory", new String[0]);

    public static l44 a(String str) {
        Map map;
        try {
            map = hwf.c(str);
        } catch (zzzx e) {
            a.i("Error parsing token claims", e, new Object[0]);
            map = new HashMap();
        }
        l44 l44Var = new l44();
        l44Var.a = map;
        return l44Var;
    }
}
