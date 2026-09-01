package defpackage;

import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;
import gen.model.UserSocialStats;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qme extends Message.Builder {
    public String a;
    public Long b;
    public Long c;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        String str = this.a;
        if (str != null) {
            return new UserSocialStats(str, this.b, this.c, buildUnknownFields());
        }
        Internal.missingRequiredFields(str, "user_id");
        throw null;
    }
}
