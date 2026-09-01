package defpackage;

import com.squareup.wire.Message;
import gen.model.ImageInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cx5 extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public Integer d;
    public Integer e;
    public String f;
    public Integer g;
    public Integer h;
    public Float i;
    public Float j;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new ImageInfo(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, buildUnknownFields());
    }
}
