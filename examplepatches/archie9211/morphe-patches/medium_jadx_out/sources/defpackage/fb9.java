package defpackage;

import com.medium.proto.model.PlaybackModel;
import com.medium.proto.model.PostDisplay;
import com.medium.proto.model.RichTextModel;
import com.medium.proto.model.SelectionPb;
import com.squareup.wire.Message;
import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fb9 extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public ImageMetadata d;
    public RichTextModel e;
    public PostDisplay f;
    public SelectionPb g;
    public String h;
    public ImageMetadata i;

    @Override // com.squareup.wire.Message.Builder
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final PlaybackModel build() {
        return new PlaybackModel(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, buildUnknownFields());
    }
}
