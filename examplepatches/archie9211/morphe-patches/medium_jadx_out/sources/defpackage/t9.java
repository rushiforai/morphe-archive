package defpackage;

import com.squareup.wire.Message;
import gen.model.AddMembership;
import gen.model.MediumMembershipType;
import gen.model.MembershipDiscount;
import gen.model.PaymentProvider;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t9 extends Message.Builder {
    public Boolean A;
    public String B;
    public String C;
    public String D;
    public String E;
    public String a;
    public String b;
    public PaymentProvider c;
    public Integer d;
    public MediumMembershipType e;
    public String f;
    public String g;
    public String h;
    public String i;
    public String j;
    public Boolean k;
    public Boolean l;
    public String m;
    public String n;
    public Long o;
    public Long p;
    public Long q;
    public Integer r;
    public Long s;
    public Long t;
    public Boolean u;
    public String v;
    public String w;
    public String x;
    public Boolean y;
    public MembershipDiscount z;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new AddMembership(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, this.w, this.x, this.y, this.z, this.A, this.B, this.C, this.D, this.E, buildUnknownFields());
    }
}
