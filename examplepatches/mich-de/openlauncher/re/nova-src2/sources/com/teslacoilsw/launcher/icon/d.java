package com.teslacoilsw.launcher.icon;

import aa.e;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import e10.y2;
import e10.z2;
import fz.y;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;
import java.util.function.IntFunction;

/* loaded from: classes4.dex */
public final class d extends a implements e {

    /* renamed from: v, reason: collision with root package name */
    public static final long f45799v = TimeUnit.MINUTES.toMillis(1);

    /* renamed from: t, reason: collision with root package name */
    public final y f45800t;

    /* renamed from: u, reason: collision with root package name */
    public int f45801u;

    public d(a aVar) {
        super(aVar.h(), aVar.i(), (fz.d) y2.f51877a.i().l());
        this.f45800t = new y();
    }

    public static d q(ApplicationInfo applicationInfo, Bundle bundle, IntFunction intFunction) {
        int i5;
        if (bundle != null && (i5 = bundle.getInt("com.android.launcher3.LEVEL_PER_TICK_ICON_ROUND", 0)) != 0) {
            Drawable drawableMutate = ((Drawable) intFunction.apply(i5)).mutate();
            if (drawableMutate instanceof AdaptiveIconDrawable) {
                Drawable drawableB0 = z2.B0(drawableMutate, (fz.d) y2.f51877a.i().l());
                d dVar = new d((a) drawableB0);
                dVar.f45801u = applicationInfo.targetSdkVersion;
                Drawable.ConstantState constantState = drawableB0.getConstantState();
                y yVar = dVar.f45800t;
                yVar.f56393g = constantState;
                yVar.f56387a = bundle.getInt("com.android.launcher3.HOUR_LAYER_INDEX", -1);
                yVar.f56388b = bundle.getInt("com.android.launcher3.MINUTE_LAYER_INDEX", -1);
                yVar.f56389c = bundle.getInt("com.android.launcher3.SECOND_LAYER_INDEX", -1);
                yVar.f56390d = bundle.getInt("com.android.launcher3.DEFAULT_HOUR", 0);
                yVar.f56391e = bundle.getInt("com.android.launcher3.DEFAULT_MINUTE", 0);
                yVar.f56392f = bundle.getInt("com.android.launcher3.DEFAULT_SECOND", 0);
                LayerDrawable layerDrawable = (LayerDrawable) dVar.i();
                int numberOfLayers = layerDrawable.getNumberOfLayers();
                int i11 = yVar.f56387a;
                if (i11 < 0 || i11 >= numberOfLayers) {
                    yVar.f56387a = -1;
                }
                int i12 = yVar.f56388b;
                if (i12 < 0 || i12 >= numberOfLayers) {
                    yVar.f56388b = -1;
                }
                int i13 = yVar.f56389c;
                if (i13 < 0 || i13 >= numberOfLayers) {
                    yVar.f56389c = -1;
                } else {
                    layerDrawable.setDrawable(i13, null);
                    yVar.f56389c = -1;
                }
                yVar.a(Calendar.getInstance(), layerDrawable);
                return dVar;
            }
        }
        return null;
    }

    public static d r(Context context, final int i5, String str) throws PackageManager.NameNotFoundException {
        try {
            PackageManager packageManager = context.getPackageManager();
            ApplicationInfo applicationInfo = packageManager.getApplicationInfo(str, 8320);
            final Resources resourcesForApplication = packageManager.getResourcesForApplication(applicationInfo);
            return q(applicationInfo, applicationInfo.metaData, new IntFunction() { // from class: fz.x
                @Override // java.util.function.IntFunction
                public final Object apply(int i11) {
                    return resourcesForApplication.getDrawableForDensity(i11, i5);
                }
            });
        } catch (Exception unused) {
            return null;
        }
    }

    public static d s(Drawable drawable, int i5, int i11, int i12, int i13, int i14, int i15) {
        Drawable drawableMutate;
        try {
            drawableMutate = drawable.mutate();
        } catch (Exception unused) {
        }
        if (!(drawableMutate instanceof AdaptiveIconDrawable)) {
            return null;
        }
        Drawable drawableB0 = z2.B0(drawableMutate, (fz.d) y2.f51877a.i().l());
        d dVar = new d((a) drawableB0);
        dVar.f45801u = Build.VERSION.SDK_INT;
        y yVar = dVar.f45800t;
        yVar.f56393g = drawableB0.getConstantState();
        yVar.f56387a = i5;
        yVar.f56388b = i11;
        yVar.f56389c = i12;
        yVar.f56390d = i13;
        yVar.f56391e = i14;
        yVar.f56392f = i15;
        LayerDrawable layerDrawable = (LayerDrawable) dVar.i();
        int numberOfLayers = layerDrawable.getNumberOfLayers();
        int i16 = yVar.f56387a;
        if (i16 < 0 || i16 >= numberOfLayers) {
            yVar.f56387a = -1;
        }
        int i17 = yVar.f56388b;
        if (i17 < 0 || i17 >= numberOfLayers) {
            yVar.f56388b = -1;
        }
        int i18 = yVar.f56389c;
        if (i18 >= 0 && i18 < numberOfLayers) {
            layerDrawable.setDrawable(i18, null);
            yVar.f56389c = -1;
            return dVar;
        }
        yVar.f56389c = -1;
        return dVar;
    }

    @Override // com.teslacoilsw.launcher.icon.a, aa.e
    public final BitmapInfo a(Bitmap bitmap, int i5, aa.c cVar, float f11, UserHandle userHandle) {
        cVar.f549f = true;
        return new NovaClockDrawableWrapper$ClockBitmapInfo(bitmap, i5, f11, this.f45800t, cVar.c(new AdaptiveIconDrawable(h().getConstantState().newDrawable(), null), Process.myUserHandle(), this.f45801u).f21151a, null);
    }

    @Override // com.teslacoilsw.launcher.icon.a, aa.e
    public final void b(Canvas canvas) {
        LayerDrawable layerDrawable = (LayerDrawable) i();
        y yVar = this.f45800t;
        int i5 = yVar.f56387a;
        if (i5 != -1) {
            layerDrawable.getDrawable(i5).setLevel(0);
        }
        int i11 = yVar.f56388b;
        if (i11 != -1) {
            layerDrawable.getDrawable(i11).setLevel(0);
        }
        int i12 = yVar.f56389c;
        if (i12 != -1) {
            layerDrawable.getDrawable(i12).setLevel(0);
        }
        draw(canvas);
        yVar.a(Calendar.getInstance(), (LayerDrawable) i());
    }

    @Override // com.teslacoilsw.launcher.icon.a, aa.e
    public final Drawable e(Context context) {
        return this;
    }
}
