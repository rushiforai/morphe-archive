package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dw4 {
    public final String a;
    public final String b;
    public final boolean c;

    public dw4(String str, String str2, boolean z) {
        this.a = str;
        this.b = str2;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dw4)) {
            return false;
        }
        dw4 dw4Var = (dw4) obj;
        return this.a.equals(dw4Var.a) && this.b.equals(dw4Var.b) && this.c == dw4Var.c;
    }

    public final int hashCode() {
        return wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(y30.u("FollowedTagPillUiModel(tagId=", this.a, ", tagName=", this.b, ", isSelected="), this.c, ")");
    }
}
