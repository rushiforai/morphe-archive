package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wma implements ena {
    public final SourceParameter a;

    public wma(SourceParameter sourceParameter) {
        this.a = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wma) && this.a.equals(((wma) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "MuteCurrentPublicationSuccess(sourceParameter=" + this.a + ")";
    }
}
