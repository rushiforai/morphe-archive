package defpackage;

import com.medium.proto.model.SectionModel;
import com.medium.proto.obv.post.ColorType;
import com.medium.proto.obv.post.SectionImageLayout;
import com.medium.proto.obv.post.SectionTextLayout;
import com.medium.proto.obv.post.SectionType;
import com.medium.proto.obv.post.SectionVideoLayout;
import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;
import gen.model.ImageMetadata;
import gen.model.VideoMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ivb extends Message.Builder {
    public String a;
    public Integer b;
    public ImageMetadata c;
    public VideoMetadata d;
    public SectionTextLayout e;
    public SectionImageLayout f;
    public SectionVideoLayout g;
    public ColorType h;
    public SectionType i;

    @Override // com.squareup.wire.Message.Builder
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final SectionModel build() {
        String str = this.a;
        Integer num = this.b;
        if (num != null) {
            return new SectionModel(str, num.intValue(), this.c, this.d, this.e, this.f, this.g, this.h, this.i, buildUnknownFields());
        }
        Internal.missingRequiredFields(num, "start_index");
        throw null;
    }
}
