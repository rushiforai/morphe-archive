package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionHeaderMetadata;
import gen.model.CollectionPromoMetadata;
import gen.model.CollectionSection;
import gen.model.CollectionSectionType;
import gen.model.PostListMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zs1 extends Message.Builder {
    public CollectionSectionType a;
    public PostListMetadata b;
    public CollectionHeaderMetadata c;
    public CollectionPromoMetadata d;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionSection(this.a, this.b, this.c, this.d, buildUnknownFields());
    }
}
