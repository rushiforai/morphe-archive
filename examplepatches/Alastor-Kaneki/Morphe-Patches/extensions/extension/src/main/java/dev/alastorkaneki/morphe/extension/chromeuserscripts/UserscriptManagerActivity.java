package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Locale;

/** Chrome Material You userscript dashboard backed by the Violentmonkey compatibility core. */
public final class UserscriptManagerActivity extends Activity {
    private static final int PICK_IMPORT = 41;
    private static final int SAVE_EXPORT = 42;

    private LinearLayout list;
    private EditText search;
    private TextView summary;
    private String pendingExport;
    private String currentUrl;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        currentUrl = getIntent().getStringExtra("current_url");
        render();
    }

    @Override protected void onResume() {
        super.onResume();
        if (list != null) refresh();
    }

    private void render() {
        MonkeyUi.window(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(18), dp(18), dp(18), dp(14));
        root.setBackgroundColor(MonkeyUi.bg(this));

        root.addView(label("Userscripts", 28, true, MonkeyUi.text(this)));
        summary = label("Violentmonkey-compatible manager for Chrome Android", 14, false,
                MonkeyUi.muted(this));
        root.addView(summary, margins(-1, -2, 0, 2, 0, 16));

        String marked = ForkSiteSupport.installUrlFromMarker(currentUrl);
        String installTarget = marked == null ? currentUrl : marked;
        if (ForkSiteSupport.isInstallablePage(installTarget)) {
            LinearLayout currentCard = new LinearLayout(this);
            currentCard.setOrientation(LinearLayout.VERTICAL);
            currentCard.setPadding(dp(16), dp(14), dp(16), dp(14));
            currentCard.setBackground(MonkeyUi.card(this));
            currentCard.addView(label("Userscript detected on this page", 16, true,
                    MonkeyUi.text(this)));
            currentCard.addView(label("Review its source and permissions before installing.", 13,
                    false, MonkeyUi.muted(this)), margins(-1, -2, 0, 4, 0, 12));
            TextView current = MonkeyUi.button(this, "Review and install", true);
            current.setOnClickListener(view ->
                    ForkSiteSupport.openInstallPreview(this, installTarget));
            currentCard.addView(current);
            root.addView(currentCard, margins(-1, -2, 0, 0, 0, 16));
        }

        search = new EditText(this);
        search.setHint("Search installed scripts");
        search.setTextColor(MonkeyUi.text(this));
        search.setHintTextColor(MonkeyUi.muted(this));
        search.setSingleLine(true);
        search.setBackground(MonkeyUi.input(this));
        search.setPadding(dp(16), dp(13), dp(16), dp(13));
        root.addView(search, margins(-1, -2, 0, 0, 0, 18));
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                refresh();
            }
            @Override public void afterTextChanged(Editable editable) { }
        });

        root.addView(label("Quick actions", 15, true, MonkeyUi.text(this)),
                margins(-1, -2, 0, 0, 0, 10));

        LinearLayout actionGrid = new LinearLayout(this);
        actionGrid.setOrientation(LinearLayout.VERTICAL);
        addActionRow(actionGrid,
                action("New script", view -> chooseNew()),
                action("Import file", view -> pickImport()));
        addActionRow(actionGrid,
                action("Install URL", view -> installUrl()),
                action("Check updates", view -> updateAll()));
        addActionRow(actionGrid,
                action("Greasy Fork", view ->
                        ForkSiteSupport.openSite(this, ForkSiteSupport.GREASY_HOST)),
                action("Sleazy Fork", view ->
                        ForkSiteSupport.openSite(this, ForkSiteSupport.SLEAZY_HOST)));
        addActionRow(actionGrid,
                action("Backup", view -> backup()),
                action("Settings", view -> settings()));
        root.addView(actionGrid, margins(-1, -2, 0, 0, 0, 18));

        root.addView(label("Installed", 15, true, MonkeyUi.text(this)),
                margins(-1, -2, 0, 0, 0, 8));

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list, new ScrollView.LayoutParams(-1, -2));
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));

        setContentView(root);
        refresh();
    }

    private void refresh() {
        if (list == null) return;
        list.removeAllViews();
        String query = search == null
                ? ""
                : search.getText().toString().toLowerCase(Locale.US).trim();

        List<Userscript> scripts = MonkeyStore.list(this);
        if (summary != null) {
            summary.setText(scripts.size() + (scripts.size() == 1 ? " script" : " scripts")
                    + " installed • Violentmonkey-compatible core");
        }

        int visible = 0;
        for (Userscript script : scripts) {
            String haystack = (script.name + " " + script.description + " "
                    + script.matches + " " + script.includes + " " + script.tags)
                    .toLowerCase(Locale.US);
            if (!query.isEmpty() && !haystack.contains(query)) continue;
            list.addView(card(script), margins(-1, -2, 0, 0, 0, 10));
            visible++;
        }

        if (visible == 0) list.addView(emptyState(scripts.isEmpty()));
    }

    private View emptyState(boolean noScripts) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setPadding(dp(20), dp(26), dp(20), dp(24));
        card.setBackground(MonkeyUi.card(this));

        card.addView(label(noScripts ? "No userscripts yet" : "No matching scripts",
                19, true, MonkeyUi.text(this)));
        TextView body = label(noScripts
                        ? "Browse a script catalogue, import a file, or review a direct .user.js URL."
                        : "Try a different search term.",
                14, false, MonkeyUi.muted(this));
        body.setGravity(Gravity.CENTER);
        card.addView(body, margins(-1, -2, 0, 8, 0, 18));

        if (noScripts) {
            TextView browse = MonkeyUi.button(this, "Browse Greasy Fork", true);
            browse.setOnClickListener(view ->
                    ForkSiteSupport.openSite(this, ForkSiteSupport.GREASY_HOST));
            card.addView(browse, new LinearLayout.LayoutParams(-1, -2));

            TextView install = MonkeyUi.button(this, "Install from URL", false);
            install.setOnClickListener(view -> installUrl());
            card.addView(install, margins(-1, -2, 0, 10, 0, 0));
        }
        return card;
    }

    private View card(Userscript script) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(12));
        card.setBackground(MonkeyUi.card(this));

        LinearLayout top = new LinearLayout(this);
        top.setGravity(Gravity.CENTER_VERTICAL);

        TextView badge = label(
                Userscript.KIND_CSS.equals(script.kind) ? "CSS" : "JS",
                12, true,
                Userscript.KIND_CSS.equals(script.kind)
                        ? MonkeyUi.secondary(this) : MonkeyUi.primary(this));
        top.addView(badge, margins(-2, -2, 0, 0, 12, 0));

        TextView name = label(script.name, 16, true, MonkeyUi.text(this));
        top.addView(name, new LinearLayout.LayoutParams(0, -2, 1));

        Switch enabled = new Switch(this);
        enabled.setChecked(script.enabled);
        enabled.setContentDescription("Enable " + script.name);
        enabled.setOnCheckedChangeListener((button, checked) -> {
            try {
                MonkeyStore.setEnabled(this, script.id, checked);
            } catch (Exception error) {
                toast(error.getMessage());
            }
        });
        top.addView(enabled);
        card.addView(top);

        card.addView(label(
                "v" + script.version + "  •  " + script.runAt + "  •  "
                        + (script.matches.size() + script.includes.size()) + " rule(s)",
                12, false, MonkeyUi.muted(this)));

        if (!script.description.isEmpty()) {
            card.addView(label(script.description, 13, false, MonkeyUi.muted(this)),
                    margins(-1, -2, 0, 5, 0, 0));
        }

        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.END);
        TextView edit = MonkeyUi.button(this, "Edit", false);
        edit.setOnClickListener(view -> openEditor(script.id));
        row.addView(edit, margins(-2, -2, 0, 10, 8, 0));

        TextView export = MonkeyUi.button(this, "Export", false);
        export.setOnClickListener(view -> exportScript(script));
        row.addView(export, margins(-2, -2, 0, 10, 8, 0));

        TextView delete = MonkeyUi.button(this, "Delete", false);
        delete.setOnClickListener(view -> confirmDelete(script));
        row.addView(delete, margins(-2, -2, 0, 10, 0, 0));
        card.addView(row);
        return card;
    }

    private TextView action(String text, View.OnClickListener listener) {
        TextView button = MonkeyUi.button(this, text, false);
        button.setOnClickListener(listener);
        return button;
    }

    private void addActionRow(LinearLayout grid, TextView left, TextView right) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams leftParams = new LinearLayout.LayoutParams(0, -2, 1);
        leftParams.setMargins(0, 0, dp(6), dp(10));
        LinearLayout.LayoutParams rightParams = new LinearLayout.LayoutParams(0, -2, 1);
        rightParams.setMargins(dp(6), 0, 0, dp(10));
        row.addView(left, leftParams);
        row.addView(right, rightParams);
        grid.addView(row, new LinearLayout.LayoutParams(-1, -2));
    }

    private void chooseNew() {
        new AlertDialog.Builder(this)
                .setTitle("New userscript")
                .setItems(new String[]{"JavaScript userscript", "CSS userstyle"},
                        (dialog, which) -> {
                            String kind = which == 1
                                    ? Userscript.KIND_CSS : Userscript.KIND_JAVASCRIPT;
                            Userscript script = UserscriptMetadataParser.parse(
                                    template(kind),
                                    which == 1 ? "new.user.css" : "new.user.js", "");
                            script.enabled = false;
                            try {
                                MonkeyStore.save(this, script);
                                openEditor(script.id);
                            } catch (Exception error) {
                                toast(error.getMessage());
                            }
                        })
                .show();
    }

    private void pickImport() {
        startActivityForResult(
                new Intent(Intent.ACTION_OPEN_DOCUMENT)
                        .setType("*/*")
                        .addCategory(Intent.CATEGORY_OPENABLE),
                PICK_IMPORT);
    }

    private void installUrl() {
        EditText input = new EditText(this);
        input.setHint("Greasy Fork page or direct .user.js URL");
        input.setTextColor(MonkeyUi.text(this));
        input.setHintTextColor(MonkeyUi.muted(this));
        input.setSingleLine(true);
        new AlertDialog.Builder(this)
                .setTitle("Install userscript")
                .setView(input)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Review", (dialog, which) -> {
                    String url = input.getText().toString().trim();
                    if (!url.isEmpty()) ForkSiteSupport.openInstallPreview(this, url);
                })
                .show();
    }

    private void updateAll() {
        toast("Checking for userscript updates…");
        MonkeyStore.updateAll(this, callback());
    }

    private MonkeyStore.Callback callback() {
        return (ok, message, script) -> runOnUiThread(() -> {
            toast(message);
            refresh();
        });
    }

    private void backup() {
        try {
            pendingExport = MonkeyStore.backup(this);
            startActivityForResult(
                    new Intent(Intent.ACTION_CREATE_DOCUMENT)
                            .setType("application/json")
                            .putExtra(Intent.EXTRA_TITLE, "userscripts-backup.json"),
                    SAVE_EXPORT);
        } catch (Exception error) {
            toast(error.getMessage());
        }
    }

    private void exportScript(Userscript script) {
        pendingExport = script.source;
        String extension = Userscript.KIND_CSS.equals(script.kind)
                ? ".user.css" : ".user.js";
        startActivityForResult(
                new Intent(Intent.ACTION_CREATE_DOCUMENT)
                        .setType("text/plain")
                        .putExtra(Intent.EXTRA_TITLE, safeName(script.name) + extension),
                SAVE_EXPORT);
    }

    private void settings() {
        String[] labels = {"Enable userscripts"};
        boolean[] values = {MonkeyStore.globalEnabled(this)};
        new AlertDialog.Builder(this)
                .setTitle("Userscript settings")
                .setMultiChoiceItems(labels, values, (dialog, which, checked) ->
                        MonkeyStore.globalEnabled(this, checked))
                .setNeutralButton("Clear pending upload", (dialog, which) -> {
                    ForkSiteSupport.clearPending(this);
                    toast("Pending Fork upload cleared");
                })
                .setPositiveButton(android.R.string.ok, null)
                .show();
    }

    private void confirmDelete(Userscript script) {
        new AlertDialog.Builder(this)
                .setTitle("Delete " + script.name + "?")
                .setMessage("This removes the script and its cached @require files.")
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Delete", (dialog, which) -> {
                    try {
                        MonkeyStore.remove(this, script.id);
                        refresh();
                    } catch (Exception error) {
                        toast(error.getMessage());
                    }
                })
                .show();
    }

    private void openEditor(String id) {
        startActivity(new Intent(this, UserscriptEditorActivity.class)
                .putExtra("script_id", id));
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (result != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        try {
            if (request == PICK_IMPORT) {
                String name = uri.getLastPathSegment() == null
                        ? "import.user.js" : uri.getLastPathSegment();
                String text;
                try (InputStream input = getContentResolver().openInputStream(uri)) {
                    text = MonkeyStore.read(input, 8 * 1024 * 1024);
                }
                if (text.trim().startsWith("{") && text.contains("MonkeyScript-backup")) {
                    MonkeyStore.restore(this, text);
                    refresh();
                } else {
                    MonkeyStore.importText(this, text, name, "", callback());
                }
            } else if (request == SAVE_EXPORT && pendingExport != null) {
                try (OutputStream output = getContentResolver().openOutputStream(uri)) {
                    output.write(pendingExport.getBytes(StandardCharsets.UTF_8));
                }
                pendingExport = null;
                toast("Export saved");
            }
        } catch (Exception error) {
            toast(error.getMessage());
        }
    }

    private String template(String kind) {
        if (Userscript.KIND_CSS.equals(kind)) {
            return "/* ==UserStyle==\n@name New userstyle\n@namespace local.userscripts\n"
                    + "@version 1.0.0\n@match https://example.com/*\n==/UserStyle== */\n\nbody { }\n";
        }
        return "// ==UserScript==\n// @name New userscript\n// @namespace local.userscripts\n"
                + "// @version 1.0.0\n// @description Created in Chrome\n"
                + "// @match https://example.com/*\n// @grant none\n"
                + "// @run-at document-end\n// ==/UserScript==\n\n"
                + "(function () {\n  'use strict';\n})();\n";
    }

    private TextView label(String text, int sp, boolean bold, int color) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(color);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    private LinearLayout.LayoutParams margins(
            int width, int height, int left, int top, int right, int bottom) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(width, height);
        params.setMargins(dp(left), dp(top), dp(right), dp(bottom));
        return params;
    }

    private int dp(int value) {
        return MonkeyUi.dp(this, value);
    }

    private void toast(String message) {
        ChromeUserscriptController.toast(this, message);
    }

    private static String safeName(String value) {
        return value.toLowerCase(Locale.US)
                .replaceAll("[^a-z0-9._-]+", "-")
                .replaceAll("^-+|-+$", "");
    }
}
