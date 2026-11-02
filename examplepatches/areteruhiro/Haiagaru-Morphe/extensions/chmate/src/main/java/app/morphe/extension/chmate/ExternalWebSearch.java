package app.morphe.extension.chmate;

import android.app.SearchManager;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;

/** Web searches must not become result activities inside ChMate's task. */
public final class ExternalWebSearch {
    private ExternalWebSearch() { }

    /** All native launch boundaries use this, including newer for-result launchers. */
    public static void prepare(Intent intent) {
        if (intent != null && Intent.ACTION_WEB_SEARCH.equals(intent.getAction()))
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    public static void open(Context context, String query) {
        if (context == null || query == null || query.trim().isEmpty()) return;
        Context application = context.getApplicationContext();
        if (application == null) application = context;
        Intent search = new Intent(Intent.ACTION_WEB_SEARCH)
                .putExtra(SearchManager.QUERY, query)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            application.startActivity(search);
        } catch (ActivityNotFoundException unavailable) {
            Intent browser = new Intent(Intent.ACTION_VIEW,
                    Uri.parse("https://www.google.com/search?q=" + Uri.encode(query)))
                    .addCategory(Intent.CATEGORY_BROWSABLE)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            try {
                application.startActivity(browser);
            } catch (ActivityNotFoundException | SecurityException error) {
                failed(application, error);
            }
        } catch (SecurityException error) {
            failed(application, error);
        }
    }

    private static void failed(Context context, RuntimeException error) {
        // Do not log the selected text or the search URL.
        Log.w("Haiagaru", "External web search unavailable: " + error.getClass().getSimpleName());
        Toast.makeText(context, "Web検索を開けませんでした。ブラウザの設定を確認してください。",
                Toast.LENGTH_LONG).show();
    }
}
