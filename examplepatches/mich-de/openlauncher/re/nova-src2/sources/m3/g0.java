package m3;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.gms.internal.measurement.k2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import i2.u0;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g0 implements b {

    /* renamed from: a, reason: collision with root package name */
    public final x3.o f75883a;

    /* renamed from: b, reason: collision with root package name */
    public final long f75884b;

    /* renamed from: c, reason: collision with root package name */
    public final q3.b0 f75885c;

    /* renamed from: d, reason: collision with root package name */
    public final q3.v f75886d;

    /* renamed from: e, reason: collision with root package name */
    public final q3.w f75887e;

    /* renamed from: f, reason: collision with root package name */
    public final q3.p f75888f;

    /* renamed from: g, reason: collision with root package name */
    public final String f75889g;

    /* renamed from: h, reason: collision with root package name */
    public final long f75890h;

    /* renamed from: i, reason: collision with root package name */
    public final x3.a f75891i;

    /* renamed from: j, reason: collision with root package name */
    public final x3.p f75892j;

    /* renamed from: k, reason: collision with root package name */
    public final t3.b f75893k;

    /* renamed from: l, reason: collision with root package name */
    public final long f75894l;

    /* renamed from: m, reason: collision with root package name */
    public final x3.l f75895m;
    public final u0 n;
    public final y o;

    /* renamed from: p, reason: collision with root package name */
    public final k2.g f75896p;

    public g0(long j11, long j12, q3.b0 b0Var, q3.v vVar, q3.w wVar, q3.p pVar, String str, long j13, x3.a aVar, x3.p pVar2, t3.b bVar, long j14, x3.l lVar, u0 u0Var, y yVar) {
        this(j11 != 16 ? new x3.c(j11) : x3.n.f95025a, j12, b0Var, vVar, wVar, pVar, str, j13, aVar, pVar2, bVar, j14, lVar, u0Var, yVar, null);
    }

    public final boolean a(g0 g0Var) {
        if (this == g0Var) {
            return true;
        }
        if (!y3.p.a(this.f75884b, g0Var.f75884b) || !Intrinsics.b(this.f75885c, g0Var.f75885c) || !Intrinsics.b(this.f75886d, g0Var.f75886d) || !Intrinsics.b(this.f75887e, g0Var.f75887e) || !Intrinsics.b(this.f75888f, g0Var.f75888f) || !Intrinsics.b(this.f75889g, g0Var.f75889g) || !y3.p.a(this.f75890h, g0Var.f75890h) || !Intrinsics.b(this.f75891i, g0Var.f75891i) || !Intrinsics.b(this.f75892j, g0Var.f75892j) || !Intrinsics.b(this.f75893k, g0Var.f75893k)) {
            return false;
        }
        long j11 = g0Var.f75894l;
        int i5 = i2.s.n;
        return ULong.a(this.f75894l, j11) && Intrinsics.b(this.o, g0Var.o);
    }

    public final boolean b(g0 g0Var) {
        return Intrinsics.b(this.f75883a, g0Var.f75883a) && Intrinsics.b(this.f75895m, g0Var.f75895m) && Intrinsics.b(this.n, g0Var.n) && Intrinsics.b(this.f75896p, g0Var.f75896p);
    }

    public final g0 c(g0 g0Var) {
        if (g0Var == null) {
            return this;
        }
        x3.o oVar = g0Var.f75883a;
        return h0.a(this, oVar.b(), oVar.c(), oVar.a(), g0Var.f75884b, g0Var.f75885c, g0Var.f75886d, g0Var.f75887e, g0Var.f75888f, g0Var.f75889g, g0Var.f75890h, g0Var.f75891i, g0Var.f75892j, g0Var.f75893k, g0Var.f75894l, g0Var.f75895m, g0Var.n, g0Var.o, g0Var.f75896p);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g0)) {
            return false;
        }
        g0 g0Var = (g0) obj;
        return a(g0Var) && b(g0Var);
    }

    public final int hashCode() {
        x3.o oVar = this.f75883a;
        long jB = oVar.b();
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        int iHashCode = Long.hashCode(jB) * 31;
        i2.p pVarC = oVar.c();
        int iHashCode2 = (Float.hashCode(oVar.a()) + ((iHashCode + (pVarC != null ? pVarC.hashCode() : 0)) * 31)) * 31;
        y3.q[] qVarArr = y3.p.f96616b;
        int iD = b.c0.d(iHashCode2, 31, this.f75884b);
        q3.b0 b0Var = this.f75885c;
        int i11 = (iD + (b0Var != null ? b0Var.f83539a : 0)) * 31;
        q3.v vVar = this.f75886d;
        int iHashCode3 = (i11 + (vVar != null ? Integer.hashCode(vVar.f83601a) : 0)) * 31;
        q3.w wVar = this.f75887e;
        int iHashCode4 = (iHashCode3 + (wVar != null ? Integer.hashCode(wVar.f83602a) : 0)) * 31;
        q3.p pVar = this.f75888f;
        int iHashCode5 = (iHashCode4 + (pVar != null ? pVar.hashCode() : 0)) * 31;
        String str = this.f75889g;
        int iD2 = b.c0.d((iHashCode5 + (str != null ? str.hashCode() : 0)) * 31, 31, this.f75890h);
        x3.a aVar = this.f75891i;
        int iHashCode6 = (iD2 + (aVar != null ? Float.hashCode(aVar.f95001a) : 0)) * 31;
        x3.p pVar2 = this.f75892j;
        int iHashCode7 = (iHashCode6 + (pVar2 != null ? pVar2.hashCode() : 0)) * 31;
        t3.b bVar = this.f75893k;
        int iD3 = b.c0.d((iHashCode7 + (bVar != null ? bVar.f88511a.hashCode() : 0)) * 31, 31, this.f75894l);
        x3.l lVar = this.f75895m;
        int i12 = (iD3 + (lVar != null ? lVar.f95023a : 0)) * 31;
        u0 u0Var = this.n;
        int iHashCode8 = (i12 + (u0Var != null ? u0Var.hashCode() : 0)) * 31;
        y yVar = this.o;
        int iHashCode9 = (iHashCode8 + (yVar != null ? yVar.hashCode() : 0)) * 31;
        k2.g gVar = this.f75896p;
        return iHashCode9 + (gVar != null ? gVar.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SpanStyle(color=");
        x3.o oVar = this.f75883a;
        sb2.append((Object) i2.s.h(oVar.b()));
        sb2.append(", brush=");
        sb2.append(oVar.c());
        sb2.append(", alpha=");
        sb2.append(oVar.a());
        sb2.append(", fontSize=");
        sb2.append((Object) y3.p.d(this.f75884b));
        sb2.append(", fontWeight=");
        sb2.append(this.f75885c);
        sb2.append(", fontStyle=");
        sb2.append(this.f75886d);
        sb2.append(", fontSynthesis=");
        sb2.append(this.f75887e);
        sb2.append(", fontFamily=");
        sb2.append(this.f75888f);
        sb2.append(", fontFeatureSettings=");
        sb2.append(this.f75889g);
        sb2.append(", letterSpacing=");
        sb2.append((Object) y3.p.d(this.f75890h));
        sb2.append(", baselineShift=");
        sb2.append(this.f75891i);
        sb2.append(", textGeometricTransform=");
        sb2.append(this.f75892j);
        sb2.append(", localeList=");
        sb2.append(this.f75893k);
        sb2.append(", background=");
        k2.v(this.f75894l, ", textDecoration=", sb2);
        sb2.append(this.f75895m);
        sb2.append(", shadow=");
        sb2.append(this.n);
        sb2.append(", platformStyle=");
        sb2.append(this.o);
        sb2.append(", drawStyle=");
        sb2.append(this.f75896p);
        sb2.append(')');
        return sb2.toString();
    }

    public g0(x3.o oVar, long j11, q3.b0 b0Var, q3.v vVar, q3.w wVar, q3.p pVar, String str, long j12, x3.a aVar, x3.p pVar2, t3.b bVar, long j13, x3.l lVar, u0 u0Var, y yVar, k2.g gVar) {
        this.f75883a = oVar;
        this.f75884b = j11;
        this.f75885c = b0Var;
        this.f75886d = vVar;
        this.f75887e = wVar;
        this.f75888f = pVar;
        this.f75889g = str;
        this.f75890h = j12;
        this.f75891i = aVar;
        this.f75892j = pVar2;
        this.f75893k = bVar;
        this.f75894l = j13;
        this.f75895m = lVar;
        this.n = u0Var;
        this.o = yVar;
        this.f75896p = gVar;
    }

    public g0(long j11, long j12, q3.b0 b0Var, q3.v vVar, q3.w wVar, q3.p pVar, String str, long j13, x3.a aVar, x3.p pVar2, t3.b bVar, long j14, x3.l lVar, u0 u0Var, int i5) {
        this((i5 & 1) != 0 ? i2.s.f61147m : j11, (i5 & 2) != 0 ? y3.p.f96617c : j12, (i5 & 4) != 0 ? null : b0Var, (i5 & 8) != 0 ? null : vVar, (i5 & 16) != 0 ? null : wVar, (i5 & 32) != 0 ? null : pVar, (i5 & 64) != 0 ? null : str, (i5 & 128) != 0 ? y3.p.f96617c : j13, (i5 & 256) != 0 ? null : aVar, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : pVar2, (i5 & 1024) != 0 ? null : bVar, (i5 & 2048) != 0 ? i2.s.f61147m : j14, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : lVar, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : u0Var, (y) null);
    }
}
