package defpackage;

import com.medium.proto.model.PostDisplay;
import com.medium.proto.model.PostViewContent;
import com.medium.proto.model.RichTextModel;
import com.squareup.wire.Message;
import gen.model.ImageInfo;
import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kr9 extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public ImageInfo d;
    public RichTextModel e;
    public PostDisplay f;
    public String g;
    public ImageMetadata h;
    public Boolean i;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PostViewContent(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, buildUnknownFields());
    }
}
