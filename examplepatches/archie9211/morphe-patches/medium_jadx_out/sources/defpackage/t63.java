package defpackage;

import com.medium.proto.model.PostDisplay;
import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t63 implements z63 {
    public final PostDisplay a;
    public final DeltaType b = DeltaType.UPDATE_POST_DISPLAY;

    public t63(PostDisplay postDisplay) {
        this.a = postDisplay;
    }

    @Override // defpackage.z63
    public final DeltaType a() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t63) && this.a.equals(((t63) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UpdatePostDisplay(postDisplay=" + this.a + ")";
    }
}
