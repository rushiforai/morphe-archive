package dev.jason.gboardpatches.extension.websearch;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@SuppressLint("QueryPermissionsNeeded")
public final class GboardCustomTabsProviderResolver {
    static final String CUSTOM_TABS_SERVICE_ACTION =
            "android.support.customtabs.action.CustomTabsService";

    private GboardCustomTabsProviderResolver() {
    }

    public static boolean hasBrowsableActivity(Context context, String url) {
        if (context == null || url == null) {
            return false;
        }
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addCategory(Intent.CATEGORY_BROWSABLE);
            List<ResolveInfo> handlers = context.getPackageManager().queryIntentActivities(
                    intent, PackageManager.MATCH_DEFAULT_ONLY);
            return handlers != null && !handlers.isEmpty();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static List<ProviderOption> installedProviders(Context context) {
        Map<String, String> providers = new LinkedHashMap<>();
        if (context == null) {
            return new ArrayList<>();
        }
        try {
            PackageManager packageManager = context.getPackageManager();
            Intent query = new Intent(CUSTOM_TABS_SERVICE_ACTION);
            for (ResolveInfo service : packageManager.queryIntentServices(
                    query, PackageManager.MATCH_ALL)) {
                if (service.serviceInfo == null || service.serviceInfo.packageName == null) {
                    continue;
                }
                String packageName = service.serviceInfo.packageName;
                if (!providers.containsKey(packageName)) {
                    providers.put(packageName, applicationLabel(packageManager, packageName));
                }
            }
        } catch (Throwable ignored) {
            // System-default browser fallback remains available.
        }
        List<ProviderOption> result = new ArrayList<>();
        for (Map.Entry<String, String> entry : providers.entrySet()) {
            result.add(new ProviderOption(entry.getKey(), entry.getValue()));
        }
        Collections.sort(result,
                (left, right) -> left.label.compareToIgnoreCase(right.label));
        return result;
    }

    static List<String> launchCandidates(Context context, String selectedProvider, String url) {
        List<String> result = new ArrayList<>();
        if (selectedProvider != null
                && !GboardFloatingWebSearchSettings.BROWSER_SYSTEM_DEFAULT.equals(
                        selectedProvider)) {
            result.add(selectedProvider);
        }
        String defaultPackage = resolveDefaultBrowserPackage(context, url);
        if (defaultPackage != null && !result.contains(defaultPackage)) {
            result.add(defaultPackage);
        }
        return result;
    }

    private static String resolveDefaultBrowserPackage(Context context, String url) {
        if (context == null || url == null) {
            return null;
        }
        try {
            ResolveInfo resolved = context.getPackageManager().resolveActivity(
                    new Intent(Intent.ACTION_VIEW, Uri.parse(url)),
                    PackageManager.MATCH_DEFAULT_ONLY);
            if (resolved == null || resolved.activityInfo == null) {
                return null;
            }
            String packageName = resolved.activityInfo.packageName;
            return "android".equals(packageName) ? null : packageName;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String applicationLabel(PackageManager packageManager, String packageName) {
        try {
            ApplicationInfo applicationInfo = packageManager.getApplicationInfo(packageName, 0);
            CharSequence label = packageManager.getApplicationLabel(applicationInfo);
            if (label != null && !label.toString().isBlank()) {
                return label.toString();
            }
        } catch (Throwable ignored) {
            // Package name is a stable fallback label.
        }
        return packageName;
    }

    public static final class ProviderOption {
        public final String packageName;
        public final String label;

        ProviderOption(String packageName, String label) {
            this.packageName = packageName;
            this.label = label;
        }
    }
}
