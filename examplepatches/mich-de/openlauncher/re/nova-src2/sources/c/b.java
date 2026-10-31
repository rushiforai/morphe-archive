package c;

import android.app.ActivityManager;
import android.app.Notification;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageItemInfo;
import android.content.pm.PackageParser;
import android.content.pm.ResolveInfo;
import android.content.res.AbsResourcesImpl;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.IHwConfiguration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.hwtheme.HwThemeManager;
import android.os.IBinder;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.DisplayAdjustments;
import java.io.InputStream;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class b implements HwThemeManager.IHwThemeManager {

    /* renamed from: a, reason: collision with root package name */
    public final HwThemeManager.IHwThemeManager f18684a;

    public b(HwThemeManager.IHwThemeManager iHwThemeManager) {
        this.f18684a = iHwThemeManager;
    }

    public final void addSimpleUIConfig(PackageParser.Activity activity) {
        this.f18684a.addSimpleUIConfig(activity);
    }

    public final void applyDefaultHwTheme(boolean z11, Context context) {
        this.f18684a.applyDefaultHwTheme(z11, context);
    }

    public final Bitmap generateBitmap(Context context, Bitmap bitmap, int i5, int i11) {
        return this.f18684a.generateBitmap(context, bitmap, i5, i11);
    }

    public final Drawable getClonedDrawable(Context context, Drawable drawable) {
        return this.f18684a.getClonedDrawable(context, drawable);
    }

    public final String getDefaultLiveWallpaper(int i5) {
        return this.f18684a.getDefaultLiveWallpaper(i5);
    }

    public final InputStream getDefaultWallpaperIS(Context context, int i5) {
        return this.f18684a.getDefaultWallpaperIS(context, i5);
    }

    public final Drawable getHwBadgeDrawable(Notification notification, Context context, Drawable drawable) {
        return this.f18684a.getHwBadgeDrawable(notification, context, drawable);
    }

    public final IHwConfiguration getHwConfiguration() {
        return this.f18684a.getHwConfiguration();
    }

    public final AbsResourcesImpl getHwResourcesImpl() {
        Intrinsics.e(this.f18684a.getHwResourcesImpl(), "null cannot be cast to non-null type android.content.res.HwResourcesImpl");
        return new a();
    }

    public final int getHwThemeLauncherIconSize(ActivityManager activityManager, Resources resources) {
        return this.f18684a.getHwThemeLauncherIconSize(activityManager, resources);
    }

    public final Drawable getJoinBitmap(Context context, Drawable drawable, int i5) {
        return this.f18684a.getJoinBitmap(context, drawable, i5);
    }

    public final Resources getResources() {
        return this.f18684a.getResources();
    }

    public final int getShadowcolor(TypedArray typedArray, int i5) {
        return this.f18684a.getShadowcolor(typedArray, i5);
    }

    public final Bitmap getThemeBitmap(Resources resources, int i5) {
        return this.f18684a.getThemeBitmap(resources, i5);
    }

    public final int getThemeColor(int[] iArr, int i5, TypedValue typedValue, Resources resources, boolean z11) {
        return this.f18684a.getThemeColor(iArr, i5, typedValue, resources, z11);
    }

    public final void initForThemeFont(Configuration configuration) {
        this.f18684a.initForThemeFont(configuration);
    }

    public final IHwConfiguration initHwConfiguration() {
        return this.f18684a.initHwConfiguration();
    }

    public final boolean installDefaultHwTheme(Context context) {
        return this.f18684a.installDefaultHwTheme(context);
    }

    public final boolean installHwTheme(String str) {
        return this.f18684a.installHwTheme(str);
    }

    public final boolean isTAlarms(String str) {
        return this.f18684a.isTAlarms(str);
    }

    public final boolean isTNotifications(String str) {
        return this.f18684a.isTNotifications(str);
    }

    public final boolean isTRingtones(String str) {
        return this.f18684a.isTRingtones(str);
    }

    public final boolean isTargetFamily(String str) {
        return this.f18684a.isTargetFamily(str);
    }

    public final boolean makeIconCache(boolean z11) {
        return this.f18684a.makeIconCache(z11);
    }

    public final void removeIconCache(String str, String str2, int i5, int i11) {
        this.f18684a.removeIconCache(str, str2, i5, i11);
    }

    public final void restoreIconCache(String str, int i5) {
        this.f18684a.restoreIconCache(str, i5);
    }

    public final void retrieveSimpleUIConfig(ContentResolver contentResolver, Configuration configuration, int i5) {
        this.f18684a.retrieveSimpleUIConfig(contentResolver, configuration, i5);
    }

    public final boolean saveIconToCache(Bitmap bitmap, String str, boolean z11) {
        return this.f18684a.saveIconToCache(bitmap, str, z11);
    }

    public final void setThemeFont() {
        this.f18684a.setThemeFont();
    }

    public final boolean setThemeFontOnConfigChg(Configuration configuration) {
        return this.f18684a.setThemeFontOnConfigChg(configuration);
    }

    public final boolean shouldUseAdditionalChnFont(String str) {
        return this.f18684a.shouldUseAdditionalChnFont(str);
    }

    public final void updateConfiguration() {
        this.f18684a.updateConfiguration();
    }

    public final void updateIconCache(PackageItemInfo packageItemInfo, String str, String str2, int i5, int i11) {
        this.f18684a.updateIconCache(packageItemInfo, str, str2, i5, i11);
    }

    public final void updateResolveInfoIconCache(ResolveInfo resolveInfo, int i5, String str) {
        this.f18684a.updateResolveInfoIconCache(resolveInfo, i5, str);
    }

    public final void updateSimpleUIConfig(ContentResolver contentResolver, Configuration configuration, int i5) {
        this.f18684a.updateSimpleUIConfig(contentResolver, configuration, i5);
    }

    public final void applyDefaultHwTheme(boolean z11, Context context, int i5) {
        this.f18684a.applyDefaultHwTheme(z11, context, i5);
    }

    public final Resources getResources(AssetManager assetManager, DisplayMetrics displayMetrics, Configuration configuration, DisplayAdjustments displayAdjustments, IBinder iBinder) {
        return this.f18684a.getResources(assetManager, displayMetrics, configuration, displayAdjustments, iBinder);
    }

    public final Bitmap getThemeBitmap(Resources resources, int i5, Rect rect) {
        return this.f18684a.getThemeBitmap(resources, i5, rect);
    }

    public final boolean installDefaultHwTheme(Context context, int i5) {
        return this.f18684a.installDefaultHwTheme(context, i5);
    }

    public final boolean installHwTheme(String str, boolean z11) {
        return this.f18684a.installHwTheme(str, z11);
    }

    public final void updateConfiguration(boolean z11) {
        this.f18684a.updateConfiguration(z11);
    }

    public final Resources getResources(ClassLoader classLoader) {
        return this.f18684a.getResources(classLoader);
    }

    public final boolean installHwTheme(String str, boolean z11, int i5) {
        return this.f18684a.installHwTheme(str, z11, i5);
    }

    public final Resources getResources(boolean z11) {
        return this.f18684a.getResources(z11);
    }
}
