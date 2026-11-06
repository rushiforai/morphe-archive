package app.ayufa.extension.simeji;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ScrollView;

/**
 * Full-screen host for the Ayufa Simeji patch settings. Declared in
 * the extension manifest; if the declaration is not merged into a
 * given build, {@link SimejiSettingsUi#show} falls back to a dialog
 * with the same content.
 */
public final class SimejiSettingsActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle("Ayufaパッチ設定");
        ScrollView scroller = new ScrollView(this);
        scroller.addView(SimejiSettingsUi.createContentView(this));
        setContentView(scroller);
    }
}
