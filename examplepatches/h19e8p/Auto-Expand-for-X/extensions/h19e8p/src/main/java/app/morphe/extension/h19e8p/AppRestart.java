/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p;

import android.app.Activity;
import android.content.Intent;
import android.os.Process;

/** X を起動し直す。フラグの一覧やキャッシュは、起動し直すと読み込み直される。 */
public final class AppRestart {
    private AppRestart() {
    }

    public static void restart(Activity activity) {
        Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(launch);
        }
        activity.finishAffinity();
        Process.killProcess(Process.myPid());
    }
}
