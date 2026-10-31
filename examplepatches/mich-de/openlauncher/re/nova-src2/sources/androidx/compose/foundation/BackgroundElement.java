package androidx.compose.foundation;

import a80.m;
import androidx.compose.ui.Modifier$Node;
import b3.g;
import b3.j1;
import c3.q2;
import c3.r;
import e0.o;
import i2.p;
import i2.s;
import i2.v0;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/BackgroundElement;", "Lb3/j1;", "Le0/o;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class BackgroundElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final long f13872b;

    /* renamed from: c, reason: collision with root package name */
    public final p f13873c;

    /* renamed from: d, reason: collision with root package name */
    public final float f13874d;

    /* renamed from: e, reason: collision with root package name */
    public final v0 f13875e;

    /* renamed from: f, reason: collision with root package name */
    public final r f13876f;

    public BackgroundElement(long j11, p pVar, v0 v0Var, int i5) {
        r rVar = r.n;
        j11 = (i5 & 1) != 0 ? s.f61147m : j11;
        pVar = (i5 & 2) != 0 ? null : pVar;
        this.f13872b = j11;
        this.f13873c = pVar;
        this.f13874d = 1.0f;
        this.f13875e = v0Var;
        this.f13876f = rVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        o oVar = new o();
        oVar.f50076a = this.f13872b;
        oVar.f50077b = this.f13873c;
        oVar.f50078c = this.f13874d;
        oVar.f50079d = this.f13875e;
        oVar.f50080e = 9205357640488583168L;
        return oVar;
    }

    public final boolean equals(Object obj) {
        BackgroundElement backgroundElement = obj instanceof BackgroundElement ? (BackgroundElement) obj : null;
        if (backgroundElement == null) {
            return false;
        }
        long j11 = backgroundElement.f13872b;
        int i5 = s.n;
        return ULong.a(this.f13872b, j11) && Intrinsics.b(this.f13873c, backgroundElement.f13873c) && this.f13874d == backgroundElement.f13874d && Intrinsics.b(this.f13875e, backgroundElement.f13875e);
    }

    public final int hashCode() {
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        int iHashCode = Long.hashCode(this.f13872b) * 31;
        p pVar = this.f13873c;
        return this.f13875e.hashCode() + m.d(this.f13874d, (iHashCode + (pVar != null ? pVar.hashCode() : 0)) * 31, 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        this.f13876f.getClass();
        Unit unit = Unit.f71706a;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        o oVar = (o) modifier$Node;
        oVar.f50076a = this.f13872b;
        oVar.f50077b = this.f13873c;
        oVar.f50078c = this.f13874d;
        oVar.f50079d = this.f13875e;
        g.d(oVar);
    }
}
