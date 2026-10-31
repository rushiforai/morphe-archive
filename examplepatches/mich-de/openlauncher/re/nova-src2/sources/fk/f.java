package fk;

import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/* loaded from: classes3.dex */
public final class f extends bk.f {

    /* renamed from: r, reason: collision with root package name */
    public final RectF f55181r;

    public f(bk.j jVar, RectF rectF) {
        super(jVar);
        this.f55181r = rectF;
    }

    @Override // bk.f, android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        g gVar = new g(this);
        gVar.f55183y = this;
        gVar.invalidateSelf();
        return gVar;
    }

    public f(f fVar) {
        super(fVar);
        this.f55181r = fVar.f55181r;
    }
}
