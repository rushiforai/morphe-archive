package app.matthew.chrome.linktest;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

/** A distinct sender exercises real external intents without changing the default browser. */
public final class MainActivity extends Activity {
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        String url = getIntent().getStringExtra("url");
        if (url == null) url = "http://127.0.0.1:8765/read";
        Intent link = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        link.setPackage("app.matthew.chrome.test");
        link.addCategory(Intent.CATEGORY_BROWSABLE);
        if ("custom".equals(getIntent().getStringExtra("kind"))) {
            Bundle extras = new Bundle();
            extras.putBinder("android.support.customtabs.extra.SESSION", null);
            link.putExtras(extras);
            link.putExtra("android.support.customtabs.extra.TITLE_VISIBILITY", 1);
        }
        startActivity(link);
        finish();
    }
}
