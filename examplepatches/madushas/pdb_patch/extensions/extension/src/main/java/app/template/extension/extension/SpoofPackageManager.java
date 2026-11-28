package app.template.extension.extension;

import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.*;
import android.content.res.Resources;
import android.content.ComponentName;
import android.graphics.Rect;
import android.os.UserHandle;
import java.util.List;

/** Delegating PackageManager used by PairIpSpoof. Generated from android-35 API surface. */
class SpoofPackageManager extends PackageManager {
    private final PackageManager mBase;
    private final String mPackageName;
    private final String mRedirectSourceDir;

    SpoofPackageManager(PackageManager base, String packageName, String redirectSourceDir) {
        mBase = base; mPackageName = packageName; mRedirectSourceDir = redirectSourceDir;
    }

    @Override public android.content.pm.PackageInfo getPackageInfo(java.lang.String p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getPackageInfo(p0, p1); }
    @Override public android.content.pm.PackageInfo getPackageInfo(android.content.pm.VersionedPackage p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getPackageInfo(p0, p1); }
    @Override public java.lang.String[] currentToCanonicalPackageNames(java.lang.String[] p0) { return mBase.currentToCanonicalPackageNames(p0); }
    @Override public java.lang.String[] canonicalToCurrentPackageNames(java.lang.String[] p0) { return mBase.canonicalToCurrentPackageNames(p0); }
    @Override public android.content.Intent getLaunchIntentForPackage(java.lang.String p0) { return mBase.getLaunchIntentForPackage(p0); }
    @Override public android.content.Intent getLeanbackLaunchIntentForPackage(java.lang.String p0) { return mBase.getLeanbackLaunchIntentForPackage(p0); }
    @Override public int[] getPackageGids(java.lang.String p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getPackageGids(p0); }
    @Override public int[] getPackageGids(java.lang.String p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getPackageGids(p0, p1); }
    @Override public int getPackageUid(java.lang.String p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getPackageUid(p0, p1); }
    @Override public android.content.pm.PermissionInfo getPermissionInfo(java.lang.String p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getPermissionInfo(p0, p1); }
    @Override public java.util.List<android.content.pm.PermissionInfo> queryPermissionsByGroup(java.lang.String p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.queryPermissionsByGroup(p0, p1); }
    @Override public android.content.pm.PermissionGroupInfo getPermissionGroupInfo(java.lang.String p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getPermissionGroupInfo(p0, p1); }
    @Override public java.util.List<android.content.pm.PermissionGroupInfo> getAllPermissionGroups(int p0) { return mBase.getAllPermissionGroups(p0); }
    @Override public android.content.pm.ActivityInfo getActivityInfo(android.content.ComponentName p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getActivityInfo(p0, p1); }
    @Override public android.content.pm.ActivityInfo getReceiverInfo(android.content.ComponentName p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getReceiverInfo(p0, p1); }
    @Override public android.content.pm.ServiceInfo getServiceInfo(android.content.ComponentName p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getServiceInfo(p0, p1); }
    @Override public android.content.pm.ProviderInfo getProviderInfo(android.content.ComponentName p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getProviderInfo(p0, p1); }
    @Override public java.util.List<android.content.pm.PackageInfo> getInstalledPackages(int p0) { return mBase.getInstalledPackages(p0); }
    @Override public java.util.List<android.content.pm.PackageInfo> getPackagesHoldingPermissions(java.lang.String[] p0, int p1) { return mBase.getPackagesHoldingPermissions(p0, p1); }
    @Override public int checkPermission(java.lang.String p0, java.lang.String p1) { return mBase.checkPermission(p0, p1); }
    @Override public boolean isPermissionRevokedByPolicy(java.lang.String p0, java.lang.String p1) { return mBase.isPermissionRevokedByPolicy(p0, p1); }
    @Override public boolean addPermission(android.content.pm.PermissionInfo p0) { return mBase.addPermission(p0); }
    @Override public boolean addPermissionAsync(android.content.pm.PermissionInfo p0) { return mBase.addPermissionAsync(p0); }
    @Override public void removePermission(java.lang.String p0) { mBase.removePermission(p0); }
    @Override public int checkSignatures(int p0, int p1) { return mBase.checkSignatures(p0, p1); }
    @Override public java.lang.String[] getPackagesForUid(int p0) { return mBase.getPackagesForUid(p0); }
    @Override public java.lang.String getNameForUid(int p0) { return mBase.getNameForUid(p0); }
    @Override public java.util.List<android.content.pm.ApplicationInfo> getInstalledApplications(int p0) { return mBase.getInstalledApplications(p0); }
    @Override public boolean isInstantApp() { return mBase.isInstantApp(); }
    @Override public boolean isInstantApp(java.lang.String p0) { return mBase.isInstantApp(p0); }
    @Override public int getInstantAppCookieMaxBytes() { return mBase.getInstantAppCookieMaxBytes(); }
    @Override public byte[] getInstantAppCookie() { return mBase.getInstantAppCookie(); }
    @Override public void clearInstantAppCookie() { mBase.clearInstantAppCookie(); }
    @Override public void updateInstantAppCookie(byte[] p0) { mBase.updateInstantAppCookie(p0); }
    @Override public java.lang.String[] getSystemSharedLibraryNames() { return mBase.getSystemSharedLibraryNames(); }
    @Override public java.util.List<android.content.pm.SharedLibraryInfo> getSharedLibraries(int p0) { return mBase.getSharedLibraries(p0); }
    @Override public android.content.pm.ChangedPackages getChangedPackages(int p0) { return mBase.getChangedPackages(p0); }
    @Override public android.content.pm.FeatureInfo[] getSystemAvailableFeatures() { return mBase.getSystemAvailableFeatures(); }
    @Override public boolean hasSystemFeature(java.lang.String p0) { return mBase.hasSystemFeature(p0); }
    @Override public boolean hasSystemFeature(java.lang.String p0, int p1) { return mBase.hasSystemFeature(p0, p1); }
    @Override public android.content.pm.ResolveInfo resolveActivity(android.content.Intent p0, int p1) { return mBase.resolveActivity(p0, p1); }
    @Override public java.util.List<android.content.pm.ResolveInfo> queryIntentActivities(android.content.Intent p0, int p1) { return mBase.queryIntentActivities(p0, p1); }
    @Override public java.util.List<android.content.pm.ResolveInfo> queryIntentActivityOptions(android.content.ComponentName p0, android.content.Intent[] p1, android.content.Intent p2, int p3) { return mBase.queryIntentActivityOptions(p0, p1, p2, p3); }
    @Override public java.util.List<android.content.pm.ResolveInfo> queryBroadcastReceivers(android.content.Intent p0, int p1) { return mBase.queryBroadcastReceivers(p0, p1); }
    @Override public android.content.pm.ResolveInfo resolveService(android.content.Intent p0, int p1) { return mBase.resolveService(p0, p1); }
    @Override public java.util.List<android.content.pm.ResolveInfo> queryIntentServices(android.content.Intent p0, int p1) { return mBase.queryIntentServices(p0, p1); }
    @Override public java.util.List<android.content.pm.ResolveInfo> queryIntentContentProviders(android.content.Intent p0, int p1) { return mBase.queryIntentContentProviders(p0, p1); }
    @Override public android.content.pm.ProviderInfo resolveContentProvider(java.lang.String p0, int p1) { return mBase.resolveContentProvider(p0, p1); }
    @Override public java.util.List<android.content.pm.ProviderInfo> queryContentProviders(java.lang.String p0, int p1, int p2) { return mBase.queryContentProviders(p0, p1, p2); }
    @Override public android.content.pm.InstrumentationInfo getInstrumentationInfo(android.content.ComponentName p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getInstrumentationInfo(p0, p1); }
    @Override public java.util.List<android.content.pm.InstrumentationInfo> queryInstrumentation(java.lang.String p0, int p1) { return mBase.queryInstrumentation(p0, p1); }
    @Override public android.graphics.drawable.Drawable getDrawable(java.lang.String p0, int p1, android.content.pm.ApplicationInfo p2) { return mBase.getDrawable(p0, p1, p2); }
    @Override public android.graphics.drawable.Drawable getActivityIcon(android.content.ComponentName p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getActivityIcon(p0); }
    @Override public android.graphics.drawable.Drawable getActivityIcon(android.content.Intent p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getActivityIcon(p0); }
    @Override public android.graphics.drawable.Drawable getActivityBanner(android.content.ComponentName p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getActivityBanner(p0); }
    @Override public android.graphics.drawable.Drawable getActivityBanner(android.content.Intent p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getActivityBanner(p0); }
    @Override public android.graphics.drawable.Drawable getDefaultActivityIcon() { return mBase.getDefaultActivityIcon(); }
    @Override public android.graphics.drawable.Drawable getApplicationIcon(android.content.pm.ApplicationInfo p0) { return mBase.getApplicationIcon(p0); }
    @Override public android.graphics.drawable.Drawable getApplicationIcon(java.lang.String p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getApplicationIcon(p0); }
    @Override public android.graphics.drawable.Drawable getApplicationBanner(android.content.pm.ApplicationInfo p0) { return mBase.getApplicationBanner(p0); }
    @Override public android.graphics.drawable.Drawable getApplicationBanner(java.lang.String p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getApplicationBanner(p0); }
    @Override public android.graphics.drawable.Drawable getActivityLogo(android.content.ComponentName p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getActivityLogo(p0); }
    @Override public android.graphics.drawable.Drawable getActivityLogo(android.content.Intent p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getActivityLogo(p0); }
    @Override public android.graphics.drawable.Drawable getApplicationLogo(android.content.pm.ApplicationInfo p0) { return mBase.getApplicationLogo(p0); }
    @Override public android.graphics.drawable.Drawable getApplicationLogo(java.lang.String p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getApplicationLogo(p0); }
    @Override public android.graphics.drawable.Drawable getUserBadgedIcon(android.graphics.drawable.Drawable p0, android.os.UserHandle p1) { return mBase.getUserBadgedIcon(p0, p1); }
    @Override public android.graphics.drawable.Drawable getUserBadgedDrawableForDensity(android.graphics.drawable.Drawable p0, android.os.UserHandle p1, android.graphics.Rect p2, int p3) { return mBase.getUserBadgedDrawableForDensity(p0, p1, p2, p3); }
    @Override public java.lang.CharSequence getUserBadgedLabel(java.lang.CharSequence p0, android.os.UserHandle p1) { return mBase.getUserBadgedLabel(p0, p1); }
    @Override public java.lang.CharSequence getText(java.lang.String p0, int p1, android.content.pm.ApplicationInfo p2) { return mBase.getText(p0, p1, p2); }
    @Override public android.content.res.XmlResourceParser getXml(java.lang.String p0, int p1, android.content.pm.ApplicationInfo p2) { return mBase.getXml(p0, p1, p2); }
    @Override public java.lang.CharSequence getApplicationLabel(android.content.pm.ApplicationInfo p0) { return mBase.getApplicationLabel(p0); }
    @Override public android.content.res.Resources getResourcesForActivity(android.content.ComponentName p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getResourcesForActivity(p0); }
    @Override public android.content.res.Resources getResourcesForApplication(android.content.pm.ApplicationInfo p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getResourcesForApplication(p0); }
    @Override public android.content.res.Resources getResourcesForApplication(java.lang.String p0) throws android.content.pm.PackageManager.NameNotFoundException { return mBase.getResourcesForApplication(p0); }
    @Override public void verifyPendingInstall(int p0, int p1) { mBase.verifyPendingInstall(p0, p1); }
    @Override public void extendVerificationTimeout(int p0, int p1, long p2) { mBase.extendVerificationTimeout(p0, p1, p2); }
    @Override public void setInstallerPackageName(java.lang.String p0, java.lang.String p1) { mBase.setInstallerPackageName(p0, p1); }
    @Override public java.lang.String getInstallerPackageName(java.lang.String p0) {
        return mPackageName.equals(p0) ? "com.android.vending" : mBase.getInstallerPackageName(p0);
    }

    /**
     * The app was adb-installed, so the framework records no installer. PairIP's check
     * reads the install source through JNI (which reaches the REAL framework method,
     * not any dex call site), so the delegator must fake it for this package.
     */
    @Override
    public android.content.pm.InstallSourceInfo getInstallSourceInfo(java.lang.String packageName)
            throws android.content.pm.PackageManager.NameNotFoundException {
        android.content.pm.InstallSourceInfo real = mBase.getInstallSourceInfo(packageName);
        if (!mPackageName.equals(packageName)) return real;
        try {
            java.lang.reflect.Constructor<android.content.pm.InstallSourceInfo> ctor =
                    android.content.pm.InstallSourceInfo.class.getDeclaredConstructor();
            ctor.setAccessible(true);
            android.content.pm.InstallSourceInfo fake = ctor.newInstance();
            for (java.lang.reflect.Field f : android.content.pm.InstallSourceInfo.class.getDeclaredFields()) {
                f.setAccessible(true);
                Class<?> t = f.getType();
                if (t == String.class) f.set(fake, "com.android.vending");
                else if (t == int.class) f.setInt(fake, 1); // PACKAGE_SOURCE_STORE
                else if (t == android.content.pm.SigningInfo.class) {
                    f.set(fake, real == null ? null : real.getInitiatingPackageSigningInfo());
                }
            }
            return fake;
        } catch (Throwable ignored) {
            return real;
        }
    }
    @Override public void addPackageToPreferred(java.lang.String p0) { mBase.addPackageToPreferred(p0); }
    @Override public void removePackageFromPreferred(java.lang.String p0) { mBase.removePackageFromPreferred(p0); }
    @Override public java.util.List<android.content.pm.PackageInfo> getPreferredPackages(int p0) { return mBase.getPreferredPackages(p0); }
    @Override public void addPreferredActivity(android.content.IntentFilter p0, int p1, android.content.ComponentName[] p2, android.content.ComponentName p3) { mBase.addPreferredActivity(p0, p1, p2, p3); }
    @Override public void clearPackagePreferredActivities(java.lang.String p0) { mBase.clearPackagePreferredActivities(p0); }
    @Override public int getPreferredActivities(java.util.List<android.content.IntentFilter> p0, java.util.List<android.content.ComponentName> p1, java.lang.String p2) { return mBase.getPreferredActivities(p0, p1, p2); }
    @Override public void setComponentEnabledSetting(android.content.ComponentName p0, int p1, int p2) { mBase.setComponentEnabledSetting(p0, p1, p2); }
    @Override public int getComponentEnabledSetting(android.content.ComponentName p0) { return mBase.getComponentEnabledSetting(p0); }
    @Override public void setApplicationEnabledSetting(java.lang.String p0, int p1, int p2) { mBase.setApplicationEnabledSetting(p0, p1, p2); }
    @Override public int getApplicationEnabledSetting(java.lang.String p0) { return mBase.getApplicationEnabledSetting(p0); }
    @Override public boolean isSafeMode() { return mBase.isSafeMode(); }
    @Override public void setApplicationCategoryHint(java.lang.String p0, int p1) { mBase.setApplicationCategoryHint(p0, p1); }
    @Override public android.content.pm.PackageInstaller getPackageInstaller() { return mBase.getPackageInstaller(); }
    @Override public boolean canRequestPackageInstalls() { return mBase.canRequestPackageInstalls(); }
    @Override public android.content.pm.ApplicationInfo getApplicationInfo(java.lang.String p0, int p1) throws android.content.pm.PackageManager.NameNotFoundException {
        android.content.pm.ApplicationInfo info = mBase.getApplicationInfo(p0, p1);
        if (mRedirectSourceDir != null && info != null && mPackageName.equals(info.packageName)) {
            info.sourceDir = mRedirectSourceDir; info.publicSourceDir = mRedirectSourceDir;
        }
        return info;
    }

    // ---- spoofed verdicts ---------------------------------------------------------

    @Override
    public boolean hasSigningCertificate(String packageName, byte[] certificate, int type) {
        return mPackageName.equals(packageName);
    }

    @Override
    public boolean hasSigningCertificate(int uid, byte[] certificate, int type) {
        return true;
    }

    @Override
    public int checkSignatures(String pkg1, String pkg2) {
        if (mPackageName.equals(pkg1) || mPackageName.equals(pkg2)) {
            return PackageManager.SIGNATURE_MATCH;
        }
        return mBase.checkSignatures(pkg1, pkg2);
    }
}
