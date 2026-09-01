package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pa9 {
    public final boolean a;
    public final int b;

    public pa9(boolean z) {
        this.a = z;
        this.b = 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pa9)) {
            return false;
        }
        pa9 pa9Var = (pa9) obj;
        return this.a == pa9Var.a && this.b == pa9Var.b;
    }

    public final int hashCode() {
        return ((this.a ? 1231 : 1237) * 31) + this.b;
    }

    public final String toString() {
        return "PlatformParagraphStyle(includeFontPadding=" + this.a + ", emojiSupportMatch=" + ((Object) mx3.a(this.b)) + ')';
    }

    public pa9(int i, boolean z) {
        this.a = z;
        this.b = i;
    }
}
