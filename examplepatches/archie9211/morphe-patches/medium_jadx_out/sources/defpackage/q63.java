package defpackage;

import com.medium.proto.obv.post.DeltaType;
import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q63 implements z63 {
    public final ImageMetadata a;
    public final DeltaType b = DeltaType.UPDATE_IMAGE;

    public q63(ImageMetadata imageMetadata) {
        this.a = imageMetadata;
    }

    @Override // defpackage.z63
    public final DeltaType a() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof q63) && this.a.equals(((q63) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UpdateImage(imageMetadata=" + this.a + ")";
    }
}
