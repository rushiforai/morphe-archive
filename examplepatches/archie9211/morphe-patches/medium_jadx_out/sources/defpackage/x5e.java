package defpackage;

import com.squareup.wire.Message;
import gen.model.UploadInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x5e extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public String d;
    public Integer e;
    public String f;
    public Integer g;
    public Integer h;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new UploadInfo(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, buildUnknownFields());
    }
}
