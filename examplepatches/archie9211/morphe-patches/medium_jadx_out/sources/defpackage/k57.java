package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k57 implements x27 {
    public final String a;
    public final int b;
    public final boolean c;
    public final String d;

    public k57(int i, String str, boolean z) {
        this.a = str;
        this.b = i;
        this.c = z;
        this.d = "load_more:".concat(str);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k57)) {
            return false;
        }
        k57 k57Var = (k57) obj;
        return this.a.equals(k57Var.a) && this.b == k57Var.b && this.c == k57Var.c;
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.d;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + this.b) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(y30.t(this.b, "LoadMoreResponsesUiModel(id=", this.a, ", nestingLevel=", ", isLastThreadedItem="), this.c, ")");
    }
}
