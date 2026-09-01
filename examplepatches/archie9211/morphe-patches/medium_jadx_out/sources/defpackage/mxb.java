package defpackage;

import com.medium.proto.model.SelectionPoint;
import com.medium.proto.obv.post.SelectionPointType;
import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mxb extends Message.Builder {
    public SelectionPointType a;
    public Integer b;
    public Integer c;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        SelectionPointType selectionPointType = this.a;
        if (selectionPointType == null) {
            Internal.missingRequiredFields(selectionPointType, "type");
            throw null;
        }
        Integer num = this.b;
        if (num == null) {
            Internal.missingRequiredFields(num, "paragraph_index");
            throw null;
        }
        int iIntValue = num.intValue();
        Integer num2 = this.c;
        if (num2 != null) {
            return new SelectionPoint(selectionPointType, iIntValue, num2.intValue(), buildUnknownFields());
        }
        Internal.missingRequiredFields(num2, "offset");
        throw null;
    }
}
