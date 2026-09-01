package defpackage;

import com.squareup.wire.Message;
import gen.model.ImageMetadata;
import gen.model.TagMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g9d extends Message.Builder {
    public Integer a;
    public Integer b;
    public ImageMetadata c;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new TagMetadata(this.a, this.b, this.c, buildUnknownFields());
    }
}
