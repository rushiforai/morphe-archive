/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.misc;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PermissionInfo;
import android.content.pm.ProviderInfo;

import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;

/**
 * A TikTok that runs under another package name, beside the store app: its device registration,
 * and the places TikTok's code names its own package outright.
 *
 * <p>Morphe's Clone app patch renames the package so Android installs the copy next to the store
 * app. TikTok's AppLog then puts the new name in the {@code package} field of the header every
 * {@code device_register} request carries, and TikTok's servers answer a package they don't know
 * with device and install ids of 0, so signing in and everything after it fails. Reporting
 * {@value #STORE_PACKAGE} there gets real ids back (niposch/revanced-tiktok-patches measured it
 * with only that field changed). {@code real_package_name}, the signature hash and the rest of the
 * header still say what is actually installed.
 *
 * <p>Elsewhere TikTok names {@value #STORE_PACKAGE} where it means this app: the authority its
 * live wallpaper data provider's URIs are built on, the package a content URI's authority or an
 * activity's link has to hold to count as TikTok's own, and the multiprocess settings authority
 * its provider shell fills from a template. In a renamed copy each of those reaches the store app
 * installed beside it, which doesn't export the provider, or nothing at all. {@link #ownPackage}
 * answers the copy's own name for the checks, and {@link #declared} answers the name the copy's
 * manifest declares for a provider authority or a permission, whatever Clone app made of it.
 *
 * <p>Only the one write of the running package into {@code package} comes to {@link #putPackage}.
 * A build that kept TikTok's package name, a paused Hushfeed and a call before Hushfeed has a
 * context (when the pause hasn't been decided yet) all answer what TikTok would have.
 */
@SuppressWarnings("unused")
public final class BesideStoreApp {
    /** The package the store app installs as, the one TikTok's servers register devices under. */
    static final String STORE_PACKAGE = "com.zhiliaoapp.musically";
    /** The header field TikTok's servers read the app's identity from. */
    static final String PACKAGE_KEY = "package";

    private static volatile boolean logged;
    /** Every provider authority and permission this package's manifest declares, read once. */
    @Nullable
    private static volatile Set<String> declaredNames;
    /** The names already reported as rewritten, so each is logged once per process. */
    private static final Set<String> reported = Collections.newSetFromMap(new ConcurrentHashMap<>());

    private BesideStoreApp() {
    }

    /**
     * In place of the {@code header.put("package", context.getPackageName())} in AppLog's package
     * header. Same arguments and result as the call it replaces, which throws as it always did.
     */
    public static JSONObject putPackage(JSONObject header, String key, Object value) throws JSONException {
        return header.put(key, reported(key, value));
    }

    /** What goes into the header for {@code key}: the store package for a renamed copy's own name. */
    @Nullable
    static Object reported(@Nullable String key, @Nullable Object value) {
        if (!PACKAGE_KEY.equals(key) || !(value instanceof String) || !renamed((String) value)) return value;
        if (!logged) {
            logged = true;
            String running = (String) value;
            Logger.printInfo(() -> "Beside the store app: registering " + running + " as " + STORE_PACKAGE);
        }
        return STORE_PACKAGE;
    }

    /** Whether {@code running} is this app's own package and isn't the store app's, unpaused. */
    static boolean renamed(String running) {
        Context context = Utils.getContext();
        if (context == null || Setting.isPaused() || STORE_PACKAGE.equals(running)) return false;
        return running.equals(context.getPackageName());
    }

    /**
     * TikTok's own package where its code names the store package to mean this app: the package
     * a content URI's authority has to hold for the URI to count as TikTok's own rather than
     * another app's, and the one an app-settings page or a Play link has to name to open under
     * Family Pairing. A renamed copy gets its own name there, as the store app gets its own;
     * {@code storePackage} comes back unchanged everywhere else, and whenever Hushfeed is paused
     * or has no context yet.
     */
    @Nullable
    public static String ownPackage(@Nullable String storePackage) {
        Context context = Utils.getContext();
        if (context == null || Setting.isPaused() || !STORE_PACKAGE.equals(storePackage)) return storePackage;
        String running = context.getPackageName();
        if (running == null || STORE_PACKAGE.equals(running)) return storePackage;
        return running;
    }

    /**
     * A provider authority or permission name as this package's manifest declares it.
     *
     * <p>TikTok builds the names of its own providers and their permissions from templates
     * ({@code ${applicationId}.push.SHARE_PROVIDER_AUTHORITY}, {@code
     * com.ss.android.common.multiprocess.SHARE_PROVIDER_AUTHORITY${APP_ID}}) and writes the live
     * wallpaper caller's outright, while Clone app renames the manifest's copy of each by its own
     * two rules: a name that starts with the store package gets the new package in its place, and
     * any other name gets the new package and an underscore in front. The names that start with
     * {@code ${applicationId}} come out the same both ways. The rest the copy's code still builds
     * as the store app did, so Android sends its own lookups to the store app beside it, which
     * doesn't export the provider, or to nothing. This answers the declared name when the
     * manifest holds one of Clone app's two renames of {@code name}, and {@code name} itself when
     * it holds {@code name} as it is, holds neither, or when this is the store app, Hushfeed is
     * paused or has no context yet.
     */
    @Nullable
    public static String declared(@Nullable String name) {
        if (name == null) return null;
        Context context = Utils.getContext();
        if (context == null || Setting.isPaused()) return name;
        String running = context.getPackageName();
        if (running == null || STORE_PACKAGE.equals(running)) return name;
        String found = declared(name, running, declaredNames(context));
        if (!found.equals(name) && reported.add(name)) {
            Logger.printInfo(() -> "Beside the store app: " + name + " is declared as " + found);
        }
        return found;
    }

    /** The one of {@code names} that Clone app's rename of {@code name} for {@code running} gives, else {@code name}. */
    static String declared(String name, String running, Set<String> names) {
        if (names.contains(name)) return name;
        String prefixed = running + "_" + name;
        if (names.contains(prefixed)) return prefixed;
        if (name.startsWith(STORE_PACKAGE + ".")) {
            String replaced = running + name.substring(STORE_PACKAGE.length());
            if (names.contains(replaced)) return replaced;
        }
        return name;
    }

    /** Every provider authority and permission this package declares, read from the manifest once. */
    static Set<String> declaredNames(Context context) {
        Set<String> names = declaredNames;
        if (names != null) return names;
        names = readDeclaredNames(context);
        declaredNames = names;
        return names;
    }

    private static Set<String> readDeclaredNames(Context context) {
        Set<String> names = new HashSet<>();
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(
                    context.getPackageName(), PackageManager.GET_PROVIDERS | PackageManager.GET_PERMISSIONS);
            if (info.providers != null) {
                for (ProviderInfo provider : info.providers) {
                    // One provider may serve several authorities, written with ';' between them.
                    if (provider.authority != null) Collections.addAll(names, provider.authority.split(";"));
                }
            }
            if (info.permissions != null) {
                for (PermissionInfo permission : info.permissions) {
                    if (permission.name != null) names.add(permission.name);
                }
            }
        } catch (PackageManager.NameNotFoundException | RuntimeException failure) {
            Logger.printException(() -> "Beside the store app: could not read this package's providers", failure);
        }
        return Collections.unmodifiableSet(names);
    }

    static void resetForTests() {
        logged = false;
        declaredNames = null;
        reported.clear();
    }
}
