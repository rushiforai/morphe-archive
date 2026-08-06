package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/** Source editor, metadata inspector, Fork publisher, and URL rule tester. */
public final class UserscriptEditorActivity extends Activity {
    private static final int SAVE_SCRIPT = 51;
    private Userscript script;
    private EditText source;
    private String pendingExport;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        String id = getIntent().getStringExtra("script_id");
        script = id == null ? null : MonkeyStore.get(this, id);
        if (script == null) {
            finish();
            return;
        }
        render();
    }

    private void render() {
        MonkeyUi.window(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(12), dp(12), dp(12), dp(12));
        root.setBackgroundColor(MonkeyUi.bg(this));
        root.addView(label("MonkeyScript Editor", 23, true, MonkeyUi.text(this)));
        root.addView(label(script.name + "  •  "
                        + (Userscript.KIND_CSS.equals(script.kind)
                        ? "CSS userstyle"
                        : "JavaScript userscript"),
                12, false, MonkeyUi.muted(this)));

        LinearLayout actions = new LinearLayout(this);
        add(actions, "Save", true, () -> save(false));
        add(actions, "Publish", true, this::publish);
        add(actions, "Metadata", false, this::metadata);
        add(actions, "Test URL", false, this::testUrl);
        add(actions, "GM APIs", false, this::apis);
        add(actions, "Export", false, this::export);
        android.widget.HorizontalScrollView actionScroll = new android.widget.HorizontalScrollView(this);
        actionScroll.setHorizontalScrollBarEnabled(false);
        actionScroll.addView(actions);
        root.addView(actionScroll, params(-1, -2, 0, 0));

        ScrollView scroll = new ScrollView(this);
        source = new EditText(this);
        source.setText(script.source);
        source.setTextColor(MonkeyUi.text(this));
        source.setHintTextColor(MonkeyUi.muted(this));
        source.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        source.setTypeface(Typeface.MONOSPACE);
        source.setGravity(android.view.Gravity.TOP | android.view.Gravity.START);
        source.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        source.setHorizontallyScrolling(true);
        source.setPadding(dp(12), dp(12), dp(12), dp(24));
        source.setBackground(MonkeyUi.card(this));
        scroll.addView(source, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                0,
                1
        ));

        LinearLayout bottom = new LinearLayout(this);
        add(bottom, script.enabled ? "Disable" : "Enable", false, this::toggle);
        add(bottom, "Duplicate", false, this::duplicate);
        add(bottom, "Delete", false, this::delete);
        root.addView(bottom, params(-1, -2, 8, 0));
        setContentView(root);
    }

    private void save(boolean finishAfter) {
        try {
            script.source = source.getText().toString();
            MonkeyStore.save(this, script);
            script = MonkeyStore.get(this, script.id);
            toast("Saved " + script.name);
            if (finishAfter) finish();
        } catch (Exception error) {
            toast(error.getMessage());
        }
    }

    private void publish() {
        if (Userscript.KIND_CSS.equals(script.kind)) {
            toast("Greasy Fork and Sleazy Fork publishing currently accepts JavaScript userscripts");
            return;
        }
        new AlertDialog.Builder(this)
                .setTitle("Publish userscript")
                .setMessage("The selected site will open in Chrome. MonkeyScript will submit the code to its official prefill page using your existing login, where you review and confirm the upload.")
                .setItems(new String[]{"Greasy Fork", "Sleazy Fork"}, (dialog, which) -> {
                    try {
                        script.source = source.getText().toString();
                        MonkeyStore.save(this, script);
                        script = MonkeyStore.get(this, script.id);
                        String host = which == 0
                                ? ForkSiteSupport.GREASY_HOST
                                : ForkSiteSupport.SLEAZY_HOST;
                        ForkSiteSupport.queuePublish(this, script, host);
                        toast("Opening " + (which == 0 ? "Greasy Fork" : "Sleazy Fork") + " publish review…");
                    } catch (Exception error) {
                        toast(error.getMessage());
                    }
                })
                .show();
    }

    private void metadata() {
        Userscript parsed = UserscriptMetadataParser.reparsePreservingState(
                script,
                source.getText().toString()
        );
        String text = "Name: " + parsed.name
                + "\nVersion: " + parsed.version
                + "\nNamespace: " + parsed.namespace
                + "\nRun at: " + parsed.runAt
                + "\nKind: " + parsed.kind
                + "\n\n@match\n" + join(parsed.matches)
                + "\n\n@include\n" + join(parsed.includes)
                + "\n\n@exclude\n" + join(parsed.excludes)
                + "\n\n@grant\n" + join(parsed.grants)
                + "\n\n@require\n" + join(parsed.requires);
        new AlertDialog.Builder(this)
                .setTitle("Parsed metadata")
                .setMessage(text)
                .setPositiveButton(android.R.string.ok, null)
                .show();
    }

    private void testUrl() {
        EditText input = new EditText(this);
        input.setHint("https://example.com/page");
        input.setSingleLine(true);
        new AlertDialog.Builder(this)
                .setTitle("Test URL rules")
                .setView(input)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Test", (dialog, which) -> {
                    Userscript parsed = UserscriptMetadataParser.reparsePreservingState(
                            script,
                            source.getText().toString()
                    );
                    parsed.enabled = true;
                    boolean matches = UrlPatternMatcher.matches(
                            parsed,
                            input.getText().toString().trim()
                    );
                    toast(matches
                            ? "This script matches the URL"
                            : "This script does not match the URL");
                }).show();
    }

    private void apis() {
        new AlertDialog.Builder(this)
                .setTitle("MonkeyScript GM compatibility")
                .setMessage("Supported core APIs:\n\nGM_info / GM.info\nGM_getValue, GM_setValue, "
                        + "GM_deleteValue, GM_listValues\nPromise-style GM value APIs\nGM_addStyle\n"
                        + "GM_log\nGM_registerMenuCommand\nGM_openInTab\nGM_setClipboard\n"
                        + "GM_notification\nGM_download\nGM_xmlhttpRequest (page fetch / CORS applies)\n"
                        + "unsafeWindow\n\n@require is cached during install/update. This is a userscript "
                        + "engine, not the desktop Chrome extension runtime.")
                .setPositiveButton(android.R.string.ok, null)
                .show();
    }

    private void export() {
        pendingExport = source.getText().toString();
        String extension = Userscript.KIND_CSS.equals(script.kind)
                ? ".user.css"
                : ".user.js";
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                .setType("text/plain")
                .putExtra(Intent.EXTRA_TITLE, safe(script.name) + extension);
        startActivityForResult(intent, SAVE_SCRIPT);
    }

    private void toggle() {
        try {
            script.enabled = !script.enabled;
            MonkeyStore.setEnabled(this, script.id, script.enabled);
            render();
        } catch (Exception error) {
            toast(error.getMessage());
        }
    }

    private void duplicate() {
        try {
            Userscript copy = UserscriptMetadataParser.parse(
                    source.getText().toString(),
                    script.name + " copy.user.js",
                    ""
            );
            copy.name = script.name + " copy";
            copy.id = UserscriptMetadataParser.stableId(
                    copy.namespace + ".copy." + System.currentTimeMillis(),
                    copy.name
            );
            copy.enabled = false;
            MonkeyStore.save(this, copy);
            toast("Duplicate created");
        } catch (Exception error) {
            toast(error.getMessage());
        }
    }

    private void delete() {
        new AlertDialog.Builder(this)
                .setTitle("Delete " + script.name + "?")
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Delete", (dialog, which) -> {
                    try {
                        MonkeyStore.remove(this, script.id);
                        finish();
                    } catch (Exception error) {
                        toast(error.getMessage());
                    }
                }).show();
    }

    @Override public void onBackPressed() {
        new AlertDialog.Builder(this)
                .setTitle("Save changes?")
                .setNeutralButton("Discard", (dialog, which) -> finish())
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Save", (dialog, which) -> save(true))
                .show();
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != SAVE_SCRIPT
                || result != RESULT_OK
                || data == null
                || data.getData() == null
                || pendingExport == null) return;
        Uri uri = data.getData();
        try (OutputStream output = getContentResolver().openOutputStream(uri)) {
            output.write(pendingExport.getBytes(StandardCharsets.UTF_8));
            pendingExport = null;
            toast("Script exported");
        } catch (Exception error) {
            toast(error.getMessage());
        }
    }

    private void add(LinearLayout row, String text, boolean primary, Runnable action) {
        TextView button = MonkeyUi.button(this, text, primary);
        button.setOnClickListener(view -> action.run());
        row.addView(button, params(-2, -2, 0, 7));
    }

    private TextView label(String text, int sp, boolean bold, int color) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(color);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    private LinearLayout.LayoutParams params(int width, int height, int top, int right) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(width, height);
        params.setMargins(0, dp(top), dp(right), 0);
        return params;
    }

    private int dp(int value) { return MonkeyUi.dp(this, value); }
    private void toast(String message) { ChromeUserscriptController.toast(this, message); }

    private static String join(java.util.List<String> values) {
        return values.isEmpty() ? "(none)" : android.text.TextUtils.join("\n", values);
    }

    private static String safe(String value) {
        return value.toLowerCase(Locale.US)
                .replaceAll("[^a-z0-9._-]+", "-")
                .replaceAll("^-+|-+$", "");
    }
}
