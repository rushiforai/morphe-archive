package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionPromoLinkWithContent;
import gen.model.ColorSpectrum;
import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vs1 extends Message.Builder {
    public String a;
    public ImageMetadata b;
    public String c;
    public String d;
    public String e;
    public ColorSpectrum f;
    public Boolean g;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionPromoLinkWithContent(this.a, this.b, this.c, this.d, this.e, this.f, this.g, buildUnknownFields());
    }
}
