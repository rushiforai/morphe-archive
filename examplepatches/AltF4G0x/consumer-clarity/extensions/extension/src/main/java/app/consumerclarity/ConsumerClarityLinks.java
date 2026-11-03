package app.consumerclarity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

public final class ConsumerClarityLinks {
    private ConsumerClarityLinks() {}

    public static boolean route(Activity activity, String url) {
        if (ConsumerClaritySettings.enabled("link_preview")) {
            new AlertDialog.Builder(activity)
                .setTitle("Open this link?")
                .setMessage(url)
                .setPositiveButton("Open", (dialog, which) -> openBrowser(activity, url))
                .setNeutralButton("Share", (dialog, which) -> share(activity, url))
                .setNegativeButton("Copy", (dialog, which) -> copy(activity, url))
                .setOnCancelListener(dialog -> {})
                .show();
            return true;
        }
        if (ConsumerClaritySettings.enabled("share_links")) {
            share(activity, url);
            return true;
        }
        if (ConsumerClaritySettings.openLinksExternally()) {
            openBrowser(activity, url);
            return true;
        }
        return false;
    }

    private static void openBrowser(Activity activity, String url) {
        activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
    }

    private static void share(Activity activity, String url) {
        Intent share = new Intent(Intent.ACTION_SEND);
        share.setType("text/plain");
        share.putExtra(Intent.EXTRA_TEXT, url);
        activity.startActivity(Intent.createChooser(share, "Share link"));
    }

    private static void copy(Activity activity, String url) {
        ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
        clipboard.setPrimaryClip(ClipData.newPlainText("Link", url));
        Toast.makeText(activity, "Link copied", Toast.LENGTH_SHORT).show();
    }
}
