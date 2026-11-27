package dev.abotmaker.ramblerenhancements;

import android.Manifest;
import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLayoutPair;
import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix;
import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Unified standalone DayNight settings activity launched from Gboard Settings
 * (Voice typing -> Rambler voice typing or Voice typing -> Rambler Enhancements).
 *
 * <p>When opened without {@link #EXTRA_SECTION}, renders a compact 7-category Dashboard Hub
 * with live at-a-glance status badges that drills into focused subpages (zero duplication).
 * When opened with {@link #EXTRA_SECTION}, renders only that focused subpage.</p>
 */
public final class RamblerEnhancementsActivity extends Activity {
    private static final String TAG = "RamblerEnhancements";
    private static final int REQ_IMPORT_WORDS = 4101;
    private static final int REQ_EXPORT_WORDS = 4102;
    private static final int REQ_CONTACTS_PERMISSION = 4103;
    private static final int REQ_EXPORT_BACKUP = 4104;
    private static final int REQ_IMPORT_BACKUP = 4105;
    private static final int PREVIEW_WORD_LIMIT = 8;
    private static final String EXPORT_FILE_NAME = "rambler-voice-dictionary.txt";

    private static final String[] LISTENING_VALUES = {
            RamblerWaveformSettings.LISTENING_HEX_DOT_SCOPE,
            RamblerWaveformSettings.LISTENING_HEX_ANDROID_WAVE,
            RamblerWaveformSettings.LISTENING_STOCK
    };
    private static final String[] LISTENING_LABELS = {
            "Hex Dot Scope",
            "Hex Android Wave",
            "Gboard Default"
    };
    private static final String[] LISTENING_DESCS = {
            "Braided dual-trace dot oscilloscope with phosphor trails (Hex macOS/iOS).",
            "7-row scrolling dot sine wave driven by live speech level (Hex Android).",
            "Disable Hex animations and use Gboard's stock Rambler light bar."
    };

    private static final String[] PROCESSING_VALUES = {
            RamblerWaveformSettings.PROCESSING_FLOW,
            RamblerWaveformSettings.PROCESSING_PULSE,
            RamblerWaveformSettings.PROCESSING_SWEEP
    };
    private static final String[] PROCESSING_LABELS = {
            "Flow",
            "Pulse",
            "Sweep"
    };
    private static final String[] PROCESSING_DESCS = {
            "Braid keeps turning while light flows left to right.",
            "Light rings pulse outward from the center.",
            "Braid flattens into a line and a light beam sweeps back and forth."
    };

    private static final String[] COLOR_VALUES = {
            RamblerWaveformSettings.COLOR_HEX_DEFAULT,
            RamblerWaveformSettings.COLOR_THEME_AUTO,
            RamblerWaveformSettings.PRESET_PEARL,
            RamblerWaveformSettings.PRESET_AGENT_BLUE,
            RamblerWaveformSettings.PRESET_CORAL,
            RamblerWaveformSettings.PRESET_EMERALD,
            RamblerWaveformSettings.PRESET_VIOLET,
            RamblerWaveformSettings.PRESET_AMBER,
            RamblerWaveformSettings.PRESET_CYAN,
            RamblerWaveformSettings.PRESET_WHITE,
            RamblerWaveformSettings.COLOR_SELECTION_CUSTOM
    };
    private static final String[] LISTENING_COLOR_LABELS = {
            "Hex Pearl", "Theme accent", "Pearl", "Agent Blue", "Coral",
            "Emerald", "Violet", "Amber", "Cyan", "White", "Custom"
    };
    private static final String[] PROCESSING_COLOR_LABELS = {
            "Hex Blue", "Theme accent", "Pearl", "Agent Blue", "Coral",
            "Emerald", "Violet", "Amber", "Cyan", "White", "Custom"
    };

    public static final String EXTRA_SECTION = "section";
    public static final String SECTION_BANGLA = "bangla";
    public static final String SECTION_WAVEFORM = "waveform";
    public static final String SECTION_CUSTOM_INSTRUCTIONS = "custom_instructions";
    public static final String SECTION_BEHAVIOR = "behavior";
    public static final String SECTION_PRODUCTIVITY = "productivity";
    public static final String SECTION_DICTIONARY = "dictionary";
    public static final String SECTION_CONTACTS = "contacts";
    public static final String SECTION_HISTORY = "history";
    public static final String SECTION_HISTORY_LIST = "history_list";
    public static final String SECTION_BACKUP = "backup";

    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private LinearLayout contentContainer;
    private HexDotScopeSimulation.Stage previewStage = HexDotScopeSimulation.Stage.RECORDING;
    private String pendingExportPayload;
    private String activeSection;
    private String historySearchQuery = "";
    private volatile List<RamblerCustomInstructionRules.AppEntry> installedAppsCache;
    private volatile Map<String, String> packageLabelCache;
    private volatile boolean loadingInstalledApps;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        RamblerFlagRuntime.seedAndRefreshIfNeeded(this);
        RamblerWaveformRuntime.seedApplicationContext(this);
        Intent launchIntent = getIntent();
        activeSection = normalizeSection(
                launchIntent == null ? null : launchIntent.getStringExtra(EXTRA_SECTION));
        setTitle(titleForSection(activeSection));
        ActionBar actionBar = getActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
        }

        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(this);
        ScrollView scroll = new ScrollView(this);
        scroll.setFitsSystemWindows(true);
        scroll.setBackgroundColor(pal.background);
        scroll.setFillViewport(true);

        contentContainer = new LinearLayout(this);
        contentContainer.setOrientation(LinearLayout.VERTICAL);
        contentContainer.setPadding(dp(16), dp(14), dp(16), dp(28));
        scroll.addView(contentContainer, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        setContentView(scroll);
        refreshUi();
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshUi();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item != null && item.getItemId() == android.R.id.home) {
            finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) {
            pendingExportPayload = null;
            return;
        }
        Uri uri = data.getData();
        if (requestCode == REQ_IMPORT_WORDS) {
            runAsync(() -> {
                String content = readTextFromUri(uri);
                LinkedHashSet<String> words = RamblerMuseStatsBridge.parseWordList(content);
                if (words.isEmpty()) {
                    toastOnMain("No valid words found to import.");
                    return;
                }
                boolean ok = RamblerMuseStatsBridge.addWords(this, words);
                mainHandler.post(() -> {
                    showToast(ok
                            ? "Added " + words.size() + " words to Rambler voice dictionary."
                            : "Rambler dictionary isn't ready yet. Dictate once and try again.");
                    refreshUi();
                });
            });
        } else if (requestCode == REQ_EXPORT_WORDS) {
            final String payload = pendingExportPayload;
            pendingExportPayload = null;
            if (payload == null) {
                return;
            }
            runAsync(() -> {
                boolean ok = writeTextToUri(uri, payload);
                toastOnMain(ok
                        ? "Exported Rambler voice dictionary."
                        : "Failed to write export file.");
            });
        } else if (requestCode == REQ_EXPORT_BACKUP) {
            final String payload = pendingExportPayload;
            pendingExportPayload = null;
            if (payload == null) {
                return;
            }
            runAsync(() -> {
                boolean ok = writeTextToUri(uri, payload);
                toastOnMain(ok
                        ? "Exported Rambler Enhancements backup (.json)."
                        : "Failed to write backup file.");
            });
        } else if (requestCode == REQ_IMPORT_BACKUP) {
            runAsync(() -> {
                String content = readTextFromUri(uri);
                RamblerBackupManager.ImportResult result =
                        RamblerBackupManager.importJson(this, content);
                mainHandler.post(() -> {
                    showToast(result.message);
                    refreshUi();
                });
            });
        }
    }

    @Override
    public void onRequestPermissionsResult(
            int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == REQ_CONTACTS_PERMISSION) {
            boolean granted = grantResults != null
                    && grantResults.length > 0
                    && grantResults[0] == PackageManager.PERMISSION_GRANTED;
            if (granted) {
                syncContactsNow();
            } else {
                showToast("Contacts permission not granted.");
                refreshUi();
            }
        }
    }

    static String normalizeSection(String section) {
        if (section == null || section.isEmpty()) {
            return null;
        }
        if (SECTION_CONTACTS.equals(section)) {
            return SECTION_DICTIONARY;
        }
        if (SECTION_BANGLA.equals(section)
                || SECTION_WAVEFORM.equals(section)
                || SECTION_CUSTOM_INSTRUCTIONS.equals(section)
                || SECTION_BEHAVIOR.equals(section)
                || SECTION_PRODUCTIVITY.equals(section)
                || SECTION_DICTIONARY.equals(section)
                || SECTION_HISTORY.equals(section)
                || SECTION_HISTORY_LIST.equals(section)
                || SECTION_BACKUP.equals(section)) {
            return section;
        }
        return null;
    }

    static String titleForSection(String section) {
        String normalized = normalizeSection(section);
        if (SECTION_BANGLA.equals(normalized)) {
            return "Rambler Bangla (phonetic & script)";
        }
        if (SECTION_WAVEFORM.equals(normalized)) {
            return "Waveform animation (Hex)";
        }
        if (SECTION_CUSTOM_INSTRUCTIONS.equals(normalized)) {
            return "Instructions & app rules";
        }
        if (SECTION_BEHAVIOR.equals(normalized)) {
            return "Dictation & reliability";
        }
        if (SECTION_PRODUCTIVITY.equals(normalized)) {
            return "Voice actions, snippets & replace";
        }
        if (SECTION_DICTIONARY.equals(normalized)) {
            return "Voice dictionary & contacts";
        }
        if (SECTION_HISTORY.equals(normalized)) {
            return "Dictation stats & history";
        }
        if (SECTION_HISTORY_LIST.equals(normalized)) {
            return "Dictation history";
        }
        if (SECTION_BACKUP.equals(normalized)) {
            return "Backup & restore";
        }
        return "Rambler Enhancements";
    }

    private void openSection(String section) {
        Intent intent = new Intent(this, RamblerEnhancementsActivity.class);
        intent.putExtra(EXTRA_SECTION, section);
        startActivity(intent);
    }

    private void refreshUi() {
        if (contentContainer == null) {
            return;
        }
        contentContainer.removeAllViews();

        if (activeSection == null) {
            buildHubScreen();
        } else if (SECTION_BANGLA.equals(activeSection)
                && (RamblerDynamicConfig.FEATURE_BANGLA_LITE_SCRIPT
                || RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC)) {
            buildBanglaSection();
        } else if (SECTION_WAVEFORM.equals(activeSection) && RamblerDynamicConfig.FEATURE_WAVEFORM) {
            buildWaveformSection();
        } else if (SECTION_CUSTOM_INSTRUCTIONS.equals(activeSection)
                && RamblerDynamicConfig.FEATURE_CUSTOM_INSTRUCTIONS) {
            buildCustomInstructionsSection();
        } else if (SECTION_BEHAVIOR.equals(activeSection)
                && (RamblerDynamicConfig.FEATURE_CURSOR_EDITING
                || RamblerDynamicConfig.FEATURE_APP_CONTEXT
                || RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS)) {
            buildDictationBehaviorSection();
        } else if (SECTION_PRODUCTIVITY.equals(activeSection)
                && RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            buildProductivitySection();
        } else if (SECTION_DICTIONARY.equals(activeSection)
                && (RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY
                || RamblerDynamicConfig.FEATURE_CONTACT_NAMES)) {
            buildDictionaryAndContactsSection();
        } else if (SECTION_HISTORY.equals(activeSection)
                && RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            buildHistorySection();
        } else if (SECTION_HISTORY_LIST.equals(activeSection)
                && RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            buildHistoryListSection();
        } else if (SECTION_BACKUP.equals(activeSection)) {
            buildBackupSection();
        } else {
            buildHubScreen();
        }
    }

    private void buildHubScreen() {
        if (RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            LinearLayout statsCard = RamblerStatsCardView.buildCard(
                    this, true, () -> openSection(SECTION_HISTORY), this::refreshUi);
            LinearLayout.LayoutParams statsParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            statsParams.bottomMargin = dp(10);
            contentContainer.addView(statsCard, statsParams);
        }

        if (RamblerDynamicConfig.FEATURE_BANGLA_LITE_SCRIPT
                || RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC) {
            boolean enabled = GboardRamblerScriptFixSettings.isEnabled(this);
            int converted = GboardRamblerScriptFixSettings.getConvertedCount(this);
            String badge = enabled ? "ON" : "OFF";
            String summary = (RamblerDynamicConfig.FEATURE_BANGLA_LITE_SCRIPT ? "Lite policy" : "")
                    + (RamblerDynamicConfig.FEATURE_BANGLA_LITE_SCRIPT
                    && RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC ? " · " : "")
                    + (RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC ? "Phonetic & loanwords" : "")
                    + (converted > 0 ? (" · " + converted + " converted") : "");
            addRow("Rambler Bangla (phonetic & script)", summary, badge, true,
                    () -> openSection(SECTION_BANGLA));
        }

        if (RamblerDynamicConfig.FEATURE_WAVEFORM) {
            SharedPreferences prefs = RamblerWaveformSettings.preferencesOrNull(this);
            RamblerWaveformSettings.SettingsSnapshot snap =
                    RamblerWaveformSettings.snapshotFromPreferences(prefs);
            boolean hexOn = !snap.isStock();
            String badge = displayListening(snap.getListeningStyle());
            String summary = hexOn
                    ? "Listening: " + displayColor(snap.getListeningColorValue(), false)
                    + " · Processing: " + displayProcessing(snap.getProcessingStyle())
                    + " (" + displayColor(snap.getProcessingColorValue(), true) + ")"
                    : "Using Gboard's stock Rambler light bar.";
            addRow("Waveform animation (Hex)", summary, badge, true,
                    () -> openSection(SECTION_WAVEFORM));
        }

        if (RamblerDynamicConfig.FEATURE_CUSTOM_INSTRUCTIONS) {
            String defInstr = RamblerMuseStatsBridge.readCustomInstruction(this).trim();
            List<RamblerCustomInstructionRules.Rule> rules =
                    RamblerCustomInstructionRules.readRules(this);
            java.util.Set<String> disabled =
                    RamblerCustomInstructionRules.readDisabledApps(this);
            String badge = !rules.isEmpty()
                    ? (rules.size() + (rules.size() == 1 ? " rule" : " rules"))
                    : (defInstr.isEmpty() ? "Empty" : "Default");
            String summary = (defInstr.isEmpty() ? "Default empty" : "Default set")
                    + " · " + rules.size() + (rules.size() == 1 ? " app rule" : " app rules")
                    + (disabled.isEmpty() ? "" : (" · " + disabled.size() + " disabled"));
            addRow("Instructions & app rules", summary, badge, true,
                    () -> openSection(SECTION_CUSTOM_INSTRUCTIONS));
        }

        if (RamblerDynamicConfig.FEATURE_CURSOR_EDITING
                || RamblerDynamicConfig.FEATURE_APP_CONTEXT
                || RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            List<String> parts = new ArrayList<String>();
            if (RamblerDynamicConfig.FEATURE_CURSOR_EDITING) {
                parts.add("Append-only "
                        + (RamblerEnhancementsSettings.readAppendOnly(this) ? "ON" : "OFF"));
                parts.add("Cursor "
                        + (RamblerEnhancementsSettings.readCursorEditingEnabled(this) ? "ON" : "OFF"));
            }
            if (RamblerDynamicConfig.FEATURE_APP_CONTEXT) {
                parts.add("App context "
                        + (RamblerEnhancementsSettings.readAppContextEnabled(this) ? "ON" : "OFF"));
            }
            if (RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
                parts.add("Strip period "
                        + (RamblerEnhancementsSettings.readStripTrailingPeriod(this) ? "ON" : "OFF"));
                parts.add("Retry "
                        + (RamblerEnhancementsSettings.readAutoParallelRetryEnabled(this) ? "ON" : "OFF"));
            }
            int maxSec = RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS
                    ? RamblerEnhancementsSettings.readMaxSessionSeconds(this)
                    : 0;
            String badge = RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS
                    ? RamblerTextPipeline.formatDurationBadge(maxSec)
                    : "Configure";
            addRow("Dictation & reliability", joinMiddleDot(parts), badge, true,
                    () -> openSection(SECTION_BEHAVIOR));
        }

        if (RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            boolean sendOn = RamblerEnhancementsSettings.readVoiceSendEnabled(this);
            boolean searchOn = RamblerEnhancementsSettings.readVoiceSearchEnabled(this);
            boolean autoSearchOn = RamblerEnhancementsSettings.readAutoSearchOnCommitEnabled(this);
            int autoSearchAppCount = RamblerEnhancementsSettings.readAutoSearchApps(this).size();
            boolean autoSearchActive = autoSearchOn && autoSearchAppCount > 0;
            int snippetCount = RamblerTextPipeline.readSnippets(this).size();
            int replaceCount = RamblerTextPipeline.readReplaceRules(this).size();
            String badge;
            if (autoSearchActive && sendOn) {
                badge = "Auto-search · Send";
            } else if (autoSearchActive) {
                badge = "Auto-search (" + autoSearchAppCount + ")";
            } else if (sendOn && searchOn) {
                badge = "Send · Search";
            } else if (sendOn) {
                badge = "Send ON";
            } else if (searchOn) {
                badge = "Search ON";
            } else if (snippetCount + replaceCount > 0) {
                int total = snippetCount + replaceCount;
                badge = total + (total == 1 ? " rule" : " rules");
            } else {
                badge = "Off";
            }
            String autoSearchPart = autoSearchOn
                    ? ("Auto-search " + autoSearchAppCount + (autoSearchAppCount == 1 ? " app" : " apps"))
                    : "Auto-search OFF";
            String summary = autoSearchPart
                    + " · Send " + (sendOn ? "ON" : "OFF")
                    + " · " + snippetCount + (snippetCount == 1 ? " snippet" : " snippets")
                    + " · " + replaceCount + " replace";
            addRow("Voice actions, snippets & replace", summary, badge, true,
                    () -> openSection(SECTION_PRODUCTIVITY));
        }

        if (RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY
                || RamblerDynamicConfig.FEATURE_CONTACT_NAMES) {
            List<String> parts = new ArrayList<String>();
            String badge = "Manage";
            if (RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY) {
                boolean useDict = RamblerEnhancementsSettings.readUseDictionaryWords(this);
                List<String> words = RamblerMuseStatsBridge.readWords(this);
                parts.add("Dictionary " + (useDict ? "ON" : "OFF"));
                if (words == null) {
                    parts.add("Store pending");
                } else {
                    parts.add(words.size() + (words.size() == 1 ? " word" : " words"));
                    badge = words.size() + (words.size() == 1 ? " word" : " words");
                }
            }
            if (RamblerDynamicConfig.FEATURE_CONTACT_NAMES) {
                int seeded = RamblerContactsRuntime.readSeededCount(this);
                parts.add(seeded + " contacts synced");
                if (!RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY) {
                    badge = seeded + " synced";
                }
            }
            addRow("Voice dictionary & contacts", joinMiddleDot(parts), badge, true,
                    () -> openSection(SECTION_DICTIONARY));
        }

        if (RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            boolean histOn = RamblerEnhancementsSettings.readHistoryEnabled(this);
            int count = RamblerTextPipeline.readHistory(this).size();
            String summary = (histOn ? "History ON" : "History OFF")
                    + " · On-device WPM, latency & time-saved stats plus your last "
                    + RamblerTextPipeline.MAX_HISTORY_ENTRIES + " dictations.";
            addRow("Dictation stats & history", summary, count + " saved", true,
                    () -> openSection(SECTION_HISTORY));
        }

        addRow(
                "Backup & restore (.json)",
                "Export or import all settings, per-app rules, snippets, replace rules, and dictionary words.",
                "JSON",
                true,
                () -> openSection(SECTION_BACKUP));

        // In-app footer (upstream credits live in GitHub repository docs)
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(this);
        TextView creditView = new TextView(this);
        creditView.setText("Rambler Bangla v31.2.0 — by muhib-karim (GPLv3)");
        creditView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        creditView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams creditParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        creditParams.topMargin = dp(10);
        contentContainer.addView(creditView, creditParams);
    }

    private void buildBanglaSection() {
        addSectionHeader("Bengali script & voice engine");
        boolean enabled = GboardRamblerScriptFixSettings.isEnabled(this);
        addToggleRow(
                "Bangla script correction",
                "Keep Bangla dictation in Bengali Unicode (bn-BD, bn-IN, bn-Beng), apply one-language-per-sentence multilingual routing and CMUdict loanword spellings, while preserving #hashtags, @handles, URLs, and emails.",
                enabled,
                checked -> {
                    GboardRamblerScriptFixSettings.setEnabled(this, checked);
                    refreshUi();
                });

        boolean pairOn = GboardRamblerLayoutPair.isToggleOn(this);
        addToggleRow(
                "Treat EN + bn-Latn pair as multilingual",
                "When Bangla (Latin) is enabled alongside English, run multilingual sentence detection on the English layout as well.",
                pairOn,
                checked -> {
                    GboardRamblerLayoutPair.setToggleOn(this, checked);
                    refreshUi();
                });

        addSectionHeader("Diagnostics & status");
        boolean diagArmed = GboardRamblerScriptFixSettings.isDiagArmed(this);
        addToggleRow(
                "Rambler Bangla diagnostics",
                "Opt-in troubleshooting log (off by default). Turn on, reproduce an issue, then turn off to save RamblerBangla-diag-<timestamp>.txt to Downloads.",
                diagArmed,
                checked -> {
                    GboardRamblerScriptFixSettings.setDiagArmed(this, checked);
                    GboardRamblerScriptFix.onDiagToggled(checked);
                    refreshUi();
                });

        int converted = GboardRamblerScriptFixSettings.getConvertedCount(this);
        String activeLayers = (RamblerDynamicConfig.FEATURE_BANGLA_LITE_SCRIPT
                ? "Lite prompt policy: ACTIVE\n" : "Lite prompt policy: not patched\n")
                + (RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC
                ? "Phonetic + Loanword + SentenceLang engine: ACTIVE\n" : "Phonetic engine: not patched\n")
                + "Converted voice commits: " + converted;
        addRow("Active Bangla layers", activeLayers, enabled ? "Active" : "Paused", false, null);

        if (RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS) {
            addSectionHeader("@Mention & email strip (SwiftKey-style)");
            boolean atOn = RamblerAtMentionStore.isEnabled(this);
            java.util.List<RamblerAtMentionStore.Entry> learnedEntries =
                    RamblerAtMentionStore.readEntries(this);
            int learnedCount = learnedEntries.size();
            addToggleRow(
                    "@Mention & email strip suggestions",
                    "Shows YOUR learned @handles (@grok, @claude) on the suggestion strip when typing @, and learned email domains when typing name@. Learns automatically on space, Send/Enter, keyboard close, and voice dictation. Long-press any chip to forget. Always off in password/incognito fields.",
                    atOn,
                    checked -> {
                        RamblerAtMentionStore.setEnabled(this, checked);
                        RamblerFlagRuntime.refreshLiveFlags();
                        refreshUi();
                    });
            addRow(
                    "Add custom @mentions or domains",
                    "Seed your favorite @handles or email domains right away (e.g. @grok @claude @gmail.com) so they appear immediately after @.",
                    "Add",
                    true,
                    () -> showTextInputDialog(
                            "Add @mentions",
                            "@grok @claude @chatgpt @gmail.com",
                            "",
                            raw -> {
                                int added = RamblerAtMentionStore.recordTokensFromText(this, raw);
                                showToast(added > 0
                                        ? ("Saved " + added + " @mention" + (added == 1 ? "" : "s"))
                                        : "Include @ before each handle (e.g. @grok @claude)");
                                refreshUi();
                            }));
            StringBuilder preview = new StringBuilder();
            for (int i = 0; i < Math.min(learnedEntries.size(), 6); i++) {
                if (i > 0) {
                    preview.append(", ");
                }
                preview.append(learnedEntries.get(i).token);
            }
            if (learnedEntries.size() > 6) {
                preview.append(", …");
            }
            addRow(
                    "Learned @mentions & domains",
                    learnedCount == 0
                            ? "Nothing learned yet. Type any @handle (e.g. @grok) or tap Add above — standalone @ never shows fixed canned suggestions."
                            : (preview + " — tap to clear all learned @mentions."),
                    learnedCount + " saved",
                    learnedCount > 0,
                    () -> {
                        RamblerAtMentionStore.clearAll(this);
                        showToast("Cleared learned @mentions.");
                        refreshUi();
                    });
        }

        if (RamblerDynamicConfig.FEATURE_HIDDEN_FLAGS || RamblerDynamicConfig.FEATURE_RAMBLER_EXTRAS) {
            addSectionHeader("Rambler extras & hidden flags (live override)");
            for (RamblerHiddenFlagOverrideRuntime.Entry entry : RamblerHiddenFlagOverrideRuntime.entries()) {
                boolean on = RamblerHiddenFlagOverrideRuntime.isEnabled(
                        this, entry.flagName, entry.defaultEnabled);
                final String flagName = entry.flagName;
                addToggleRow(entry.title, entry.summary, on, checked -> {
                    RamblerHiddenFlagOverrideRuntime.setEnabled(this, flagName, checked);
                    RamblerFlagRuntime.refreshLiveFlags();
                    refreshUi();
                });
            }
        }
    }

    private void buildWaveformSection() {
        SharedPreferences prefs = RamblerWaveformSettings.preferencesOrNull(this);
        RamblerWaveformSettings.SettingsSnapshot snapshot =
                RamblerWaveformSettings.snapshotFromPreferences(prefs);
        boolean hexEnabled = !snapshot.isStock();
        if (!hexEnabled) {
            previewStage = HexDotScopeSimulation.Stage.RECORDING;
        }

        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(this);
        LinearLayout previewHeader = new LinearLayout(this);
        previewHeader.setOrientation(LinearLayout.HORIZONTAL);
        previewHeader.setGravity(Gravity.CENTER_VERTICAL);
        TextView previewLabel = new TextView(this);
        previewLabel.setText("Live preview");
        previewLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        previewLabel.setTextColor(pal.secondary);
        previewHeader.addView(previewLabel, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        if (hexEnabled) {
            TextView stageToggle = new TextView(this);
            stageToggle.setText(previewStage == HexDotScopeSimulation.Stage.RECORDING
                    ? "Listening (tap for Processing)"
                    : "Processing (tap for Listening)");
            stageToggle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            stageToggle.setTypeface(Typeface.DEFAULT_BOLD);
            stageToggle.setTextColor(pal.accent);
            stageToggle.setPadding(dp(8), dp(2), dp(4), dp(2));
            stageToggle.setClickable(true);
            stageToggle.setFocusable(true);
            stageToggle.setOnClickListener(v -> {
                previewStage = previewStage == HexDotScopeSimulation.Stage.RECORDING
                        ? HexDotScopeSimulation.Stage.PROCESSING
                        : HexDotScopeSimulation.Stage.RECORDING;
                refreshUi();
            });
            previewHeader.addView(stageToggle);
        }
        contentContainer.addView(previewHeader);

        RamblerWaveformPreviewView preview = new RamblerWaveformPreviewView(this);
        preview.setPreviewState(snapshot, previewStage);
        LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(60));
        previewParams.topMargin = dp(6);
        previewParams.bottomMargin = dp(12);
        contentContainer.addView(preview, previewParams);

        addRow(
                "Listening animation",
                "Plays while you speak. Choose Hex Dot Scope, Hex Android Wave, or Gboard Default.",
                displayListening(snapshot.getListeningStyle()),
                true,
                () -> RamblerWaveformDialogs.showAnimationChoiceDialog(
                        this,
                        "Listening animation",
                        "Shown while you speak. Tap an option to preview.",
                        LISTENING_LABELS,
                        LISTENING_DESCS,
                        LISTENING_VALUES,
                        snapshot.getListeningStyle(),
                        snapshot,
                        false,
                        selected -> {
                            RamblerWaveformSettings.writeListeningStyle(this, selected);
                            refreshUi();
                        }));

        addRow(
                "Processing animation",
                hexEnabled
                        ? "Plays after you stop speaking, while Rambler transcribes and formats."
                        : "Select a Hex listening animation above to customize.",
                hexEnabled ? displayProcessing(snapshot.getProcessingStyle()) : "Stock",
                hexEnabled,
                () -> RamblerWaveformDialogs.showAnimationChoiceDialog(
                        this,
                        "Processing animation",
                        "Shown briefly after you stop speaking while Rambler transcribes.",
                        PROCESSING_LABELS,
                        PROCESSING_DESCS,
                        PROCESSING_VALUES,
                        snapshot.getProcessingStyle(),
                        snapshot,
                        true,
                        selected -> {
                            RamblerWaveformSettings.writeProcessingStyle(this, selected);
                            refreshUi();
                        }));

        String listenSelection = RamblerWaveformSettings.readListeningColorSelection(prefs);
        String listenCustom = RamblerWaveformSettings.readListeningCustomColor(prefs);
        addRow(
                "Listening color",
                hexEnabled
                        ? "Waveform color shown while you speak."
                        : "Select a Hex listening animation above to customize.",
                hexEnabled ? displayColor(snapshot.getListeningColorValue(), false) : "Stock",
                hexEnabled,
                () -> openColorDialog(
                        "Listening waveform color",
                        snapshot.getListeningColorValue(),
                        listenSelection,
                        listenCustom,
                        snapshot,
                        false));

        String processSelection = RamblerWaveformSettings.readProcessingColorSelection(prefs);
        String processCustom = RamblerWaveformSettings.readProcessingCustomColor(prefs);
        addRow(
                "Processing color",
                hexEnabled
                        ? "Animation color shown while Rambler transcribes."
                        : "Select a Hex listening animation above to customize.",
                hexEnabled ? displayColor(snapshot.getProcessingColorValue(), true) : "Stock",
                hexEnabled,
                () -> openColorDialog(
                        "Processing waveform color",
                        snapshot.getProcessingColorValue(),
                        processSelection,
                        processCustom,
                        snapshot,
                        true));

        addRow(
                "Hex tuning",
                hexEnabled
                        ? "Glow style (Strip trace or iOS halo), dot spacing, glow strength, and voice response."
                        : "Select a Hex listening animation above to customize.",
                hexEnabled ? displayTuning(snapshot) : "Stock",
                hexEnabled,
                () -> RamblerWaveformDialogs.showTuningDialog(
                        this,
                        snapshot,
                        (glowLook, spacing, glow, response) -> {
                            RamblerWaveformSettings.writeTuning(
                                    this, glowLook, spacing, glow, response);
                            refreshUi();
                        }));
    }

    private void buildCustomInstructionsSection() {
        ensureInstalledAppsLoadedAsync();
        String current = RamblerMuseStatsBridge.readCustomInstruction(this).trim();
        List<RamblerCustomInstructionRules.Rule> rules =
                RamblerCustomInstructionRules.readRules(this);
        java.util.Set<String> disabledApps =
                RamblerCustomInstructionRules.readDisabledApps(this);
        Map<String, String> labels = packageLabelCache;

        addSectionHeader("Default prompt");
        addRow(
                "Default instruction",
                current.isEmpty()
                        ? "Empty — custom instructions only run in apps matched by a rule below."
                        : current,
                current.isEmpty() ? "Empty" : "Fallback",
                true,
                () -> showTextInputDialog(
                        "Default custom instruction",
                        "Applied in apps without a matching rule. Leave blank to only use app rules below.",
                        current,
                        value -> {
                            boolean ok = RamblerMuseStatsBridge.writeCustomInstruction(this, value);
                            showToast(ok
                                    ? (value.trim().isEmpty()
                                            ? "Default instruction cleared."
                                            : "Default instruction saved.")
                                    : "Could not save custom instructions.");
                            refreshUi();
                        }));

        if (!current.isEmpty() && rules.isEmpty()) {
            addRow(
                    "Use only in selected apps",
                    "Move your current Default instruction into an app rule and pick which apps should use it (clears Default).",
                    "Quick setup",
                    true,
                    () -> withInstalledApps((apps, map) -> RamblerAppRuleDialogs.showAppPickerDialog(
                            this,
                            "Choose apps for your custom instruction",
                            "Your current prompt will only be sent in these apps and cleared as Default.",
                            Collections.<String>emptyList(),
                            apps,
                            picked -> {
                                if (picked.isEmpty()) {
                                    showToast("No apps selected; Default instruction unchanged.");
                                    return;
                                }
                                RamblerCustomInstructionRules.Rule rule =
                                        new RamblerCustomInstructionRules.Rule(
                                                "rule_" + System.currentTimeMillis(),
                                                "Selected apps",
                                                current,
                                                picked,
                                                false);
                                RamblerCustomInstructionRules.upsertRule(this, rule);
                                RamblerMuseStatsBridge.writeCustomInstruction(this, "");
                                showToast("Applied custom instruction to " + picked.size() + " app(s).");
                                refreshUi();
                            })));
        }

        addSectionHeader("Per-app rules & behavior overrides");
        for (RamblerCustomInstructionRules.Rule rule : rules) {
            String appSummary = RamblerCustomInstructionRules.formatPackageList(
                    rule.packages, labels, 4);
            String promptPreview = rule.instruction.isEmpty()
                    ? "(Behavior overrides only)"
                    : (rule.instruction.length() > 96
                            ? rule.instruction.substring(0, 96) + "…"
                            : rule.instruction);
            String modeTag = rule.combineWithDefault ? " · +Default" : "";
            String overrideBadges = rule.formatBehaviorOverrideBadges();
            StringBuilder summaryBuilder = new StringBuilder(appSummary).append(modeTag);
            if (!overrideBadges.isEmpty()) {
                summaryBuilder.append('\n').append(overrideBadges);
            }
            summaryBuilder.append('\n').append(promptPreview);
            addRow(
                    rule.displayName(),
                    summaryBuilder.toString(),
                    rule.packages.size() + (rule.packages.size() == 1 ? " app" : " apps"),
                    true,
                    () -> withInstalledApps((apps, map) -> RamblerAppRuleDialogs.showRuleEditorDialog(
                            this,
                            rule,
                            null,
                            null,
                            apps,
                            map,
                            updated -> {
                                RamblerCustomInstructionRules.upsertRule(this, updated);
                                showToast("Saved \"" + updated.displayName() + "\".");
                                refreshUi();
                            },
                            () -> showConfirmDialog(
                                    "Delete \"" + rule.displayName() + "\"?",
                                    "Apps in this rule will fall back to your Default instruction.",
                                    () -> {
                                        RamblerCustomInstructionRules.deleteRule(this, rule.id);
                                        showToast("Deleted rule.");
                                        refreshUi();
                                    }))));
        }

        addRow(
                "+ Add app rule",
                "Create a named custom instruction and/or behavior overrides for one or more apps.",
                "Add",
                true,
                () -> withInstalledApps((apps, map) -> RamblerAppRuleDialogs.showRuleEditorDialog(
                        this,
                        null,
                        "",
                        "",
                        apps,
                        map,
                        created -> {
                            RamblerCustomInstructionRules.upsertRule(this, created);
                            showToast("Added \"" + created.displayName() + "\".");
                            refreshUi();
                        },
                        null)));

        addRow(
                "Disabled apps",
                disabledApps.isEmpty()
                        ? "Never send any custom instructions in chosen apps (overrides Default and all rules)."
                        : RamblerCustomInstructionRules.formatPackageList(disabledApps, labels, 5),
                disabledApps.isEmpty() ? "0 apps" : (disabledApps.size()
                        + (disabledApps.size() == 1 ? " app" : " apps")),
                true,
                () -> withInstalledApps((apps, map) -> RamblerAppRuleDialogs.showAppPickerDialog(
                        this,
                        "Disabled apps",
                        "Custom instructions will never be sent in these apps.",
                        disabledApps,
                        apps,
                        picked -> {
                            RamblerCustomInstructionRules.writeDisabledApps(this, picked);
                            showToast(picked.isEmpty()
                                    ? "Cleared disabled apps."
                                    : "Disabled custom instructions in " + picked.size() + " app(s).");
                            refreshUi();
                        })));
    }

    private void buildDictationBehaviorSection() {
        addSectionHeader("Dictation behavior");
        if (RamblerDynamicConfig.FEATURE_CURSOR_EDITING) {
            addToggleRow(
                    "Append-only dictation",
                    "Insert new speech purely at the cursor (with clean spacing) instead of rewriting earlier words. Selecting text still edits normally.",
                    RamblerEnhancementsSettings.readAppendOnly(this),
                    checked -> {
                        RamblerEnhancementsSettings.writeAppendOnly(this, checked);
                        refreshUi();
                    });
            addToggleRow(
                    "Cursor-aware editing",
                    "Send text after the cursor too and enable selected-text-only spoken edits.",
                    RamblerEnhancementsSettings.readCursorEditingEnabled(this),
                    checked -> {
                        RamblerEnhancementsSettings.writeCursorEditingEnabled(this, checked);
                        refreshUi();
                    });
            addToggleRow(
                    "Re-select after edit",
                    "Keep edited text highlighted for chained voice edits (off by default so follow-up dictations append cleanly).",
                    RamblerEnhancementsSettings.readReselectAfterEditEnabled(this),
                    checked -> {
                        RamblerEnhancementsSettings.writeReselectAfterEditEnabled(this, checked);
                        refreshUi();
                    });
        }
        if (RamblerDynamicConfig.FEATURE_APP_CONTEXT) {
            addToggleRow(
                    "App context",
                    "Share the active app name, input type, and field hint so Rambler adapts tone and formatting.",
                    RamblerEnhancementsSettings.readAppContextEnabled(this),
                    checked -> {
                        RamblerEnhancementsSettings.writeAppContextEnabled(this, checked);
                        refreshUi();
                    });
        }
        if (RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            addToggleRow(
                    "Strip trailing period",
                    "Remove the final period on casual dictations while keeping ellipses (…) and abbreviations (e.g., Dr.). Can also be overridden per app.",
                    RamblerEnhancementsSettings.readStripTrailingPeriod(this),
                    checked -> {
                        RamblerEnhancementsSettings.writeStripTrailingPeriod(this, checked);
                        refreshUi();
                    });

            addSectionHeader("Session & reliability");
            addToggleRow(
                    "Auto parallel retry (flaky networks)",
                    "Buffer PCM audio locally and silently retry dictation in parallel when Wi-Fi or 5G drops instead of failing.",
                    RamblerEnhancementsSettings.readAutoParallelRetryEnabled(this),
                    checked -> {
                        RamblerEnhancementsSettings.writeAutoParallelRetryEnabled(this, checked);
                        refreshUi();
                    });
            int maxSec = RamblerEnhancementsSettings.readMaxSessionSeconds(this);
            addRow(
                    "Max dictation duration",
                    "Override Rambler's session timeout so long voice dumps aren't cut off early ("
                            + RamblerTextPipeline.formatDurationLabel(maxSec) + ").",
                    RamblerTextPipeline.formatDurationBadge(maxSec),
                    true,
                    () -> RamblerProductivityDialogs.showSessionDurationDialog(
                            this,
                            maxSec,
                            chosen -> {
                                RamblerEnhancementsSettings.writeMaxSessionSeconds(this, chosen);
                                showToast("Max dictation duration: "
                                        + RamblerTextPipeline.formatDurationLabel(chosen));
                                refreshUi();
                            }));
        }

        addSectionHeader("Quick access");
        addToggleRow(
                "Toolbar quick-access button",
                "Adds a draggable \"Rambler\" button in Gboard's 4-dots toolbar menu so you can pin it to the top bar for 1-tap access.",
                RamblerEnhancementsSettings.readToolbarButtonEnabled(this),
                checked -> {
                    RamblerEnhancementsSettings.writeToolbarButtonEnabled(this, checked);
                    RamblerToolbarAccessPoint.refreshRegisteredControllers(this);
                    refreshUi();
                });
        boolean spacebarEnabled =
                RamblerEnhancementsSettings.readSpacebarLongPressRamblerEnabled(this);
        addToggleRow(
                "Long-press spacebar for Rambler",
                "Hold the spacebar stationary to trigger Rambler right under your thumb (sliding on the spacebar still moves the cursor; use the bottom-right keyboard button to switch keyboards).",
                spacebarEnabled,
                checked -> {
                    RamblerEnhancementsSettings.writeSpacebarLongPressRamblerEnabled(this, checked);
                    refreshUi();
                });
        if (spacebarEnabled) {
            String currentMode = RamblerEnhancementsSettings.readSpacebarLongPressMode(this);
            addRow(
                    "Spacebar trigger mode",
                    describeSpacebarMode(currentMode),
                    displaySpacebarMode(currentMode),
                    true,
                    () -> showSpacebarModeDialog(currentMode));
        }
    }

    private void buildProductivitySection() {
        ensureInstalledAppsLoadedAsync();
        addSectionHeader("Hands-free voice actions");
        boolean sendOn = RamblerEnhancementsSettings.readVoiceSendEnabled(this);
        String sendTriggers = RamblerEnhancementsSettings.readVoiceSendTriggers(this);
        addToggleRow(
                "Voice send suffix",
                "Say a trigger phrase at the end of a dictation (e.g. \"pls send the link, hit send\") to strip it, insert the message, and tap Send automatically. Only fires in fields with a Send button.",
                sendOn,
                checked -> {
                    RamblerEnhancementsSettings.writeVoiceSendEnabled(this, checked);
                    refreshUi();
                });
        if (sendOn) {
            addRow(
                    "Send trigger phrases",
                    sendTriggers.isEmpty()
                            ? "No triggers configured (comma-separated)."
                            : sendTriggers,
                    "Edit",
                    true,
                    () -> showTextInputDialog(
                            "Voice send triggers",
                            "Comma-separated end phrases (e.g. hit send, send it)",
                            sendTriggers,
                            val -> {
                                RamblerEnhancementsSettings.writeVoiceSendTriggers(this, val);
                                showToast("Saved send triggers.");
                                refreshUi();
                            }));
        }

        boolean searchOn = RamblerEnhancementsSettings.readVoiceSearchEnabled(this);
        String searchTriggers = RamblerEnhancementsSettings.readVoiceSearchTriggers(this);
        addToggleRow(
                "Voice search suffix",
                "Say a trigger phrase at the end of a query (e.g. \"weather in tokyo, hit search\") to submit automatically in Search fields.",
                searchOn,
                checked -> {
                    RamblerEnhancementsSettings.writeVoiceSearchEnabled(this, checked);
                    refreshUi();
                });
        if (searchOn) {
            addRow(
                    "Search trigger phrases",
                    searchTriggers.isEmpty()
                            ? "No triggers configured (comma-separated)."
                            : searchTriggers,
                    "Edit",
                    true,
                    () -> showTextInputDialog(
                            "Voice search triggers",
                            "Comma-separated end phrases (e.g. hit search, search it)",
                            searchTriggers,
                            val -> {
                                RamblerEnhancementsSettings.writeVoiceSearchTriggers(this, val);
                                showToast("Saved search triggers.");
                                refreshUi();
                            }));
        }

        addSectionHeader("Search bars");
        boolean searchStripPeriodOn =
                RamblerEnhancementsSettings.readSearchStripTrailingPeriod(this);
        addToggleRow(
                "Auto-strip period in search bars",
                "Automatically removes a trailing period when dictating into Search bars and browser address bars (preserves abbreviations like \"Dr.\" or \"e.g.\").",
                searchStripPeriodOn,
                checked -> {
                    RamblerEnhancementsSettings.writeSearchStripTrailingPeriod(this, checked);
                    refreshUi();
                });

        boolean autoSearchOn = RamblerEnhancementsSettings.readAutoSearchOnCommitEnabled(this);
        java.util.Set<String> autoSearchApps =
                RamblerEnhancementsSettings.readAutoSearchApps(this);
        Runnable openAutoSearchAppPicker = () -> withInstalledApps((apps, map) ->
                RamblerAppRuleDialogs.showAppPickerDialog(
                        this,
                        "Auto-search apps",
                        "Dictation automatically submits Search bars (and browser address bars) only in the apps you select here.",
                        RamblerEnhancementsSettings.readAutoSearchApps(this),
                        apps,
                        picked -> {
                            RamblerEnhancementsSettings.writeAutoSearchApps(this, picked);
                            showToast(picked.isEmpty()
                                    ? "Cleared auto-search apps."
                                    : "Auto-search enabled for " + picked.size() + " app(s).");
                            refreshUi();
                        }));
        addToggleRow(
                "Auto-search on commit",
                "Immediately submits the search right after dictation finishes in your selected apps (no need to tap Search or say \"hit search\"). Only fires in Search bars and browser address bars.",
                autoSearchOn,
                checked -> {
                    RamblerEnhancementsSettings.writeAutoSearchOnCommitEnabled(this, checked);
                    refreshUi();
                    if (checked && RamblerEnhancementsSettings.readAutoSearchApps(this).isEmpty()) {
                        openAutoSearchAppPicker.run();
                    }
                });
        if (autoSearchOn || !autoSearchApps.isEmpty()) {
            String appsSubtitle = autoSearchApps.isEmpty()
                    ? "No apps selected yet — tap to pick apps (e.g. Chrome, YouTube, Play Store, Settings)."
                    : RamblerCustomInstructionRules.formatPackageList(
                            autoSearchApps, packageLabelCache, 4);
            String appsBadge = autoSearchApps.isEmpty()
                    ? "Select apps"
                    : autoSearchApps.size() + (autoSearchApps.size() == 1 ? " app" : " apps");
            addRow(
                    "Apps for auto-search",
                    appsSubtitle,
                    appsBadge,
                    true,
                    openAutoSearchAppPicker);
        }

        addSectionHeader("Voice snippets");
        List<RamblerTextPipeline.SnippetRule> snippets = RamblerTextPipeline.readSnippets(this);
        for (RamblerTextPipeline.SnippetRule snippet : snippets) {
            String preview = snippet.expansion.length() > 80
                    ? snippet.expansion.substring(0, 80) + "…"
                    : snippet.expansion;
            addRow(
                    "\"" + snippet.trigger + "\"",
                    "→ " + preview,
                    snippet.enabled ? "Snippet" : "Paused",
                    true,
                    () -> RamblerProductivityDialogs.showSnippetEditorDialog(
                            this,
                            snippet,
                            updated -> {
                                RamblerTextPipeline.upsertSnippet(this, updated);
                                showToast("Saved snippet.");
                                refreshUi();
                            },
                            () -> {
                                RamblerTextPipeline.deleteSnippet(this, snippet.id);
                                showToast("Deleted snippet.");
                                refreshUi();
                            }));
        }
        addRow(
                "+ Add voice snippet",
                "Expand a spoken phrase deterministically into an exact email, URL, handle, or template.",
                snippets.size() + " saved",
                true,
                () -> RamblerProductivityDialogs.showSnippetEditorDialog(
                        this,
                        null,
                        created -> {
                            RamblerTextPipeline.upsertSnippet(this, created);
                            showToast("Added snippet.");
                            refreshUi();
                        },
                        null));

        addSectionHeader("Find & replace");
        List<RamblerTextPipeline.ReplaceRule> replaceRules =
                RamblerTextPipeline.readReplaceRules(this);
        Map<String, String> labels = packageLabelCache;
        for (RamblerTextPipeline.ReplaceRule rule : replaceRules) {
            StringBuilder meta = new StringBuilder();
            meta.append("→ ").append(rule.replace.isEmpty() ? "(delete)" : rule.replace);
            if (rule.regex) {
                meta.append(" · Regex");
            }
            if (rule.caseSensitive) {
                meta.append(" · Case");
            }
            if (!rule.packages.isEmpty()) {
                meta.append(" · ").append(RamblerCustomInstructionRules.formatPackageList(
                        rule.packages, labels, 2));
            }
            addRow(
                    "Replace \"" + rule.find + "\"",
                    meta.toString(),
                    rule.enabled ? "Active" : "Paused",
                    true,
                    () -> withInstalledApps((apps, map) ->
                            RamblerProductivityDialogs.showReplaceRuleEditorDialog(
                                    this,
                                    rule,
                                    apps,
                                    map,
                                    updated -> {
                                        RamblerTextPipeline.upsertReplaceRule(this, updated);
                                        showToast("Saved replace rule.");
                                        refreshUi();
                                    },
                                    () -> {
                                        RamblerTextPipeline.deleteReplaceRule(this, rule.id);
                                        showToast("Deleted replace rule.");
                                        refreshUi();
                                    })));
        }
        addRow(
                "+ Add find & replace rule",
                "Automatically fix recurring misspellings or formatting (plain text or regex, global or per-app).",
                replaceRules.size() + " saved",
                true,
                () -> withInstalledApps((apps, map) ->
                        RamblerProductivityDialogs.showReplaceRuleEditorDialog(
                                this,
                                null,
                                apps,
                                map,
                                created -> {
                                    RamblerTextPipeline.upsertReplaceRule(this, created);
                                    showToast("Added replace rule.");
                                    refreshUi();
                                },
                                null)));
    }

    private void buildDictionaryAndContactsSection() {
        if (RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY) {
            addSectionHeader("Voice dictionary (MUSE_STATS)");
            addToggleRow(
                    "Use dictionary words",
                    "Send stored MUSE_STATS biasing words with every Rambler dictation.",
                    RamblerEnhancementsSettings.readUseDictionaryWords(this),
                    checked -> {
                        RamblerEnhancementsSettings.writeUseDictionaryWords(this, checked);
                        refreshUi();
                    });
            List<String> storedWords = RamblerMuseStatsBridge.readWords(this);
            boolean hasWords = storedWords != null && !storedWords.isEmpty();
            addRow(
                    "Stored words",
                    formatDictionaryStatus(storedWords)
                            + (hasWords ? "\nTap to search or remove words." : ""),
                    storedWords == null ? "Wait" : Integer.toString(storedWords.size()),
                    hasWords,
                    hasWords ? () -> openWordBrowserDialog(storedWords) : null);
            addRow(
                    "+ Add words",
                    "Enter names or jargon separated by commas or new lines.",
                    "Add",
                    true,
                    () -> showTextInputDialog(
                            "Add voice dictionary words",
                            "One word/phrase per line or comma-separated.",
                            "",
                            raw -> {
                                LinkedHashSet<String> words =
                                        RamblerMuseStatsBridge.parseWordList(raw);
                                if (words.isEmpty()) {
                                    showToast("No valid words entered.");
                                    return;
                                }
                                runAsync(() -> {
                                    boolean ok = RamblerMuseStatsBridge.addWords(this, words);
                                    mainHandler.post(() -> {
                                        showToast(ok
                                                ? "Added " + words.size() + " word(s)."
                                                : "Dictionary not ready yet. Dictate once first.");
                                        refreshUi();
                                    });
                                });
                            }));
            addDictionaryActionBar(hasWords);
        }

        if (RamblerDynamicConfig.FEATURE_CONTACT_NAMES) {
            addSectionHeader("Contact names");
            boolean granted = RamblerContactsRuntime.hasContactsPermission(this);
            int seededCount = RamblerContactsRuntime.readSeededCount(this);
            addRow(
                    "Sync contact names",
                    granted
                            ? "Permission granted · " + seededCount
                            + " synced so far. Tap to add new contacts (up to 1,000)."
                            : "Tap to grant Contacts permission and seed up to 1,000 contact names into Rambler's voice dictionary.",
                    granted ? (seededCount + " synced") : "Grant",
                    true,
                    () -> {
                        if (!RamblerContactsRuntime.hasContactsPermission(this)) {
                            requestPermissions(
                                    new String[]{Manifest.permission.READ_CONTACTS},
                                    REQ_CONTACTS_PERMISSION);
                            return;
                        }
                        syncContactsNow();
                    });
            if (seededCount > 0) {
                addRow(
                        "Reset sync history",
                        "Clears the local record of already-seeded contacts so removed contacts can be synced again.",
                        "Reset",
                        true,
                        () -> showConfirmDialog(
                                "Reset contact sync history?",
                                "Existing words in the dictionary stay, and removed contacts will be eligible to sync again.",
                                () -> {
                                    RamblerContactsRuntime.resetSeededMemory(this);
                                    showToast("Contact sync history cleared.");
                                    refreshUi();
                                }));
            }
        }
    }

    private void addDictionaryActionBar(boolean hasWords) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(this);
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);

        bar.addView(makeActionChip("Import (.txt)", true, pal, () -> {
            try {
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("text/*");
                startActivityForResult(intent, REQ_IMPORT_WORDS);
            } catch (Throwable err) {
                Log.w(TAG, "Import picker failed", err);
                showToast("Could not open file picker.");
            }
        }), actionChipParams(0, dp(8)));

        bar.addView(makeActionChip("Export (.txt)", hasWords, pal, () -> {
            List<String> words = RamblerMuseStatsBridge.readWords(this);
            if (words == null) {
                showToast("Dictionary not ready yet. Dictate once first.");
                return;
            }
            if (words.isEmpty()) {
                showToast("Voice dictionary is empty.");
                return;
            }
            pendingExportPayload = RamblerMuseStatsBridge.formatExportText(words);
            try {
                Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("text/plain");
                intent.putExtra(Intent.EXTRA_TITLE, EXPORT_FILE_NAME);
                startActivityForResult(intent, REQ_EXPORT_WORDS);
            } catch (Throwable err) {
                Log.w(TAG, "Export picker failed", err);
                pendingExportPayload = null;
                showToast("Could not open save dialog.");
            }
        }), actionChipParams(0, dp(8)));

        bar.addView(makeActionChip("Clear all", hasWords, pal, () -> showConfirmDialog(
                "Clear all voice dictionary words?",
                "This removes all words from Rambler's MUSE_STATS list.",
                () -> runAsync(() -> {
                    boolean ok = RamblerMuseStatsBridge.clearAllWords(this);
                    mainHandler.post(() -> {
                        showToast(ok
                                ? "Cleared Rambler voice dictionary."
                                : "Dictionary not ready yet.");
                        refreshUi();
                    });
                }))), actionChipParams(0, 0));

        LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        barParams.bottomMargin = dp(9);
        contentContainer.addView(bar, barParams);
    }

    private TextView makeActionChip(
            String label, boolean enabled, RamblerWaveformDialogs.Palette pal, Runnable onClick) {
        TextView btn = new TextView(this);
        btn.setText(label);
        btn.setGravity(Gravity.CENTER);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        btn.setTypeface(Typeface.DEFAULT_BOLD);
        btn.setTextColor(enabled ? pal.accent : pal.secondary);
        btn.setPadding(dp(10), dp(12), dp(10), dp(12));
        btn.setBackground(RamblerWaveformDialogs.tileBackground(this, false));
        btn.setAlpha(enabled ? 1.0f : 0.5f);
        btn.setEnabled(enabled);
        btn.setClickable(enabled);
        btn.setFocusable(enabled);
        if (enabled && onClick != null) {
            btn.setOnClickListener(v -> onClick.run());
        }
        return btn;
    }

    private LinearLayout.LayoutParams actionChipParams(int leftMargin, int rightMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        params.leftMargin = leftMargin;
        params.rightMargin = rightMargin;
        return params;
    }

    private void openWordBrowserDialog(List<String> storedWords) {
        RamblerProductivityDialogs.showWordBrowserDialog(
                this,
                storedWords,
                (word, onRemoved) -> runAsync(() -> {
                    boolean ok = RamblerMuseStatsBridge.removeWord(this, word);
                    mainHandler.post(() -> {
                        if (ok) {
                            showToast("Removed \"" + word + "\".");
                            onRemoved.run();
                            refreshUi();
                        } else {
                            showToast("Could not remove word.");
                        }
                    });
                }));
    }

    private void buildHistorySection() {
        boolean statsOn = RamblerEnhancementsSettings.readStatsEnabled(this);
        boolean historyOn = RamblerEnhancementsSettings.readHistoryEnabled(this);
        int savedCount = RamblerTextPipeline.readHistory(this).size();

        LinearLayout statsCard = RamblerStatsCardView.buildCard(
                this, false, null, this::refreshUi);
        LinearLayout.LayoutParams statsParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        statsParams.bottomMargin = dp(10);
        contentContainer.addView(statsCard, statsParams);

        addToggleRow(
                "Track local dictation stats",
                "Counts words, sessions, WPM, cloud latency, and time saved privately on device (no dictated text stored).",
                statsOn,
                checked -> {
                    RamblerEnhancementsSettings.writeStatsEnabled(this, checked);
                    refreshUi();
                });

        addSectionHeader("Recent dictations");

        addToggleRow(
                "Keep local dictation history",
                "Privately stores your last " + RamblerTextPipeline.MAX_HISTORY_ENTRIES
                        + " Rambler dictations on device (excluded from JSON backups).",
                historyOn,
                checked -> {
                    RamblerEnhancementsSettings.writeHistoryEnabled(this, checked);
                    refreshUi();
                });

        addRow(
                "View dictation history",
                savedCount == 0
                        ? "No dictations saved yet. Tap to open history."
                        : "Tap to browse, search, copy, or delete your saved local dictations.",
                savedCount == 0 ? "Empty" : (savedCount + " saved"),
                true,
                () -> openSection(SECTION_HISTORY_LIST));
    }

    private void buildHistoryListSection() {
        ensureInstalledAppsLoadedAsync();
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(this);
        List<RamblerTextPipeline.HistoryEntry> entries =
                new ArrayList<RamblerTextPipeline.HistoryEntry>(
                        RamblerTextPipeline.readHistory(this));

        // Search bar + Clear all button
        LinearLayout searchRow = new LinearLayout(this);
        searchRow.setOrientation(LinearLayout.HORIZONTAL);
        searchRow.setGravity(Gravity.CENTER_VERTICAL);
        searchRow.setPadding(dp(14), dp(6), dp(14), dp(6));
        searchRow.setBackground(RamblerWaveformDialogs.tileBackground(this, false));

        EditText searchInput = new EditText(this);
        searchInput.setHint("Search " + entries.size() + " dictations or apps…");
        searchInput.setText(historySearchQuery);
        searchInput.setSelection(searchInput.getText().length());
        searchInput.setSingleLine(true);
        searchInput.setBackground(null);
        searchInput.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        searchInput.setTextColor(pal.primary);
        searchInput.setHintTextColor(pal.secondary);
        searchInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        searchRow.addView(searchInput, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        TextView clearAllBtn = new TextView(this);
        clearAllBtn.setText("Clear all");
        clearAllBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        clearAllBtn.setTypeface(Typeface.DEFAULT_BOLD);
        clearAllBtn.setTextColor(entries.isEmpty() ? pal.secondary : pal.accent);
        clearAllBtn.setAlpha(entries.isEmpty() ? 0.5f : 1.0f);
        clearAllBtn.setPadding(dp(10), dp(6), dp(2), dp(6));
        clearAllBtn.setClickable(!entries.isEmpty());
        clearAllBtn.setFocusable(!entries.isEmpty());
        searchRow.addView(clearAllBtn);

        LinearLayout.LayoutParams searchParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        searchParams.topMargin = dp(4);
        searchParams.bottomMargin = dp(10);
        contentContainer.addView(searchRow, searchParams);

        LinearLayout listBox = new LinearLayout(this);
        listBox.setOrientation(LinearLayout.VERTICAL);
        contentContainer.addView(listBox, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        SimpleDateFormat fmt = new SimpleDateFormat("MMM d, HH:mm", Locale.getDefault());
        Map<String, String> labels = packageLabelCache;

        Runnable[] rebuildList = new Runnable[1];
        rebuildList[0] = () -> {
            String query = historySearchQuery == null
                    ? ""
                    : historySearchQuery.trim().toLowerCase(Locale.ROOT);
            listBox.removeAllViews();
            int shown = 0;
            for (RamblerTextPipeline.HistoryEntry entry : entries) {
                String appName = (labels != null && !entry.packageName.isEmpty()
                        && labels.containsKey(entry.packageName))
                        ? labels.get(entry.packageName)
                        : (entry.packageName.isEmpty() ? "Unknown app" : entry.packageName);
                if (!query.isEmpty()
                        && !entry.text.toLowerCase(Locale.ROOT).contains(query)
                        && !appName.toLowerCase(Locale.ROOT).contains(query)
                        && !entry.packageName.toLowerCase(Locale.ROOT).contains(query)) {
                    continue;
                }
                shown++;
                LinearLayout card = new LinearLayout(this);
                card.setOrientation(LinearLayout.VERTICAL);
                card.setPadding(dp(14), dp(11), dp(14), dp(11));
                card.setBackground(RamblerWaveformDialogs.tileBackground(this, false));
                card.setClickable(true);
                card.setFocusable(true);
                card.setOnClickListener(v -> {
                    RamblerProductivityDialogs.copyToClipboard(this, entry.text);
                    showToast("Copied to clipboard.");
                });
                card.setOnLongClickListener(v -> {
                    RamblerFixAndLearnDialog.show(
                            this,
                            entry,
                            appName,
                            RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY,
                            null);
                    return true;
                });

                LinearLayout metaRow = new LinearLayout(this);
                metaRow.setOrientation(LinearLayout.HORIZONTAL);
                metaRow.setGravity(Gravity.CENTER_VERTICAL);

                TextView meta = new TextView(this);
                String ts = entry.timestampMs > 0 ? fmt.format(new Date(entry.timestampMs)) : "";
                meta.setText(ts.isEmpty() ? appName : (appName + " · " + ts));
                meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                meta.setTypeface(Typeface.DEFAULT_BOLD);
                meta.setTextColor(pal.accent);
                metaRow.addView(meta, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

                TextView fixBtn = new TextView(this);
                fixBtn.setText("Fix & learn");
                fixBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                fixBtn.setTypeface(Typeface.DEFAULT_BOLD);
                fixBtn.setTextColor(pal.accent);
                fixBtn.setPadding(dp(8), dp(2), dp(8), dp(2));
                fixBtn.setOnClickListener(v -> RamblerFixAndLearnDialog.show(
                        this,
                        entry,
                        appName,
                        RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY,
                        null));
                metaRow.addView(fixBtn);

                TextView delBtn = new TextView(this);
                delBtn.setText("Delete");
                delBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                delBtn.setTypeface(Typeface.DEFAULT_BOLD);
                delBtn.setTextColor(pal.secondary);
                delBtn.setPadding(dp(8), dp(2), dp(2), dp(2));
                delBtn.setOnClickListener(v -> {
                    RamblerTextPipeline.deleteHistoryEntry(this, entry.id);
                    entries.remove(entry);
                    searchInput.setHint("Search " + entries.size() + " dictations or apps…");
                    clearAllBtn.setTextColor(entries.isEmpty() ? pal.secondary : pal.accent);
                    clearAllBtn.setAlpha(entries.isEmpty() ? 0.5f : 1.0f);
                    clearAllBtn.setClickable(!entries.isEmpty());
                    rebuildList[0].run();
                });
                metaRow.addView(delBtn);
                card.addView(metaRow);

                TextView body = new TextView(this);
                body.setText(entry.text);
                body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                body.setTextColor(pal.primary);
                LinearLayout.LayoutParams bodyParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                bodyParams.topMargin = dp(4);
                card.addView(body, bodyParams);

                LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                cardParams.bottomMargin = dp(8);
                listBox.addView(card, cardParams);
            }
            if (shown == 0) {
                TextView empty = new TextView(this);
                empty.setText(entries.isEmpty()
                        ? "No dictations saved yet. Tap any future dictation here to copy it."
                        : "No matching dictations.");
                empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                empty.setTextColor(pal.secondary);
                empty.setPadding(dp(4), dp(14), dp(4), dp(14));
                listBox.addView(empty);
            }
        };

        clearAllBtn.setOnClickListener(v -> {
            if (entries.isEmpty()) {
                return;
            }
            showConfirmDialog(
                    "Clear dictation history?",
                    "Delete all " + entries.size() + " saved local dictations?",
                    () -> {
                        RamblerTextPipeline.clearHistory(this);
                        entries.clear();
                        refreshUi();
                    });
        });

        searchInput.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                historySearchQuery = s == null ? "" : s.toString();
                rebuildList[0].run();
            }
        });
        rebuildList[0].run();
    }

    private void buildBackupSection() {
        addRow(
                "Export all settings (.json)",
                "Save waveform preset/colors, per-app rules, snippets, find/replace rules, behavior toggles, and voice dictionary words into one portable JSON file.",
                "Export",
                true,
                () -> runAsync(() -> {
                    String payload = RamblerBackupManager.exportJson(this);
                    mainHandler.post(() -> {
                        pendingExportPayload = payload;
                        try {
                            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
                            intent.addCategory(Intent.CATEGORY_OPENABLE);
                            intent.setType("application/json");
                            intent.putExtra(Intent.EXTRA_TITLE, RamblerBackupManager.BACKUP_FILE_NAME);
                            startActivityForResult(intent, REQ_EXPORT_BACKUP);
                        } catch (Throwable err) {
                            Log.w(TAG, "Backup export picker failed", err);
                            pendingExportPayload = null;
                            showToast("Could not open save dialog.");
                        }
                    });
                }));
        addRow(
                "Import settings (.json)",
                "Restore a previously exported Rambler Enhancements backup file.",
                "Import",
                true,
                () -> {
                    try {
                        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                        intent.addCategory(Intent.CATEGORY_OPENABLE);
                        intent.setType("*/*");
                        intent.putExtra(Intent.EXTRA_MIME_TYPES,
                                new String[]{"application/json", "text/plain", "*/*"});
                        startActivityForResult(intent, REQ_IMPORT_BACKUP);
                    } catch (Throwable err) {
                        Log.w(TAG, "Backup import picker failed", err);
                        showToast("Could not open file picker.");
                    }
                });
    }

    private interface InstalledAppsCallback {
        void onReady(
                List<RamblerCustomInstructionRules.AppEntry> apps,
                Map<String, String> labels);
    }

    private void ensureInstalledAppsLoadedAsync() {
        if (installedAppsCache != null || loadingInstalledApps) {
            return;
        }
        loadingInstalledApps = true;
        runAsync(() -> {
            List<RamblerCustomInstructionRules.AppEntry> apps =
                    RamblerCustomInstructionRules.loadInstalledLauncherApps(this);
            Map<String, String> labels = new java.util.HashMap<String, String>();
            for (RamblerCustomInstructionRules.AppEntry entry : apps) {
                labels.put(entry.packageName, entry.label);
            }
            installedAppsCache = apps;
            packageLabelCache = labels;
            loadingInstalledApps = false;
            mainHandler.post(() -> {
                if (!isFinishing()) {
                    refreshUi();
                }
            });
        });
    }

    private void withInstalledApps(InstalledAppsCallback callback) {
        List<RamblerCustomInstructionRules.AppEntry> cached = installedAppsCache;
        Map<String, String> cachedLabels = packageLabelCache;
        if (cached != null && cachedLabels != null) {
            callback.onReady(cached, cachedLabels);
            return;
        }
        showToast("Loading installed apps…");
        runAsync(() -> {
            List<RamblerCustomInstructionRules.AppEntry> apps =
                    RamblerCustomInstructionRules.loadInstalledLauncherApps(this);
            Map<String, String> labels = new java.util.HashMap<String, String>();
            for (RamblerCustomInstructionRules.AppEntry entry : apps) {
                labels.put(entry.packageName, entry.label);
            }
            installedAppsCache = apps;
            packageLabelCache = labels;
            loadingInstalledApps = false;
            mainHandler.post(() -> {
                if (!isFinishing()) {
                    callback.onReady(apps, labels);
                }
            });
        });
    }

    private void syncContactsNow() {
        RamblerContactsRuntime.syncNowAsync(this, result -> mainHandler.post(() -> {
            switch (result.getStatus()) {
                case ADDED:
                    showToast("Synced " + result.getAddedCount() + " contact names.");
                    break;
                case UP_TO_DATE:
                    showToast("Contact names are already up to date.");
                    break;
                case NO_PERMISSION:
                    showToast("Contacts permission not granted.");
                    break;
                case STORE_NOT_READY:
                    showToast("Rambler dictionary isn't ready yet. Dictate once and try again.");
                    break;
                case BUSY:
                    showToast("Contact sync is already running.");
                    break;
                default:
                    showToast("Contact sync failed.");
                    break;
            }
            refreshUi();
        }));
    }

    private void openColorDialog(
            String title,
            String currentColor,
            String currentSelection,
            String customColor,
            RamblerWaveformSettings.SettingsSnapshot snapshot,
            boolean isProcessingSlot) {
        String[] summaries = {
                "Adaptive Hex palette",
                "System accent",
                COLOR_VALUES[2], COLOR_VALUES[3], COLOR_VALUES[4], COLOR_VALUES[5],
                COLOR_VALUES[6], COLOR_VALUES[7], COLOR_VALUES[8], COLOR_VALUES[9],
                customColor == null ? "" : customColor
        };
        String[] labels = isProcessingSlot ? PROCESSING_COLOR_LABELS : LISTENING_COLOR_LABELS;
        RamblerWaveformDialogs.showPaletteDialog(
                this,
                title,
                labels,
                summaries,
                COLOR_VALUES,
                currentSelection,
                snapshot,
                isProcessingSlot,
                () -> openCustomColorDialog(
                        title, currentColor, customColor, snapshot, isProcessingSlot),
                selected -> {
                    if (isProcessingSlot) {
                        RamblerWaveformSettings.writeProcessingColor(this, selected);
                    } else {
                        RamblerWaveformSettings.writeListeningColor(this, selected);
                    }
                    refreshUi();
                });
    }

    private void openCustomColorDialog(
            String title,
            String currentColor,
            String customColor,
            RamblerWaveformSettings.SettingsSnapshot snapshot,
            boolean isProcessingSlot) {
        String fallback = isProcessingSlot
                ? RamblerWaveformSettings.DEFAULT_CUSTOM_PROCESSING_HEX
                : RamblerWaveformSettings.DEFAULT_CUSTOM_LISTENING_HEX;
        String initial = customColor != null
                ? customColor
                : (RamblerWaveformSettings.tryNormalizeColorHex(currentColor) != null
                        ? currentColor
                        : fallback);
        RamblerWaveformDialogs.showColorPickerDialog(
                this,
                title,
                initial,
                snapshot,
                isProcessingSlot,
                selectedHex -> {
                    if (isProcessingSlot) {
                        RamblerWaveformSettings.writeProcessingCustomColor(this, selectedHex);
                    } else {
                        RamblerWaveformSettings.writeListeningCustomColor(this, selectedHex);
                    }
                    refreshUi();
                });
    }

    private void addSectionHeader(String title) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(this);
        TextView header = new TextView(this);
        header.setText(title);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setTextColor(pal.accent);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = contentContainer.getChildCount() == 0 ? dp(2) : dp(16);
        params.bottomMargin = dp(8);
        contentContainer.addView(header, params);
    }

    private void addRow(
            String title,
            String summary,
            String badgeValue,
            boolean clickable,
            Runnable onClick) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(this);
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(13), dp(16), dp(13));
        card.setBackground(RamblerWaveformDialogs.tileBackground(this, false));
        card.setEnabled(clickable || onClick == null);
        card.setClickable(clickable && onClick != null);
        card.setFocusable(clickable && onClick != null);
        card.setAlpha((clickable || onClick == null) ? 1.0f : 0.55f);
        if (clickable && onClick != null) {
            card.setOnClickListener(v -> onClick.run());
        }

        LinearLayout topLine = new LinearLayout(this);
        topLine.setOrientation(LinearLayout.HORIZONTAL);
        topLine.setGravity(Gravity.CENTER_VERTICAL);

        TextView titleView = new TextView(this);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextColor(pal.primary);
        topLine.addView(titleView, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        if (badgeValue != null && !badgeValue.isEmpty()) {
            TextView valueView = new TextView(this);
            valueView.setText(badgeValue);
            valueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            valueView.setTypeface(Typeface.DEFAULT_BOLD);
            valueView.setTextColor((clickable || onClick == null) ? pal.accent : pal.secondary);
            LinearLayout.LayoutParams valueParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            valueParams.leftMargin = dp(10);
            topLine.addView(valueView, valueParams);
        }
        card.addView(topLine);

        TextView summaryView = new TextView(this);
        summaryView.setText(summary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        summaryView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams sumParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sumParams.topMargin = dp(4);
        card.addView(summaryView, sumParams);

        LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardParams.bottomMargin = dp(9);
        contentContainer.addView(card, cardParams);
    }

    private interface BooleanConsumer {
        void accept(boolean value);
    }

    private void addToggleRow(
            String title,
            String summary,
            boolean initialChecked,
            BooleanConsumer onToggle) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(this);
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(13), dp(16), dp(13));
        card.setBackground(RamblerWaveformDialogs.tileBackground(this, false));
        card.setClickable(true);
        card.setFocusable(true);

        LinearLayout topLine = new LinearLayout(this);
        topLine.setOrientation(LinearLayout.HORIZONTAL);
        topLine.setGravity(Gravity.CENTER_VERTICAL);

        TextView titleView = new TextView(this);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextColor(pal.primary);
        topLine.addView(titleView, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        Switch toggle = new Switch(this);
        toggle.setChecked(initialChecked);
        toggle.setOnCheckedChangeListener((ignored, checked) -> onToggle.accept(checked));
        topLine.addView(toggle);
        card.addView(topLine);

        card.setOnClickListener(v -> toggle.setChecked(!toggle.isChecked()));

        TextView summaryView = new TextView(this);
        summaryView.setText(summary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        summaryView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams sumParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sumParams.topMargin = dp(4);
        card.addView(summaryView, sumParams);

        LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardParams.bottomMargin = dp(9);
        contentContainer.addView(card, cardParams);
    }

    private void showTextInputDialog(
            String title,
            String hint,
            String initialValue,
            RamblerWaveformDialogs.SelectionConsumer onSave) {
        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(dp(20), dp(12), dp(20), dp(4));

        EditText input = new EditText(this);
        input.setHint(hint);
        input.setText(initialValue == null ? "" : initialValue);
        input.setSelection(input.getText().length());
        input.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        input.setMinLines(3);
        input.setMaxLines(8);
        container.addView(input, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        new AlertDialog.Builder(this)
                .setTitle(title)
                .setView(container)
                .setPositiveButton("Save", (ignored, which) ->
                        onSave.accept(input.getText() == null ? "" : input.getText().toString()))
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void showSpacebarModeDialog(String currentMode) {
        final String[] values = {
                RamblerEnhancementsSettings.SPACEBAR_MODE_HYBRID,
                RamblerEnhancementsSettings.SPACEBAR_MODE_HOLD,
                RamblerEnhancementsSettings.SPACEBAR_MODE_TOGGLE
        };
        final String[] items = {
                "Smart hybrid (Recommended)\nQuick release stays hands-free; keep holding while speaking and release to transcribe.",
                "Hold to talk (Push-to-Talk)\nHold the spacebar while speaking; lifting your thumb immediately stops & transcribes.",
                "Toggle (Hands-free)\nHold to start, lift your thumb and talk freely; stop via auto-stop, mic button, or another long-press."
        };
        int checkedIndex = 0;
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(currentMode)) {
                checkedIndex = i;
                break;
            }
        }
        new AlertDialog.Builder(this)
                .setTitle("Spacebar trigger mode")
                .setSingleChoiceItems(items, checkedIndex, (dialog, which) -> {
                    if (which >= 0 && which < values.length) {
                        String chosen = values[which];
                        RamblerEnhancementsSettings.writeSpacebarLongPressMode(this, chosen);
                        showToast("Spacebar mode: " + displaySpacebarMode(chosen));
                        refreshUi();
                    }
                    dialog.dismiss();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static String displaySpacebarMode(String mode) {
        if (RamblerEnhancementsSettings.SPACEBAR_MODE_HOLD.equals(mode)) {
            return "Hold to talk";
        }
        if (RamblerEnhancementsSettings.SPACEBAR_MODE_TOGGLE.equals(mode)) {
            return "Toggle";
        }
        return "Smart hybrid";
    }

    private static String describeSpacebarMode(String mode) {
        if (RamblerEnhancementsSettings.SPACEBAR_MODE_HOLD.equals(mode)) {
            return "Push-to-Talk: keep holding the spacebar while speaking; releasing immediately stops & transcribes.";
        }
        if (RamblerEnhancementsSettings.SPACEBAR_MODE_TOGGLE.equals(mode)) {
            return "Hands-free toggle: hold spacebar to start, lift your thumb and talk freely; stop via auto-stop, mic, or another long-press.";
        }
        return "Smart hybrid: quick release stays hands-free; keep holding while speaking (>0.6s) and release to stop & transcribe.";
    }

    private void showConfirmDialog(String title, String message, Runnable onConfirm) {
        new AlertDialog.Builder(this)
                .setTitle(title)
                .setMessage(message)
                .setPositiveButton("Confirm", (ignored, which) -> onConfirm.run())
                .setNegativeButton("Cancel", null)
                .show();
    }

    private String formatDictionaryStatus(List<String> words) {
        if (words == null) {
            return "Store not ready yet — dictate once with Rambler to initialize MUSE_STATS.";
        }
        if (words.isEmpty()) {
            return "0 words stored.";
        }
        StringBuilder preview = new StringBuilder();
        int shown = Math.min(words.size(), PREVIEW_WORD_LIMIT);
        for (int i = 0; i < shown; i++) {
            if (i > 0) {
                preview.append(", ");
            }
            preview.append(words.get(i));
        }
        if (words.size() > shown) {
            preview.append(" (+" + (words.size() - shown) + " more)");
        }
        return words.size() + " word(s): " + preview;
    }

    private static String joinMiddleDot(List<String> parts) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < parts.size(); i++) {
            if (i > 0) {
                sb.append(" · ");
            }
            sb.append(parts.get(i));
        }
        return sb.toString();
    }

    private String readTextFromUri(Uri uri) {
        try (InputStream in = getContentResolver().openInputStream(uri)) {
            if (in == null) {
                return "";
            }
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } catch (Throwable err) {
            Log.w(TAG, "Failed to read imported file", err);
            return "";
        }
    }

    private boolean writeTextToUri(Uri uri, String content) {
        try (OutputStream out = getContentResolver().openOutputStream(uri)) {
            if (out == null) {
                return false;
            }
            out.write(content.getBytes(StandardCharsets.UTF_8));
            out.flush();
            return true;
        } catch (Throwable err) {
            Log.w(TAG, "Failed to export file", err);
            return false;
        }
    }

    private void runAsync(Runnable task) {
        Thread worker = new Thread(task, "rambler-enhancements-ui-io");
        worker.setDaemon(true);
        worker.start();
    }

    private void toastOnMain(String message) {
        mainHandler.post(() -> showToast(message));
    }

    private void showToast(String message) {
        try {
            Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // Safe no-op in headless tests.
        }
    }

    private static String displayListening(String value) {
        for (int i = 0; i < LISTENING_VALUES.length; i++) {
            if (LISTENING_VALUES[i].equals(value)) {
                return LISTENING_LABELS[i];
            }
        }
        return LISTENING_LABELS[0];
    }

    private static String displayProcessing(String value) {
        for (int i = 0; i < PROCESSING_VALUES.length; i++) {
            if (PROCESSING_VALUES[i].equals(value)) {
                return PROCESSING_LABELS[i];
            }
        }
        return PROCESSING_LABELS[0];
    }

    private static String displayColor(String value, boolean isProcessingSlot) {
        String[] labels = isProcessingSlot ? PROCESSING_COLOR_LABELS : LISTENING_COLOR_LABELS;
        if (RamblerWaveformSettings.isHexDefault(value)) {
            return labels[0];
        }
        if (RamblerWaveformSettings.isThemeAuto(value)) {
            return labels[1];
        }
        for (int i = 2; i < COLOR_VALUES.length - 1; i++) {
            if (COLOR_VALUES[i].equals(value)) {
                return labels[i];
            }
        }
        return value;
    }

    private static String displayTuning(RamblerWaveformSettings.SettingsSnapshot snapshot) {
        if (snapshot == null || snapshot.isDefaultTuning()) {
            return "Default";
        }
        if (snapshot.isIosHaloGlow()
                && Math.abs(snapshot.getDotSpacingDp()
                        - RamblerWaveformSettings.DEFAULT_DOT_SPACING_DP) < 0.02f
                && Math.abs(snapshot.getGlowIntensity()
                        - RamblerWaveformSettings.DEFAULT_GLOW_INTENSITY) < 0.02f
                && Math.abs(snapshot.getVoiceResponse()
                        - RamblerWaveformSettings.DEFAULT_VOICE_RESPONSE) < 0.02f) {
            return "iOS halo";
        }
        return "Custom";
    }

    private int dp(int value) {
        return RamblerWaveformDialogs.dp(this, value);
    }
}
