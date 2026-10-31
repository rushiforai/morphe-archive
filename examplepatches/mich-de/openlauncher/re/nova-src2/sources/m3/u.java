package m3;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class u implements b {

    /* renamed from: a, reason: collision with root package name */
    public final int f75973a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75974b;

    /* renamed from: c, reason: collision with root package name */
    public final long f75975c;

    /* renamed from: d, reason: collision with root package name */
    public final x3.q f75976d;

    /* renamed from: e, reason: collision with root package name */
    public final x f75977e;

    /* renamed from: f, reason: collision with root package name */
    public final x3.i f75978f;

    /* renamed from: g, reason: collision with root package name */
    public final int f75979g;

    /* renamed from: h, reason: collision with root package name */
    public final int f75980h;

    /* renamed from: i, reason: collision with root package name */
    public final x3.s f75981i;

    public u(int i5, int i11, long j11, x3.q qVar, x xVar, x3.i iVar, int i12, int i13, x3.s sVar) {
        this.f75973a = i5;
        this.f75974b = i11;
        this.f75975c = j11;
        this.f75976d = qVar;
        this.f75977e = xVar;
        this.f75978f = iVar;
        this.f75979g = i12;
        this.f75980h = i13;
        this.f75981i = sVar;
        if (y3.p.a(j11, y3.p.f96617c) || y3.p.c(j11) >= 0.0f) {
            return;
        }
        s3.a.c("lineHeight can't be negative (" + y3.p.c(j11) + ')');
    }

    public final u a(u uVar) {
        return uVar == null ? this : v.a(this, uVar.f75973a, uVar.f75974b, uVar.f75975c, uVar.f75976d, uVar.f75977e, uVar.f75978f, uVar.f75979g, uVar.f75980h, uVar.f75981i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return this.f75973a == uVar.f75973a && this.f75974b == uVar.f75974b && y3.p.a(this.f75975c, uVar.f75975c) && Intrinsics.b(this.f75976d, uVar.f75976d) && Intrinsics.b(this.f75977e, uVar.f75977e) && Intrinsics.b(this.f75978f, uVar.f75978f) && this.f75979g == uVar.f75979g && this.f75980h == uVar.f75980h && Intrinsics.b(this.f75981i, uVar.f75981i);
    }

    public final int hashCode() {
        int iA = u4.a(this.f75974b, Integer.hashCode(this.f75973a) * 31, 31);
        y3.q[] qVarArr = y3.p.f96616b;
        int iD = b.c0.d(iA, 31, this.f75975c);
        x3.q qVar = this.f75976d;
        int iHashCode = (iD + (qVar != null ? qVar.hashCode() : 0)) * 31;
        x xVar = this.f75977e;
        int iHashCode2 = (iHashCode + (xVar != null ? xVar.hashCode() : 0)) * 31;
        x3.i iVar = this.f75978f;
        int iA2 = u4.a(this.f75980h, u4.a(this.f75979g, (iHashCode2 + (iVar != null ? iVar.hashCode() : 0)) * 31, 31), 31);
        x3.s sVar = this.f75981i;
        return iA2 + (sVar != null ? sVar.hashCode() : 0);
    }

    public final String toString() {
        return "ParagraphStyle(textAlign=" + ((Object) x3.k.b(this.f75973a)) + ", textDirection=" + ((Object) x3.m.a(this.f75974b)) + ", lineHeight=" + ((Object) y3.p.d(this.f75975c)) + ", textIndent=" + this.f75976d + ", platformStyle=" + this.f75977e + ", lineHeightStyle=" + this.f75978f + ", lineBreak=" + ((Object) x3.e.a(this.f75979g)) + ", hyphens=" + ((Object) x3.d.a(this.f75980h)) + ", textMotion=" + this.f75981i + ')';
    }
}
