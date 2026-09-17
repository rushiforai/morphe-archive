/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

import java.util.Collections;
import java.util.List;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class InstalledAppsBlocker {

    public static List<PackageInfo> interceptGetInstalledPackages(PackageManager pm, int flags) {
        Logger.printInfo(() -> "Installed apps blocker: blocked getInstalledPackages");
        return Collections.emptyList();
    }

    public static List<ApplicationInfo> interceptGetInstalledApplications(PackageManager pm, int flags) {
        Logger.printInfo(() -> "Installed apps blocker: blocked getInstalledApplications");
        return Collections.emptyList();
    }

    private InstalledAppsBlocker() {}
}
