package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bna implements ena {
    public final SourceParameter a;

    public bna(SourceParameter sourceParameter) {
        this.a = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof bna) && this.a.equals(((bna) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UnmuteCurrentPublicationSuccess(sourceParameter=" + this.a + ")";
    }
}
