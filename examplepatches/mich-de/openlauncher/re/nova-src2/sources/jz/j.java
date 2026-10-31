package jz;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.launcher3.NovaBitmapInfo;
import kotlin.NotImplementedError;

/* loaded from: classes4.dex */
public final class j extends d8.a implements h {

    /* renamed from: d, reason: collision with root package name */
    public boolean f70532d;

    public /* synthetic */ j(Drawable drawable) {
        this(drawable, true);
    }

    @Override // aa.e
    public final BitmapInfo a(Bitmap bitmap, int i5, aa.c cVar, float f11, UserHandle userHandle) {
        return new NovaBitmapInfo(bitmap, i5, false, false, false);
    }

    @Override // aa.e
    public final void b(Canvas canvas) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }

    @Override // jz.h
    public final boolean c() {
        return false;
    }

    @Override // jz.h
    public final boolean d() {
        return this.f70532d;
    }

    @Override // aa.e
    public final Drawable e(Context context) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }

    public final void g() {
        this.f70532d = false;
    }

    public j(Drawable drawable, boolean z11) {
        super(drawable);
        this.f70532d = z11;
    }
}
