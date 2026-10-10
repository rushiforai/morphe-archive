package app.nogoogle.gboard;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.text.InputType;
import android.text.format.DateFormat;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import app.nogoogle.gboard.extras.PortedFeatures;
import app.nogoogle.gboard.gif.GifBridge;
import app.nogoogle.gboard.gif.HelperApk;
import app.nogoogle.gboard.translate.LocalTranslate;
import app.nogoogle.gboard.translate.LocalTranslateInfo;
import app.nogoogle.gboard.voice.Models;
import app.nogoogle.gboard.voice.VoiceController;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** "No-Google" mod menu, opened from an entry injected into Gboard's settings. */
public class ModMenuActivity extends Activity {
    public static final String EXTRA_REQUEST_MIC = "request_mic";
    /** "gboard_patches": open the Gboard patches page (its own entry in Gboard's settings);
     *  SECTION_GIF: only the GIF sources (the GIF tab's "Add sources" button);
     *  SECTION_MODELS: only the models (voice typing or translation without one). */
    public static final String EXTRA_SECTION = "section";
    public static final String SECTION_GIF = "gif";
    public static final String SECTION_MODELS = "models";
    /** Start installing the network helper app (the GIF tab's "Install" button). */
    public static final String EXTRA_INSTALL_HELPER = "install_helper";
    private static final int REQ_MIC = 1;
    private static final int REQ_IMPORT = 2;

    private LinearLayout list;
    private int fg;
    private int muted;
    private int accent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        boolean dark = (getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_DeviceDefault : android.R.style.Theme_DeviceDefault_Light);
        fg = dark ? 0xFFE8EAED : 0xFF202124;
        muted = dark ? 0xFF9AA0A6 : 0xFF5F6368;
        accent = dark ? 0xFF8AB4F8 : 0xFF1A73E8;
        setTitle(patchesPage() ? "Gboard patches" : gifPage() ? "GIF sources" : modelsPage() ? "Models" : "No-Google");

        ScrollView scroll = new ScrollView(this);
        scroll.setFitsSystemWindows(true);
        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(dp(16), dp(8), dp(16), dp(32));
        scroll.addView(list);
        setContentView(scroll);
        build();

        if (getIntent().getBooleanExtra(EXTRA_REQUEST_MIC, false)) requestMic();
        if (savedInstanceState == null && getIntent().getBooleanExtra(EXTRA_INSTALL_HELPER, false)
                && HelperApk.state(this) != HelperApk.READY) {
            HelperApk.install(this);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        ModelDownloads.setListener(this::build);
        HelperApk.setListener(this::build);
        build();
    }

    @Override
    protected void onPause() {
        ModelDownloads.setListener(null);
        HelperApk.setListener(null);
        super.onPause();
    }

    private boolean patchesPage() {
        return "gboard_patches".equals(getIntent().getStringExtra(EXTRA_SECTION));
    }

    private boolean gifPage() {
        return SECTION_GIF.equals(getIntent().getStringExtra(EXTRA_SECTION));
    }

    private boolean modelsPage() {
        return SECTION_MODELS.equals(getIntent().getStringExtra(EXTRA_SECTION));
    }

    /** From the keyboard: says what is missing and opens the models page to download it. */
    public static void openModels(Context c, String message) {
        Toast.makeText(c, message, Toast.LENGTH_LONG).show();
        c.startActivity(new Intent(c, ModMenuActivity.class)
                .putExtra(EXTRA_SECTION, SECTION_MODELS)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
    }

    private void build() {
        list.removeAllViews();
        if (patchesPage()) {
            buildGboardPatches();
            return;
        }
        if (gifPage()) {
            buildGif();
            return;
        }
        if (modelsPage()) {
            buildModels();
            return;
        }

        header("Privacy");
        note("Network access is removed at install time, so Gboard (including its native code) "
                + "cannot open any connection. The switches below control the extra layer that "
                + "stops Gboard handing data to other Google apps on the phone.");
        toggle("Block Google services", "Play services, Google app, AICore, Play Store binds",
                NoGoogleSettings.BLOCK_SERVICES);
        toggle("Block broadcasts to Google apps", "Also confines Gboard's own broadcasts to itself",
                NoGoogleSettings.BLOCK_BROADCASTS);
        toggle("Block opening Google apps & links", "Help pages, Google search, Lens, Play Store",
                NoGoogleSettings.BLOCK_ACTIVITIES);
        toggle("Block Google content providers", "Gservices, Phenotype, Google Photos URIs",
                NoGoogleSettings.BLOCK_PROVIDERS);
        toggle("Block system AI services", "Android System Intelligence text classifier & translation",
                NoGoogleSettings.BLOCK_SYSTEM_AI);
        toggle("Report Play services missing", "Gboard skips all GMS features (logging, flags, learning)",
                NoGoogleSettings.REPORT_GMS_MISSING);
        toggle("Turn off online-only features", "Emoji Kitchen, Tenor, Assistant voice, proofread…",
                NoGoogleSettings.DISABLE_ONLINE_FEATURES);

        buildGif();

        header("Keyboard");
        toggle("Keep the keyboard left-to-right", "Right-to-left languages (Hebrew, Arabic…) change only the "
                + "letters: nothing is mirrored and the keyboard's menus stay in the phone's language. Restart "
                + "Gboard after changing", NoGoogleSettings.KEEP_LTR);
        restartAction();

        header("Voice typing");
        choice("Engine", NoGoogleSettings.VOICE_ENGINE,
                new String[]{"whisper", "stock"},
                new String[]{"Offline Whisper", "Gboard default (needs Google)"});
        List<String> names = new ArrayList<>();
        List<String> labels = new ArrayList<>();
        names.add("auto");
        labels.add("Automatic (most accurate installed)");
        for (File f : Models.whisperModels()) {
            names.add(f.getName());
            labels.add(f.getName() + "  (" + (f.length() >> 20) + " MB"
                    + (Models.isAcft(f) ? ", fast short-audio mode" : "") + ")");
        }
        choice("Model", NoGoogleSettings.VOICE_MODEL, names.toArray(new String[0]), labels.toArray(new String[0]));
        choice("CPU threads", NoGoogleSettings.VOICE_THREADS,
                new String[]{"2", "4", "6", "8"}, new String[]{"2", "4 (big cores)", "6", "8"});
        toggle("Stop automatically on silence", "Finish after 4 s of silence instead of waiting for Done",
                NoGoogleSettings.VOICE_AUTO_STOP);
        boolean mic = checkSelfPermission(Manifest.permission.RECORD_AUDIO) == PackageManager.PERMISSION_GRANTED;
        action(mic ? "Microphone: allowed" : "Microphone: not allowed. Tap to allow", null,
                mic ? null : v -> requestMic());

        header("Translation");
        choice("Engine", NoGoogleSettings.TRANSLATE_ENGINE,
                new String[]{"llm", "firefox", "stock"},
                new String[]{"Best: Hy-MT (instant Firefox draft, then Hy-MT)",
                        "Fast: Firefox Translations only", "Gboard default (needs Google)"});
        note(LocalTranslateInfo.summary());

        buildModels();

        header("Blocked calls (this session)");
        List<String> log = NoGoogleSettings.blockedLog();
        if (log.isEmpty()) note("Nothing blocked yet.");
        for (int i = log.size() - 1; i >= 0 && i >= log.size() - 30; i--) {
            String e = log.get(i);
            int sp = e.indexOf(' ');
            String when = DateFormat.format("HH:mm:ss", Long.parseLong(e.substring(0, sp))).toString();
            note(when + "  " + e.substring(sp + 1));
        }
    }

    private int dp(float v) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, getResources().getDisplayMetrics());
    }

    private void header(String text) {
        TextView t = new TextView(this);
        t.setText(text);
        t.setTextColor(accent);
        t.setTextSize(14);
        t.setTypeface(Typeface.DEFAULT_BOLD);
        t.setPadding(0, dp(24), 0, dp(8));
        list.addView(t);
    }

    private void note(String text) {
        TextView t = new TextView(this);
        t.setText(text);
        t.setTextColor(muted);
        t.setTextSize(13);
        t.setPadding(0, dp(4), 0, dp(4));
        list.addView(t);
    }

    private LinearLayout row(String title, String summary) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(10), 0, dp(10));
        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView t = new TextView(this);
        t.setText(title);
        t.setTextColor(fg);
        t.setTextSize(16);
        texts.addView(t);
        if (summary != null) {
            TextView s = new TextView(this);
            s.setText(summary);
            s.setTextColor(muted);
            s.setTextSize(13);
            texts.addView(s);
        }
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TypedValue ripple = new TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true);
        row.setBackgroundResource(ripple.resourceId);
        list.addView(row);
        return row;
    }

    private void toggle(String title, String summary, String key) {
        toggle(title, summary, key, null);
    }

    /** @param changed run after the switch changes (e.g. rebuild rows that depend on it) */
    private void toggle(String title, String summary, String key, Runnable changed) {
        LinearLayout row = row(title, summary);
        Switch s = new Switch(this);
        s.setChecked(NoGoogleSettings.bool(key));
        s.setOnCheckedChangeListener((b, checked) -> {
            NoGoogleSettings.put(key, checked);
            if (changed != null) list.post(changed);
        });
        row.addView(s);
        row.setOnClickListener(v -> s.toggle());
    }

    private void choice(String title, String key, String[] values, String[] labels) {
        String current = NoGoogleSettings.str(key);
        int idx = 0;
        for (int i = 0; i < values.length; i++) if (values[i].equals(current)) idx = i;
        int selected = idx;
        LinearLayout row = row(title, labels[idx]);
        row.setOnClickListener(v -> new AlertDialog.Builder(this)
                .setTitle(title)
                .setSingleChoiceItems(labels, selected, (d, which) -> {
                    NoGoogleSettings.put(key, values[which]);
                    if (key.startsWith("voice_")) VoiceController.releaseModels();
                    d.dismiss();
                    build();
                })
                .show());
    }

    /** A text setting (API key): shows whether it is set, edits it in a dialog. */
    private void text(String title, String hint, String key) {
        String value = NoGoogleSettings.str(key);
        LinearLayout row = row(title, value.isEmpty() ? hint
                : "Set (" + value.substring(0, Math.min(4, value.length())) + "…)");
        row.setOnClickListener(v -> {
            EditText input = new EditText(this);
            input.setSingleLine(true);
            input.setText(value);
            input.setHint(hint);
            new AlertDialog.Builder(this)
                    .setTitle(title)
                    .setView(input)
                    .setPositiveButton("Save", (d, which) -> {
                        NoGoogleSettings.put(key, input.getText().toString().trim());
                        build();
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        });
    }

    private void buildModels() {
        header("Models");
        note("Downloads go through the network helper app, which for this only reaches Hugging Face and "
                + "Mozilla's Firefox Translations servers; every file is checked against its published "
                + "checksum. Tap to download or stop, long-press to delete.");
        for (ModelDownloads.Item item : ModelDownloads.ITEMS) modelRow(item);
        languagesRow();
        File models = NoGoogleSettings.modelsDir();
        note("Folder: " + (models == null ? "?" : models.getAbsolutePath())
                + "\n  whisper/: Whisper .bin files (ggml; \"acft\" models are fastest)"
                + "\n  llm/: Hy-MT translation model (.gguf)"
                + "\n  translate/<src>-<tgt>/: Firefox model, vocab, lex files"
                + "\nModels can also be copied here (Termux/root/USB) or imported from a folder.");
        action("Import models from a folder…", "Pick a folder containing whisper/, llm/ and/or translate/",
                v -> startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE), REQ_IMPORT));
        action("Unload models", "Frees memory until the next voice input or translation "
                        + "(also happens after 3 idle minutes)",
                v -> {
                    VoiceController.releaseModels();
                    LocalTranslate.releaseModels();
                    Toast.makeText(this, "Unloaded", Toast.LENGTH_SHORT).show();
                });
    }

    private void buildGif() {
        header("GIFs & stickers");
        int helper = HelperApk.state(this);
        note((helper == HelperApk.READY ? "Network helper app: installed."
                : helper == HelperApk.MISSING ? "Network helper app: NOT installed, so GIFs can't load."
                : "Network helper app: installed some other way, and it doesn't serve this keyboard, so GIFs "
                        + "can't load. Reinstalling it from here fixes that.")
                + " Gboard itself still has no internet: GIF searches and pictures go through that separate "
                + "app, which can only reach the GIF sites below (and the model downloads further down). The site you search sees your search words "
                + "and your IP address, nothing else you type. Each enabled source is a chip in the GIF tab; "
                + "tap one to search there.");
        if (helper != HelperApk.READY) {
            action(helper == HelperApk.MISSING ? "Install the network helper app" : "Reinstall the network helper app",
                    "It comes with this keyboard", v -> HelperApk.install(this));
        }
        for (GifBridge.Source source : GifBridge.SOURCES) {
            String key = NoGoogleSettings.GIF_SOURCE_PREFIX + source.id;
            toggle(source.label, source.about, key, () -> {
                GifBridge.sourcesChanged();
                build();
            });
            if (source.keySetting != null && NoGoogleSettings.bool(key)) {
                text("    " + source.label + " API key", "Paste the key here", source.keySetting);
            }
        }
        toggle("Hide sticker tab", "Sticker search needs internet", NoGoogleSettings.HIDE_STICKER_TAB);
    }

    /** Features ported from jasonwu1994/Gboard-patches that were selected when patching. */
    private void buildGboardPatches() {
        note("Ported from jasonwu1994's Gboard-patches (github.com/jasonwu1994/Gboard-patches, GPLv3). "
                + "Gboard reads these settings when it starts: restart it after changing them.");
        restartAction();
        if (!PortedFeatures.anyIncluded()) note("None of them were selected when this Gboard was patched.");
        for (PortedFeatures.Feature f : PortedFeatures.ALL) {
            if (!PortedFeatures.included(f)) continue;
            switch (f.kind) {
                case PortedFeatures.SWITCH:
                    toggle(f.name, f.description, f.setting());
                    break;
                case PortedFeatures.MENU_STYLE:
                    toggle(f.name + ": new design", "Off: the legacy menu. " + f.description, f.setting());
                    break;
                case PortedFeatures.TOOLBAR_COUNT:
                    toggle(f.name, f.description, f.setting(), this::build);
                    if (PortedFeatures.on(f)) {
                        number("    Items on the toolbar", PortedFeatures.TOOLBAR_MIN + " to " + PortedFeatures.TOOLBAR_MAX,
                                "gp_toolbar_count_value", PortedFeatures.toolbarCount(),
                                PortedFeatures.TOOLBAR_MIN, PortedFeatures.TOOLBAR_MAX);
                    }
                    break;
                case PortedFeatures.CLIPBOARD_LIMIT:
                    number(f.name, f.description, "gp_clipboard_limit_value", PortedFeatures.clipboardLimit(),
                            1, Integer.MAX_VALUE);
                    break;
            }
        }
    }

    private void restartAction() {
        action("Restart Gboard now", "Closes this screen; the keyboard restarts by itself", v -> {
            if (ModelDownloads.anyBusy()) {
                Toast.makeText(this, "A model download is running: restart when it is done", Toast.LENGTH_LONG).show();
                return;
            }
            android.os.Process.killProcess(android.os.Process.myPid());
        });
    }

    /** A whole-number setting edited in a dialog; values outside [min, max] are refused. */
    private void number(String title, String summary, String key, int current, int min, int max) {
        LinearLayout row = row(title, current + "  (" + summary + ")");
        row.setOnClickListener(v -> {
            EditText input = new EditText(this);
            input.setInputType(InputType.TYPE_CLASS_NUMBER);
            input.setText(String.valueOf(current));
            new AlertDialog.Builder(this)
                    .setTitle(title.trim())
                    .setView(input)
                    .setPositiveButton("Save", (d, which) -> {
                        try {
                            int n = Integer.parseInt(input.getText().toString().trim());
                            if (n < min || n > max) throw new NumberFormatException();
                            NoGoogleSettings.put(key, String.valueOf(n));
                        } catch (NumberFormatException e) {
                            Toast.makeText(this, "Enter a number from " + min + " to " + max, Toast.LENGTH_LONG).show();
                        }
                        build();
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        });
    }

    private void modelRow(ModelDownloads.Item item) {
        String state = ModelDownloads.state(item.id);
        boolean busy = ModelDownloads.busy(item.id);
        boolean have = item.installed();
        String summary;
        if (busy) summary = state + " (tap to stop)";
        else if (state != null) summary = state + " (tap to retry)";
        else if (have) summary = "Installed (" + ModelDownloads.mb(item.target().length()) + ")";
        else summary = "Not installed. Tap to download " + ModelDownloads.mb(item.downloadBytes)
                + (item.installedBytes != item.downloadBytes ? " (" + ModelDownloads.mb(item.installedBytes) + " after converting)" : "");
        LinearLayout row = row(item.label, summary);
        row.setOnClickListener(v -> {
            if (ModelDownloads.busy(item.id)) ModelDownloads.stop(item.id);
            else if (!item.installed()) ModelDownloads.download(item);
            build();
        });
        if (have) row.setOnLongClickListener(v -> {
            new AlertDialog.Builder(this)
                    .setTitle("Delete " + item.label + "?")
                    .setMessage("It can be downloaded again here.")
                    .setPositiveButton("Delete", (d, w) -> {
                        VoiceController.releaseModels();
                        LocalTranslate.releaseModels();
                        ModelDownloads.delete(item);
                        build();
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
            return true;
        });
    }

    /** Firefox Translations languages (to and from English): pick which ones to keep. */
    private void languagesRow() {
        String busy = ModelDownloads.languageState();
        int pairs = LocalTranslate.installedPairs();
        LinearLayout row = row("Translation: Firefox Translations languages",
                busy != null ? busy : pairs + " language pairs installed. Tap to choose");
        row.setOnClickListener(v -> {
            Toast.makeText(this, "Loading Mozilla's language list…", Toast.LENGTH_SHORT).show();
            Handler main = new Handler(Looper.getMainLooper());
            new Thread(() -> {
                try {
                    List<ModelDownloads.Language> langs = ModelDownloads.languages();
                    main.post(() -> chooseLanguages(langs));
                } catch (Throwable t) {
                    main.post(() -> Toast.makeText(this, "Could not load the list: " + t.getMessage(),
                            Toast.LENGTH_LONG).show());
                }
            }, "nogoogle-languages").start();
        });
    }

    private void chooseLanguages(List<ModelDownloads.Language> langs) {
        if (isFinishing()) return;
        String[] labels = new String[langs.size()];
        boolean[] checked = new boolean[langs.size()];
        for (int i = 0; i < langs.size(); i++) {
            ModelDownloads.Language l = langs.get(i);
            labels[i] = l.name() + "  (" + ModelDownloads.mb(l.bytes()) + ")";
            checked[i] = l.installed();
        }
        boolean[] before = checked.clone();
        new AlertDialog.Builder(this)
                .setTitle("Firefox Translations languages")
                .setMultiChoiceItems(labels, checked, (d, which, on) -> checked[which] = on)
                .setPositiveButton("Apply", (d, w) -> {
                    for (int i = 0; i < langs.size(); i++) {
                        if (checked[i] && !before[i]) ModelDownloads.download(langs.get(i));
                        if (!checked[i] && before[i]) {
                            LocalTranslate.releaseModels();
                            ModelDownloads.delete(langs.get(i));
                        }
                    }
                    build();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void action(String title, String summary, View.OnClickListener click) {
        LinearLayout row = row(title, summary);
        if (click != null) row.setOnClickListener(click);
    }

    private void requestMic() {
        requestPermissions(new String[]{Manifest.permission.RECORD_AUDIO}, REQ_MIC);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        build();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != REQ_IMPORT || resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri tree = data.getData();
        Toast.makeText(this, "Importing models…", Toast.LENGTH_SHORT).show();
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            int[] count = {0};
            String error = null;
            try {
                String root = DocumentsContract.getTreeDocumentId(tree);
                copyTree(tree, root, NoGoogleSettings.modelsDir(), count, true);
            } catch (Throwable t) {
                error = t.getMessage();
            }
            String msg = error == null ? "Imported " + count[0] + " files" : "Import failed: " + error;
            main.post(() -> {
                Toast.makeText(this, msg, Toast.LENGTH_LONG).show();
                build();
            });
        }, "nogoogle-import").start();
    }

    /** Copies whisper/, llm/ and translate/ (or loose .bin files) from a SAF tree into the models dir. */
    private void copyTree(Uri tree, String docId, File dest, int[] count, boolean top) throws Exception {
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, docId);
        try (Cursor c = getContentResolver().query(children, new String[]{
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE}, null, null, null)) {
            if (c == null) return;
            while (c.moveToNext()) {
                String id = c.getString(0);
                String name = c.getString(1);
                boolean dir = DocumentsContract.Document.MIME_TYPE_DIR.equals(c.getString(2));
                if (dir) {
                    if (top && !name.equals("whisper") && !name.equals("translate") && !name.equals("llm")) continue;
                    File sub = new File(dest, name);
                    //noinspection ResultOfMethodCallIgnored
                    sub.mkdirs();
                    copyTree(tree, id, sub, count, false);
                } else {
                    File target = top && name.toLowerCase(Locale.ROOT).endsWith(".bin")
                            ? new File(Models.whisperDir(), name) : new File(dest, name);
                    if (top && !name.toLowerCase(Locale.ROOT).endsWith(".bin")) continue;
                    Uri doc = DocumentsContract.buildDocumentUriUsingTree(tree, id);
                    try (InputStream in = getContentResolver().openInputStream(doc);
                         OutputStream out = new FileOutputStream(target)) {
                        byte[] buf = new byte[1 << 16];
                        int n;
                        while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
                    }
                    count[0]++;
                }
            }
        }
    }
}
