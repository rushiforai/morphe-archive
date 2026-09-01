package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x5d {
    public static boolean a(String str) {
        if (str == null) {
            return false;
        }
        g04 entries = y5d.getEntries();
        if (entries != null && entries.isEmpty()) {
            return false;
        }
        Iterator<E> it2 = entries.iterator();
        while (it2.hasNext()) {
            if (g76.L(((y5d) it2.next()).getLanguageName(), str)) {
                return true;
            }
        }
        return false;
    }
}
