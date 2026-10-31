package fa;

import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.os.Process;
import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import java.util.function.Predicate;

/* loaded from: classes.dex */
public final class c1 implements Predicate {
    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        WidgetItem widgetItem = (WidgetItem) obj;
        LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo = widgetItem.f21171d;
        ComponentName componentName = widgetItem.f21251a;
        if (launcherAppWidgetProviderInfo != null) {
            if ((launcherAppWidgetProviderInfo.i() & 2) != 0) {
                return false;
            }
            if ("com.teslacoilsw.launcher".equals(componentName.getPackageName()) && !Process.myUserHandle().equals(widgetItem.f21252b)) {
                return false;
            }
            if (!launcherAppWidgetProviderInfo.f21317e && !"com.teslacoilsw.launcher".equals(componentName.getPackageName())) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("WidgetsModel");
                bVar.h("Widget %s cannot fit on this device (%s, %s spans %sx%s %sx%s)", widgetItem.f21251a, Integer.valueOf(((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).minWidth), Integer.valueOf(((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).minHeight), Integer.valueOf(launcherAppWidgetProviderInfo.f21315c), Integer.valueOf(launcherAppWidgetProviderInfo.f21316d), Integer.valueOf(launcherAppWidgetProviderInfo.f21313a), Integer.valueOf(launcherAppWidgetProviderInfo.f21314b));
            }
        }
        String packageName = componentName.getPackageName();
        String className = componentName.getClassName();
        int iHashCode = packageName.hashCode();
        if (iHashCode != -1493701396) {
            if (iHashCode != -798707644) {
                if (iHashCode == 631039536 && packageName.equals("com.huawei.android.totemweatherwidget")) {
                    return false;
                }
            } else if (packageName.equals("com.hihonor.android.totemweather")) {
                return false;
            }
        } else if (packageName.equals("com.huawei.android.totemweather")) {
            return false;
        }
        if (("com.sec.android.app.launcher".equals(packageName) && "com.android.launcher2.WidgetReceiver".equals(className)) || "com.anddoes.launcher".equals(packageName)) {
            return false;
        }
        return ("com.actionlauncher.playstore".equals(packageName) && "com.actionlauncher.rocket.app.ActivityPicker".equals(className)) ? false : true;
    }
}
