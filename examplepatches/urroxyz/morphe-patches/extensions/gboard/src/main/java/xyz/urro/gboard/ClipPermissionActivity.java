package xyz.urro.gboard;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;

/** Owns the native permission result without changing Gboard's activity callbacks. */
public final class ClipPermissionActivity extends Activity {
    private static final String LOCAL_NETWORK = "android.permission.ACCESS_LOCAL_NETWORK";

    static boolean granted(Context context) {
        return Build.VERSION.SDK_INT < 37
                || context.checkSelfPermission(LOCAL_NETWORK) == PackageManager.PERMISSION_GRANTED;
    }

    @Override public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (granted(this)) {
            ClipboardHooks.settingsChanged();
            Toast.makeText(this, Build.VERSION.SDK_INT < 37 ? "Not required on this Android version" : "Local network access allowed", Toast.LENGTH_SHORT).show();
            finish();
        } else if (savedInstanceState == null) {
            requestPermissions(new String[]{LOCAL_NETWORK}, 1);
        }
    }

    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(requestCode, permissions, results);
        if (requestCode == 1) {
            if (granted(this)) ClipboardHooks.settingsChanged();
            finish();
        }
    }
}
