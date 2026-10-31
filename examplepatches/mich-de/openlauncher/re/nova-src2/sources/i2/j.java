package i2;

import android.graphics.PathMeasure;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final PathMeasure f61124a;

    public j(PathMeasure pathMeasure) {
        this.f61124a = pathMeasure;
    }

    public final float a() {
        return this.f61124a.getLength();
    }

    public final void b(float f11, float f12, n0 n0Var) {
        if (!(n0Var instanceof h)) {
            throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
        }
        this.f61124a.getSegment(f11, f12, ((h) n0Var).f61117a, true);
    }

    public final void c(h hVar) {
        this.f61124a.setPath(hVar != null ? hVar.f61117a : null, false);
    }
}
