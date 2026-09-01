package defpackage;

import com.squareup.wire.Message;
import com.squareup.wire.internal.Internal;
import gen.model.UserPostRelation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eee extends Message.Builder {
    public String a;
    public String b;
    public Long c;
    public Long d;
    public Long e;
    public Long f;
    public Long g;
    public Long h;
    public Long i;
    public Long j;
    public String k;
    public String l;
    public Long m;
    public String n;
    public Double o;
    public Integer p;
    public Integer q;
    public Integer r;
    public Long s;
    public Long t;
    public Long u;
    public Float v;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        String str = this.a;
        if (str == null) {
            Internal.missingRequiredFields(str, "user_id");
            throw null;
        }
        String str2 = this.b;
        if (str2 != null) {
            return new UserPostRelation(str, str2, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, buildUnknownFields());
        }
        Internal.missingRequiredFields(str2, "post_id");
        throw null;
    }
}
