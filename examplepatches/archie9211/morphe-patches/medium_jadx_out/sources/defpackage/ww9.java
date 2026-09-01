package defpackage;

import com.squareup.wire.Message;
import gen.model.ImageInfo;
import gen.model.LinkMetadataList;
import gen.model.PostVirtuals;
import gen.model.ReadingListType;
import gen.model.UserPostRelation;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ww9 extends Message.Builder {
    public ReadingListType A;
    public Boolean B;
    public Boolean C;
    public String D;
    public String E;
    public String F;
    public String G;
    public String H;
    public String I;
    public String J;
    public String K;
    public String L;
    public String M;
    public String N;
    public String O;
    public List P;
    public List Q;
    public String R;
    public String S;
    public String T;
    public String U;
    public String V;
    public String W;
    public Long X;
    public String Y;
    public List Z;
    public String a;
    public Boolean a0;
    public Boolean b;
    public Integer b0;
    public ImageInfo c;
    public Integer d;
    public Integer e;
    public Integer f;
    public Double g;
    public String h;
    public UserPostRelation i;
    public Integer j;
    public List k;
    public Boolean l;
    public Integer m;
    public Integer n;
    public Long o;
    public List p;
    public Long q;
    public List r;
    public List s;
    public Integer t;
    public String u;
    public Boolean v;
    public LinkMetadataList w;
    public Boolean x;
    public Boolean y;
    public String z;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new PostVirtuals(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, this.w, this.x, this.y, this.z, this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H, this.I, this.J, this.K, this.L, this.M, this.N, this.O, this.P, this.Q, this.R, this.S, this.T, this.U, this.V, this.W, this.X, this.Y, this.Z, this.a0, this.b0, buildUnknownFields());
    }
}
