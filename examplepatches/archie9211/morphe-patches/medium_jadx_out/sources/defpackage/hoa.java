package defpackage;

import com.squareup.wire.Message;
import gen.model.PostResponseType;
import gen.model.ResponseDistribution;
import gen.model.request.PublishPostRequestContent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hoa extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public Long d;
    public String e;
    public PostResponseType f;
    public ResponseDistribution g;
    public Boolean h;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PublishPostRequestContent(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, buildUnknownFields());
    }
}
