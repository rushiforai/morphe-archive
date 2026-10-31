package jz;

import aa.n;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.launcher3.NovaBitmapInfo;
import kotlin.NotImplementedError;

/* loaded from: classes4.dex */
public final class i extends n implements h {
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f70531p;

    public /* synthetic */ i(Bitmap bitmap, int i5) {
        this(bitmap, 0, true, (i5 & 8) != 0);
    }

    @Override // aa.e
    public final BitmapInfo a(Bitmap bitmap, int i5, aa.c cVar, float f11, UserHandle userHandle) {
        return new NovaBitmapInfo(bitmap, i5, this.f70531p, false, false);
    }

    @Override // aa.e
    public final void b(Canvas canvas) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }

    @Override // jz.h
    public final boolean c() {
        return this.f70531p;
    }

    @Override // jz.h
    public final boolean d() {
        return this.o;
    }

    @Override // aa.e
    public final Drawable e(Context context) {
        return this;
    }

    public final void l() {
        this.o = false;
    }

    public i(Bitmap bitmap, int i5, boolean z11, boolean z12) {
        super(bitmap, i5, false);
        this.o = z11;
        this.f70531p = z12;
    }
}
