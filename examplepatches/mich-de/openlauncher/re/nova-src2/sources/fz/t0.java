package fz;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.launcher3.NovaBitmapInfo;
import kotlin.NotImplementedError;

/* loaded from: classes4.dex */
public final class t0 extends DrawableWrapper implements jz.h {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f56357a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f56358b;

    public t0(Drawable drawable) {
        super(drawable);
        this.f56357a = (drawable instanceof AdaptiveIconDrawable) || (drawable instanceof com.teslacoilsw.launcher.icon.a);
        this.f56358b = true;
    }

    @Override // aa.e
    public final BitmapInfo a(Bitmap bitmap, int i5, aa.c cVar, float f11, UserHandle userHandle) {
        return new NovaBitmapInfo(bitmap, i5, true, this.f56357a, false);
    }

    @Override // aa.e
    public final void b(Canvas canvas) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }

    @Override // jz.h
    public final boolean c() {
        return this.f56358b;
    }

    @Override // jz.h
    public final boolean d() {
        return true;
    }

    @Override // aa.e
    public final Drawable e(Context context) {
        return this;
    }
}
