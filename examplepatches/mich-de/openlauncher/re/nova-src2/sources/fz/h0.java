package fz;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import e10.s2;
import e10.y2;
import e10.z2;
import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public final class h0 extends aa.f0 {

    /* renamed from: k, reason: collision with root package name */
    public static final ComponentName f56251k = new ComponentName("com.oneplus.deskclock", "com.oneplus.deskclock.DeskClock");

    /* renamed from: g, reason: collision with root package name */
    public final Context f56252g;

    /* renamed from: h, reason: collision with root package name */
    public u f56253h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f56254i;

    /* renamed from: j, reason: collision with root package name */
    public final z2 f56255j;

    public h0(Context context, u uVar) {
        super(context);
        this.f56252g = context;
        this.f56253h = uVar;
        this.f56254i = new ArrayList();
        this.f56255j = bh.g.Y();
    }

    public static Bitmap d(h0 h0Var, Resources resources, int i5) {
        Bitmap bitmapA;
        u uVar = h0Var.f56253h;
        int i11 = uVar.f56360b;
        int i12 = uVar.f56361c;
        if (i5 == 0 || (bitmapA = dy.g.a(resources, i5, i11, i12, i12)) == null) {
            return null;
        }
        if (bitmapA.getWidth() > i12 || bitmapA.getHeight() > i12) {
            bitmapA = Bitmap.createScaledBitmap(bitmapA, i12, i12, true);
        }
        bitmapA.setDensity(0);
        return bitmapA;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x005f A[Catch: NameNotFoundException -> 0x0064, TRY_LEAVE, TryCatch #1 {NameNotFoundException -> 0x0064, blocks: (B:5:0x0014, B:17:0x005f, B:8:0x002b, B:10:0x0033, B:13:0x003d, B:15:0x004d), top: B:54:0x0014, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00e0 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Drawable e(h0 h0Var, LauncherActivityInfo launcherActivityInfo, int i5) throws Resources.NotFoundException, PackageManager.NameNotFoundException {
        Drawable drawableForDensity;
        int i11;
        com.teslacoilsw.launcher.icon.d dVarS;
        Bundle bundle;
        Resources resourcesForApplication;
        int resourceId;
        ArrayList arrayList = h0Var.f56254i;
        Context context = h0Var.f56252g;
        Bitmap bitmap = null;
        if (arrayList.contains(launcherActivityInfo.getComponentName())) {
            PackageManager packageManager = context.getPackageManager();
            try {
                bundle = packageManager.getActivityInfo(launcherActivityInfo.getComponentName(), 8320).metaData;
                resourcesForApplication = packageManager.getResourcesForApplication(launcherActivityInfo.getApplicationInfo());
            } catch (PackageManager.NameNotFoundException unused) {
            }
            if (bundle != null) {
                String str = "com.teslacoilsw.launcher.calendarIconArray";
                int i12 = bundle.getInt("com.teslacoilsw.launcher.calendarIconArray", 0);
                if (i12 == 0) {
                    str = "com.google.android.calendar.dynamic_icons";
                    i12 = bundle.getInt("com.google.android.calendar.dynamic_icons", 0);
                }
                if (i12 != 0) {
                    try {
                        TypedArray typedArrayObtainTypedArray = resourcesForApplication.obtainTypedArray(i12);
                        resourceId = typedArrayObtainTypedArray.getResourceId(aa.f0.a(), 0);
                        typedArrayObtainTypedArray.recycle();
                    } catch (Resources.NotFoundException unused2) {
                        mc0.d.f76206a.b(b.c0.l("package defines '", str, "' but corresponding array not found"), new Object[0]);
                    }
                    drawableForDensity = resourceId == 0 ? resourcesForApplication.getDrawableForDensity(resourceId, i5, null) : null;
                }
            }
            resourceId = 0;
            if (resourceId == 0) {
            }
        }
        if (drawableForDensity != null) {
            return drawableForDensity;
        }
        if (Intrinsics.b(f56251k, launcherActivityInfo.getComponentName()) && (dVarS = com.teslacoilsw.launcher.icon.d.s(context.getDrawable(2131231667), 0, 1, 2, 10, 10, 30)) != null) {
            return dVarS;
        }
        if (((Boolean) y2.f51877a.g().l()).booleanValue()) {
            try {
                Resources resourcesForActivity = context.getPackageManager().getResourcesForActivity(launcherActivityInfo.getComponentName());
                dy.k kVar = e.f56218a;
                int iIntValue = ((Number) e.f(launcherActivityInfo).f71683a).intValue();
                int i13 = h0Var.f56253h.f56361c;
                if (iIntValue == 0) {
                    i11 = i5;
                    if (bitmap != null) {
                        try {
                            return new aa.n(bitmap, 0, false);
                        } catch (Exception unused3) {
                        }
                    }
                } else {
                    try {
                        int i14 = Build.VERSION.SDK_INT;
                        if (e.a(resourcesForActivity, 25)) {
                            i11 = i5;
                            try {
                                try {
                                    Bitmap bitmapB = dy.g.b(resourcesForActivity, iIntValue, i11, i13, i13, null, false);
                                    e.a(resourcesForActivity, i14);
                                    bitmap = bitmapB;
                                } catch (Throwable th2) {
                                    e.a(resourcesForActivity, Build.VERSION.SDK_INT);
                                    throw th2;
                                }
                            } catch (Throwable unused4) {
                            }
                        }
                    } catch (Throwable unused5) {
                    }
                    if (bitmap != null) {
                    }
                }
            } catch (Exception unused6) {
            }
        } else {
            i11 = i5;
        }
        return h0Var.f56255j.e0(context, launcherActivityInfo, h0Var.f56253h.f56361c, new g0(h0Var, launcherActivityInfo, i11));
    }

    public static final ArrayList f(Context context, String str) {
        List<ResolveInfo> listQueryIntentActivities;
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.LAUNCHER");
        intent.addCategory("android.intent.category.APP_CALENDAR");
        if (str != null) {
            intent.setPackage(str);
        }
        try {
            listQueryIntentActivities = context.getPackageManager().queryIntentActivities(intent, 8320);
        } catch (Exception e3) {
            e3.printStackTrace();
            listQueryIntentActivities = EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList(listQueryIntentActivities.size());
        int size = listQueryIntentActivities.size();
        for (int i5 = 0; i5 < size; i5++) {
            ResolveInfo resolveInfo = listQueryIntentActivities.get(i5);
            Bundle bundle = resolveInfo.activityInfo.metaData;
            if (bundle != null && bundle.containsKey("com.teslacoilsw.launcher.calendarIconArray")) {
                ActivityInfo activityInfo = resolveInfo.activityInfo;
                arrayList.add(new ComponentName(activityInfo.packageName, activityInfo.name));
            } else if ("com.google.android.calendar".equals(resolveInfo.activityInfo.packageName)) {
                ActivityInfo activityInfo2 = resolveInfo.activityInfo;
                arrayList.add(new ComponentName(activityInfo2.packageName, activityInfo2.name));
            }
        }
        return arrayList;
    }

    @Override // aa.f0
    public final String b() {
        String strG0 = bh.g.Y().g0(this.f56252g);
        StringBuilder sb2 = new StringBuilder();
        int i5 = aa.f0.f577e;
        sb2.append(i5 == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : this.f580b.getResources().getString(i5));
        sb2.append(this.f579a == aa.f0.f578f ? ",no-theme" : ",with-theme");
        return b.c0.E(sb2.toString(), strG0);
    }

    public final Drawable c(LauncherActivityInfo launcherActivityInfo, int i5) {
        gz.f fVar = (gz.f) this.f56253h.f56363e;
        if (fVar.isEmpty()) {
            return e(this, launcherActivityInfo, i5);
        }
        ComponentName componentName = launcherActivityInfo.getComponentName();
        Context context = this.f56252g;
        Drawable drawableF = fVar.f(context, this, componentName);
        Drawable drawableE = drawableF == null ? e(this, launcherActivityInfo, i5) : new ColorDrawable(-65281);
        if (drawableF == null) {
            y2.f51877a.getClass();
            s2 s2Var = y2.B1;
            KProperty kProperty = y2.f51881b[127];
            s2Var.getClass();
            if (((Boolean) s2Var.l()).booleanValue()) {
                drawableF = fVar.e(context, componentName, z2.B0(drawableE, (d) this.f56253h.f56362d));
            }
        }
        if (!(drawableF instanceof AdaptiveIconDrawable) && !(drawableF instanceof com.teslacoilsw.launcher.icon.a)) {
            return drawableF != null ? new t0(drawableF) : drawableE;
        }
        Drawable drawableB0 = z2.B0(drawableF, (d) this.f56253h.f56362d);
        Intrinsics.e(drawableB0, "null cannot be cast to non-null type com.teslacoilsw.launcher.icon.NovaAdaptiveIconDrawable");
        ((com.teslacoilsw.launcher.icon.a) drawableB0).f45791p = true;
        return drawableB0;
    }
}
