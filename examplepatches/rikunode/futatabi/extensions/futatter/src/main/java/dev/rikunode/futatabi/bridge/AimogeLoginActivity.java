package dev.rikunode.futatabi.bridge;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** Use the real browser's official security checks, never a WebView cookie transfer. */
public final class AimogeLoginActivity extends Activity {
    static final String AUTH_URL = "authorization_url";
    private static final String CHROME = "com.android.chrome";
    private static final String CUSTOM_TABS_SERVICE = "android.support.customtabs.action.CustomTabsService";
    private static final String SESSION = "android.support.customtabs.extra.SESSION";
    private boolean launched, left;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("Aimoge login");
        String start = getIntent().getStringExtra(AUTH_URL);
        if (AimogeLoginFlow.page(start) != AimogeLoginFlow.Page.OFFICIAL) {
            finish();
            return;
        }
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        TextView notice = new TextView(this);
        notice.setPadding(16, 12, 16, 12);
        notice.setText("公式ページで承認し、完了後はアプリへ戻ってください。");
        layout.addView(notice);
        Button close = new Button(this);
        close.setText("ホームへ戻る");
        close.setOnClickListener(v -> finish());
        layout.addView(close);
        setContentView(layout);
        // Never reopen an old request automatically after Activity recreation.
        if (state != null) return;
        Uri uri = Uri.parse(start);
        Intent service = new Intent(CUSTOM_TABS_SERVICE).setPackage(CHROME);
        if (getPackageManager().resolveService(service, 0) != null) {
            Intent tab = browserIntent(uri).setPackage(CHROME);
            Bundle extras = new Bundle();
            extras.putBinder(SESSION, null);
            extras.putInt("android.support.customtabs.extra.TITLE_VISIBILITY", 1);
            tab.putExtras(extras);
            if (open(tab)) return;
        }
        // Prefer normal Chrome if its tab service is unavailable; otherwise let
        // Android resolve the installed normal browser. No cookie sharing.
        String fallback = "カスタムタブが使えないため、通常のブラウザで開きます。完了後はアプリへ戻ってください。";
        notice.setText(fallback);
        Toast.makeText(this, fallback, Toast.LENGTH_LONG).show();
        if (open(browserIntent(uri).setPackage(CHROME))) return;
        if (open(browserIntent(uri))) return;
        notice.setText("対応ブラウザが見つかりません。Chromeをインストールし、再度ログインしてください。");
    }

    private static Intent browserIntent(Uri uri) {
        return new Intent(Intent.ACTION_VIEW, uri).addCategory(Intent.CATEGORY_BROWSABLE);
    }

    private boolean open(Intent intent) {
        try {
            startActivity(intent);
            launched = true;
            return true;
        } catch (ActivityNotFoundException | SecurityException ex) {
            return false;
        }
    }

    @Override protected void onPause() {
        super.onPause();
        if (launched) left = true;
    }

    @Override protected void onResume() {
        super.onResume();
        // Home reads the actual saved credential status on Activity result.
        // Closing the browser is not itself treated as login success.
        if (left) finish();
    }
}
