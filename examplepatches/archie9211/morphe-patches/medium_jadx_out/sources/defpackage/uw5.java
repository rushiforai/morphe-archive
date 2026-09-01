package defpackage;

import com.squareup.wire.Message;
import gen.model.ImageDisplay;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class uw5 extends Message.Builder {
    public String a;
    public Integer b;
    public Integer c;
    public String d;
    public String e;
    public String f;
    public String g;
    public Integer h;
    public Integer i;
    public String j;
    public String k;
    public Float l;
    public Float m;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new ImageDisplay(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, buildUnknownFields());
    }
}
