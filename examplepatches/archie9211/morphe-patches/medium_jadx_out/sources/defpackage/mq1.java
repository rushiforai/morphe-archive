package defpackage;

import com.squareup.wire.Message;
import gen.model.AcceleratedMobilePages;
import gen.model.AuroraTheme;
import gen.model.Collection;
import gen.model.CollectionColorBehavior;
import gen.model.CollectionColorPalette;
import gen.model.CollectionHeaderMetadata;
import gen.model.CollectionLayoutType;
import gen.model.CollectionMetadata;
import gen.model.CollectionTheme;
import gen.model.CollectionVirtuals;
import gen.model.FullTextRSSType;
import gen.model.ImageInfo;
import gen.model.InstantArticles;
import gen.model.NewsletterV3;
import gen.model.User;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mq1 extends Message.Builder {
    public List A;
    public String B;
    public String C;
    public Boolean D;
    public CollectionColorPalette E;
    public List F;
    public FullTextRSSType G;
    public CollectionColorBehavior H;
    public InstantArticles I;
    public AcceleratedMobilePages J;
    public String K;
    public String L;
    public List M;
    public Long N;
    public CollectionHeaderMetadata O;
    public Boolean P;
    public Boolean Q;
    public CollectionTheme R;
    public AuroraTheme S;
    public Long T;
    public String U;
    public String V;
    public Boolean W;
    public NewsletterV3 X;
    public Boolean Y;
    public List Z;
    public String a;
    public Long a0;
    public String b;
    public Long b0;
    public String c;
    public List d;
    public String e;
    public User f;
    public String g;
    public String h;
    public String i;
    public String j;
    public ImageInfo k;
    public ImageInfo l;
    public ImageInfo m;
    public ImageInfo n;
    public ImageInfo o;
    public CollectionMetadata p;
    public CollectionVirtuals q;
    public CollectionLayoutType r;
    public String s;
    public String t;
    public String u;
    public String v;
    public String w;
    public String x;
    public Long y;
    public List z;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new Collection(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, this.w, this.x, this.y, this.z, this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H, this.I, this.J, this.K, this.L, this.M, this.N, this.O, this.P, this.Q, this.R, this.S, this.T, this.U, this.V, this.W, this.X, this.Y, this.Z, this.a0, this.b0, buildUnknownFields());
    }
}
