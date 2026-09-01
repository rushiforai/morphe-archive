package defpackage;

import com.medium.proto.model.ParagraphPb;
import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;
import gen.model.Post;
import gen.model.Quote;
import gen.model.QuoteType;
import gen.model.User;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class era extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public List d;
    public Integer e;
    public Integer f;
    public Long g;
    public Long h;
    public User i;
    public Post j;
    public Integer k;
    public QuoteType l;
    public ParagraphPb m;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        String str = this.a;
        if (str == null) {
            Internal.missingRequiredFields(str, "quote_id");
            throw null;
        }
        String str2 = this.b;
        if (str2 != null) {
            return new Quote(str, str2, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, buildUnknownFields());
        }
        Internal.missingRequiredFields(str2, "post_id");
        throw null;
    }
}
