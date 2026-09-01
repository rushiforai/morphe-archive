package defpackage;

import com.squareup.wire.Message;
import gen.model.Collection;
import gen.model.MediaResourceMediumCollection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class im7 extends Message.Builder {
    public String a;
    public Collection b;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new MediaResourceMediumCollection(this.a, this.b, buildUnknownFields());
    }
}
