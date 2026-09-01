package defpackage;

import com.medium.proto.model.PreviewContent;
import com.medium.proto.model.RichTextModel;
import com.squareup.wire.Message;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class k0a extends Message.Builder {
    public RichTextModel a;
    public Boolean b;
    public String c;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PreviewContent(this.a, this.b, this.c, buildUnknownFields());
    }
}
