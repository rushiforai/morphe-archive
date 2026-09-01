package defpackage;

import com.squareup.wire.Message;
import gen.model.CollectionPermissions;
import gen.model.CollectionVirtuals;
import gen.model.Membership;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xt1 extends Message.Builder {
    public CollectionPermissions a;
    public Boolean b;
    public Boolean c;
    public Boolean d;
    public Boolean e;
    public Boolean f;
    public Boolean g;
    public Boolean h;
    public Boolean i;
    public String j;
    public Membership k;
    public String l;
    public Boolean m;
    public Long n;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new CollectionVirtuals(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, buildUnknownFields());
    }
}
