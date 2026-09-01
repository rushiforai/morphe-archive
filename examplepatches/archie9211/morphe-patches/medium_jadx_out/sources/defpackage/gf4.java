package defpackage;

import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gf4 {
    public final String a;
    public final Map b;

    public gf4(String str, Map map) {
        this.a = str;
        this.b = map;
    }

    public static gf4 a(String str) {
        return new gf4(str, Collections.EMPTY_MAP);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gf4)) {
            return false;
        }
        gf4 gf4Var = (gf4) obj;
        return this.a.equals(gf4Var.a) && this.b.equals(gf4Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "FieldDescriptor{name=" + this.a + ", properties=" + this.b.values() + "}";
    }
}
