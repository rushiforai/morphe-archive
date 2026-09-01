package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionHeadAlignment;
import gen.model.CollectionHeadLayout;
import gen.model.CollectionHeaderMetadata;
import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nr1 extends Message.Builder {
    public String a;
    public String b;
    public ImageMetadata c;
    public ImageMetadata d;
    public CollectionHeadAlignment e;
    public CollectionHeadLayout f;
    public String g;
    public String h;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionHeaderMetadata(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, buildUnknownFields());
    }
}
