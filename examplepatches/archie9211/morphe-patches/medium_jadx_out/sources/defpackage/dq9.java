package defpackage;

import com.squareup.wire.Message;
import gen.model.PostFeedReason;
import gen.model.PostSuggestionReason;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dq9 extends Message.Builder {
    public PostFeedReason a;
    public String b;
    public List c;
    public List d;
    public List e;
    public List f;
    public List g;
    public List h;
    public Long i;
    public String j;
    public Integer k;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PostSuggestionReason(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, buildUnknownFields());
    }
}
