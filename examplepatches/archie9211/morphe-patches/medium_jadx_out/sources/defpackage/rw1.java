package defpackage;

import com.medium.android.graphql.CreateMediaResourceMutation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rw1 implements tw1 {
    public final int a;
    public final String b;
    public final CreateMediaResourceMutation.OnMediaResource c;
    public final String d;

    public rw1(int i, String str, CreateMediaResourceMutation.OnMediaResource onMediaResource, String str2) {
        onMediaResource.getClass();
        this.a = i;
        this.b = str;
        this.c = onMediaResource;
        this.d = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rw1)) {
            return false;
        }
        rw1 rw1Var = (rw1) obj;
        return this.a == rw1Var.a && this.b.equals(rw1Var.b) && g76.L(this.c, rw1Var.c) && this.d.equals(rw1Var.d);
    }

    @Override // defpackage.tw1
    public final String getParagraphName() {
        return this.b;
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + wgd.o(this.a * 31, 31, this.b)) * 31);
    }

    public final String toString() {
        return "Loaded(graphIndex=" + this.a + ", paragraphName=" + this.b + ", data=" + this.c + ", rawUrl=" + this.d + ")";
    }
}
