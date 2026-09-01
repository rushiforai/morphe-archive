package defpackage;

import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.explore.ui.vAWg.OphtYB;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class du9 implements ou9 {
    public final HighlightReference a;
    public final SourceParameter b;
    public final String c;
    public final String d;

    public du9(HighlightReference highlightReference, SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = highlightReference;
        this.b = sourceParameter;
        this.c = str;
        this.d = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof du9)) {
            return false;
        }
        du9 du9Var = (du9) obj;
        return this.a.equals(du9Var.a) && this.b.equals(du9Var.b) && g76.L(this.c, du9Var.c) && this.d.equals(du9Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.o(ev6.o(this.b, this.a.hashCode() * 31, 31), 31, this.c);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ShowHighlight(highlightReference=");
        sb.append(this.a);
        sb.append(OphtYB.MaLSmOpmITvYa);
        sb.append(this.b);
        sb.append(", referrerSource=");
        return km4.C(sb, this.c, ", location=", this.d, ")");
    }
}
