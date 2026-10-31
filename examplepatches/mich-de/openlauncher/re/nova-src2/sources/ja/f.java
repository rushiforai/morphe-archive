package ja;

import aa.j;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.os.Process;
import android.os.UserHandle;
import android.util.Log;
import com.google.android.gms.internal.consent_sdk.k0;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import ya.g0;

/* loaded from: classes.dex */
public abstract class f implements j {

    /* renamed from: a, reason: collision with root package name */
    public final ComponentName f69290a;

    /* renamed from: b, reason: collision with root package name */
    public final UserHandle f69291b;

    public f(ComponentName componentName, UserHandle userHandle) {
        this.f69290a = componentName;
        this.f69291b = userHandle;
    }

    public static ArrayList f(Context context, g0 g0Var) {
        String str;
        List<UserHandle> listF;
        ArrayList arrayList = new ArrayList();
        UserHandle userHandleMyUserHandle = Process.myUserHandle();
        if (g0Var == null) {
            listF = ((h) h.f69294h.h(context)).f();
            str = null;
        } else {
            List listSingletonList = Collections.singletonList(g0Var.f97140c);
            str = g0Var.f97138a;
            listF = listSingletonList;
        }
        LauncherApps launcherApps = (LauncherApps) context.getSystemService(LauncherApps.class);
        for (UserHandle userHandle : listF) {
            boolean zEquals = userHandleMyUserHandle.equals(userHandle);
            for (LauncherActivityInfo launcherActivityInfo : launcherApps.getShortcutConfigActivityList(str, userHandle)) {
                if (zEquals || launcherActivityInfo.getApplicationInfo().targetSdkVersion >= 26) {
                    arrayList.add(new e(launcherActivityInfo));
                }
            }
        }
        return arrayList;
    }

    public ga.j c() {
        return null;
    }

    @Override // aa.j
    public final ComponentName d() {
        return this.f69290a;
    }

    public int e() {
        return 1;
    }

    public boolean g(Activity activity, int i5) {
        Intent component = new Intent("android.intent.action.CREATE_SHORTCUT").setComponent(this.f69290a);
        try {
            activity.startActivityForResult(component, i5);
            return true;
        } catch (ActivityNotFoundException unused) {
            k0.w(activity, 2132017222, 0).show();
            return false;
        } catch (SecurityException e3) {
            k0.w(activity, 2132017222, 0).show();
            Log.e("SCActivityInfo", "Launcher does not have the permission to launch " + component + ". Make sure to create a MAIN intent-filter for the corresponding activity or use the exported attribute for this activity.", e3);
            return false;
        }
    }

    @Override // aa.j
    public final UserHandle getUser() {
        return this.f69291b;
    }
}
