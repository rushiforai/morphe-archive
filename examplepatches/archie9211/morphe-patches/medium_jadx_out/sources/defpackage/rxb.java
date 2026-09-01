package defpackage;

import com.medium.proto.model.SelectionPb;
import com.medium.proto.model.SelectionPoint;
import com.medium.proto.obv.post.SelectionPointType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rxb {
    public static final SelectionPb a = new SelectionPb(c(0, 0), c(0, 0), null, Boolean.TRUE, null, 20, null);
    public static final SelectionPb b = a(0, 0);

    public static SelectionPb a(int i, int i2) {
        return new SelectionPb(c(i, i2), c(i, i2), null, null, null, 28, null);
    }

    public static SelectionPb b(int i) {
        SelectionPointType selectionPointType = SelectionPointType.MEDIA;
        return new SelectionPb(new SelectionPoint(selectionPointType, i, 0, null, 8, null), new SelectionPoint(selectionPointType, i, 0, null, 8, null), null, null, null, 28, null);
    }

    public static SelectionPoint c(int i, int i2) {
        return new SelectionPoint(SelectionPointType.TEXT, i, i2, null, 8, null);
    }

    public static SelectionPb d(int i, int i2, int i3) {
        return new SelectionPb(c(i, Math.min(i2, i3)), c(i, Math.max(i2, i3)), null, null, null, 28, null);
    }
}
