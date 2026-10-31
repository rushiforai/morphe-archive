package z9;

import aa.m;
import aa.n;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final class c extends m {

    /* renamed from: d, reason: collision with root package name */
    public final ga.f f98352d;

    /* renamed from: e, reason: collision with root package name */
    public final int f98353e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f98354f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f98355g;

    public c(Bitmap bitmap, int i5, boolean z11, ga.f fVar, int i11, int[] iArr, boolean z12) {
        super(bitmap, i5, z11);
        this.f98352d = fVar;
        this.f98353e = i11;
        this.f98354f = iArr;
        this.f98355g = z12;
        fVar.getClass();
    }

    @Override // aa.m
    /* renamed from: a */
    public final n newDrawable() {
        return new d(this.f98352d, this.f98353e, this.f98354f, this.f98355g);
    }

    @Override // aa.m, android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        return 0;
    }

    @Override // aa.m, android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        return new d(this.f98352d, this.f98353e, this.f98354f, this.f98355g);
    }
}
