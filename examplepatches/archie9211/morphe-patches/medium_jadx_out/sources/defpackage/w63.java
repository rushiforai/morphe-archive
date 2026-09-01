package defpackage;

import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w63 implements z63 {
    public final SelectionPb a;
    public final DeltaType b = DeltaType.UPDATE_SELECTION;

    public w63(SelectionPb selectionPb) {
        this.a = selectionPb;
    }

    @Override // defpackage.z63
    public final DeltaType a() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof w63) && this.a.equals(((w63) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UpdateSelection(selectionPb=" + this.a + ")";
    }
}
