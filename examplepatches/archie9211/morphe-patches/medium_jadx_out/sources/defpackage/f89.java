package defpackage;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f89 implements Serializable {
    public final HashMap a;

    public f89(HashMap map) {
        HashMap map2 = new HashMap();
        this.a = map2;
        map2.putAll(map);
    }

    private final Object writeReplace() {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            return new e89(this.a);
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final void a(y3 y3Var, List list) {
        HashMap map = this.a;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            list.getClass();
            if (!map.containsKey(y3Var)) {
                map.put(y3Var, new ArrayList(list));
                return;
            }
            List list2 = (List) map.get(y3Var);
            if (list2 != null) {
                list2.addAll(list);
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public f89() {
        this.a = new HashMap();
    }
}
