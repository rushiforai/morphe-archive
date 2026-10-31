package oz;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Process;
import android.os.UserHandle;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Intent f81126a;

    static {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        intent.addCategory("android.intent.category.DEFAULT");
        f81126a = intent;
    }

    public static final List a(Context context, String str) {
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        LauncherApps launcherApps = (LauncherApps) context.getSystemService(LauncherApps.class);
        Intent intent = new Intent(f81126a);
        intent.setPackage(str);
        List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent, SQLiteDatabase.OPEN_FULLMUTEX);
        UserHandle userHandleMyUserHandle = Process.myUserHandle();
        if (listQueryIntentActivities.isEmpty()) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        for (ResolveInfo resolveInfo : listQueryIntentActivities) {
            Intent intent2 = new Intent(intent);
            ActivityInfo activityInfo = resolveInfo.activityInfo;
            intent2.setComponent(new ComponentName(activityInfo.packageName, activityInfo.name));
            arrayList.add(launcherApps.resolveActivity(intent2, userHandleMyUserHandle));
        }
        return arrayList;
    }
}
