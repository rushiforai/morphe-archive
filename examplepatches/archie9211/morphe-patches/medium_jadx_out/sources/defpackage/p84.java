package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p84 {
    public final LinkedHashMap a;

    public p84(r84 r84Var) {
        this.a = ei7.Y(r84Var.a);
    }

    public final void a(q84 q84Var, Object obj) {
        LinkedHashMap linkedHashMap = this.a;
        if (obj != null) {
            linkedHashMap.put(q84Var, obj);
        } else {
            linkedHashMap.remove(q84Var);
        }
    }

    public p84() {
        this.a = new LinkedHashMap();
    }
}
