package defpackage;

import android.net.Uri;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class te0 {
    public final se0 a;
    public final String b;
    public final Uri c;
    public final SourceParameter d;
    public final bo4 e;

    public te0(se0 se0Var, String str, Uri uri, SourceParameter sourceParameter, bo4 bo4Var) {
        str.getClass();
        this.a = se0Var;
        this.b = str;
        this.c = uri;
        this.d = sourceParameter;
        this.e = bo4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof te0)) {
            return false;
        }
        te0 te0Var = (te0) obj;
        return this.a.equals(te0Var.a) && g76.L(this.b, te0Var.b) && g76.L(this.c, te0Var.c) && this.d.equals(te0Var.d) && this.e.equals(te0Var.e);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        Uri uri = this.c;
        return this.e.hashCode() + ev6.o(this.d, (iO + (uri == null ? 0 : uri.hashCode())) * 31, 31);
    }

    public final String toString() {
        return "AuthorFooterUiModel(author=" + this.a + ", postId=" + this.b + ", tippingUri=" + this.c + ", sourceParameter=" + this.d + ", followSubscribeUiModelStream=" + this.e + ")";
    }
}
