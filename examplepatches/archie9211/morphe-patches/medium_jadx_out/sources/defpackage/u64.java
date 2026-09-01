package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u64 implements x64 {
    public final az5 a;
    public final az5 b;
    public final az5 c;
    public final az5 d;
    public final az5 e;
    public final az5 f;
    public final boolean g;
    public final SourceParameter h;

    public u64(az5 az5Var, az5 az5Var2, az5 az5Var3, az5 az5Var4, az5 az5Var5, az5 az5Var6, boolean z, SourceParameter sourceParameter) {
        az5Var.getClass();
        az5Var2.getClass();
        az5Var3.getClass();
        az5Var4.getClass();
        az5Var5.getClass();
        az5Var6.getClass();
        sourceParameter.getClass();
        this.a = az5Var;
        this.b = az5Var2;
        this.c = az5Var3;
        this.d = az5Var4;
        this.e = az5Var5;
        this.f = az5Var6;
        this.g = z;
        this.h = sourceParameter;
    }

    @Override // defpackage.x64
    public final SourceParameter a() {
        return this.h;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u64)) {
            return false;
        }
        u64 u64Var = (u64) obj;
        return g76.L(this.a, u64Var.a) && g76.L(this.b, u64Var.b) && g76.L(this.c, u64Var.c) && g76.L(this.d, u64Var.d) && g76.L(this.e, u64Var.e) && g76.L(this.f, u64Var.f) && this.g == u64Var.g && g76.L(this.h, u64Var.h);
    }

    public final int hashCode() {
        return this.h.hashCode() + ((ka1.b(this.f, ka1.b(this.e, ka1.b(this.d, ka1.b(this.c, ka1.b(this.b, this.a.hashCode() * 31, 31), 31), 31), 31), 31) + (this.g ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "Content(recommendedTagPillItems=" + this.a + ", trendingPostItems=" + this.b + ", staffPickItems=" + this.c + ", recommendedPostItems=" + this.d + ", whoToFollowItems=" + this.e + ", friendsToFollowItems=" + this.f + ", isRefreshing=" + this.g + ", sourceParameter=" + this.h + ")";
    }
}
