package defpackage;

import com.medium.proto.model.SelectionPb;
import com.medium.proto.model.SelectionPoint;
import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kxb extends Message.Builder {
    public SelectionPoint a;
    public SelectionPoint b;
    public Boolean c;
    public Boolean d;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        SelectionPoint selectionPoint = this.a;
        if (selectionPoint == null) {
            Internal.missingRequiredFields(selectionPoint, "start");
            throw null;
        }
        SelectionPoint selectionPoint2 = this.b;
        if (selectionPoint2 != null) {
            return new SelectionPb(selectionPoint, selectionPoint2, this.c, this.d, buildUnknownFields());
        }
        Internal.missingRequiredFields(selectionPoint2, "end");
        throw null;
    }
}
