package y9;

import android.graphics.drawable.Drawable;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public float f96996a;

    /* renamed from: b, reason: collision with root package name */
    public float f96997b;

    /* renamed from: c, reason: collision with root package name */
    public float f96998c;

    /* renamed from: d, reason: collision with root package name */
    public float f96999d;

    /* renamed from: e, reason: collision with root package name */
    public t f97000e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f97001f;

    /* renamed from: g, reason: collision with root package name */
    public Drawable f97002g;

    /* renamed from: h, reason: collision with root package name */
    public ga.j f97003h;

    /* renamed from: i, reason: collision with root package name */
    public int f97004i = 255;

    public z(float f11, float f12, float f13) {
        this.f96997b = f11;
        this.f96998c = f12;
        this.f96999d = f13;
    }

    public final void a(float f11, float f12, float f13) {
        t tVar = this.f97000e;
        if (tVar != null) {
            float[] fArr = tVar.f96962d;
            if (fArr[1] == f11 || fArr[2] == f12 || fArr[0] == f13) {
                return;
            } else {
                tVar.a();
            }
        }
        this.f96997b = f11;
        this.f96998c = f12;
        this.f96999d = f13;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PreviewItemDrawingParams{transX=");
        sb2.append(this.f96997b);
        sb2.append(", transY=");
        sb2.append(this.f96998c);
        sb2.append(", scale=");
        sb2.append(this.f96999d);
        sb2.append(", anim=");
        sb2.append(this.f97000e);
        sb2.append(", hidden=");
        sb2.append(this.f97001f);
        sb2.append(", drawable=");
        sb2.append(this.f97002g);
        sb2.append(", alpha=");
        return a2.c.m(sb2, this.f97004i, AbstractJsonLexerKt.END_OBJ);
    }
}
