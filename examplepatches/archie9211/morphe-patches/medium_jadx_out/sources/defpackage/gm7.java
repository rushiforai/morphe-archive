package defpackage;

import com.squareup.wire.Message;
import gen.model.Catalog;
import gen.model.MediaResourceMediumCatalog;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gm7 extends Message.Builder {
    public String a;
    public Catalog b;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new MediaResourceMediumCatalog(this.a, this.b, buildUnknownFields());
    }
}
