package app.template.extension.settings;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/**
 * Standalone host for {@link ModSettingsView}. Added to the Letterboxd manifest by the "Mod
 * settings" patch and launched from a launcher long-press shortcut / the profile-tab gear.
 *
 * <p>The manifest theme is {@code @android:style/Theme.Material.NoActionBar}; this class draws its
 * own header and applies the system-bar insets itself.
 */
@SuppressWarnings("deprecation")
public class ModSettingsActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        final LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(SurfaceColors.background(this));

        root.addView(buildHeader(), new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        root.addView(new ModSettingsView(this), new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));

        root.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                v.setPadding(0, insets.getSystemWindowInsetTop(), 0,
                        insets.getSystemWindowInsetBottom());
                return insets;
            }
        });

        setContentView(root);
    }

    private View buildHeader() {
        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(16), dp(14), dp(16), dp(14));

        TextView back = new TextView(this);
        back.setText("‹");
        back.setTextColor(Color.WHITE);
        back.setTextSize(TypedValue.COMPLEX_UNIT_SP, 26f);
        back.setPadding(0, 0, dp(18), 0);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        header.addView(back);

        TextView title = new TextView(this);
        title.setText("Letterboxd Mods");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        header.addView(title);

        return header;
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    // --- config export / import -----------------------------------------

    private static final int REQ_EXPORT = 0x4011;
    private static final int REQ_IMPORT = 0x4012;

    void pickExport() {
        try {
            startActivityForResult(new Intent(Intent.ACTION_CREATE_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("application/json")
                    .putExtra(Intent.EXTRA_TITLE, "letterboxd-mods-config.json"), REQ_EXPORT);
        } catch (Throwable t) {
            toast("No file picker available");
        }
    }

    void pickImport() {
        try {
            // "*/*" not "application/json" — some pickers hide .json files under the strict type.
            startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("*/*"), REQ_IMPORT);
        } catch (Throwable t) {
            toast("No file picker available");
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();

        if (requestCode == REQ_EXPORT) {
            try (OutputStream out = getContentResolver().openOutputStream(uri, "wt")) {
                if (out == null) throw new Exception("no stream");
                out.write(ConfigTransfer.export(this).getBytes(StandardCharsets.UTF_8));
                toast("Settings exported");
            } catch (Throwable t) {
                toast("Couldn't write that file");
            }
        } else if (requestCode == REQ_IMPORT) {
            String text;
            try (InputStream in = getContentResolver().openInputStream(uri)) {
                if (in == null) throw new Exception("no stream");
                text = readAll(in);
            } catch (Throwable t) {
                toast("Couldn't read that file");
                return;
            }
            int n = ConfigTransfer.importJson(this, text);
            if (n < 0) {
                toast("That doesn't look like a Mods config");
                return;
            }
            toast("Imported " + n + " setting" + (n == 1 ? "" : "s"));
            RestartHelper.promptRestart(this);
        }
    }

    private static String readAll(InputStream in) throws Exception {
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        byte[] chunk = new byte[4096];
        int read;
        int total = 0;
        while ((read = in.read(chunk)) != -1) {
            total += read;
            if (total > 1_000_000) throw new Exception("file too large"); // a config is a few KB
            buf.write(chunk, 0, read);
        }
        return buf.toString("UTF-8");
    }

    private void toast(String message) {
        try {
            Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
        }
    }
}
