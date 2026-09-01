package defpackage;

import j$.util.DesugarCollections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e33 {
    public final String a;
    public final md5 b;

    public e33(Set set, md5 md5Var) {
        this.a = b(set);
        this.b = md5Var;
    }

    public static String b(Set set) {
        StringBuilder sb = new StringBuilder();
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            rj0 rj0Var = (rj0) it2.next();
            sb.append(rj0Var.a);
            sb.append('/');
            sb.append(rj0Var.b);
            if (it2.hasNext()) {
                sb.append(' ');
            }
        }
        return sb.toString();
    }

    public final String a() {
        Set setUnmodifiableSet;
        md5 md5Var = this.b;
        synchronized (((HashSet) md5Var.b)) {
            setUnmodifiableSet = DesugarCollections.unmodifiableSet((HashSet) md5Var.b);
        }
        boolean zIsEmpty = setUnmodifiableSet.isEmpty();
        String str = this.a;
        if (zIsEmpty) {
            return str;
        }
        return str + ' ' + b(md5Var.h());
    }
}
