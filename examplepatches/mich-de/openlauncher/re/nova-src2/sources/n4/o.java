package n4;

import android.app.Notification;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Shader;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.core.graphics.drawable.IconCompat;
import l1.a2;

/* loaded from: classes2.dex */
public final class o extends g0 {

    /* renamed from: e, reason: collision with root package name */
    public IconCompat f77842e;

    /* renamed from: f, reason: collision with root package name */
    public IconCompat f77843f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f77844g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f77845h;

    public static IconCompat e(Parcelable parcelable) {
        if (parcelable == null) {
            return null;
        }
        if (parcelable instanceof Icon) {
            return IconCompat.b((Icon) parcelable);
        }
        if (!(parcelable instanceof Bitmap)) {
            return null;
        }
        IconCompat iconCompat = new IconCompat(1);
        iconCompat.f14226b = (Bitmap) parcelable;
        return iconCompat;
    }

    @Override // n4.g0
    public final void b(a2 a2Var) {
        Bitmap bitmap;
        Notification.Builder builder = (Notification.Builder) a2Var.f73008b;
        Context context = (Context) a2Var.f73007a;
        Notification.BigPictureStyle bigContentTitle = new Notification.BigPictureStyle(builder).setBigContentTitle(this.f77808b);
        IconCompat iconCompat = this.f77842e;
        if (iconCompat != null) {
            if (Build.VERSION.SDK_INT >= 31) {
                n.a(bigContentTitle, iconCompat.f(context));
            } else {
                int iS = iconCompat.f14225a;
                if (iS == -1) {
                    iS = ps.f0.s(iconCompat.f14226b);
                }
                if (iS == 1) {
                    IconCompat iconCompat2 = this.f77842e;
                    int i5 = iconCompat2.f14225a;
                    if (i5 == -1) {
                        Object obj = iconCompat2.f14226b;
                        bitmap = obj instanceof Bitmap ? (Bitmap) obj : null;
                    } else if (i5 == 1) {
                        bitmap = (Bitmap) iconCompat2.f14226b;
                    } else {
                        if (i5 != 5) {
                            throw new IllegalStateException("called getBitmap() on " + iconCompat2);
                        }
                        Bitmap bitmap2 = (Bitmap) iconCompat2.f14226b;
                        int iMin = (int) (Math.min(bitmap2.getWidth(), bitmap2.getHeight()) * 0.6666667f);
                        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(iMin, iMin, Bitmap.Config.ARGB_8888);
                        Canvas canvas = new Canvas(bitmapCreateBitmap);
                        Paint paint = new Paint(3);
                        float f11 = iMin;
                        float f12 = 0.5f * f11;
                        float f13 = 0.9166667f * f12;
                        float f14 = 0.010416667f * f11;
                        paint.setColor(0);
                        paint.setShadowLayer(f14, 0.0f, f11 * 0.020833334f, 1023410176);
                        canvas.drawCircle(f12, f12, f13, paint);
                        paint.setShadowLayer(f14, 0.0f, 0.0f, 503316480);
                        canvas.drawCircle(f12, f12, f13, paint);
                        paint.clearShadowLayer();
                        paint.setColor(-16777216);
                        Shader.TileMode tileMode = Shader.TileMode.CLAMP;
                        BitmapShader bitmapShader = new BitmapShader(bitmap2, tileMode, tileMode);
                        Matrix matrix = new Matrix();
                        matrix.setTranslate((-(bitmap2.getWidth() - iMin)) / 2.0f, (-(bitmap2.getHeight() - iMin)) / 2.0f);
                        bitmapShader.setLocalMatrix(matrix);
                        paint.setShader(bitmapShader);
                        canvas.drawCircle(f12, f12, f13, paint);
                        canvas.setBitmap(null);
                        bitmap = bitmapCreateBitmap;
                    }
                    bigContentTitle = bigContentTitle.bigPicture(bitmap);
                }
            }
        }
        if (this.f77844g) {
            IconCompat iconCompat3 = this.f77843f;
            if (iconCompat3 == null) {
                bigContentTitle.bigLargeIcon((Bitmap) null);
            } else {
                m.a(bigContentTitle, iconCompat3.f(context));
            }
        }
        if (this.f77810d) {
            bigContentTitle.setSummaryText(this.f77809c);
        }
        if (Build.VERSION.SDK_INT >= 31) {
            n.c(bigContentTitle, this.f77845h);
            n.b(bigContentTitle, null);
        }
    }

    @Override // n4.g0
    public final String c() {
        return "androidx.core.app.NotificationCompat$BigPictureStyle";
    }

    @Override // n4.g0
    public final void d(Bundle bundle) {
        super.d(bundle);
        if (bundle.containsKey("android.largeIcon.big")) {
            this.f77843f = e(bundle.getParcelable("android.largeIcon.big"));
            this.f77844g = true;
        }
        Parcelable parcelable = bundle.getParcelable("android.picture");
        this.f77842e = parcelable != null ? e(parcelable) : e(bundle.getParcelable("android.pictureIcon"));
        this.f77845h = bundle.getBoolean("android.showBigPictureWhenCollapsed");
    }
}
