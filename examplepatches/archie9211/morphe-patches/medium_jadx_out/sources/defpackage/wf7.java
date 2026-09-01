package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wf7 implements bg7 {
    public final SourceParameter a;

    public wf7(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wf7) && g76.L(this.a, ((wf7) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "ShowSuspendedAccountSnackbar(sourceParameter=" + this.a + ")";
    }
}
