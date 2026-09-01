package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h6c {
    public final int a;
    public final b5c b;
    public final List c;
    public final boolean d;
    public final String e;
    public final boolean f;

    public h6c(int i, b5c b5cVar, List list, boolean z, String str, boolean z2) {
        this.a = i;
        this.b = b5cVar;
        this.c = list;
        this.d = z;
        this.e = str;
        this.f = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h6c)) {
            return false;
        }
        h6c h6cVar = (h6c) obj;
        return this.a == h6cVar.a && this.b.equals(h6cVar.b) && this.c.equals(h6cVar.c) && this.d == h6cVar.d && g76.L(this.e, h6cVar.e) && this.f == h6cVar.f;
    }

    public final int hashCode() {
        int iP = (wgd.p((this.b.hashCode() + (this.a * 31)) * 31, 31, this.c) + (this.d ? 1231 : 1237)) * 31;
        String str = this.e;
        return ((iP + (str == null ? 0 : str.hashCode())) * 31) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        return "State(initialPage=" + this.a + ", shareCardUiModel=" + this.b + ", shareQuotesUiModels=" + this.c + ", instagramIsInstalled=" + this.d + ", targetedHighlightedText=" + this.e + ", isFriendLinkAvailable=" + this.f + ")";
    }
}
