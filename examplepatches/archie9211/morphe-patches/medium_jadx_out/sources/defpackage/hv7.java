package defpackage;

import com.squareup.wire.Message;
import gen.model.CancellationType;
import gen.model.MediumMembershipType;
import gen.model.Membership;
import gen.model.MembershipDiscount;
import gen.model.MembershipPlan;
import gen.model.PaymentCurrency;
import gen.model.PaymentMembershipStatus;
import gen.model.PaymentProvider;
import gen.model.User;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hv7 extends Message.Builder {
    public Boolean A;
    public MembershipDiscount B;
    public Long C;
    public MediumMembershipType D;
    public String a;
    public String b;
    public MembershipPlan c;
    public MediumMembershipType d;
    public Integer e;
    public PaymentCurrency f;
    public String g;
    public User h;
    public Long i;
    public Long j;
    public String k;
    public Float l;
    public Long m;
    public Long n;
    public Long o;
    public Long p;
    public Long q;
    public CancellationType r;
    public PaymentProvider s;
    public String t;
    public Long u;
    public Long v;
    public Integer w;
    public Boolean x;
    public Long y;
    public PaymentMembershipStatus z;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new Membership(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, this.w, this.x, this.y, this.z, this.A, this.B, this.C, this.D, buildUnknownFields());
    }
}
