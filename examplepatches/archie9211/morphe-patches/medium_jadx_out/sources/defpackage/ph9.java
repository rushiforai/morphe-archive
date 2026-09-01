package defpackage;

import com.squareup.wire.Message;
import gen.model.PostListLayout;
import gen.model.PostListMetadata;
import gen.model.PostListSource;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ph9 extends Message.Builder {
    public PostListSource a;
    public PostListLayout b;
    public Integer c;
    public List d;
    public String e;
    public String f;
    public String g;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PostListMetadata(this.a, this.b, this.c, this.d, this.e, this.f, this.g, buildUnknownFields());
    }
}
