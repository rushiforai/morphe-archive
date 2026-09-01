package defpackage;

import com.medium.proto.model.IframeMetadata;
import com.squareup.wire.Message;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zv5 extends Message.Builder {
    public String a;
    public Integer b;
    public Integer c;
    public String d;
    public String e;
    public String f;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new IframeMetadata(this.a, this.b, this.c, this.d, this.e, this.f, buildUnknownFields());
    }
}
