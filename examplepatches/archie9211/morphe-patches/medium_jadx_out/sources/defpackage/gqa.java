package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gqa implements kqa {
    public final List a;
    public final boolean b;

    public gqa(List list, boolean z) {
        this.a = list;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gqa)) {
            return false;
        }
        gqa gqaVar = (gqa) obj;
        return this.a.equals(gqaVar.a) && this.b == gqaVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Content(sections=" + this.a + ", isUpdating=" + this.b + ")";
    }
}
