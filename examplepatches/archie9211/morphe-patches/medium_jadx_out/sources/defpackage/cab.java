package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cab implements dab {
    public final hne a;

    public cab(hne hneVar) {
        this.a = hneVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof cab) && this.a.equals(((cab) obj).a);
    }

    @Override // defpackage.dab
    public final String getKey() {
        return this.a.a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "WithoutNote(user=" + this.a + ")";
    }
}
