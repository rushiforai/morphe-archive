package defpackage;

import com.medium.proto.model.RichTextModel;
import com.squareup.wire.Message;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ekb extends Message.Builder {
    public List a;
    public List b;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new RichTextModel(this.a, this.b, buildUnknownFields());
    }
}
