package defpackage;

import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;
import gen.model.AuthInfo;
import gen.model.response.AcctCreateResponse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p5 extends Message.Builder {
    public AuthInfo a;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        AuthInfo authInfo = this.a;
        if (authInfo != null) {
            return new AcctCreateResponse(authInfo, buildUnknownFields());
        }
        Internal.missingRequiredFields(authInfo, "value_");
        throw null;
    }
}
