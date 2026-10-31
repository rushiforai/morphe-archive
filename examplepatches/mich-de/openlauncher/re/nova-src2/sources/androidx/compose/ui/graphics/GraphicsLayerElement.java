package androidx.compose.ui.graphics;

import a5.d1;
import a80.m;
import androidx.compose.ui.Modifier$Node;
import b.c0;
import b.c9;
import b.u4;
import b0.x;
import b3.j1;
import b3.o;
import b3.t1;
import c3.q2;
import com.google.android.gms.internal.measurement.k2;
import i2.s;
import i2.v0;
import i2.w0;
import i2.y0;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/graphics/GraphicsLayerElement;", "Lb3/j1;", "Li2/w0;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final /* data */ class GraphicsLayerElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final float f14136b;

    /* renamed from: c, reason: collision with root package name */
    public final float f14137c;

    /* renamed from: d, reason: collision with root package name */
    public final float f14138d;

    /* renamed from: e, reason: collision with root package name */
    public final float f14139e;

    /* renamed from: f, reason: collision with root package name */
    public final float f14140f;

    /* renamed from: g, reason: collision with root package name */
    public final long f14141g;

    /* renamed from: h, reason: collision with root package name */
    public final v0 f14142h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f14143i;

    /* renamed from: j, reason: collision with root package name */
    public final long f14144j;

    /* renamed from: k, reason: collision with root package name */
    public final long f14145k;

    public GraphicsLayerElement(float f11, float f12, float f13, float f14, float f15, long j11, v0 v0Var, boolean z11, long j12, long j13) {
        this.f14136b = f11;
        this.f14137c = f12;
        this.f14138d = f13;
        this.f14139e = f14;
        this.f14140f = f15;
        this.f14141g = j11;
        this.f14142h = v0Var;
        this.f14143i = z11;
        this.f14144j = j12;
        this.f14145k = j13;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        w0 w0Var = new w0();
        w0Var.f61176a = this.f14136b;
        w0Var.f61177b = this.f14137c;
        w0Var.f61178c = this.f14138d;
        w0Var.f61179d = this.f14139e;
        w0Var.f61180e = this.f14140f;
        w0Var.f61181f = 8.0f;
        w0Var.f61182g = this.f14141g;
        w0Var.f61183h = this.f14142h;
        w0Var.f61184i = this.f14143i;
        w0Var.f61185j = this.f14144j;
        w0Var.f61186k = this.f14145k;
        w0Var.f61187l = 3;
        w0Var.f61188m = new x(w0Var, 12);
        return w0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GraphicsLayerElement)) {
            return false;
        }
        GraphicsLayerElement graphicsLayerElement = (GraphicsLayerElement) obj;
        if (Float.compare(this.f14136b, graphicsLayerElement.f14136b) != 0 || Float.compare(this.f14137c, graphicsLayerElement.f14137c) != 0 || Float.compare(this.f14138d, graphicsLayerElement.f14138d) != 0 || Float.compare(0.0f, 0.0f) != 0 || Float.compare(0.0f, 0.0f) != 0 || Float.compare(this.f14139e, graphicsLayerElement.f14139e) != 0 || Float.compare(0.0f, 0.0f) != 0 || Float.compare(0.0f, 0.0f) != 0 || Float.compare(this.f14140f, graphicsLayerElement.f14140f) != 0 || Float.compare(8.0f, 8.0f) != 0 || !y0.a(this.f14141g, graphicsLayerElement.f14141g) || !Intrinsics.b(this.f14142h, graphicsLayerElement.f14142h) || this.f14143i != graphicsLayerElement.f14143i) {
            return false;
        }
        long j11 = graphicsLayerElement.f14144j;
        int i5 = s.n;
        return ULong.a(this.f14144j, j11) && ULong.a(this.f14145k, graphicsLayerElement.f14145k);
    }

    public final int hashCode() {
        int iD = m.d(8.0f, m.d(this.f14140f, m.d(0.0f, m.d(0.0f, m.d(this.f14139e, m.d(0.0f, m.d(0.0f, m.d(this.f14138d, m.d(this.f14137c, Float.hashCode(this.f14136b) * 31, 31), 31), 31), 31), 31), 31), 31), 31), 31);
        int i5 = y0.f61192c;
        int iF = c9.f((this.f14142h.hashCode() + c0.d(iD, 31, this.f14141g)) * 31, 961, this.f14143i);
        int i11 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return u4.a(3, u4.a(0, c0.d(c0.d(iF, 31, this.f14144j), 31, this.f14145k), 31), 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("graphicsLayer");
        q2Var.b().b("scaleX", Float.valueOf(this.f14136b));
        q2Var.b().b("scaleY", Float.valueOf(this.f14137c));
        q2Var.b().b("alpha", Float.valueOf(this.f14138d));
        d1 d1VarB = q2Var.b();
        Float fValueOf = Float.valueOf(0.0f);
        d1VarB.b("translationX", fValueOf);
        q2Var.b().b("translationY", fValueOf);
        q2Var.b().b("shadowElevation", Float.valueOf(this.f14139e));
        q2Var.b().b("rotationX", fValueOf);
        q2Var.b().b("rotationY", fValueOf);
        q2Var.b().b("rotationZ", Float.valueOf(this.f14140f));
        q2Var.b().b("cameraDistance", Float.valueOf(8.0f));
        q2Var.b().b("transformOrigin", new y0(this.f14141g));
        q2Var.b().b("shape", this.f14142h);
        q2Var.b().b("clip", Boolean.valueOf(this.f14143i));
        q2Var.b().b("renderEffect", null);
        q2Var.b().b("ambientShadowColor", new s(this.f14144j));
        q2Var.b().b("spotShadowColor", new s(this.f14145k));
        q2Var.b().b("compositingStrategy", new i2.x());
        q2Var.b().b("blendMode", new i2.m());
        q2Var.b().b("colorFilter", null);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("GraphicsLayerElement(scaleX=");
        sb2.append(this.f14136b);
        sb2.append(", scaleY=");
        sb2.append(this.f14137c);
        sb2.append(", alpha=");
        sb2.append(this.f14138d);
        sb2.append(", translationX=0.0, translationY=0.0, shadowElevation=");
        sb2.append(this.f14139e);
        sb2.append(", rotationX=0.0, rotationY=0.0, rotationZ=");
        sb2.append(this.f14140f);
        sb2.append(", cameraDistance=8.0, transformOrigin=");
        sb2.append((Object) y0.d(this.f14141g));
        sb2.append(", shape=");
        sb2.append(this.f14142h);
        sb2.append(", clip=");
        sb2.append(this.f14143i);
        sb2.append(", renderEffect=null, ambientShadowColor=");
        k2.v(this.f14144j, ", spotShadowColor=", sb2);
        sb2.append((Object) s.h(this.f14145k));
        sb2.append(", compositingStrategy=CompositingStrategy(value=0), blendMode=");
        sb2.append((Object) i2.m.a(3));
        sb2.append(", colorFilter=null)");
        return sb2.toString();
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        w0 w0Var = (w0) modifier$Node;
        w0Var.f61176a = this.f14136b;
        w0Var.f61177b = this.f14137c;
        w0Var.f61178c = this.f14138d;
        w0Var.f61179d = this.f14139e;
        w0Var.f61180e = this.f14140f;
        w0Var.f61181f = 8.0f;
        w0Var.f61182g = this.f14141g;
        w0Var.f61183h = this.f14142h;
        w0Var.f61184i = this.f14143i;
        w0Var.f61185j = this.f14144j;
        w0Var.f61186k = this.f14145k;
        w0Var.f61187l = 3;
        t1 t1Var = o.d(w0Var, 2).f17359p;
        if (t1Var != null) {
            t1Var.V0(true, w0Var.f61188m);
        }
    }
}
