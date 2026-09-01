package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionPermissions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ks1 extends Message.Builder {
    public Boolean a;
    public Boolean b;
    public Boolean c;
    public Boolean d;
    public Boolean e;
    public Boolean f;
    public Boolean g;
    public Boolean h;
    public Boolean i;
    public Boolean j;
    public Boolean k;
    public Boolean l;
    public Boolean m;
    public Boolean n;
    public Boolean o;
    public Boolean p;
    public Boolean q;
    public Boolean r;
    public Boolean s;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionPermissions(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, buildUnknownFields());
    }
}
