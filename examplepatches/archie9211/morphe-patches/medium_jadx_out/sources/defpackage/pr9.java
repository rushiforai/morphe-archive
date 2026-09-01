package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pr9 implements rr9 {
    public final j4b a;

    public pr9(j4b j4bVar) {
        this.a = j4bVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof pr9) && this.a.equals(((pr9) obj).a);
    }

    public final int hashCode() {
        return this.a.a.hashCode();
    }

    public final String toString() {
        return "RemoveNoteConfirmation(uiModel=" + this.a + ")";
    }
}
