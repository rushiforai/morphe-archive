package defpackage;

import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;
import gen.model.UserUserSocial;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rne extends Message.Builder {
    public String a;
    public String b;
    public Long c;
    public Boolean d;
    public Boolean e;
    public Boolean f;
    public Boolean g;
    public Boolean h;
    public Boolean i;
    public Boolean j;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        String str = this.a;
        if (str == null) {
            Internal.missingRequiredFields(str, "user_id");
            throw null;
        }
        String str2 = this.b;
        if (str2 != null) {
            return new UserUserSocial(str, str2, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, buildUnknownFields());
        }
        Internal.missingRequiredFields(str2, "target_user_id");
        throw null;
    }
}
