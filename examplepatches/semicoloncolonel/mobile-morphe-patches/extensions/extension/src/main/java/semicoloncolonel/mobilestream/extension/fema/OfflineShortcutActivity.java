package semicoloncolonel.mobilestream.extension.fema;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

/**
 * The target of the "Save everything" and "Refresh saved content" shortcuts.
 * It has no screen: it starts OfflineSaveService and closes, and the
 * service's notification shows the progress.
 */
@SuppressWarnings("unused")
public final class OfflineShortcutActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String action = getIntent() == null ? null : getIntent().getAction();
        boolean refresh = OfflineSaveService.ACTION_REFRESH.equals(action);
        Intent service = new Intent(this, OfflineSaveService.class)
                .setAction(refresh ? OfflineSaveService.ACTION_REFRESH : OfflineSaveService.ACTION_SAVE_ALL);
        try {
            startForegroundService(service);
            Toast.makeText(this,
                    refresh ? "Refreshing saved FEMA content." : "Saving FEMA content for offline use.",
                    Toast.LENGTH_SHORT).show();
        } catch (Exception ex) {
            Toast.makeText(this, "Could not start saving content.", Toast.LENGTH_LONG).show();
        }
        finish();
    }
}
