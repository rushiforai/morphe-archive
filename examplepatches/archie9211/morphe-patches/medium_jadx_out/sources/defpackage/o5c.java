package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o5c implements q5c {
    public final boolean a;
    public final boolean b;
    public final boolean c;

    public o5c(boolean z, boolean z2, boolean z3) {
        this.a = z;
        this.b = z2;
        this.c = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o5c)) {
            return false;
        }
        o5c o5cVar = (o5c) obj;
        return this.a == o5cVar.a && this.b == o5cVar.b && this.c == o5cVar.c;
    }

    public final int hashCode() {
        return ((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Shareable(isAuthorOrCollectionEditorFriendLink=");
        sb.append(this.a);
        sb.append(", isCopyingFriendLink=");
        sb.append(this.b);
        sb.append(", isCreatingFriendLink=");
        return lv8.t(sb, this.c, ")");
    }
}
