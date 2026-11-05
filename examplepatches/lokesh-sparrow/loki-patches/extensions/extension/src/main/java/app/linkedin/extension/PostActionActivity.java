package app.linkedin.extension;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;

/**
 * Invisible screen behind the items Loki Patches adds to a post's ⋯ menu (lokipatches://post/...): does the action
 * and closes. LinkedIn opens the item's URL with an ACTION_VIEW intent.
 */
@SuppressWarnings("unused")
public final class PostActionActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            Uri uri = getIntent() == null ? null : getIntent().getData();
            if (uri != null && PostMenu.SCHEME.equals(uri.getScheme()) && PostMenu.HOST.equals(uri.getHost())) {
                PostMenu.perform(this, uri);
            }
        } catch (Throwable t) {
            Diagnostics.error("post action failed", t);
        }
        finish();
        overridePendingTransition(0, 0);
    }
}
