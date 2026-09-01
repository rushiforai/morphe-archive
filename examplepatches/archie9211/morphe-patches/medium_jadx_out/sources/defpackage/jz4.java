package defpackage;

import j$.util.Objects;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jz4 {
    public String a;
    public String b;
    public List c;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jz4)) {
            return false;
        }
        jz4 jz4Var = (jz4) obj;
        return Objects.equals(this.a, jz4Var.a) && Objects.equals(this.b, jz4Var.b) && Objects.equals(this.c, jz4Var.c);
    }

    public final int hashCode() {
        return Objects.hash(this.a, this.b, this.c);
    }
}
