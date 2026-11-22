package app.userinsights.extension;

import android.app.Activity;
import android.os.Bundle;

/**
 * Full screen view of a user's archived posts and comments from Arctic Shift,
 * including users whose Reddit profile is hidden.
 */
public class ArchiveActivity extends Activity {
    static final String EXTRA_USER = "user_insights_user";
    static final String EXTRA_SUBREDDIT = "user_insights_subreddit";

    private ArchiveView view;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        UserInsights.init(this);

        String user = getIntent().getStringExtra(EXTRA_USER);
        String subreddit = getIntent().getStringExtra(EXTRA_SUBREDDIT);
        if (user == null || user.trim().isEmpty()) {
            finish();
            return;
        }
        user = user.trim().replaceFirst("^/?u/", "");

        try {
            getWindow().setStatusBarColor(ArchiveView.BG);
            getWindow().setNavigationBarColor(ArchiveView.BG);
        } catch (Throwable ignored) {
            // Not important.
        }

        view = new ArchiveView(this, user, subreddit, false);
        view.setFitsSystemWindows(true);
        setContentView(view);
    }

    @Override
    protected void onDestroy() {
        if (view != null) {
            view.release();
        }
        super.onDestroy();
    }
}
