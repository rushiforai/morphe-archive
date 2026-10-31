package t20;

import android.graphics.drawable.Drawable;

/* loaded from: classes4.dex */
public final class c extends Drawable.ConstantState {

    /* renamed from: a, reason: collision with root package name */
    public int f88488a;

    /* renamed from: b, reason: collision with root package name */
    public String f88489b;

    /* renamed from: c, reason: collision with root package name */
    public String f88490c;

    /* renamed from: d, reason: collision with root package name */
    public float f88491d;

    /* renamed from: e, reason: collision with root package name */
    public int f88492e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ d f88493f;

    public c(d dVar, int i5, String str, String str2, float f11, int i11) {
        this.f88493f = dVar;
        this.f88488a = i5;
        this.f88489b = str;
        this.f88490c = str2;
        this.f88491d = f11;
        this.f88492e = i11;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        return new d(new c(this.f88493f, this.f88488a, this.f88489b, this.f88490c, this.f88491d, this.f88492e));
    }
}
