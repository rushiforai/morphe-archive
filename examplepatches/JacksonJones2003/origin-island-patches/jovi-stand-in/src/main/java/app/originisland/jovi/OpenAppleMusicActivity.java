package app.originisland.jovi;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/**
 * Opening this app, as Jovi does to show what it plays, opens Apple Music instead.
 */
public final class OpenAppleMusicActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent launch = getPackageManager().getLaunchIntentForPackage(AppleMusic.PACKAGE);
        if (launch != null) {
            startActivity(launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        }
        finish();
    }
}
