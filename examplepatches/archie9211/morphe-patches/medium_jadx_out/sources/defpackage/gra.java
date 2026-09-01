package defpackage;

import com.medium.proto.event.AnalyticsEventCommonFields;
import com.medium.proto.event.QuoteCreated;
import com.medium.proto.model.GFI;
import com.squareup.wire.Message;
import gen.model.QuoteType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gra extends Message.Builder {
    public AnalyticsEventCommonFields a;
    public String b;
    public String c;
    public QuoteType d;
    public String e;
    public String f;
    public String g;
    public GFI h;
    public GFI i;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new QuoteCreated(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, buildUnknownFields());
    }
}
