package defpackage;

import com.medium.proto.model.StreamItemSectionContext;
import com.squareup.wire.Message;
import gen.model.DigestSectionType;
import gen.model.IFTTTSource;
import gen.model.PostFeedReason;
import gen.model.PostFeedSource;
import gen.model.SourceParameter;
import gen.model.SourceRssType;
import gen.model.SuggestionReasonType;
import gen.model.TagSource;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class okc extends Message.Builder {
    public String A;
    public String B;
    public String C;
    public String D;
    public Integer E;
    public String F;
    public String G;
    public String H;
    public String I;
    public Integer J;
    public String K;
    public String L;
    public String M;
    public String N;
    public String O;
    public String P;
    public String Q;
    public Integer R;
    public String a;
    public String b;
    public Long c;
    public String d;
    public String e;
    public String f;
    public String g;
    public String h;
    public Integer i;
    public String j;
    public String k;
    public String l;
    public String m;
    public String n;
    public String o;
    public Long p;
    public SourceRssType q;
    public PostFeedReason r;
    public PostFeedSource s;
    public TagSource t;
    public IFTTTSource u;
    public String v;
    public SuggestionReasonType w;
    public SuggestionReasonType x;
    public StreamItemSectionContext y;
    public DigestSectionType z;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new SourceParameter(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, this.w, this.x, this.y, this.z, this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H, this.I, this.J, this.K, this.L, this.M, this.N, this.O, this.P, this.Q, this.R, buildUnknownFields());
    }
}
