package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionPromo;
import gen.model.CollectionPromoLinkWithContent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ts1 extends Message.Builder {
    public String a;
    public String b;
    public Long c;
    public Long d;
    public CollectionPromoLinkWithContent e;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionPromo(this.a, this.b, this.c, this.d, this.e, buildUnknownFields());
    }
}
