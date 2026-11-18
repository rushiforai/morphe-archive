package nl.johninnl.medium.reader;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.text.DateFormat;
import java.util.Date;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicReference;

/** Small article-local status row; the original native content remains the reading surface. */
public final class ReaderUi {
    private ReaderUi() {}
    public static View wrap(View content, String postId) {
        if (content == null) return null;
        ReaderBootstrap.initialize(content.getContext());
        LinearLayout root = new LinearLayout(content.getContext()); root.setOrientation(LinearLayout.VERTICAL);
        root.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        root.addView(content, new LinearLayout.LayoutParams(-1, 0, 1));
        TextView status = new TextView(content.getContext()); status.setTextSize(12);
        int pad = (int) (12 * content.getResources().getDisplayMetrics().density);
        status.setPadding(pad, pad / 2, pad, pad / 2); status.setVisibility(View.GONE);
        boolean dark = (content.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        status.setTextColor(dark ? Color.LTGRAY : Color.DKGRAY); status.setBackgroundColor(dark ? 0xff202020 : 0xfff2f2f2);
        root.addView(status, new LinearLayout.LayoutParams(-1, -2));
        Handler main = new Handler(Looper.getMainLooper());
        AtomicReference<ReaderStatus> current = new AtomicReference<>();
        AtomicReference<AlertDialog> sourceDialog = new AtomicReference<>();
        ReaderStatus.Sink update = value -> main.post(() -> {
            if (!root.isAttachedToWindow()) return;
            current.set(value);
            if (value == null || value.phase.equals("ORIGINAL")) { status.setVisibility(View.GONE); return; }
            status.setVisibility(View.VISIBLE);
            if (value.phase.equals("LOADING")) status.setText("Loading full article…");
            else if (value.phase.equals("READY")) {
                ReaderArticle article = value.article;
                String message = article != null && article.olderSnapshot ? "Older mirror snapshot" :
                    article != null && article.fromCache ? "Article · cached" : "Article loaded";
                if (article != null && article.body.notices.contains("UNAVAILABLE_EMBED")) message += " · Some embedded content unavailable";
                else if (article != null && article.body.notices.contains("EXTERNAL_EMBED")) message += " · Embedded media opens externally";
                status.setText(message);
            }
            else status.setText("Full article unavailable · " + value.code + " · Tap to reload");
            status.setClickable(value.phase.equals("UNAVAILABLE") || value.phase.equals("READY"));
            status.setContentDescription(status.getText() + (value.phase.equals("READY") ? ". Tap for source and offline cache details." : ""));
        });
        status.setOnClickListener(view -> {
            ReaderStatus value = current.get();
            if (value != null && value.phase.equals("READY") && value.article != null) {
                showDetails(root, status, value.article, main, sourceDialog);
            } else if (value != null && value.phase.equals("UNAVAILABLE") && ReaderRuntime.retry(postId)) {
                status.setClickable(false);
                status.setText("Reloading full article…");
            }
        });
        status.setClickable(false);
        root.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            AutoCloseable subscription;
            public void onViewAttachedToWindow(View view) { subscription = ReaderRuntime.listen(postId, update); update.publish(ReaderRuntime.status(postId)); }
            public void onViewDetachedFromWindow(View view) {
                if (subscription != null) try { subscription.close(); } catch (Exception ignored) { }
                subscription = null;
                AlertDialog dialog = sourceDialog.getAndSet(null);
                if (dialog != null) dialog.dismiss();
            }
        });
        return root;
    }

    private static void showDetails(View root, TextView status, ReaderArticle article, Handler main, AtomicReference<AlertDialog> sourceDialog) {
        if (sourceDialog.get() != null) return;
        status.setEnabled(false);
        ArticleLoader source = ReaderRuntime.loader();
        try {
            ReaderRuntime.workers().execute(() -> {
                String details;
                try {
                    int[] images = ReaderImages.completion(article.body);
                    boolean saved = source instanceof CachedArticleLoader && ((CachedArticleLoader) source).isStored(article);
                    String mirror = source instanceof CachedArticleLoader ? ((CachedArticleLoader) source).origin().toString() : "Unknown";
                    String updated = article.body.sourceUpdatedAt == null ? "Unknown" : article.body.sourceUpdatedAt;
                    details = "Mirror: " + mirror + "\nOriginal article: " + article.body.canonicalUrl +
                        "\n\nRetrieved: " + DateFormat.getDateTimeInstance().format(new Date(article.fetchedAtMillis)) +
                        "\nSource updated: " + updated +
                        "\nRevision: " + (article.olderSnapshot ? "Older mirror snapshot" : article.sourceRevisionVerified ? "Matches Medium timestamp" : "Not verified") +
                        "\n\nText saved offline: " + (saved ? "Yes" : "No") +
                        "\nImages saved: " + images[0] + " of " + images[1];
                } catch (ArticleException failure) { details = "Source details unavailable: " + failure.code; }
                String message = details;
                main.post(() -> {
                    status.setEnabled(true);
                    if (!root.isAttachedToWindow()) return;
                    AlertDialog dialog = new AlertDialog.Builder(root.getContext()).setTitle("Article source")
                        .setMessage(message).setPositiveButton("Close", null)
                        .setNegativeButton("Clear offline cache", (ignored, which) -> clearCache(root.getContext(), source, main)).create();
                    sourceDialog.set(dialog);
                    dialog.setOnDismissListener(ignored -> sourceDialog.compareAndSet(dialog, null));
                    dialog.show();
                    TextView text = dialog.findViewById(android.R.id.message);
                    if (text != null) text.setTextIsSelectable(true);
                });
            });
        } catch (RejectedExecutionException busy) {
            status.setEnabled(true); Toast.makeText(root.getContext(), "Reader is busy", Toast.LENGTH_SHORT).show();
        }
    }

    private static void clearCache(Context context, ArticleLoader source, Handler main) {
        Context application = context.getApplicationContext();
        try {
            ReaderRuntime.workers().execute(() -> {
                String result;
                try {
                    if (source instanceof CachedArticleLoader) ((CachedArticleLoader) source).clear();
                    ReaderImages.clear(); result = "Reader offline cache cleared";
                } catch (java.io.IOException failure) { result = "Could not clear the reader cache"; }
                String message = result;
                main.post(() -> Toast.makeText(application, message, Toast.LENGTH_SHORT).show());
            });
        } catch (RejectedExecutionException busy) { Toast.makeText(application, "Reader is busy", Toast.LENGTH_SHORT).show(); }
    }
}
