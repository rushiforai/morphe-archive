package defpackage;

import com.squareup.wire.Message;
import gen.model.Quote;
import gen.model.response.CreateQuoteResponse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hg2 extends Message.Builder {
    public Quote a;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CreateQuoteResponse(this.a, buildUnknownFields());
    }
}
