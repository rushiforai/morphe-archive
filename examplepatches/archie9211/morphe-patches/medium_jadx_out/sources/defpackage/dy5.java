package defpackage;

import android.content.res.Resources;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dy5 {
    public final Resources.Theme a;
    public final int b;

    public dy5(Resources.Theme theme, int i) {
        this.a = theme;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dy5)) {
            return false;
        }
        dy5 dy5Var = (dy5) obj;
        return g76.L(this.a, dy5Var.a) && this.b == dy5Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Key(theme=");
        sb.append(this.a);
        sb.append(", id=");
        return km4.A(sb, this.b, ')');
    }
}
