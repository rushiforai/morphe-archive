package defpackage;

import com.squareup.wire.Message;
import gen.model.response.GenericStringResponse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c85 extends Message.Builder {
    public String a;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new GenericStringResponse(this.a, buildUnknownFields());
    }
}
