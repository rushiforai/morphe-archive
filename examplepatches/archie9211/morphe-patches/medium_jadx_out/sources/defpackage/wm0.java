package defpackage;

import android.os.Bundle;
import java.util.HashSet;
import org.json.JSONArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wm0 {
    public static boolean b;
    public static final wm0 a = new wm0();
    public static HashSet c = new HashSet();

    public static final void a(Bundle bundle) {
        if (ec2.a.contains(wm0.class)) {
            return;
        }
        try {
            if (b && bundle != null) {
                JSONArray jSONArray = new JSONArray();
                for (String str : c) {
                    if (bundle.containsKey(str)) {
                        bundle.remove(str);
                        jSONArray.put(str);
                    }
                }
                if (jSONArray.length() > 0) {
                    bundle.putString("_bannedParams", jSONArray.toString());
                }
            }
        } catch (Throwable th) {
            ec2.a(wm0.class, th);
        }
    }
}
