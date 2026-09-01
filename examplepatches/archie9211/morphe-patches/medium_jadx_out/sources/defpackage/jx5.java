package defpackage;

import com.squareup.wire.Message;
import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jx5 extends Message.Builder {
    public String a;
    public Integer b;
    public Integer c;
    public String d;
    public String e;
    public Boolean f;
    public String g;
    public Float h;
    public Float i;
    public String j;
    public Long k;
    public String l;

    @Override // com.squareup.wire.Message.Builder
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final ImageMetadata build() {
        return new ImageMetadata(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, buildUnknownFields());
    }
}
