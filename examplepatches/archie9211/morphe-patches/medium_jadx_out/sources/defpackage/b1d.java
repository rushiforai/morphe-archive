package defpackage;

import com.squareup.wire.Message;
import gen.model.ImageDisplay;
import gen.model.SuggestionReasonCollection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b1d extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public ImageDisplay d;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new SuggestionReasonCollection(this.a, this.b, this.c, this.d, buildUnknownFields());
    }
}
