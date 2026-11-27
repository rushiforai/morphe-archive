package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Exports and imports the full Rambler Enhancements configuration (Hex waveform, per-app custom
 * instruction &amp; behavior rules, voice snippets, find &amp; replace rules, hands-free voice
 * actions, dictation behavior/reliability/session settings, and MUSE_STATS voice dictionary words)
 * as a single portable JSON file.
 *
 * <p>Intentionally excludes local dictation history entries from exports to protect privacy.</p>
 */
public final class RamblerBackupManager {
    private static final String TAG = "RamblerEnhancements";
    public static final int SCHEMA_VERSION = 1;
    public static final String BACKUP_FILE_NAME = "rambler-enhancements-backup.json";

    public static final class ImportResult {
        public final boolean success;
        public final String message;

        public ImportResult(boolean success, String message) {
            this.success = success;
            this.message = message;
        }
    }

    private RamblerBackupManager() {
    }

    public static String exportJson(Context context) {
        if (context == null) {
            return "{}";
        }
        try {
            JSONObject root = new JSONObject();
            root.put("schemaVersion", SCHEMA_VERSION);
            root.put("app", "rambler-enhancements");
            root.put("exportedAtMs", System.currentTimeMillis());

            // 1. Hex waveform settings
            SharedPreferences wPrefs = RamblerWaveformSettings.preferencesOrNull(context);
            RamblerWaveformSettings.SettingsSnapshot wf = RamblerWaveformSettings.snapshot(context);
            JSONObject wfObj = new JSONObject();
            wfObj.put("listeningStyle", wf.getListeningStyle());
            wfObj.put("processingStyle", wf.getProcessingStyle());
            wfObj.put("listeningColor", wf.getListeningColorValue());
            wfObj.put("listeningColorSelection",
                    RamblerWaveformSettings.readListeningColorSelection(wPrefs));
            String listenCustom = RamblerWaveformSettings.readListeningCustomColor(wPrefs);
            if (listenCustom != null) {
                wfObj.put("listeningCustomColor", listenCustom);
            }
            wfObj.put("processingColor", wf.getProcessingColorValue());
            wfObj.put("processingColorSelection",
                    RamblerWaveformSettings.readProcessingColorSelection(wPrefs));
            String procCustom = RamblerWaveformSettings.readProcessingCustomColor(wPrefs);
            if (procCustom != null) {
                wfObj.put("processingCustomColor", procCustom);
            }
            wfObj.put("glowLook", wf.getGlowLook());
            wfObj.put("dotSpacingDp", (double) wf.getDotSpacingDp());
            wfObj.put("glowIntensity", (double) wf.getGlowIntensity());
            wfObj.put("voiceResponse", (double) wf.getVoiceResponse());
            root.put("waveform", wfObj);

            // 2. Dictation behavior, reliability & session duration
            JSONObject behavior = new JSONObject();
            behavior.put("useDictionaryWords",
                    RamblerEnhancementsSettings.readUseDictionaryWords(context));
            behavior.put("appendOnly", RamblerEnhancementsSettings.readAppendOnly(context));
            behavior.put("cursorEditingEnabled",
                    RamblerEnhancementsSettings.readCursorEditingEnabled(context));
            behavior.put("reselectAfterEdit",
                    RamblerEnhancementsSettings.readReselectAfterEditEnabled(context));
            behavior.put("appContextEnabled",
                    RamblerEnhancementsSettings.readAppContextEnabled(context));
            behavior.put("autoParallelRetry",
                    RamblerEnhancementsSettings.readAutoParallelRetryEnabled(context));
            behavior.put("maxSessionSeconds",
                    RamblerEnhancementsSettings.readMaxSessionSeconds(context));
            behavior.put("stripTrailingPeriod",
                    RamblerEnhancementsSettings.readStripTrailingPeriod(context));
            behavior.put("historyEnabled",
                    RamblerEnhancementsSettings.readHistoryEnabled(context));
            behavior.put("statsEnabled",
                    RamblerEnhancementsSettings.readStatsEnabled(context));
            behavior.put("typingBaselineWpm",
                    RamblerEnhancementsSettings.readTypingBaselineWpm(context));
            behavior.put("toolbarButtonEnabled",
                    RamblerEnhancementsSettings.readToolbarButtonEnabled(context));
            behavior.put("spacebarLongPressRamblerEnabled",
                    RamblerEnhancementsSettings.readSpacebarLongPressRamblerEnabled(context));
            behavior.put("spacebarLongPressMode",
                    RamblerEnhancementsSettings.readSpacebarLongPressMode(context));
            root.put("behavior", behavior);

            // 3. Hands-free voice actions
            JSONObject voiceActions = new JSONObject();
            voiceActions.put("voiceSendEnabled",
                    RamblerEnhancementsSettings.readVoiceSendEnabled(context));
            voiceActions.put("voiceSendTriggers",
                    RamblerEnhancementsSettings.readVoiceSendTriggers(context));
            voiceActions.put("voiceSearchEnabled",
                    RamblerEnhancementsSettings.readVoiceSearchEnabled(context));
            voiceActions.put("voiceSearchTriggers",
                    RamblerEnhancementsSettings.readVoiceSearchTriggers(context));
            voiceActions.put("searchStripTrailingPeriod",
                    RamblerEnhancementsSettings.readSearchStripTrailingPeriod(context));
            voiceActions.put("autoSearchOnCommitEnabled",
                    RamblerEnhancementsSettings.readAutoSearchOnCommitEnabled(context));
            JSONArray autoSearchAppsArr = new JSONArray();
            for (String pkg : RamblerEnhancementsSettings.readAutoSearchApps(context)) {
                autoSearchAppsArr.put(pkg);
            }
            voiceActions.put("autoSearchApps", autoSearchAppsArr);
            root.put("voiceActions", voiceActions);

            // 4. Custom instructions & per-app rules
            JSONObject customInstr = new JSONObject();
            customInstr.put("defaultInstruction",
                    RamblerMuseStatsBridge.readCustomInstruction(context));
            customInstr.put("rules", new JSONArray(
                    RamblerCustomInstructionRules.serializeRulesJson(
                            RamblerCustomInstructionRules.readRules(context))));
            JSONArray disabledArr = new JSONArray();
            Set<String> disabled = RamblerCustomInstructionRules.readDisabledApps(context);
            for (String pkg : disabled) {
                disabledArr.put(pkg);
            }
            customInstr.put("disabledApps", disabledArr);
            root.put("customInstructions", customInstr);

            // 5. Snippets & Find/Replace rules
            root.put("snippets", new JSONArray(
                    RamblerTextPipeline.serializeSnippetsJson(
                            RamblerTextPipeline.readSnippets(context))));
            root.put("replaceRules", new JSONArray(
                    RamblerTextPipeline.serializeReplaceRulesJson(
                            RamblerTextPipeline.readReplaceRules(context))));

            // 6. Voice dictionary (MUSE_STATS) words if store is ready
            List<String> dictWords = RamblerMuseStatsBridge.readWords(context);
            if (dictWords != null) {
                JSONArray wordsArr = new JSONArray();
                for (String word : dictWords) {
                    wordsArr.put(word);
                }
                root.put("voiceDictionaryWords", wordsArr);
            }

            return root.toString(2) + "\n";
        } catch (Throwable err) {
            Log.w(TAG, "Failed to serialize backup JSON", err);
            return "{}";
        }
    }

    public static ImportResult importJson(Context context, String rawJson) {
        if (context == null || rawJson == null || rawJson.trim().isEmpty()) {
            return new ImportResult(false, "Backup file is empty.");
        }
        try {
            JSONObject root = new JSONObject(rawJson);
            int version = root.optInt("schemaVersion", 0);
            if (version <= 0 || version > SCHEMA_VERSION) {
                return new ImportResult(
                        false, "Unrecognized backup format (schemaVersion=" + version + ").");
            }

            int restoredSections = 0;

            // 1. Waveform
            JSONObject wf = root.optJSONObject("waveform");
            if (wf != null) {
                if (wf.has("listeningStyle")) {
                    RamblerWaveformSettings.writeListeningStyle(
                            context, wf.optString("listeningStyle"));
                }
                if (wf.has("processingStyle")) {
                    RamblerWaveformSettings.writeProcessingStyle(
                            context, wf.optString("processingStyle"));
                }
                if (wf.has("listeningCustomColor")) {
                    RamblerWaveformSettings.writeListeningCustomColor(
                            context, wf.optString("listeningCustomColor"));
                }
                if (wf.has("listeningColor")) {
                    String sel = wf.optString("listeningColorSelection", "");
                    String val = wf.optString("listeningColor");
                    if (RamblerWaveformSettings.COLOR_SELECTION_CUSTOM.equals(sel)) {
                        RamblerWaveformSettings.writeListeningCustomColor(context, val);
                    } else {
                        RamblerWaveformSettings.writeListeningColor(context, val);
                    }
                }
                if (wf.has("processingCustomColor")) {
                    RamblerWaveformSettings.writeProcessingCustomColor(
                            context, wf.optString("processingCustomColor"));
                }
                if (wf.has("processingColor")) {
                    String sel = wf.optString("processingColorSelection", "");
                    String val = wf.optString("processingColor");
                    if (RamblerWaveformSettings.COLOR_SELECTION_CUSTOM.equals(sel)) {
                        RamblerWaveformSettings.writeProcessingCustomColor(context, val);
                    } else {
                        RamblerWaveformSettings.writeProcessingColor(context, val);
                    }
                }
                RamblerWaveformSettings.writeTuning(
                        context,
                        wf.optString("glowLook", RamblerWaveformSettings.DEFAULT_GLOW_LOOK),
                        (float) wf.optDouble("dotSpacingDp",
                                RamblerWaveformSettings.DEFAULT_DOT_SPACING_DP),
                        (float) wf.optDouble("glowIntensity",
                                RamblerWaveformSettings.DEFAULT_GLOW_INTENSITY),
                        (float) wf.optDouble("voiceResponse",
                                RamblerWaveformSettings.DEFAULT_VOICE_RESPONSE));
                restoredSections++;
            }

            // 2. Behavior & reliability
            JSONObject behavior = root.optJSONObject("behavior");
            if (behavior != null) {
                if (behavior.has("useDictionaryWords")) {
                    RamblerEnhancementsSettings.writeUseDictionaryWords(
                            context, behavior.optBoolean("useDictionaryWords",
                                    RamblerEnhancementsSettings.DEFAULT_USE_DICTIONARY_WORDS));
                }
                if (behavior.has("appendOnly")) {
                    RamblerEnhancementsSettings.writeAppendOnly(
                            context, behavior.optBoolean("appendOnly",
                                    RamblerEnhancementsSettings.DEFAULT_APPEND_ONLY));
                }
                if (behavior.has("cursorEditingEnabled")) {
                    RamblerEnhancementsSettings.writeCursorEditingEnabled(
                            context, behavior.optBoolean("cursorEditingEnabled",
                                    RamblerEnhancementsSettings.DEFAULT_CURSOR_EDITING_ENABLED));
                }
                if (behavior.has("reselectAfterEdit")) {
                    RamblerEnhancementsSettings.writeReselectAfterEditEnabled(
                            context, behavior.optBoolean("reselectAfterEdit",
                                    RamblerEnhancementsSettings.DEFAULT_RESELECT_AFTER_EDIT));
                }
                if (behavior.has("appContextEnabled")) {
                    RamblerEnhancementsSettings.writeAppContextEnabled(
                            context, behavior.optBoolean("appContextEnabled",
                                    RamblerEnhancementsSettings.DEFAULT_APP_CONTEXT_ENABLED));
                }
                if (behavior.has("autoParallelRetry")) {
                    RamblerEnhancementsSettings.writeAutoParallelRetryEnabled(
                            context, behavior.optBoolean("autoParallelRetry",
                                    RamblerEnhancementsSettings.DEFAULT_AUTO_PARALLEL_RETRY));
                }
                if (behavior.has("maxSessionSeconds")) {
                    RamblerEnhancementsSettings.writeMaxSessionSeconds(
                            context, behavior.optInt("maxSessionSeconds", 0));
                }
                if (behavior.has("stripTrailingPeriod")) {
                    RamblerEnhancementsSettings.writeStripTrailingPeriod(
                            context, behavior.optBoolean("stripTrailingPeriod", false));
                }
                if (behavior.has("historyEnabled")) {
                    RamblerEnhancementsSettings.writeHistoryEnabled(
                            context, behavior.optBoolean("historyEnabled", true));
                }
                if (behavior.has("statsEnabled")) {
                    RamblerEnhancementsSettings.writeStatsEnabled(
                            context, behavior.optBoolean("statsEnabled", true));
                }
                if (behavior.has("typingBaselineWpm")) {
                    RamblerEnhancementsSettings.writeTypingBaselineWpm(
                            context,
                            behavior.optInt(
                                    "typingBaselineWpm",
                                    RamblerEnhancementsSettings.DEFAULT_TYPING_BASELINE_WPM));
                }
                if (behavior.has("toolbarButtonEnabled")) {
                    RamblerEnhancementsSettings.writeToolbarButtonEnabled(
                            context, behavior.optBoolean("toolbarButtonEnabled", true));
                }
                if (behavior.has("spacebarLongPressRamblerEnabled")) {
                    RamblerEnhancementsSettings.writeSpacebarLongPressRamblerEnabled(
                            context, behavior.optBoolean("spacebarLongPressRamblerEnabled", true));
                }
                if (behavior.has("spacebarLongPressMode")) {
                    RamblerEnhancementsSettings.writeSpacebarLongPressMode(
                            context,
                            behavior.optString(
                                    "spacebarLongPressMode",
                                    RamblerEnhancementsSettings.DEFAULT_SPACEBAR_LONG_PRESS_MODE));
                }
                restoredSections++;
            }

            // 3. Hands-free voice actions
            JSONObject voiceActions = root.optJSONObject("voiceActions");
            if (voiceActions != null) {
                if (voiceActions.has("voiceSendEnabled")) {
                    RamblerEnhancementsSettings.writeVoiceSendEnabled(
                            context, voiceActions.optBoolean("voiceSendEnabled", false));
                }
                if (voiceActions.has("voiceSendTriggers")) {
                    RamblerEnhancementsSettings.writeVoiceSendTriggers(
                            context, voiceActions.optString("voiceSendTriggers",
                                    RamblerEnhancementsSettings.DEFAULT_VOICE_SEND_TRIGGERS));
                }
                if (voiceActions.has("voiceSearchEnabled")) {
                    RamblerEnhancementsSettings.writeVoiceSearchEnabled(
                            context, voiceActions.optBoolean("voiceSearchEnabled", false));
                }
                if (voiceActions.has("voiceSearchTriggers")) {
                    RamblerEnhancementsSettings.writeVoiceSearchTriggers(
                            context, voiceActions.optString("voiceSearchTriggers",
                                    RamblerEnhancementsSettings.DEFAULT_VOICE_SEARCH_TRIGGERS));
                }
                if (voiceActions.has("searchStripTrailingPeriod")) {
                    RamblerEnhancementsSettings.writeSearchStripTrailingPeriod(
                            context,
                            voiceActions.optBoolean(
                                    "searchStripTrailingPeriod",
                                    RamblerEnhancementsSettings.DEFAULT_SEARCH_STRIP_TRAILING_PERIOD));
                }
                if (voiceActions.has("autoSearchOnCommitEnabled")) {
                    RamblerEnhancementsSettings.writeAutoSearchOnCommitEnabled(
                            context,
                            voiceActions.optBoolean(
                                    "autoSearchOnCommitEnabled",
                                    RamblerEnhancementsSettings.DEFAULT_AUTO_SEARCH_ON_COMMIT));
                }
                JSONArray autoSearchAppsArr = voiceActions.optJSONArray("autoSearchApps");
                if (autoSearchAppsArr != null) {
                    List<String> apps = new ArrayList<String>(autoSearchAppsArr.length());
                    for (int i = 0; i < autoSearchAppsArr.length(); i++) {
                        String pkg = autoSearchAppsArr.optString(i, "").trim();
                        if (!pkg.isEmpty()) {
                            apps.add(pkg);
                        }
                    }
                    RamblerEnhancementsSettings.writeAutoSearchApps(context, apps);
                }
                restoredSections++;
            }

            // 4. Custom instructions & per-app rules
            JSONObject customInstr = root.optJSONObject("customInstructions");
            if (customInstr != null) {
                if (customInstr.has("defaultInstruction")) {
                    RamblerMuseStatsBridge.writeCustomInstruction(
                            context, customInstr.optString("defaultInstruction", ""));
                }
                JSONArray rulesArr = customInstr.optJSONArray("rules");
                if (rulesArr != null) {
                    RamblerCustomInstructionRules.writeRules(
                            context,
                            RamblerCustomInstructionRules.parseRulesJson(rulesArr.toString()));
                }
                JSONArray disabledArr = customInstr.optJSONArray("disabledApps");
                if (disabledArr != null) {
                    List<String> disabled = new ArrayList<String>(disabledArr.length());
                    for (int i = 0; i < disabledArr.length(); i++) {
                        String pkg = disabledArr.optString(i, "").trim();
                        if (!pkg.isEmpty()) {
                            disabled.add(pkg);
                        }
                    }
                    RamblerCustomInstructionRules.writeDisabledApps(context, disabled);
                }
                restoredSections++;
            }

            // 5. Snippets & Find/Replace rules
            JSONArray snippetsArr = root.optJSONArray("snippets");
            if (snippetsArr != null) {
                RamblerTextPipeline.writeSnippets(
                        context, RamblerTextPipeline.parseSnippetsJson(snippetsArr.toString()));
                restoredSections++;
            }
            JSONArray replaceArr = root.optJSONArray("replaceRules");
            if (replaceArr != null) {
                RamblerTextPipeline.writeReplaceRules(
                        context,
                        RamblerTextPipeline.parseReplaceRulesJson(replaceArr.toString()));
                restoredSections++;
            }

            // 6. Voice dictionary words (best-effort merge when MUSE_STATS store is ready)
            int dictAdded = 0;
            boolean dictPending = false;
            JSONArray wordsArr = root.optJSONArray("voiceDictionaryWords");
            if (wordsArr != null && wordsArr.length() > 0) {
                LinkedHashSet<String> words = new LinkedHashSet<String>();
                for (int i = 0; i < wordsArr.length(); i++) {
                    String w = wordsArr.optString(i, "").trim();
                    if (!w.isEmpty()) {
                        words.add(w);
                    }
                }
                if (!words.isEmpty()) {
                    if (RamblerMuseStatsBridge.addWords(context, words)) {
                        dictAdded = words.size();
                    } else {
                        dictPending = true;
                    }
                }
            }

            RamblerFlagRuntime.refreshLiveFlags();

            StringBuilder summary = new StringBuilder("Restored ");
            summary.append(restoredSections).append(" setting section(s)");
            if (dictAdded > 0) {
                summary.append(" + ").append(dictAdded).append(" dictionary word(s)");
            } else if (dictPending) {
                summary.append(" (dictate once to restore dictionary words)");
            }
            summary.append('.');
            return new ImportResult(true, summary.toString());
        } catch (Throwable err) {
            Log.w(TAG, "Failed to import backup JSON", err);
            return new ImportResult(false, "Invalid backup JSON file.");
        }
    }
}
