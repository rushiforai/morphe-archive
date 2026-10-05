/*
 * Copyright (C) 2026 riky-dev
 *
 * See the included NOTICE / wireguard licenses for terms.
 */

package app.riky.extension.capcut.tunnel;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Lets any user paste or pick a wg-quick .conf. CapCut-only scoping is applied
 * on save. Opened automatically when no config exists, or from the tunnel notification.
 */
public final class TunnelImportActivity extends Activity {
    private static final int REQUEST_FILE = 0x574746;
    private WireGuardManager manager;
    private EditText editor;
    private TextView status;
    private Button save;
    private Button pick;
    private Button delete;
    private Button stop;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        manager = WireGuardManager.get(this);
        setContentView(buildUi());
        refreshStatus();
    }

    private LinearLayout buildUi() {
        int pad = dp(16);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, pad);
        root.setBackgroundColor(Color.WHITE);

        TextView title = new TextView(this);
        title.setText("CapCut network tunnel");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(Color.BLACK);
        root.addView(title, matchWrap());

        TextView help = new TextView(this);
        help.setText("Import your own WireGuard (wg-quick) config. Only CapCut traffic "
                + "uses this tunnel. Try finding an exit that isn't blocked.");
        help.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        help.setTextColor(Color.DKGRAY);
        help.setPadding(0, dp(8), 0, dp(12));
        root.addView(help, matchWrap());

        status = new TextView(this);
        status.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        status.setTextColor(Color.BLACK);
        status.setPadding(0, 0, 0, dp(12));
        root.addView(status, matchWrap());

        editor = new EditText(this);
        editor.setHint("[Interface]\nPrivateKey = …\nAddress = …\n\n[Peer]\nPublicKey = …\nAllowedIPs = 0.0.0.0/0\nEndpoint = …");
        editor.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        editor.setMinLines(12);
        editor.setGravity(Gravity.TOP | Gravity.START);
        editor.setTypeface(Typeface.MONOSPACE);
        editor.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        editor.setTextColor(Color.BLACK);
        editor.setBackgroundColor(0xFFF5F5F5);
        editor.setPadding(dp(8), dp(8), dp(8), dp(8));
        ScrollView scroll = new ScrollView(this);
        scroll.addView(editor, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        root.addView(scroll, scrollLp);

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(12), 0, 0);

        pick = button("Import file");
        pick.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            startActivityForResult(intent, REQUEST_FILE);
        });
        row.addView(pick, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        save = button("Save & connect");
        save.setOnClickListener(v -> {
            String text = editor.getText() == null ? "" : editor.getText().toString().trim();
            if (text.isEmpty()) {
                toast("Paste a .conf or import a file first");
                return;
            }
            setBusy(true);
            manager.saveText(text, new WireGuardManager.ResultCallback() {
                @Override public void ok() {
                    setBusy(false);
                    toast("Saved — connecting");
                    refreshStatus();
                    finish();
                }
                @Override public void error(String message) {
                    setBusy(false);
                    toast(message);
                    refreshStatus();
                }
            });
        });
        row.addView(save, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(row, matchWrap());

        LinearLayout bottomRow = new LinearLayout(this);
        bottomRow.setOrientation(LinearLayout.HORIZONTAL);
        bottomRow.setPadding(0, dp(6), 0, 0);

        delete = button("Delete saved config");
        delete.setOnClickListener(v -> {
            setBusy(true);
            manager.deleteConfiguration(new WireGuardManager.ResultCallback() {
                @Override public void ok() {
                    setBusy(false);
                    editor.setText("");
                    toast("Config deleted");
                    refreshStatus();
                }
                @Override public void error(String message) {
                    setBusy(false);
                    toast(message);
                    refreshStatus();
                }
            });
        });
        bottomRow.addView(delete, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        stop = button("Stop using this");
        stop.setOnClickListener(v -> {
            setBusy(true);
            manager.disableAndDisconnect(new WireGuardManager.ResultCallback() {
                @Override public void ok() {
                    setBusy(false);
                    toast("VPN disabled");
                    refreshStatus();
                    finish();
                }
                @Override public void error(String message) {
                    setBusy(false);
                    toast(message);
                    refreshStatus();
                    finish();
                }
            });
        });
        bottomRow.addView(stop, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(bottomRow, matchWrap());
        return root;
    }

    private Button button(String label) {
        Button button = new Button(this);
        button.setText(label);
        return button;
    }

    private void refreshStatus() {
        WireGuardManager.Snapshot snap = manager.snapshot();
        String line;
        if (manager.isDisabled()) {
            line = "Status: Disabled (not using VPN)";
        } else if (manager.hasConfig()) {
            line = "Saved config: yes — state " + snap.state;
        } else {
            line = "Saved config: none — paste or import a .conf";
        }
        if (snap.error != null && !snap.error.isEmpty()) line += "\nLast error: " + snap.error;
        status.setText(line);
        delete.setEnabled(manager.hasConfig());
    }

    private void setBusy(boolean busy) {
        save.setEnabled(!busy);
        pick.setEnabled(!busy);
        delete.setEnabled(!busy && manager.hasConfig());
        stop.setEnabled(!busy);
        editor.setEnabled(!busy);
    }

    private void toast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private static LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_FILE || resultCode != RESULT_OK || data == null || data.getData() == null) {
            return;
        }
        Uri uri = data.getData();
        setBusy(true);
        manager.importDocument(uri, new WireGuardManager.ResultCallback() {
            @Override public void ok() {
                setBusy(false);
                toast("Imported — connecting");
                refreshStatus();
                finish();
            }
            @Override public void error(String message) {
                setBusy(false);
                toast(message);
                refreshStatus();
            }
        });
    }
}
