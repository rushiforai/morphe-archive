package dev.alastorkaneki.morphe.extension.mcpecenter;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** Small native Android settings surface for choosing a Storage Access Framework folder. */
public final class DownloadLocationActivity extends Activity {
    public static final String EXTRA_PICK_IMMEDIATELY = "pick_immediately";
    private static final int REQUEST_TREE = 0x4D43;

    private TextView currentFolderValue;
    private boolean pickerStarted;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        int nightMode = getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        setTheme(
                nightMode == Configuration.UI_MODE_NIGHT_YES
                        ? android.R.style.Theme_Material_NoActionBar
                        : android.R.style.Theme_Material_Light_NoActionBar
        );
        super.onCreate(savedInstanceState);

        setTitle("Download location");
        setContentView(buildContent());
        refreshCurrentFolder();

        if (savedInstanceState == null && getIntent().getBooleanExtra(EXTRA_PICK_IMMEDIATELY, false)) {
            getWindow().getDecorView().post(this::chooseFolder);
        }
    }

    private ScrollView buildContent() {
        ScrollView scrollView = new ScrollView(this);
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setGravity(Gravity.START);
        int side = dp(24);
        content.setPadding(side, dp(28), side, dp(28));
        scrollView.addView(
                content,
                new ScrollView.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                )
        );

        TextView title = new TextView(this);
        title.setText("Downloads");
        title.setTextSize(28f);
        title.setPadding(0, 0, 0, dp(8));
        content.addView(title, matchWrap());

        TextView description = new TextView(this);
        description.setText(
                "Choose where downloaded Minecraft add-ons are saved. The app keeps its normal " +
                        "working copy long enough to hand the file to Minecraft."
        );
        description.setTextSize(16f);
        description.setPadding(0, 0, 0, dp(28));
        content.addView(description, matchWrap());

        TextView currentLabel = new TextView(this);
        currentLabel.setText("Current folder");
        currentLabel.setTextSize(14f);
        content.addView(currentLabel, matchWrap());

        currentFolderValue = new TextView(this);
        currentFolderValue.setTextSize(18f);
        currentFolderValue.setPadding(0, dp(6), 0, dp(20));
        content.addView(currentFolderValue, matchWrap());

        Button choose = new Button(this);
        choose.setText("Choose folder");
        choose.setAllCaps(false);
        choose.setOnClickListener(v -> chooseFolder());
        content.addView(choose, matchWrap());

        Button useDefault = new Button(this);
        useDefault.setText("Use app default");
        useDefault.setAllCaps(false);
        useDefault.setOnClickListener(v -> {
            Uri oldUri = DownloadLocationManager.getTreeUri(this);
            if (oldUri != null) {
                try {
                    getContentResolver().releasePersistableUriPermission(
                            oldUri,
                            Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                    );
                } catch (Exception ignored) {
                    // Some providers do not expose a releasable persisted grant.
                }
            }
            DownloadLocationManager.setTreeUri(this, null);
            refreshCurrentFolder();
            Toast.makeText(this, "Using app default", Toast.LENGTH_SHORT).show();
        });
        content.addView(useDefault, matchWrap());

        TextView hint = new TextView(this);
        hint.setText(
                "Tip: long-press the app icon and tap Download folder to change this later."
        );
        hint.setTextSize(13f);
        hint.setPadding(0, dp(24), 0, 0);
        content.addView(hint, matchWrap());

        return scrollView;
    }

    private void chooseFolder() {
        if (pickerStarted) {
            return;
        }
        pickerStarted = true;

        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        intent.addFlags(
                Intent.FLAG_GRANT_READ_URI_PERMISSION |
                        Intent.FLAG_GRANT_WRITE_URI_PERMISSION |
                        Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION |
                        Intent.FLAG_GRANT_PREFIX_URI_PERMISSION
        );
        startActivityForResult(intent, REQUEST_TREE);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        pickerStarted = false;

        if (requestCode != REQUEST_TREE || resultCode != RESULT_OK || data == null) {
            return;
        }

        Uri uri = data.getData();
        if (uri == null) {
            return;
        }

        int takeFlags = data.getFlags() &
                (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        try {
            getContentResolver().takePersistableUriPermission(uri, takeFlags);
        } catch (SecurityException error) {
            Toast.makeText(this, "This folder cannot be kept as a download location", Toast.LENGTH_LONG).show();
            return;
        }

        DownloadLocationManager.setTreeUri(this, uri);
        refreshCurrentFolder();
        Toast.makeText(this, "Download folder updated", Toast.LENGTH_SHORT).show();
    }

    private void refreshCurrentFolder() {
        if (currentFolderValue != null) {
            currentFolderValue.setText(DownloadLocationManager.folderLabel(this));
        }
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
