package z9;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import com.android.launcher3.graphics.ShadowDrawable;

/* loaded from: classes2.dex */
public final class f extends Drawable.ConstantState {

    /* renamed from: a, reason: collision with root package name */
    public int f98373a;

    /* renamed from: b, reason: collision with root package name */
    public int f98374b;

    /* renamed from: c, reason: collision with root package name */
    public int f98375c;

    /* renamed from: d, reason: collision with root package name */
    public int f98376d;

    /* renamed from: e, reason: collision with root package name */
    public int f98377e;

    /* renamed from: f, reason: collision with root package name */
    public int f98378f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f98379g;

    /* renamed from: h, reason: collision with root package name */
    public Bitmap f98380h;

    /* renamed from: i, reason: collision with root package name */
    public Drawable.ConstantState f98381i;

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final boolean canApplyTheme() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        return this.f98373a;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        return new ShadowDrawable(this, 0);
    }
}
