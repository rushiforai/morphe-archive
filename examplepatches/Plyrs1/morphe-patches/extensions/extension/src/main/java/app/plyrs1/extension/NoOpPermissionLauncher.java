package app.plyrs1.extension;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContract;
import androidx.core.app.ActivityOptionsCompat;

public class NoOpPermissionLauncher extends ActivityResultLauncher<String[]> {

    @Override
    public void launch(String[] input, ActivityOptionsCompat options) {
        // No-op: suppress requesting permissions on startup
    }

    @Override
    public void unregister() {
        // No-op
    }

    @Override
    public ActivityResultContract<String[], ?> getContract() {
        return null;
    }
}
