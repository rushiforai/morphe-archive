package aa;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.Rect;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.os.Process;
import android.os.UserHandle;
import android.util.Log;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.launcher3.NovaBitmapInfo;

/* loaded from: classes.dex */
public abstract class c implements AutoCloseable {

    /* renamed from: k, reason: collision with root package name */
    public static final boolean f541k;

    /* renamed from: l, reason: collision with root package name */
    public static final boolean f542l;

    /* renamed from: m, reason: collision with root package name */
    public static final int f543m;

    /* renamed from: a, reason: collision with root package name */
    public final Rect f544a = new Rect();

    /* renamed from: b, reason: collision with root package name */
    public final Context f545b;

    /* renamed from: c, reason: collision with root package name */
    public final Canvas f546c;

    /* renamed from: d, reason: collision with root package name */
    public final PackageManager f547d;

    /* renamed from: e, reason: collision with root package name */
    public final g f548e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f549f;

    /* renamed from: g, reason: collision with root package name */
    public final int f550g;

    /* renamed from: h, reason: collision with root package name */
    public final int f551h;

    /* renamed from: i, reason: collision with root package name */
    public m0 f552i;

    /* renamed from: j, reason: collision with root package name */
    public Bitmap f553j;

    static {
        int i5 = Build.VERSION.SDK_INT;
        f541k = true;
        f542l = i5 >= 28;
        f543m = Color.rgb(245, 245, 245);
    }

    public c(Context context, int i5, int i11) {
        Paint paint = new Paint(3);
        if (i11 <= 0) {
            throw new IllegalStateException("iconBitmapSize must be >= 0");
        }
        Context applicationContext = context.getApplicationContext();
        this.f545b = applicationContext;
        this.f550g = i5;
        this.f551h = i11;
        this.f547d = applicationContext.getPackageManager();
        g gVar = new g(45);
        gVar.f588f = true;
        this.f548e = gVar;
        Canvas canvas = new Canvas();
        this.f546c = canvas;
        canvas.setDrawFilter(new PaintFlagsDrawFilter(4, 2));
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setColor(f543m);
        paint.setTextSize(context.getResources().getDisplayMetrics().density * 20.0f);
        this.f549f = false;
    }

    public abstract NovaBitmapInfo a(Bitmap bitmap, BitmapInfo bitmapInfo);

    public final void b(Bitmap bitmap, Drawable drawable) {
        Canvas canvas = this.f546c;
        canvas.setBitmap(bitmap);
        int i5 = this.f551h;
        int i11 = i5 - ((int) (i5 * 0.444f));
        drawable.setBounds(i11, i11, i5, i5);
        drawable.draw(canvas);
        canvas.setBitmap(null);
    }

    public final BitmapInfo c(Drawable drawable, UserHandle userHandle, int i5) {
        return d(drawable, userHandle, f542l || (f541k && i5 >= 26));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final BitmapInfo d(Drawable drawable, UserHandle userHandle, boolean z11) throws Resources.NotFoundException {
        int iA;
        float[] fArr = new float[1];
        boolean[] zArr = new boolean[1];
        Drawable drawableS = s(drawable, fArr, zArr);
        float f11 = fArr[0];
        int i5 = this.f551h;
        Bitmap bitmapE = e(drawableS, f11, i5);
        if (zArr[0]) {
            Canvas canvas = this.f546c;
            canvas.setBitmap(bitmapE);
            p().l(Bitmap.createBitmap(bitmapE), canvas);
            canvas.setBitmap(null);
        }
        if (userHandle != null && userHandle != Process.myUserHandle()) {
            try {
                Drawable userBadgedIcon = this.f547d.getUserBadgedIcon(new b(null, bitmapE), userHandle);
                bitmapE = userBadgedIcon instanceof BitmapDrawable ? ((BitmapDrawable) userBadgedIcon).getBitmap() : e(userBadgedIcon, 1.0f, i5);
            } catch (SecurityException e3) {
                Log.w("BaseIconFactory", "Unable to load user badge from system, using placeholder", e3);
                Context context = this.f545b;
                int dimensionPixelSize = context.getResources().getDimensionPixelSize(2131166369);
                l0 l0Var = new l0();
                l0Var.d(dimensionPixelSize);
                b(bitmapE, new LayerDrawable(new Drawable[]{new BitmapDrawable(context.getResources(), l0Var.a(dimensionPixelSize, dimensionPixelSize, dimensionPixelSize / 2.0f, -1, null)), new InsetDrawable(context.getDrawable(2131231522), (int) (((r8.getHeight() - dimensionPixelSize) / 2.0f) + 0.5f))}));
            }
        }
        Bitmap bitmap = bitmapE;
        if (this.f549f) {
            iA = 0;
        } else {
            g gVar = this.f548e;
            iA = gVar.a(bitmap, gVar.f587e);
        }
        return drawableS instanceof e ? ((e) drawableS).a(bitmap, iA, this, fArr[0], userHandle) : new NovaBitmapInfo(bitmap, iA, false, drawableS instanceof com.teslacoilsw.launcher.icon.a, false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:28:0x008a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Bitmap e(Drawable drawable, float f11, int i5) {
        int i11;
        int i12;
        BitmapDrawable bitmapDrawable;
        Bitmap bitmap;
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i5, i5, Bitmap.Config.ARGB_8888);
        if (drawable == 0) {
            return bitmapCreateBitmap;
        }
        Canvas canvas = this.f546c;
        canvas.setBitmap(bitmapCreateBitmap);
        Rect bounds = drawable.getBounds();
        Rect rect = this.f544a;
        rect.set(bounds);
        if (f541k && (drawable instanceof AdaptiveIconDrawable)) {
            int iMax = Math.max((int) Math.ceil(0.035f * r2), Math.round(((1.0f - f11) * i5) / 2.0f));
            int i13 = i5 - iMax;
            drawable.setBounds(iMax, iMax, i13, i13);
            if (drawable instanceof e) {
                ((e) drawable).b(canvas);
            } else {
                drawable.draw(canvas);
            }
        } else {
            if ((drawable instanceof BitmapDrawable) && (bitmap = (bitmapDrawable = (BitmapDrawable) drawable).getBitmap()) != null && bitmap.getDensity() == 0) {
                bitmapDrawable.setTargetDensity(this.f545b.getResources().getDisplayMetrics());
            }
            int intrinsicWidth = drawable.getIntrinsicWidth();
            int intrinsicHeight = drawable.getIntrinsicHeight();
            if (intrinsicWidth <= 0 || intrinsicHeight <= 0) {
                i11 = i5;
                i12 = i11;
                int i14 = (i5 - i11) / 2;
                int i15 = (i5 - i12) / 2;
                drawable.setBounds(i14, i15, i11 + i14, i12 + i15);
                int iSave = canvas.save();
                float f12 = i5 / 2;
                canvas.scale(f11, f11, f12, f12);
                drawable.draw(canvas);
                canvas.restoreToCount(iSave);
            } else {
                float f13 = intrinsicWidth / intrinsicHeight;
                if (intrinsicWidth > intrinsicHeight) {
                    i12 = (int) (i5 / f13);
                    i11 = i5;
                } else if (intrinsicHeight > intrinsicWidth) {
                    i11 = (int) (i5 * f13);
                    i12 = i5;
                }
                int i142 = (i5 - i11) / 2;
                int i152 = (i5 - i12) / 2;
                drawable.setBounds(i142, i152, i11 + i142, i12 + i152);
                int iSave2 = canvas.save();
                float f122 = i5 / 2;
                canvas.scale(f11, f11, f122, f122);
                drawable.draw(canvas);
                canvas.restoreToCount(iSave2);
            }
        }
        drawable.setBounds(rect);
        canvas.setBitmap(null);
        return bitmapCreateBitmap;
    }

    public final BitmapInfo f(Intent.ShortcutIconResource shortcutIconResource) throws PackageManager.NameNotFoundException {
        try {
            Resources resourcesForApplication = this.f547d.getResourcesForApplication(shortcutIconResource.packageName);
            if (resourcesForApplication != null) {
                return d(resourcesForApplication.getDrawableForDensity(resourcesForApplication.getIdentifier(shortcutIconResource.resourceName, null, null), this.f550g), Process.myUserHandle(), false);
            }
        } catch (Exception unused) {
        }
        return null;
    }

    public final BitmapInfo h(Bitmap bitmap) {
        int iA;
        int width = bitmap.getWidth();
        int i5 = this.f551h;
        if (i5 != width || i5 != bitmap.getHeight()) {
            bitmap = e(new BitmapDrawable(this.f545b.getResources(), bitmap), 1.0f, i5);
        }
        if (this.f549f) {
            iA = 0;
        } else {
            g gVar = this.f548e;
            iA = gVar.a(bitmap, gVar.f587e);
        }
        return new BitmapInfo(bitmap, iA);
    }

    public final Bitmap l(Drawable drawable) {
        float[] fArr = new float[1];
        return e(s(drawable, fArr, null), fArr[0], this.f551h);
    }

    public final m0 p() {
        if (this.f552i == null) {
            this.f552i = new m0(this.f551h, 0);
        }
        return this.f552i;
    }

    public abstract Drawable s(Drawable drawable, float[] fArr, boolean[] zArr);
}
