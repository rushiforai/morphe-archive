package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j57 implements x27 {
    public final String a;
    public final String b;
    public final String c;

    public j57(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = "load_more_error:0";
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j57)) {
            return false;
        }
        j57 j57Var = (j57) obj;
        return g76.L(this.a, j57Var.a) && this.b.equals(j57Var.b);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.c;
    }

    public final int hashCode() {
        return this.b.hashCode() + (((this.a.hashCode() * 961) + 1231) * 31);
    }

    public final String toString() {
        return ev6.y("LoadMoreErrorResponsesUiModel(id=", this.a, ", nestingLevel=0, isLastThreadedItem=true, source=", this.b, ")");
    }
}
