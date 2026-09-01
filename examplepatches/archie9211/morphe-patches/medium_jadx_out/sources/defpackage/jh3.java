package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jh3 implements kh3 {
    public final dne a;

    public jh3(dne dneVar) {
        this.a = dneVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof jh3) && this.a == ((jh3) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UserTextSizePreferenceUpdated(textSize=" + this.a + ")";
    }
}
