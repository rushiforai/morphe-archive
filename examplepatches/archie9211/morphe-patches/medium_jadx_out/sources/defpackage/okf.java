package defpackage;

import android.content.Context;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class okf {
    public static final xp a = new xp("GoogleSignInCommon", new String[0]);

    public static void a(Context context) {
        pkf.M(context).N();
        Set set = wif.b;
        synchronized (set) {
        }
        Iterator it2 = set.iterator();
        if (!it2.hasNext()) {
            ee5.a();
        } else {
            ((wif) it2.next()).getClass();
            rd6.b();
        }
    }
}
