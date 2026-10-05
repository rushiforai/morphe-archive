/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Looper;

import java.net.URI;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.Locale;
import java.util.regex.Pattern;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Sends Visit on a pin to an installed web browser without intercepting login or app links. */
public final class ExternalBrowser {
    private static final Pattern AUTH_ROUTE = Pattern.compile(
            "(^|[^a-z0-9])((?:my)?accounts?|auth|authenticate|authentication|authorize|authorization|oauth2?|" +
            "log[-_ /]?(?:in|out)|sign[-_ /]?(?:in|up|out)|sso|callback|password|session|" +
            "access_token|id_token|refresh_token|client_id|redirect_uri|response_type|code_challenge)([^a-z0-9]|$)");
    private ExternalBrowser() {}

    /** Called only by the native profile header and About website buttons. */
    public static boolean openProfile(String url) {
        HookStatus.invoked(FamilyNames.EXTERNAL_BROWSER);
        if (!Utils.settingsReady() || !PatchFamily.Capability.VISIT_LINKS.installed() ||
                !Settings.EXTERNAL_BROWSER.get()) return false;
        try {
            URI uri = PinMedia.webUri(url);
            Activity activity = Utils.getActivity();
            if (uri == null || PinMedia.pinterestUri(uri) || activity == null || activity.isFinishing() ||
                    activity.isDestroyed() || Looper.myLooper() != Looper.getMainLooper()) return false;
            String route = (uri.getHost() + "/" + uri.getPath() + "?" + uri.getQuery() + "#" + uri.getFragment())
                    .toLowerCase(Locale.ROOT);
            // Decode only for classification. Forward the original URL without changing its bytes.
            for (int remaining = 8; route.matches("(?s).*%[0-9a-f]{2}.*"); remaining--) {
                if (remaining == 0) return false;
                route = Uri.decode(route).toLowerCase(Locale.ROOT);
            }
            boolean oauthReply = route.matches("(?s).*[?&#](?:code|error)=.*");
            if (oauthReply || AUTH_ROUTE.matcher(route).find()) return false;
            Intent target = browserIntent(url);
            List<ResolveInfo> handlers = activity.getPackageManager().queryIntentActivities(browserIntent("https://example.com/"), 0);
            Set<String> packages = new LinkedHashSet<>();
            for (ResolveInfo handler : handlers) {
                if (handler.activityInfo != null && handler.activityInfo.exported &&
                        !activity.getPackageName().equals(handler.activityInfo.packageName)) packages.add(handler.activityInfo.packageName);
            }
            if (packages.isEmpty()) return false;
            List<Intent> choices = new ArrayList<>();
            for (String browser : packages) choices.add(new Intent(target).setPackage(browser));
            Intent chooser = Intent.createChooser(choices.remove(0), L10n.t("Open links in your browser"));
            if (!choices.isEmpty()) chooser.putExtra(Intent.EXTRA_INITIAL_INTENTS, choices.toArray(new Intent[0]));
            activity.startActivity(chooser);
            HookStatus.counted(FamilyNames.EXTERNAL_BROWSER, "profile website opened in browser");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXTERNAL_BROWSER, "open profile website", failure);
            return false;
        }
    }

    public static boolean open(String url, Object pin) {
        HookStatus.invoked(FamilyNames.EXTERNAL_BROWSER);
        if (!Utils.settingsReady() || !PatchFamily.Capability.VISIT_LINKS.installed() ||
                !Settings.EXTERNAL_BROWSER.get()) return false;
        try {
            URI uri = PinMedia.webUri(url);
            Activity activity = Utils.getActivity();
            if (PinMedia.id(pin) == null || uri == null || PinMedia.pinterestUri(uri) || activity == null ||
                    activity.isFinishing() || activity.isDestroyed() || Looper.myLooper() != Looper.getMainLooper()) return false;
            Intent target = browserIntent(url);
            // A neutral domain finds browsers rather than the destination's deep-link application.
            Intent probe = browserIntent("https://example.com/");
            List<ResolveInfo> handlers = activity.getPackageManager().queryIntentActivities(probe, 0);
            Set<String> packages = new LinkedHashSet<>();
            for (ResolveInfo handler : handlers) {
                if (handler.activityInfo != null && handler.activityInfo.exported &&
                        !activity.getPackageName().equals(handler.activityInfo.packageName)) {
                    packages.add(handler.activityInfo.packageName);
                }
            }
            if (packages.isEmpty()) return false;
            ResolveInfo preferred = activity.getPackageManager().resolveActivity(probe, 0);
            if (preferred != null && preferred.activityInfo != null &&
                    packages.contains(preferred.activityInfo.packageName)) {
                activity.startActivity(target.setPackage(preferred.activityInfo.packageName));
            } else {
                List<Intent> choices = new ArrayList<>();
                for (String browser : packages) choices.add(new Intent(target).setPackage(browser));
                Intent chooser = Intent.createChooser(choices.remove(0), L10n.t("Open pin link"));
                if (!choices.isEmpty()) chooser.putExtra(Intent.EXTRA_INITIAL_INTENTS, choices.toArray(new Intent[0]));
                activity.startActivity(chooser);
            }
            HookStatus.counted(FamilyNames.EXTERNAL_BROWSER, "pin link opened in browser");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXTERNAL_BROWSER, "open pin link", failure);
            return false;
        }
    }

    private static Intent browserIntent(String url) {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(url)).addCategory(Intent.CATEGORY_BROWSABLE);
    }
}
