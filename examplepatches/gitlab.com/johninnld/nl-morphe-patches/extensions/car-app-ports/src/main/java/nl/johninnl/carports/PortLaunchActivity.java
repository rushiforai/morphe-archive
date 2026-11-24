package nl.johninnl.carports;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Keeps the Automotive launcher on real cars and provides the phone's setup entry point. */
public final class PortLaunchActivity extends Activity {
    public static final String PHONE_ACTIVITY = "nl.johninnl.carports.PHONE_ACTIVITY";

    /** Called after the original launcher's superclass has completed its lifecycle setup. */
    public static boolean redirectIfProjected(Activity activity) {
        if (activity.getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUTOMOTIVE)) {
            return false;
        }
        activity.startActivity(new Intent(activity, PortLaunchActivity.class));
        activity.finish();
        return true;
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUTOMOTIVE)) {
            openOwnActivity("androidx.car.app.activity.CarAppActivity");
            return;
        }
        try {
            ApplicationInfo info = getPackageManager().getApplicationInfo(
                    getPackageName(), PackageManager.GET_META_DATA);
            String phoneActivity = info.metaData == null ? null : info.metaData.getString(PHONE_ACTIVITY);
            if (phoneActivity != null) {
                ActivityInfo target = getPackageManager().getActivityInfo(
                        new ComponentName(getPackageName(), phoneActivity), 0);
                if (target.applicationInfo.uid != getApplicationInfo().uid || !target.enabled) {
                    throw new IllegalStateException("Phone setup activity must belong to this app");
                }
                openOwnActivity(phoneActivity);
                return;
            }
        } catch (PackageManager.NameNotFoundException failure) {
            throw new IllegalStateException("App setup metadata is missing", failure);
        }

        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(24 * getResources().getDisplayMetrics().density);
        layout.setPadding(padding, padding, padding, padding);
        TextView title = new TextView(this);
        title.setText(getApplicationInfo().loadLabel(getPackageManager()));
        title.setTextSize(24);
        layout.addView(title);
        TextView help = new TextView(this);
        int helpId = getResources().getIdentifier("nl_projected_car_help", "string", getPackageName());
        help.setText(helpId == 0
                ? "Open this app from Android Auto or another compatible car host. You can sign in on the car screen."
                : getString(helpId));
        help.setTextSize(18);
        help.setPadding(0, padding, 0, padding);
        layout.addView(help, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        Button close = new Button(this);
        close.setText(android.R.string.ok);
        close.setOnClickListener(view -> finish());
        layout.addView(close);
        setContentView(layout);
    }

    private void openOwnActivity(String className) {
        startActivity(new Intent(Intent.ACTION_MAIN).setComponent(new ComponentName(this, className)));
        finish();
    }
}
