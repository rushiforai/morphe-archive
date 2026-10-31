package com.instabridge.ai.context.collectors;

import android.content.Context;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.os.Process;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/context/collectors/AppShortcutCollector;", b.f42142b, "<init>", "()V", "collect", b.f42142b, "context", "Landroid/content/Context;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AppShortcutCollector {
    public static final int $stable = 0;

    @NotNull
    public static final AppShortcutCollector INSTANCE = new AppShortcutCollector();

    private AppShortcutCollector() {
    }

    @Nullable
    public final String collect(@NotNull Context context) {
        List<ShortcutInfo> shortcuts;
        String str;
        String string;
        Intrinsics.g(context, "context");
        try {
            Object systemService = context.getSystemService("launcherapps");
            LauncherApps launcherApps = systemService instanceof LauncherApps ? (LauncherApps) systemService : null;
            if (launcherApps != null && launcherApps.hasShortcutHostPermission() && (shortcuts = launcherApps.getShortcuts(new LauncherApps.ShortcutQuery().setQueryFlags(11), Process.myUserHandle())) != null && !shortcuts.isEmpty()) {
                PackageManager packageManager = context.getPackageManager();
                ArrayList arrayList = new ArrayList();
                for (ShortcutInfo shortcutInfo : shortcuts) {
                    CharSequence shortLabel = shortcutInfo.getShortLabel();
                    if (shortLabel == null || (string = shortLabel.toString()) == null) {
                        CharSequence longLabel = shortcutInfo.getLongLabel();
                        if (longLabel != null) {
                            String string2 = longLabel.toString();
                            try {
                                string = packageManager.getApplicationLabel(packageManager.getApplicationInfo(shortcutInfo.getPackage(), 0)).toString();
                            } catch (Exception unused) {
                                string = shortcutInfo.getPackage();
                                Intrinsics.d(string);
                            }
                            str = string + ": " + string2;
                        } else {
                            str = null;
                        }
                    } else {
                        string = packageManager.getApplicationLabel(packageManager.getApplicationInfo(shortcutInfo.getPackage(), 0)).toString();
                        str = string + ": " + string2;
                    }
                    if (str != null) {
                        arrayList.add(str);
                    }
                }
                List listE1 = g.E1(g.P0(arrayList), 10);
                if (!listE1.isEmpty()) {
                    return "App shortcuts: " + g.f1(listE1, ", ", null, null, 0, null, 62);
                }
            }
            return null;
        } catch (SecurityException | Exception unused2) {
            return null;
        }
    }
}
