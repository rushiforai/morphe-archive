package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class pq6 {
    public final Object a;

    public pq6(Object obj) {
        this.a = obj;
        new LinkedHashMap();
    }

    public Object a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof pq6) && g76.L(a(), ((pq6) obj).a());
    }

    public final int hashCode() {
        return a().hashCode();
    }
}
