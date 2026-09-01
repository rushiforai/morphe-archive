package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w64 implements x64 {
    public final SourceParameter a;

    public w64(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a = sourceParameter;
    }

    @Override // defpackage.x64
    public final SourceParameter a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof w64) && g76.L(this.a, ((w64) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Loading(sourceParameter=" + this.a + ")";
    }
}
