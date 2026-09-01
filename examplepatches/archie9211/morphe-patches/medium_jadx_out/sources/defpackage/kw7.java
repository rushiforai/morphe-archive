package defpackage;

import com.squareup.wire.Message;
import gen.model.MembershipPlan;
import gen.model.MembershipType;
import gen.model.PaymentCurrency;
import gen.model.PaymentProvider;
import gen.model.PaymentRecurrenceInterval;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kw7 extends Message.Builder {
    public String a;
    public MembershipType b;
    public PaymentProvider c;
    public Integer d;
    public PaymentCurrency e;
    public PaymentRecurrenceInterval f;
    public Integer g;
    public String h;
    public String i;
    public String j;
    public Long k;
    public Long l;
    public Integer m;
    public String n;
    public String o;
    public String p;
    public Integer q;
    public Integer r;
    public Integer s;
    public Integer t;
    public Integer u;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new MembershipPlan(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, buildUnknownFields());
    }
}
