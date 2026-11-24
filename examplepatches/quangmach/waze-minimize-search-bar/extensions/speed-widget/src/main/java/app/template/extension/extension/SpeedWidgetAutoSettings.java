package app.template.extension.extension;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;

import java.util.ArrayList;
import java.util.List;

public final class SpeedWidgetAutoSettings extends Activity {
    static final String EXTRA_WIDGET_SETUP = "app.template.extension.extension.SPEED_WIDGET_SETUP";
    private static final String AWAITING_PERMISSION = "awaiting_permission";
    private static final int PRECISE_LOCATION = 1;
    private static final int TRIP_SIGNALS = 2;
    private static final int LOCATION_SETTINGS = 3;
    private boolean widgetSetup;
    private boolean awaitingPermission;
    private boolean requestedSetup;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        widgetSetup = getIntent().getBooleanExtra(EXTRA_WIDGET_SETUP, false);
        awaitingPermission = state != null && state.getBoolean(AWAITING_PERMISSION);
        if (widgetSetup || awaitingPermission) return;

        boolean enabled = SpeedWidgetAuto.enabled(this);
        AlertDialog.Builder dialog = new AlertDialog.Builder(this)
                .setTitle("Automatic speedometer")
                .setMessage("Start when Android Auto connects, with a recognized vehicle’s Bluetooth connection, "
                        + "or when Android detects vehicle travel. "
                        + "Nearby devices and Physical activity enable those triggers. Precise location and background location "
                        + "let the dial work while Waze’s map is closed.")
                .setNegativeButton("Cancel", (d, which) -> finish())
                .setOnCancelListener(d -> finish());
        if (enabled) {
            dialog.setNeutralButton("Turn off", (d, which) -> {
                SpeedWidgetAuto.disable(this);
                finish();
            });
        }
        dialog.setPositiveButton(enabled ? "Check permissions" : "Enable", (d, which) -> requestPreciseLocation()).show();
    }

    @Override
    protected void onPostResume() {
        super.onPostResume();
        if (widgetSetup && !awaitingPermission && !requestedSetup && !isFinishing()) {
            requestedSetup = true;
            requestPreciseLocation();
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle state) {
        state.putBoolean(AWAITING_PERMISSION, awaitingPermission);
        super.onSaveInstanceState(state);
    }

    private void requestPreciseLocation() {
        if (SpeedWidgetAuto.granted(this, Manifest.permission.ACCESS_FINE_LOCATION)) {
            requestTripSignals();
        } else {
            awaitingPermission = true;
            requestPermissions(new String[] { Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION },
                    PRECISE_LOCATION);
        }
    }

    private void requestTripSignals() {
        List<String> missing = new ArrayList<>(2);
        for (String permission : new String[] { Manifest.permission.BLUETOOTH_CONNECT, Manifest.permission.ACTIVITY_RECOGNITION }) {
            if (!SpeedWidgetAuto.granted(this, permission)) missing.add(permission);
        }
        if (missing.isEmpty()) requestBackgroundLocation();
        else {
            awaitingPermission = true;
            requestPermissions(missing.toArray(new String[0]), TRIP_SIGNALS);
        }
    }

    private void requestBackgroundLocation() {
        if (!SpeedWidgetAuto.granted(this, Manifest.permission.BLUETOOTH_CONNECT)
                && !SpeedWidgetAuto.granted(this, Manifest.permission.ACTIVITY_RECOGNITION)) {
            showMessage("Allow Nearby devices or Physical activity to detect the start of a trip.");
        } else if (SpeedWidgetAuto.granted(this, Manifest.permission.ACCESS_BACKGROUND_LOCATION)) {
            enable();
        } else {
            String option = getPackageManager().getBackgroundPermissionOptionLabel().toString();
            new AlertDialog.Builder(this)
                    .setTitle("Allow background location")
                    .setMessage("Open Waze’s app permissions, choose Location, and select “" + option
                            + "” with precise location enabled. Then return here.")
                    .setPositiveButton("Open settings", (d, which) -> {
                        awaitingPermission = true;
                        startActivityForResult(
                                new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.fromParts("package", getPackageName(), null)),
                                LOCATION_SETTINGS);
                    })
                    .setNegativeButton("Cancel", (d, which) -> finish())
                    .setOnCancelListener(d -> finish())
                    .show();
        }
    }

    private void enable() {
        if (SpeedWidgetAuto.available(this)) {
            if (widgetSetup) {
                SpeedWidgetAuto.startMonitoring(this);
            } else {
                SpeedWidgetService.useAutoOnly();
                SpeedWidgetAuto.enable(this);
            }
            finish();
        } else {
            showMessage("Automatic tracking needs precise location with “"
                    + getPackageManager().getBackgroundPermissionOptionLabel() + "” enabled.");
        }
    }

    private void showMessage(String text) {
        new AlertDialog.Builder(this).setMessage(text)
                .setPositiveButton("OK", (d, which) -> finish())
                .setOnCancelListener(d -> finish()).show();
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(requestCode, permissions, results);
        awaitingPermission = false;
        requestedSetup = true;
        if (requestCode == PRECISE_LOCATION) {
            if (SpeedWidgetAuto.granted(this, Manifest.permission.ACCESS_FINE_LOCATION)) requestTripSignals();
            else showMessage("Allow precise location for automatic speed readings.");
        } else if (requestCode == TRIP_SIGNALS) {
            requestBackgroundLocation();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == LOCATION_SETTINGS) {
            awaitingPermission = false;
            requestedSetup = true;
            enable();
        }
    }
}
