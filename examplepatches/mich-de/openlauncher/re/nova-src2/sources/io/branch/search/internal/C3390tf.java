package io.branch.search.internal;

import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.os.UserHandle;
import android.text.TextUtils;
import io.branch.search.internal.C3296o5;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.tf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3390tf {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public static String f65931a;

    public static boolean a(@NotNull Context context, @Nullable ComponentName componentName, @NotNull UserHandle user) {
        Intrinsics.g(context, "context");
        Intrinsics.g(user, "user");
        if (!TextUtils.isEmpty(componentName != null ? componentName.getPackageName() : null)) {
            LauncherApps launcherApps = (LauncherApps) context.getSystemService(LauncherApps.class);
            if (launcherApps == null) {
                String string = UUID.randomUUID().toString();
                C3296o5.a aVar = C3296o5.f65426a;
                C3296o5.a(new F6(string, "Util.openApp", "launcherApps == null, should never happen", null));
                return false;
            }
            try {
                launcherApps.startMainActivity(componentName, user, null, null);
                return true;
            } catch (SecurityException unused) {
                launcherApps.startAppDetailsActivity(componentName, user, null, null);
                return true;
            } catch (Exception e3) {
                C3296o5.a aVar2 = C3296o5.f65426a;
                C3296o5.a(new F6("Util.openApp", "componentName:" + componentName + ", user:" + user, null, e3, null));
            }
        }
        return false;
    }

    @JvmStatic
    public static final boolean a(@NotNull Context context, @NotNull String packageName, @Nullable UserHandle userHandle) {
        Intrinsics.g(context, "context");
        Intrinsics.g(packageName, "packageName");
        if (userHandle == null) {
            return a(context, packageName);
        }
        Object systemService = context.getSystemService((Class<Object>) LauncherApps.class);
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.content.pm.LauncherApps");
        Intrinsics.f(((LauncherApps) systemService).getActivityList(packageName, userHandle), "launcherApps.getActivity…(packageName, userHandle)");
        return !r1.isEmpty();
    }

    @JvmStatic
    @Nullable
    public static final Intent a(@NotNull Application context, @NotNull String packageName, @Nullable UserHandle userHandle) {
        Intrinsics.g(context, "context");
        Intrinsics.g(packageName, "packageName");
        if (userHandle == null) {
            return context.getPackageManager().getLaunchIntentForPackage(packageName);
        }
        List<LauncherActivityInfo> activityList = ((LauncherApps) context.getSystemService(LauncherApps.class)).getActivityList(packageName, userHandle);
        Intrinsics.f(activityList, "context.getSystemService…(packageName, userHandle)");
        LauncherActivityInfo launcherActivityInfo = (LauncherActivityInfo) b70.g.Y0(activityList);
        if (launcherActivityInfo == null) {
            return null;
        }
        return new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER").setComponent(launcherActivityInfo.getComponentName());
    }

    @JvmStatic
    public static final boolean a(@NotNull Context context, @NotNull String packageName) throws PackageManager.NameNotFoundException {
        Intrinsics.g(context, "context");
        Intrinsics.g(packageName, "packageName");
        try {
            context.getPackageManager().getPackageInfo(packageName, 0);
            return true;
        } catch (PackageManager.NameNotFoundException unused) {
            return false;
        }
    }

    @JvmStatic
    @NotNull
    public static final Locale a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Locale locale = context.getResources().getConfiguration().getLocales().get(0);
        Intrinsics.f(locale, "context.resources.configuration.locales.get(0)");
        return locale;
    }

    @JvmStatic
    @NotNull
    public static final String a(@NotNull String input) throws NoSuchAlgorithmException {
        Intrinsics.g(input, "input");
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA256");
            byte[] bytes = input.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "this as java.lang.String).getBytes(charset)");
            messageDigest.update(bytes);
            byte[] digest = messageDigest.digest();
            StringBuilder sb2 = new StringBuilder();
            Intrinsics.f(digest, "digest");
            for (byte b11 : digest) {
                int i5 = b11 + AbstractJsonLexerKt.TC_OTHER;
                kotlin.text.a.a(16);
                String string = Integer.toString(i5, 16);
                Intrinsics.f(string, "toString(this, checkRadix(radix))");
                String strSubstring = string.substring(1);
                Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
                sb2.append(strSubstring);
            }
            String string2 = sb2.toString();
            Intrinsics.f(string2, "result.toString()");
            return string2;
        } catch (NoSuchAlgorithmException e3) {
            C3296o5.a(UUID.randomUUID().toString(), e3, "Util.sha256Hex");
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }
}
