// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;
import android.app.*;
import android.content.*;
import android.view.ContextThemeWrapper;
/** Patch builds must never consume the legacy production APK channel. */
public final class AppUpdater {
    static void install(Application app){}
    static void show(Activity a){new AlertDialog.Builder(new ContextThemeWrapper(a,android.R.style.Theme_DeviceDefault_Dialog_Alert)).setTitle("Updates").setMessage("This is a locally patched laboratory build. To update it, apply the newer patch bundle to the supported original APK and sign it with the same key. Patch update notifications are not configured in this test build.").setPositiveButton("Done",null).show();}
    static void result(Context c,Intent i,Runnable done){done.run();}
}
