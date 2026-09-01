package defpackage;

import com.squareup.wire.Message;
import gen.model.OnboardingStatus;
import gen.model.request.AcctCreateRequestBody;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n5 extends Message.Builder {
    public String a;
    public String b;
    public String c;
    public String d;
    public String e;
    public String f;
    public String g;
    public String h;
    public String i;
    public OnboardingStatus j;
    public String k;
    public String l;
    public String m;
    public String n;
    public String o;
    public String p;
    public String q;
    public Boolean r;
    public String s;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new AcctCreateRequestBody(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, buildUnknownFields());
    }
}
