package com.valvesoftware.steamlink;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Entry-point launcher activity for Galaxy XR.
 * Requests hand-tracking, eye-tracking, audio and Bluetooth permissions,
 * then forwards to the main SteamLink activity.
 */
public class GalaxyXRPermissionActivity extends Activity {

    private static final String TAG = "SteamLinkGXR";
    private static final int REQUEST_CODE = 0x4758;

    private static final String[] REQUIRED_PERMISSIONS = {
        "android.permission.HAND_TRACKING",
        "android.permission.EYE_TRACKING_FINE",
        "android.permission.RECORD_AUDIO",
        "android.permission.BLUETOOTH_CONNECT",
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        TextView splash = new TextView(this);
        splash.setText("Launching Steam Link...");
        splash.setGravity(Gravity.CENTER);
        splash.setTextSize(20);
        setContentView(splash);

        List<String> missing = new ArrayList<>();
        for (String perm : REQUIRED_PERMISSIONS) {
            if (checkSelfPermission(perm) != PackageManager.PERMISSION_GRANTED) {
                missing.add(perm);
            }
        }

        if (missing.isEmpty()) {
            launchSteamLink();
        } else {
            requestPermissions(missing.toArray(new String[0]), REQUEST_CODE);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        launchSteamLink();
    }

    private void launchSteamLink() {
        try {
            Class<?> steamLinkClass = Class.forName("com.valvesoftware.steamlink.SteamLink");
            Intent intent = new Intent(this, steamLinkClass);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        } catch (ClassNotFoundException e) {
            Log.e(TAG, "SteamLink activity not found", e);
        }
        finish();
    }
}
