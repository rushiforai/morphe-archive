package defpackage;

import com.squareup.wire.Message;
import gen.model.NewsletterV3;
import gen.model.NewsletterV3Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fg8 extends Message.Builder {
    public String a;
    public NewsletterV3Type b;
    public String c;
    public String d;
    public String e;
    public String f;
    public Boolean g;
    public Boolean h;
    public String i;
    public String j;
    public Boolean k;
    public String l;
    public String m;
    public String n;
    public Integer o;
    public Integer p;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new NewsletterV3(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, buildUnknownFields());
    }
}
