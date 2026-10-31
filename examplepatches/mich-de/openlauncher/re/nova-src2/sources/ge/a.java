package ge;

import fe.z1;
import gf.w;
import java.util.Arrays;
import ps.v;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final long f57378a;

    /* renamed from: b, reason: collision with root package name */
    public final z1 f57379b;

    /* renamed from: c, reason: collision with root package name */
    public final int f57380c;

    /* renamed from: d, reason: collision with root package name */
    public final w f57381d;

    /* renamed from: e, reason: collision with root package name */
    public final long f57382e;

    /* renamed from: f, reason: collision with root package name */
    public final z1 f57383f;

    /* renamed from: g, reason: collision with root package name */
    public final int f57384g;

    /* renamed from: h, reason: collision with root package name */
    public final w f57385h;

    /* renamed from: i, reason: collision with root package name */
    public final long f57386i;

    /* renamed from: j, reason: collision with root package name */
    public final long f57387j;

    public a(long j11, z1 z1Var, int i5, w wVar, long j12, z1 z1Var2, int i11, w wVar2, long j13, long j14) {
        this.f57378a = j11;
        this.f57379b = z1Var;
        this.f57380c = i5;
        this.f57381d = wVar;
        this.f57382e = j12;
        this.f57383f = z1Var2;
        this.f57384g = i11;
        this.f57385h = wVar2;
        this.f57386i = j13;
        this.f57387j = j14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && a.class == obj.getClass()) {
            a aVar = (a) obj;
            if (this.f57378a == aVar.f57378a && this.f57380c == aVar.f57380c && this.f57382e == aVar.f57382e && this.f57384g == aVar.f57384g && this.f57386i == aVar.f57386i && this.f57387j == aVar.f57387j && v.q(this.f57379b, aVar.f57379b) && v.q(this.f57381d, aVar.f57381d) && v.q(this.f57383f, aVar.f57383f) && v.q(this.f57385h, aVar.f57385h)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Long.valueOf(this.f57378a), this.f57379b, Integer.valueOf(this.f57380c), this.f57381d, Long.valueOf(this.f57382e), this.f57383f, Integer.valueOf(this.f57384g), this.f57385h, Long.valueOf(this.f57386i), Long.valueOf(this.f57387j)});
    }
}
