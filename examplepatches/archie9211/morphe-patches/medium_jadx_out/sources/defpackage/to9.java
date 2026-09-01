package defpackage;

import com.medium.proto.event.AnalyticsEventCommonFields;
import com.medium.proto.event.PostSeeMoreUndo;
import com.squareup.wire.Message;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class to9 extends Message.Builder {
    public AnalyticsEventCommonFields a;
    public String b;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PostSeeMoreUndo(this.a, this.b, buildUnknownFields());
    }
}
