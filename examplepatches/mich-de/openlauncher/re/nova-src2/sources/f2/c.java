package f2;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class c implements y3.c {

    /* renamed from: a, reason: collision with root package name */
    public a f54230a = g.f54234a;

    /* renamed from: b, reason: collision with root package name */
    public cm.f f54231b;

    public final cm.f a(Function1 function1) {
        cm.f fVar = new cm.f(function1, 16);
        this.f54231b = fVar;
        return fVar;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f54230a.getDensity().getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f54230a.getDensity().getFontScale();
    }
}
