package defpackage;

import com.squareup.wire.Message;
import gen.model.FastrakBetaVersion;
import gen.model.OnboardingStatus;
import gen.model.User;
import gen.model.UserSocialStats;
import gen.model.UserUserSocial;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j7e extends Message.Builder {
    public Boolean A;
    public Boolean B;
    public Boolean C;
    public Long D;
    public Boolean E;
    public Long F;
    public Long G;
    public Integer H;
    public Long I;
    public Boolean J;
    public List K;
    public List L;
    public String M;
    public Integer N;
    public Integer O;
    public Long P;
    public Boolean Q;
    public Boolean R;
    public Boolean S;
    public String T;
    public String U;
    public String V;
    public String W;
    public Long X;
    public Long Y;
    public String Z;
    public String a;
    public Long a0;
    public String b;
    public Boolean b0;
    public String c;
    public FastrakBetaVersion c0;
    public Long d;
    public Boolean d0;
    public Long e;
    public Boolean e0;
    public String f;
    public Integer f0;
    public String g;
    public String g0;
    public String h;
    public String i;
    public UserSocialStats j;
    public UserUserSocial k;
    public String l;
    public OnboardingStatus m;
    public String n;
    public Integer o;
    public Boolean p;
    public Long q;
    public Boolean r;
    public Boolean s;
    public Long t;
    public Long u;
    public Boolean v;
    public Boolean w;
    public Long x;
    public Boolean y;
    public Boolean z;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new User(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, this.r, this.s, this.t, this.u, this.v, this.w, this.x, this.y, this.z, this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H, this.I, this.J, this.K, this.L, this.M, this.N, this.O, this.P, this.Q, this.R, this.S, this.T, this.U, this.V, this.W, this.X, this.Y, this.Z, this.a0, this.b0, this.c0, this.d0, this.e0, this.f0, this.g0, buildUnknownFields());
    }
}
