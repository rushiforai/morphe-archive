package defpackage;

import com.squareup.wire.Message;
import gen.model.PageParams;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ly8 extends Message.Builder {
    public Integer a;
    public String b;
    public String c;
    public String d;
    public List e;
    public Integer f;
    public Integer g;
    public String h;
    public String i;
    public String j;
    public String k;
    public String l;
    public String m;
    public Integer n;
    public Long o;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PageParams(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, buildUnknownFields());
    }
}
