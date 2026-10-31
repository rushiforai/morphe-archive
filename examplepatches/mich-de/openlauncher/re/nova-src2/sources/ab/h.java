package ab;

import aa.l0;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Process;
import android.util.ArrayMap;
import android.util.Log;
import android.util.Size;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import java.util.Objects;
import java.util.concurrent.ExecutionException;
import mx.j0;
import o9.g3;
import o9.t1;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public int f721a;

    /* renamed from: b, reason: collision with root package name */
    public float f722b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f723c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f724d;

    /* renamed from: e, reason: collision with root package name */
    public Object f725e;

    public h(Context context) {
        this.f724d = Process.myUserHandle();
        this.f725e = new ArrayMap();
        this.f723c = context;
        float fW = com.google.android.gms.internal.consent_sdk.e0.w();
        this.f722b = fW <= 0.0f ? context.getResources().getDimension(2131166554) : fW;
        this.f721a = (int) (context.getResources().getDisplayMetrics().density * 48.0f);
    }

    public static Drawable c(Drawable drawable) {
        try {
            ya.x xVar = ya.j.f97147b;
            Objects.requireNonNull(drawable);
            return (Drawable) xVar.submit(new e(drawable, 0)).get();
        } catch (InterruptedException e3) {
            Thread.currentThread().interrupt();
            throw new RuntimeException(e3);
        } catch (ExecutionException e11) {
            throw new RuntimeException(e11);
        }
    }

    public void a() {
        AudioManager audioManager = (AudioManager) this.f723c;
        if (this.f721a == 0) {
            return;
        }
        if (wf.v.f94376a < 26) {
            audioManager.abandonAudioFocus((fe.b) this.f724d);
        }
        d(0);
    }

    public Bitmap b(final LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo, int i5, int[] iArr) {
        int height;
        int intrinsicWidth;
        int iMax = this.f721a;
        Context context = (Context) this.f723c;
        int i11 = i5 < 0 ? Integer.MAX_VALUE : i5;
        Drawable drawableC = null;
        if (((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).previewImage != 0) {
            try {
                drawableC = launcherAppWidgetProviderInfo.p(context, context.getResources().getDisplayMetrics().densityDpi);
            } catch (NullPointerException e3) {
                mc0.d.f76206a.p(e3, "Error loading widget preview for: %s", ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).provider);
            } catch (OutOfMemoryError e11) {
                Log.w("WidgetPreviewLoader", "Error loading widget preview for: " + ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).provider, e11);
            }
            if (drawableC != null) {
                drawableC = c(drawableC);
            } else {
                Log.w("WidgetPreviewLoader", "Can't load widget preview drawable 0x" + Integer.toHexString(((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).previewImage) + " for provider: " + ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).provider);
            }
        }
        final Drawable drawable = drawableC;
        boolean z11 = drawable != null;
        final int i12 = launcherAppWidgetProviderInfo.f21313a;
        final boolean z12 = z11;
        final int i13 = launcherAppWidgetProviderInfo.f21314b;
        final j0 j0VarP = ((za.d) za.d.p(context)).P();
        if (!z12 || drawable.getIntrinsicWidth() <= 0 || drawable.getIntrinsicHeight() <= 0) {
            ComponentName componentName = ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).provider;
            n30.b bVar = n30.b.f77778b;
            Size sizeB = gb.a.b(context, componentName, j0VarP, fg.a.l(i12), fg.a.l(i13));
            int width = sizeB.getWidth();
            height = sizeB.getHeight();
            intrinsicWidth = width;
        } else {
            intrinsicWidth = drawable.getIntrinsicWidth();
            height = drawable.getIntrinsicHeight();
        }
        if (intrinsicWidth == 0 || height == 0) {
            height = iMax;
        } else {
            if (intrinsicWidth < iMax || height < iMax) {
                float fMax = Math.max(iMax / intrinsicWidth, iMax / height);
                intrinsicWidth = (int) (intrinsicWidth * fMax);
                height = (int) (fMax * height);
            }
            iMax = intrinsicWidth;
        }
        if (iArr != null) {
            iArr[0] = iMax;
        }
        float f11 = iMax > i11 ? i11 / iMax : 1.0f;
        if (f11 != 1.0f) {
            iMax = Math.max((int) (iMax * f11), 1);
            height = Math.max((int) (height * f11), 1);
        }
        final int i14 = height;
        final float f12 = f11;
        final int i15 = iMax;
        return aa.f.a(i15, i14, new aa.f() { // from class: ab.d
            @Override // aa.f
            public final void b(Canvas canvas) throws Resources.NotFoundException, PackageManager.NameNotFoundException {
                RectF rectF;
                Drawable drawableForDensity;
                Canvas canvas2 = canvas;
                LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo2 = launcherAppWidgetProviderInfo;
                j0 j0Var = j0VarP;
                float f13 = f12;
                h hVar = this.f693a;
                Context context2 = (Context) hVar.f723c;
                boolean z13 = z12;
                int i16 = i15;
                int i17 = i14;
                if (z13) {
                    Drawable drawable2 = drawable;
                    drawable2.setBounds(0, 0, i16, i17);
                    drawable2.draw(canvas2);
                    return;
                }
                int i18 = 1;
                Paint paint = new Paint(1);
                if (g3.f79853h) {
                    rectF = new RectF(0.0f, 0.0f, i16, i17);
                    paint.setStyle(Paint.Style.FILL);
                    paint.setColor(-1);
                    float dimension = context2.getResources().getDimension(17104904);
                    canvas2.drawRoundRect(rectF, dimension, dimension, paint);
                } else {
                    Resources resources = context2.getResources();
                    l0 l0Var = new l0();
                    l0Var.f609c = resources.getDimension(2131166557);
                    l0Var.f612f = hVar.f722b;
                    float dimension2 = resources.getDimension(2131166555);
                    l0Var.f610d = dimension2;
                    float f14 = l0Var.f609c;
                    float f15 = (i17 - f14) - dimension2;
                    rectF = l0Var.f607a;
                    rectF.set(f14, f14, i16 - f14, f15);
                    l0Var.b(canvas2, -1);
                }
                RectF rectF2 = rectF;
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(context2.getResources().getDimension(2131166553));
                paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
                float f16 = rectF2.left;
                float fWidth = rectF2.width();
                int i19 = i12;
                float f17 = fWidth / i19;
                int i21 = 1;
                while (i21 < i19) {
                    f16 += f17;
                    canvas2.drawLine(f16, 0.0f, f16, i17, paint);
                    i21++;
                    canvas2 = canvas;
                }
                float f18 = rectF2.top;
                float fHeight = rectF2.height();
                int i22 = i13;
                float f19 = fHeight / i22;
                while (i18 < i22) {
                    float f21 = f18 + f19;
                    canvas.drawLine(0.0f, f21, i16, f21, paint);
                    i18++;
                    f18 = f21;
                }
                try {
                    fz.d0 d0Var = ((t1) t1.f80131h.h(context2)).f80135d;
                    String packageName = ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo2).provider.getPackageName();
                    int i23 = ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo2).icon;
                    d0Var.getClass();
                    try {
                        Resources resourcesForApplication = d0Var.f557c.getResourcesForApplication(packageName);
                        if (resourcesForApplication == null || i23 == 0) {
                            int i24 = d0Var.f560f;
                            boolean z14 = aa.c.f541k;
                            drawableForDensity = Resources.getSystem().getDrawableForDensity(17301651, i24);
                        } else {
                            try {
                                drawableForDensity = resourcesForApplication.getDrawableForDensity(i23, d0Var.f560f);
                            } catch (Resources.NotFoundException unused) {
                            }
                        }
                    } catch (PackageManager.NameNotFoundException unused2) {
                        int i25 = d0Var.f560f;
                        boolean z15 = aa.c.f541k;
                        drawableForDensity = Resources.getSystem().getDrawableForDensity(17301651, i25);
                    }
                    if (drawableForDensity != null) {
                        int iMin = (int) Math.min(j0Var.D * f13, Math.min(rectF2.width(), rectF2.height()));
                        Drawable drawableC2 = h.c(drawableForDensity);
                        int i26 = (i16 - iMin) / 2;
                        int i27 = (i17 - iMin) / 2;
                        drawableC2.setBounds(i26, i27, i26 + iMin, iMin + i27);
                        drawableC2.draw(canvas);
                    }
                } catch (Resources.NotFoundException unused3) {
                }
            }
        });
    }

    public void d(int i5) {
        if (this.f721a == i5) {
            return;
        }
        this.f721a = i5;
        float f11 = i5 == 3 ? 0.2f : 1.0f;
        if (this.f722b == f11) {
            return;
        }
        this.f722b = f11;
        fe.x xVar = (fe.x) this.f725e;
        if (xVar != null) {
            fe.a0 a0Var = xVar.f55061a;
            a0Var.g0(1, 2, Float.valueOf(a0Var.f54675b0 * a0Var.A.f722b));
        }
    }

    public int e(int i5, boolean z11) {
        a();
        return z11 ? 1 : -1;
    }

    public h(Context context, Handler handler, fe.x xVar) {
        this.f722b = 1.0f;
        AudioManager audioManager = (AudioManager) context.getApplicationContext().getSystemService("audio");
        audioManager.getClass();
        this.f723c = audioManager;
        this.f725e = xVar;
        this.f724d = new fe.b(this, handler);
        this.f721a = 0;
    }
}
