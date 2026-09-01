package defpackage;

import androidx.work.OverwritingInputMerger;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c8f {
    public static final String z = d87.k("WorkSpec");
    public final String a;
    public j7f b;
    public final String c;
    public final String d;
    public dt2 e;
    public final dt2 f;
    public long g;
    public long h;
    public long i;
    public e72 j;
    public final int k;
    public tm0 l;
    public long m;
    public long n;
    public final long o;
    public final long p;
    public boolean q;
    public lw8 r;
    public final int s;
    public final int t;
    public long u;
    public int v;
    public final int w;
    public String x;
    public final Boolean y;

    public /* synthetic */ c8f(String str, j7f j7fVar, String str2, String str3, dt2 dt2Var, dt2 dt2Var2, long j, long j2, long j3, e72 e72Var, int i, tm0 tm0Var, long j4, long j5, long j6, long j7, boolean z2, lw8 lw8Var, int i2, long j8, int i3, int i4, String str4, Boolean bool, int i5) {
        this(str, (i5 & 2) != 0 ? j7f.ENQUEUED : j7fVar, str2, (i5 & 8) != 0 ? OverwritingInputMerger.class.getName() : str3, (i5 & 16) != 0 ? dt2.b : dt2Var, (i5 & 32) != 0 ? dt2.b : dt2Var2, (i5 & 64) != 0 ? 0L : j, (i5 & 128) != 0 ? 0L : j2, (i5 & 256) != 0 ? 0L : j3, (i5 & 512) != 0 ? e72.j : e72Var, (i5 & 1024) != 0 ? 0 : i, (i5 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? tm0.EXPONENTIAL : tm0Var, (i5 & 4096) != 0 ? 30000L : j4, (i5 & 8192) != 0 ? -1L : j5, (i5 & OlympusMakernoteDirectory.TAG_MAIN_INFO) == 0 ? j6 : 0L, (32768 & i5) != 0 ? -1L : j7, (65536 & i5) != 0 ? false : z2, (131072 & i5) != 0 ? lw8.RUN_AS_NON_EXPEDITED_WORK_REQUEST : lw8Var, (262144 & i5) != 0 ? 0 : i2, 0, (1048576 & i5) != 0 ? Long.MAX_VALUE : j8, (2097152 & i5) != 0 ? 0 : i3, (4194304 & i5) != 0 ? -256 : i4, (8388608 & i5) != 0 ? null : str4, (i5 & 16777216) != 0 ? Boolean.FALSE : bool);
    }

    public static c8f b(c8f c8fVar, String str, j7f j7fVar, String str2, dt2 dt2Var, int i, long j, int i2, int i3, long j2, int i4, int i5) {
        String str3 = (i5 & 1) != 0 ? c8fVar.a : str;
        j7f j7fVar2 = (i5 & 2) != 0 ? c8fVar.b : j7fVar;
        String str4 = (i5 & 4) != 0 ? c8fVar.c : str2;
        String str5 = c8fVar.d;
        dt2 dt2Var2 = (i5 & 16) != 0 ? c8fVar.e : dt2Var;
        dt2 dt2Var3 = c8fVar.f;
        long j3 = c8fVar.g;
        long j4 = c8fVar.h;
        long j5 = c8fVar.i;
        e72 e72Var = c8fVar.j;
        int i6 = (i5 & 1024) != 0 ? c8fVar.k : i;
        tm0 tm0Var = c8fVar.l;
        long j6 = c8fVar.m;
        long j7 = (i5 & 8192) != 0 ? c8fVar.n : j;
        long j8 = c8fVar.o;
        long j9 = c8fVar.p;
        boolean z2 = c8fVar.q;
        lw8 lw8Var = c8fVar.r;
        int i7 = (i5 & 262144) != 0 ? c8fVar.s : i2;
        int i8 = (i5 & 524288) != 0 ? c8fVar.t : i3;
        long j10 = (i5 & 1048576) != 0 ? c8fVar.u : j2;
        int i9 = (i5 & 2097152) != 0 ? c8fVar.v : i4;
        int i10 = c8fVar.w;
        String str6 = c8fVar.x;
        Boolean bool = c8fVar.y;
        str3.getClass();
        j7fVar2.getClass();
        str4.getClass();
        str5.getClass();
        dt2Var2.getClass();
        dt2Var3.getClass();
        e72Var.getClass();
        tm0Var.getClass();
        lw8Var.getClass();
        return new c8f(str3, j7fVar2, str4, str5, dt2Var2, dt2Var3, j3, j4, j5, e72Var, i6, tm0Var, j6, j7, j8, j9, z2, lw8Var, i7, i8, j10, i9, i10, str6, bool);
    }

    public final long a() {
        return dl7.k(this.b == j7f.ENQUEUED && this.k > 0, this.k, this.l, this.m, this.n, this.s, c(), this.g, this.i, this.h, this.u);
    }

    public final boolean c() {
        return this.h != 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c8f)) {
            return false;
        }
        c8f c8fVar = (c8f) obj;
        return g76.L(this.a, c8fVar.a) && this.b == c8fVar.b && g76.L(this.c, c8fVar.c) && g76.L(this.d, c8fVar.d) && g76.L(this.e, c8fVar.e) && g76.L(this.f, c8fVar.f) && this.g == c8fVar.g && this.h == c8fVar.h && this.i == c8fVar.i && g76.L(this.j, c8fVar.j) && this.k == c8fVar.k && this.l == c8fVar.l && this.m == c8fVar.m && this.n == c8fVar.n && this.o == c8fVar.o && this.p == c8fVar.p && this.q == c8fVar.q && this.r == c8fVar.r && this.s == c8fVar.s && this.t == c8fVar.t && this.u == c8fVar.u && this.v == c8fVar.v && this.w == c8fVar.w && g76.L(this.x, c8fVar.x) && g76.L(this.y, c8fVar.y);
    }

    public final int hashCode() {
        int iHashCode = (this.f.hashCode() + ((this.e.hashCode() + wgd.o(wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c), 31, this.d)) * 31)) * 31;
        long j = this.g;
        int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.h;
        int i2 = (i + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        long j3 = this.i;
        int iHashCode2 = (this.l.hashCode() + ((((this.j.hashCode() + ((i2 + ((int) (j3 ^ (j3 >>> 32)))) * 31)) * 31) + this.k) * 31)) * 31;
        long j4 = this.m;
        int i3 = (iHashCode2 + ((int) (j4 ^ (j4 >>> 32)))) * 31;
        long j5 = this.n;
        int i4 = (i3 + ((int) (j5 ^ (j5 >>> 32)))) * 31;
        long j6 = this.o;
        int i5 = (i4 + ((int) (j6 ^ (j6 >>> 32)))) * 31;
        long j7 = this.p;
        int iHashCode3 = (((((this.r.hashCode() + ((((i5 + ((int) (j7 ^ (j7 >>> 32)))) * 31) + (this.q ? 1231 : 1237)) * 31)) * 31) + this.s) * 31) + this.t) * 31;
        long j8 = this.u;
        int i6 = (((((iHashCode3 + ((int) ((j8 >>> 32) ^ j8))) * 31) + this.v) * 31) + this.w) * 31;
        String str = this.x;
        int iHashCode4 = (i6 + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool = this.y;
        return iHashCode4 + (bool != null ? bool.hashCode() : 0);
    }

    public final String toString() {
        return ev6.z(new StringBuilder("{WorkSpec: "), this.a, '}');
    }

    public c8f(String str, j7f j7fVar, String str2, String str3, dt2 dt2Var, dt2 dt2Var2, long j, long j2, long j3, e72 e72Var, int i, tm0 tm0Var, long j4, long j5, long j6, long j7, boolean z2, lw8 lw8Var, int i2, int i3, long j8, int i4, int i5, String str4, Boolean bool) {
        str.getClass();
        j7fVar.getClass();
        str2.getClass();
        str3.getClass();
        dt2Var.getClass();
        dt2Var2.getClass();
        e72Var.getClass();
        tm0Var.getClass();
        lw8Var.getClass();
        this.a = str;
        this.b = j7fVar;
        this.c = str2;
        this.d = str3;
        this.e = dt2Var;
        this.f = dt2Var2;
        this.g = j;
        this.h = j2;
        this.i = j3;
        this.j = e72Var;
        this.k = i;
        this.l = tm0Var;
        this.m = j4;
        this.n = j5;
        this.o = j6;
        this.p = j7;
        this.q = z2;
        this.r = lw8Var;
        this.s = i2;
        this.t = i3;
        this.u = j8;
        this.v = i4;
        this.w = i5;
        this.x = str4;
        this.y = bool;
    }
}
