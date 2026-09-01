package defpackage;

import com.squareup.wire.Message;
import gen.model.response.GenericActionResponse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v75 extends Message.Builder {
    public Boolean a;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new GenericActionResponse(this.a, buildUnknownFields());
    }
}
