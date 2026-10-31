package androidx.compose.ui.draw;

import a80.m;
import androidx.compose.ui.Modifier$Node;
import b.c9;
import b2.f;
import b3.g;
import b3.j1;
import b3.o;
import c3.q2;
import com.google.android.libraries.places.api.model.PlaceTypes;
import f2.h;
import h2.e;
import i2.t;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import n2.c;
import z2.l;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/draw/PainterElement;", "Lb3/j1;", "Lf2/h;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final /* data */ class PainterElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final c f14119b;

    /* renamed from: c, reason: collision with root package name */
    public final f f14120c;

    /* renamed from: d, reason: collision with root package name */
    public final l f14121d;

    /* renamed from: e, reason: collision with root package name */
    public final float f14122e;

    /* renamed from: f, reason: collision with root package name */
    public final t f14123f;

    public PainterElement(c cVar, f fVar, l lVar, float f11, t tVar) {
        this.f14119b = cVar;
        this.f14120c = fVar;
        this.f14121d = lVar;
        this.f14122e = f11;
        this.f14123f = tVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        h hVar = new h();
        hVar.f54237a = this.f14119b;
        hVar.f54238b = true;
        hVar.f54239c = this.f14120c;
        hVar.f54240d = this.f14121d;
        hVar.f54241e = this.f14122e;
        hVar.f54242f = this.f14123f;
        return hVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PainterElement)) {
            return false;
        }
        PainterElement painterElement = (PainterElement) obj;
        return Intrinsics.b(this.f14119b, painterElement.f14119b) && Intrinsics.b(this.f14120c, painterElement.f14120c) && Intrinsics.b(this.f14121d, painterElement.f14121d) && Float.compare(this.f14122e, painterElement.f14122e) == 0 && Intrinsics.b(this.f14123f, painterElement.f14123f);
    }

    public final int hashCode() {
        int iD = m.d(this.f14122e, (this.f14121d.hashCode() + ((this.f14120c.hashCode() + c9.f(this.f14119b.hashCode() * 31, 31, true)) * 31)) * 31, 31);
        t tVar = this.f14123f;
        return iD + (tVar == null ? 0 : tVar.hashCode());
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("paint");
        q2Var.b().b(PlaceTypes.PAINTER, this.f14119b);
        q2Var.b().b("sizeToIntrinsics", Boolean.TRUE);
        q2Var.b().b("alignment", this.f14120c);
        q2Var.b().b("contentScale", this.f14121d);
        q2Var.b().b("alpha", Float.valueOf(this.f14122e));
        q2Var.b().b("colorFilter", this.f14123f);
    }

    public final String toString() {
        return "PainterElement(painter=" + this.f14119b + ", sizeToIntrinsics=true, alignment=" + this.f14120c + ", contentScale=" + this.f14121d + ", alpha=" + this.f14122e + ", colorFilter=" + this.f14123f + ')';
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        h hVar = (h) modifier$Node;
        boolean z11 = hVar.f54238b;
        c cVar = this.f14119b;
        boolean z12 = (z11 && e.a(hVar.f54237a.f(), cVar.f())) ? false : true;
        hVar.f54237a = cVar;
        hVar.f54238b = true;
        hVar.f54239c = this.f14120c;
        hVar.f54240d = this.f14121d;
        hVar.f54241e = this.f14122e;
        hVar.f54242f = this.f14123f;
        if (z12) {
            o.f(hVar).invalidateMeasurements$ui_release();
        }
        g.d(hVar);
    }
}
