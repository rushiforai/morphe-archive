package dev.abotmaker.ramblerenhancements;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.ConscryptMode;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
@ConscryptMode(ConscryptMode.Mode.OFF)
public final class RamblerEnhancementsTest {
    @After
    public void tearDown() {
        RamblerWaveformRuntime.clearForTesting();
        RamblerFlagRuntime.clearForTesting();
        RamblerPreferenceLauncher.clearForTesting();
        RamblerCustomInstructionRules.clearForTesting();
        RamblerTextPipeline.clearForTesting();
        RamblerDictationStats.clearForTesting();
        RamblerMuseStatsBridge.setBackendForTesting(null);
        RamblerDynamicConfig.AGENTIC_CONTEXT_FIELD = "b";
        RamblerDynamicConfig.AGENTIC_EDITOR_INFO_FIELD = "h";
        RamblerDynamicConfig.PCN_GET_EDITOR_INFO_METHOD = "k";
        RamblerDynamicConfig.PCN_PERFORM_ACTION_METHOD = "y";
        RamblerDynamicConfig.FEATURE_WAVEFORM = false;
        RamblerDynamicConfig.FEATURE_CUSTOM_INSTRUCTIONS = false;
        RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY = false;
        RamblerDynamicConfig.FEATURE_CONTACT_NAMES = false;
        RamblerDynamicConfig.FEATURE_CURSOR_EDITING = false;
        RamblerDynamicConfig.FEATURE_APP_CONTEXT = false;
        RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS = false;
        RamblerDynamicConfig.FLAG_NAME_FIELD = "a";
        RamblerDynamicConfig.FLAG_RECOMPUTE_METHOD = "x";
        RamblerDynamicConfig.FLAG_NOTIFY_METHOD = "t";
        RamblerDynamicConfig.DRAWABLE_SHADER_FIELD = "e";
        RamblerDynamicConfig.DRAWABLE_CORNER_RADIUS_FIELD = "h";
        RamblerDynamicConfig.SHADER_PROCESSING_FIELD = "l";
        RamblerDynamicConfig.SHADER_COLLAPSING_FIELD = "i";
        RamblerDynamicConfig.SHADER_EXIT_FADE_FIELD = "j";
        RamblerDynamicConfig.SHADER_GLOBAL_ALPHA_FIELD = "o";
    }

    @Test
    public void dotScopeAndAndroidWaveSimulateAndRenderCleanly() {
        HexDotScopeSimulation sim = new HexDotScopeSimulation();
        sim.configureForBounds(600, 120, 2.0f, 3.0f);
        for (int i = 0; i < 60; i++) {
            sim.advance(1.0f / 60.0f, HexDotScopeSimulation.Stage.RECORDING, true,
                    HexDotScopeSimulation.loudnessFromSpeechLevel(80), false);
        }
        HexDotScopeRenderer dotRenderer = new HexDotScopeRenderer();
        android.graphics.Rect bounds = new android.graphics.Rect(0, 0, 600, 120);
        RamblerWaveformSettings.SettingsSnapshot snapshot =
                new RamblerWaveformSettings.SettingsSnapshot(
                        RamblerWaveformSettings.LISTENING_HEX_DOT_SCOPE,
                        RamblerWaveformSettings.PROCESSING_SWEEP,
                        "#34D399",
                        "#A78BFA",
                        RamblerWaveformSettings.GLOW_LOOK_IOS_HALO,
                        3.0f,
                        1.4f,
                        1.2f);
        RecordingCanvas dotCanvas = new RecordingCanvas();
        dotRenderer.draw(dotCanvas, bounds, 2.0f, 16.0f, 24.0f, 24.0f, 20.0f,
                true, Color.parseColor("#4285F4"), snapshot, sim, 1.0f);
        assertTrue(dotCanvas.clipCount > 0);
        assertTrue(dotCanvas.circleCount > 100);
        assertTrue(dotCanvas.greenDominantDots > 20);

        HexAndroidWaveSimulation wave = new HexAndroidWaveSimulation();
        for (int i = 0; i < 40; i++) {
            wave.advance(1.0f / 60.0f, 0.85f, 1.2f, false);
        }
        HexAndroidWaveRenderer waveRenderer = new HexAndroidWaveRenderer();
        RecordingCanvas waveCanvas = new RecordingCanvas();
        waveRenderer.draw(waveCanvas, bounds, 2.0f, 16.0f, 24.0f, 24.0f, 20.0f,
                true, Color.parseColor("#4285F4"),
                snapshot.withListeningStyle(RamblerWaveformSettings.LISTENING_HEX_ANDROID_WAVE),
                wave, 1.0f);
        assertTrue(waveCanvas.clipCount > 0);
        assertTrue(waveCanvas.circleCount > 120);
        assertTrue(waveCanvas.greenDominantDots > 40);
    }

    @Test
    public void waveformRuntimeHonorsDynamicFieldConfig() {
        RamblerDynamicConfig.DRAWABLE_SHADER_FIELD = "renamedShader";
        RamblerDynamicConfig.DRAWABLE_CORNER_RADIUS_FIELD = "renamedRadius";
        RamblerDynamicConfig.SHADER_PROCESSING_FIELD = "renamedProc";
        RamblerDynamicConfig.SHADER_COLLAPSING_FIELD = "renamedCollapse";
        RamblerDynamicConfig.SHADER_EXIT_FADE_FIELD = "renamedFade";
        RamblerDynamicConfig.SHADER_GLOBAL_ALPHA_FIELD = "renamedAlpha";

        Context context = RuntimeEnvironment.getApplication();
        FrameLayout header = new FrameLayout(context);
        header.layout(0, 0, 1080, 144);
        RenamedRamblerDrawable drawable = new RenamedRamblerDrawable();
        drawable.setBounds(0, 0, 1080, 144);

        RamblerWaveformRuntime.onAttach(header, drawable);
        RamblerWaveformRuntime.onSpeechLevel(75, drawable, header);
        RamblerWaveformRuntime.setSnapshotOverrideForTesting(
                new RamblerWaveformSettings.SettingsSnapshot(
                        RamblerWaveformSettings.LISTENING_HEX_ANDROID_WAVE,
                        RamblerWaveformSettings.PROCESSING_PULSE,
                        "#FF614F",
                        "#22D3EE"));

        Canvas canvas = new Canvas(Bitmap.createBitmap(1080, 144, Bitmap.Config.ARGB_8888));
        assertTrue(RamblerWaveformRuntime.maybeDraw(drawable, canvas));
        drawable.renamedShader.renamedProc = true;
        assertTrue(RamblerWaveformRuntime.maybeDraw(drawable, canvas));
        drawable.renamedShader.renamedCollapse = true;
        assertTrue(RamblerWaveformRuntime.maybeDraw(drawable, canvas));
        drawable.renamedShader.renamedFade = true;
        drawable.renamedShader.renamedAlpha = 0.2f;
        assertTrue(RamblerWaveformRuntime.maybeDraw(drawable, canvas));
    }

    @Test
    public void flagRuntimeGatesBySelectedFeatureAndRefreshesLive() {
        FakeOkiFlag surroundingLimit = new FakeOkiFlag(
                RamblerFlagRuntime.SURROUNDING_TEXT_LIMIT_FLAG, Long.valueOf(1000L));
        FakeOkiFlag customInstr = new FakeOkiFlag(
                RamblerFlagRuntime.CUSTOM_INSTRUCTION_FLAG, Boolean.FALSE);
        FakeOkiFlag appContext = new FakeOkiFlag(
                RamblerFlagRuntime.APP_CONTEXT_FLAG, Boolean.FALSE);

        // When no features are selected, everything passes through unchanged.
        assertFalse(surroundingLimit.recompute());
        assertEquals(Long.valueOf(1000L), surroundingLimit.resolved);
        assertEquals(Boolean.FALSE, RamblerFlagRuntime.applyResolvedFlag(customInstr, Boolean.FALSE));

        // Enable Cursor Editing + Custom Instructions + App Context.
        RamblerFlagRuntime.clearForTesting();
        RamblerDynamicConfig.FEATURE_CURSOR_EDITING = true;
        RamblerDynamicConfig.FEATURE_CUSTOM_INSTRUCTIONS = true;
        RamblerDynamicConfig.FEATURE_APP_CONTEXT = true;
        RamblerDynamicConfig.FLAG_NAME_FIELD = "flagName";
        RamblerDynamicConfig.FLAG_RECOMPUTE_METHOD = "recompute";
        RamblerDynamicConfig.FLAG_NOTIFY_METHOD = "notifyListeners";

        assertEquals(Boolean.TRUE, RamblerFlagRuntime.applyResolvedFlag(customInstr, Boolean.FALSE));
        assertEquals(Boolean.TRUE, RamblerFlagRuntime.applyResolvedFlag(appContext, Boolean.FALSE));

        // Initial compute with append-only OFF keeps 1000L and caches the flag instance.
        RamblerFlagRuntime.setAppendOnlyOverrideForTesting(false);
        surroundingLimit.recompute();
        assertEquals(Long.valueOf(1000L), surroundingLimit.resolved);

        // Flip append-only ON live -> refreshLiveFlags recomputes to 0L and notifies listeners!
        RamblerFlagRuntime.setAppendOnlyOverrideForTesting(true);
        RamblerFlagRuntime.refreshLiveFlags();
        assertEquals(Long.valueOf(0L), surroundingLimit.resolved);
        assertEquals(1, surroundingLimit.notifyCount);

        // Flip append-only OFF live -> refreshLiveFlags restores 1000L and notifies again!
        RamblerFlagRuntime.setAppendOnlyOverrideForTesting(false);
        RamblerFlagRuntime.refreshLiveFlags();
        assertEquals(Long.valueOf(1000L), surroundingLimit.resolved);
        assertEquals(2, surroundingLimit.notifyCount);

        // Verify native SwitchPreferenceCompat writes to default SharedPreferences live-refresh flags!
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences defaultPrefs =
                RamblerEnhancementsSettings.defaultPreferencesOrNull(context);
        defaultPrefs.edit().clear().commit();
        RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY = true;
        RamblerFlagRuntime.setAppendOnlyOverrideForTesting(null);
        RamblerFlagRuntime.seedAndRefreshIfNeeded(context);

        FakeOkiFlag sendWords = new FakeOkiFlag(
                RamblerFlagRuntime.SEND_WORDS_FLAG, Boolean.FALSE);
        sendWords.recompute();
        assertEquals(Boolean.TRUE, sendWords.resolved);

        // Flipping SwitchPreferenceCompat writes directly to default SharedPreferences -> live listener fires!
        defaultPrefs.edit()
                .putBoolean(RamblerEnhancementsSettings.PREF_KEY_USE_DICTIONARY_WORDS, false)
                .commit();
        assertEquals(Boolean.FALSE, sendWords.resolved);
        assertEquals(1, sendWords.notifyCount);

        defaultPrefs.edit()
                .putBoolean(RamblerEnhancementsSettings.PREF_KEY_APPEND_ONLY, true)
                .commit();
        assertEquals(Long.valueOf(0L), surroundingLimit.resolved);
        assertTrue(surroundingLimit.notifyCount >= 3);
    }

    @Test
    public void appendSpacingPreservesCleanBoundaries() {
        assertEquals(" world", RamblerFlagRuntime.adjustAppendSpacing("Hello", "", "world"));
        assertEquals("world", RamblerFlagRuntime.adjustAppendSpacing("Hello ", "", "world"));
        assertEquals(",", RamblerFlagRuntime.adjustAppendSpacing("Hello", "", ","));
        assertEquals("world", RamblerFlagRuntime.adjustAppendSpacing("(", ")", "world"));
        assertEquals(" world ", RamblerFlagRuntime.adjustAppendSpacing("Hello", "there", "world"));
        assertEquals("世界", RamblerFlagRuntime.adjustAppendSpacing("你好", "", "世界"));
    }

    @Test
    public void museStatsWordParsingAndContactsFilteringWork() {
        LinkedHashSet<String> parsed = RamblerMuseStatsBridge.parseWordList(
                "  Morphe, GboardWu;\nrambler\nMORPHE\n  ");
        assertEquals(Arrays.asList("Morphe", "GboardWu", "rambler"),
                new java.util.ArrayList<String>(parsed));
        assertEquals("Morphe\nGboardWu\n",
                RamblerMuseStatsBridge.formatExportText(Arrays.asList("Morphe", "GboardWu")));

        byte[] encoded = RamblerMuseStatsBridge.encodeWordProto("Hex");
        assertEquals(5, encoded.length);
        assertEquals(0x0A, encoded[0]);
        assertEquals(3, encoded[1]);

        LinkedHashSet<String> contacts = RamblerContactsRuntime.selectNewNames(
                Arrays.asList("Alice Smith", "alice smith", "bob@example.com", "+1-555-0100", "Dr. O'Connor"),
                Collections.singleton("Alice Smith"),
                10);
        assertEquals(List.of("Dr. O'Connor"), new java.util.ArrayList<String>(contacts));
    }

    @Test
    public void waveformAndBehaviorSettingsPersistCleanly() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences wPrefs = RamblerWaveformSettings.preferencesOrNull(context);
        wPrefs.edit().clear().commit();
        SharedPreferences ePrefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        ePrefs.edit().clear().commit();
        SharedPreferences defaultPrefs =
                RamblerEnhancementsSettings.defaultPreferencesOrNull(context);
        defaultPrefs.edit().clear().commit();

        assertEquals(RamblerWaveformSettings.LISTENING_HEX_DOT_SCOPE,
                RamblerWaveformSettings.snapshot(context).getListeningStyle());
        assertTrue(RamblerWaveformSettings.writeListeningStyle(
                context, RamblerWaveformSettings.LISTENING_HEX_ANDROID_WAVE));
        assertTrue(RamblerWaveformSettings.writeProcessingStyle(
                context, RamblerWaveformSettings.PROCESSING_SWEEP));
        assertTrue(RamblerWaveformSettings.writeListeningCustomColor(context, "34d399"));
        assertTrue(RamblerWaveformSettings.writeTuning(
                context, RamblerWaveformSettings.GLOW_LOOK_IOS_HALO, 2.6f, 1.8f, 1.5f));

        RamblerWaveformSettings.SettingsSnapshot snap = RamblerWaveformSettings.snapshot(context);
        assertTrue(snap.isAndroidWaveListening());
        assertEquals(HexDotScopeSimulation.ProcessingMode.SWEEP, snap.getProcessingMode());
        assertEquals("#34D399", snap.getListeningColorValue());
        assertTrue(snap.isIosHaloGlow());
        assertNull(RamblerWaveformSettings.tryNormalizeColorHex("bad"));

        assertTrue(RamblerEnhancementsSettings.readUseDictionaryWords(context));
        assertTrue(RamblerEnhancementsSettings.writeUseDictionaryWords(context, false));
        assertFalse(RamblerEnhancementsSettings.readUseDictionaryWords(context));
        assertFalse(defaultPrefs.getBoolean(
                RamblerEnhancementsSettings.PREF_KEY_USE_DICTIONARY_WORDS, true));

        assertFalse(RamblerEnhancementsSettings.readAppendOnly(context));
        assertTrue(RamblerEnhancementsSettings.writeAppendOnly(context, true));
        assertTrue(RamblerEnhancementsSettings.readAppendOnly(context));
        assertTrue(RamblerEnhancementsSettings.writeAppContextEnabled(context, false));
        assertFalse(RamblerEnhancementsSettings.readAppContextEnabled(context));
    }

    @Test
    public void preferenceLauncherConvertsImplicitActionToExplicitOwnPackageIntent() {
        Context context = RuntimeEnvironment.getApplication();
        android.content.Intent implicit = new android.content.Intent(
                RamblerPreferenceLauncher.ACTION_OPEN_SETTINGS);
        implicit.putExtra(
                RamblerEnhancementsActivity.EXTRA_SECTION,
                RamblerEnhancementsActivity.SECTION_WAVEFORM);

        android.content.Intent explicit =
                RamblerPreferenceLauncher.buildExplicitIntent(context, implicit);
        assertEquals(context.getPackageName(), explicit.getComponent().getPackageName());
        assertEquals(
                RamblerEnhancementsActivity.class.getName(),
                explicit.getComponent().getClassName());
        assertEquals(
                RamblerEnhancementsActivity.SECTION_WAVEFORM,
                explicit.getStringExtra(RamblerEnhancementsActivity.EXTRA_SECTION));

        // Unrelated preferences pass through untouched
        FakePreference unrelated = new FakePreference(
                context, new android.content.Intent("android.intent.action.VIEW"));
        assertFalse(RamblerPreferenceLauncher.maybeLaunch(unrelated));
        assertFalse(RamblerPreferenceLauncher.maybeLaunch(new FakePreference(context, null)));
    }

    @Test
    public void gboardProtoPreferenceStoreDrivesLiveTogglesAndInstantFlagRefresh() {
        Context context = RuntimeEnvironment.getApplication();
        String originalPrefsClass = RamblerDynamicConfig.PREFS_CLASS;
        String originalGetInstance = RamblerDynamicConfig.PREFS_GET_INSTANCE_METHOD;
        try {
            FakeGboardPrefs.reset(context);
            RamblerDynamicConfig.FEATURE_CURSOR_EDITING = true;
            RamblerDynamicConfig.FEATURE_APP_CONTEXT = true;
            RamblerDynamicConfig.FLAG_NAME_FIELD = "flagName";
            RamblerDynamicConfig.FLAG_RECOMPUTE_METHOD = "recompute";
            RamblerDynamicConfig.FLAG_NOTIFY_METHOD = "notifyListeners";
            RamblerDynamicConfig.PREFS_CLASS = FakeGboardPrefs.class.getName();
            RamblerDynamicConfig.PREFS_GET_INSTANCE_METHOD = "getInstance";
            RamblerFlagRuntime.clearForTesting();

            // Simulate user flipping native switches in setting_jetson_voice.xml (written to qvt,
            // NOT to Android's <pkg>_preferences.xml).
            FakeGboardPrefs.backing.edit()
                    .putBoolean(RamblerEnhancementsSettings.PREF_KEY_APPEND_ONLY, true)
                    .putBoolean(RamblerEnhancementsSettings.PREF_KEY_APP_CONTEXT_ENABLED, false)
                    .commit();

            FakeOkiFlag surroundingLimit = new FakeOkiFlag(
                    RamblerFlagRuntime.SURROUNDING_TEXT_LIMIT_FLAG, Long.valueOf(2000L));
            FakeOkiFlag reselectAfterEdit = new FakeOkiFlag(
                    RamblerFlagRuntime.RESELECT_AFTER_EDIT_FLAG, Boolean.FALSE);
            FakeOkiFlag appContext = new FakeOkiFlag(
                    RamblerFlagRuntime.APP_CONTEXT_FLAG, Boolean.FALSE);

            RamblerFlagRuntime.seedAndRefreshIfNeeded(context);
            assertTrue(surroundingLimit.recompute());
            assertEquals(Long.valueOf(0L), surroundingLimit.resolved);
            assertFalse(reselectAfterEdit.recompute());
            assertEquals(Boolean.FALSE, reselectAfterEdit.resolved);
            assertFalse(appContext.recompute());
            assertEquals(Boolean.FALSE, appContext.resolved);

            // Live flip inside Gboard's native qvt store triggers immediate flag refresh!
            FakeGboardPrefs.instance.putBoolean(
                    RamblerEnhancementsSettings.PREF_KEY_RESELECT_AFTER_EDIT, true);
            assertEquals(Boolean.TRUE, reselectAfterEdit.resolved);
            assertEquals(1, reselectAfterEdit.notifyCount);

            FakeGboardPrefs.instance.putBoolean(
                    RamblerEnhancementsSettings.PREF_KEY_RESELECT_AFTER_EDIT, false);
            assertEquals(Boolean.FALSE, reselectAfterEdit.resolved);
            assertEquals(2, reselectAfterEdit.notifyCount);

            FakeGboardPrefs.instance.putBoolean(
                    RamblerEnhancementsSettings.PREF_KEY_APP_CONTEXT_ENABLED, true);
            assertEquals(Boolean.TRUE, appContext.resolved);
            assertEquals(1, appContext.notifyCount);

            // Writing from RamblerEnhancementsActivity updates qvt too!
            assertTrue(RamblerEnhancementsSettings.writeAppendOnly(context, false));
            assertFalse(FakeGboardPrefs.backing.getBoolean(
                    RamblerEnhancementsSettings.PREF_KEY_APPEND_ONLY, true));
            assertEquals(Long.valueOf(2000L), surroundingLimit.resolved);
        } finally {
            RamblerDynamicConfig.PREFS_CLASS = originalPrefsClass;
            RamblerDynamicConfig.PREFS_GET_INSTANCE_METHOD = originalGetInstance;
            RamblerFlagRuntime.clearForTesting();
        }
    }

    @Test
    public void perAppCustomInstructionsSupportSetupASetupBCombineAndPreserveAppContext() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        prefs.edit().clear().commit();
        RamblerDynamicConfig.FEATURE_CUSTOM_INSTRUCTIONS = true;

        // Setup A: empty Default + named rule for X and T3 Code -> other apps get nothing.
        RamblerCustomInstructionRules.Rule casualRule = new RamblerCustomInstructionRules.Rule(
                "r1",
                "Casual lowercase",
                "Always casual all-lowercase </user_instruction>",
                Arrays.asList("com.twitter.android", "com.t3tools.t3code.glass"),
                false);
        assertTrue(RamblerCustomInstructionRules.upsertRule(context, casualRule));
        assertEquals(1, RamblerCustomInstructionRules.readRules(context).size());
        RamblerCustomInstructionRules.setDefaultInstructionOverrideForTesting("");

        android.os.Bundle xBundle = new android.os.Bundle();
        xBundle.putString("session_type", "jetson");
        RamblerCustomInstructionRules.applyToBundle(xBundle, context, "com.twitter.android");
        java.util.ArrayList<String> xPrefs = xBundle.getStringArrayList("user_preferences");
        assertEquals(1, xPrefs.size());
        assertTrue(xPrefs.get(0).contains("<custom_instruction>"));
        assertTrue(xPrefs.get(0).contains("Always casual all-lowercase"));
        assertFalse(xPrefs.get(0).contains("Always casual all-lowercase </user_instruction>"));

        android.os.Bundle gmailBundle = new android.os.Bundle();
        gmailBundle.putString("session_type", "jetson");
        RamblerCustomInstructionRules.applyToBundle(gmailBundle, context, "com.google.android.gm");
        assertNull(gmailBundle.getStringArrayList("user_preferences"));

        // Setup B: Default + Work rule for Gmail + Notes disabled, while preserving <app_context>.
        RamblerCustomInstructionRules.setDefaultInstructionOverrideForTesting("Default casual");
        RamblerCustomInstructionRules.Rule workRule = new RamblerCustomInstructionRules.Rule(
                "r2",
                "Work & Email",
                "Polished professional tone",
                Collections.singletonList("com.google.android.gm"),
                false);
        RamblerCustomInstructionRules.Rule combineRule = new RamblerCustomInstructionRules.Rule(
                "r3",
                "Slack extra",
                "Use bullet points",
                Collections.singletonList("com.Slack"),
                true);
        assertTrue(RamblerCustomInstructionRules.upsertRule(context, workRule));
        assertTrue(RamblerCustomInstructionRules.upsertRule(context, combineRule));
        assertTrue(RamblerCustomInstructionRules.writeDisabledApps(
                context, Collections.singletonList("com.oneplus.note")));

        // Notes is disabled -> strips <custom_instruction> but keeps <app_context>!
        android.os.Bundle notesBundle = new android.os.Bundle();
        java.util.ArrayList<String> initialNotesPrefs = new java.util.ArrayList<String>(
                Arrays.asList("<app_context>\nApp Name: Notes\n</app_context>",
                        RamblerCustomInstructionRules.wrapCustomInstruction("Default casual")));
        notesBundle.putStringArrayList("user_preferences", initialNotesPrefs);
        RamblerCustomInstructionRules.applyToBundle(notesBundle, context, "com.oneplus.note");
        java.util.ArrayList<String> afterNotes = notesBundle.getStringArrayList("user_preferences");
        assertEquals(1, afterNotes.size());
        assertTrue(afterNotes.get(0).contains("<app_context>"));

        // Slack combines Default + rule.
        android.os.Bundle slackBundle = new android.os.Bundle();
        RamblerCustomInstructionRules.applyToBundle(slackBundle, context, "com.Slack");
        String slackInstr = slackBundle.getStringArrayList("user_preferences").get(0);
        assertTrue(slackInstr.contains("Default casual\nUse bullet points"));

        // End-to-end reflective captureSessionContext + applyPerAppCustomInstruction hook test.
        RamblerDynamicConfig.AGENTIC_CONTEXT_FIELD = "ctx";
        RamblerDynamicConfig.AGENTIC_EDITOR_INFO_FIELD = "editor";
        android.view.inputmethod.EditorInfo gmailEditor = new android.view.inputmethod.EditorInfo();
        gmailEditor.packageName = "com.google.android.gm";
        FakeAgenticExtension fakeExt = new FakeAgenticExtension(context, gmailEditor);
        android.os.Bundle hookedBundle = new android.os.Bundle();
        RamblerCustomInstructionRules.captureSessionContext(fakeExt);
        RamblerCustomInstructionRules.applyPerAppCustomInstruction(hookedBundle);
        String hookedInstr = hookedBundle.getStringArrayList("user_preferences").get(0);
        assertTrue(hookedInstr.contains("Polished professional tone"));
        assertFalse(hookedInstr.contains("Default casual"));
    }

    @Test
    public void handsFreeVoiceSendSearchSnippetsFindReplaceStripPeriodAndHistoryWork() {
        Context context = RuntimeEnvironment.getApplication();
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        prefs.edit().clear().commit();
        RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS = true;
        RamblerFlagRuntime.seedApplicationContext(context);

        // Configure snippets, find/replace, strip trailing period, and voice send/search.
        RamblerEnhancementsSettings.writeVoiceSendEnabled(context, true);
        RamblerEnhancementsSettings.writeVoiceSendTriggers(context, "hit send, send it");
        RamblerEnhancementsSettings.writeVoiceSearchEnabled(context, true);
        RamblerEnhancementsSettings.writeVoiceSearchTriggers(context, "hit search");
        RamblerEnhancementsSettings.writeStripTrailingPeriod(context, true);
        RamblerEnhancementsSettings.writeHistoryEnabled(context, true);

        RamblerTextPipeline.upsertSnippet(
                context,
                new RamblerTextPipeline.SnippetRule(
                        "s1", "my email", "alex.dev+work@example.com", true));
        RamblerTextPipeline.upsertSnippet(
                context,
                new RamblerTextPipeline.SnippetRule(
                        "s2", "dollar tag", "$100\\cash", true));
        RamblerTextPipeline.upsertReplaceRule(
                context,
                new RamblerTextPipeline.ReplaceRule(
                        "rep1", "g board", "Gboard", false, false, null, true));
        RamblerTextPipeline.upsertReplaceRule(
                context,
                new RamblerTextPipeline.ReplaceRule(
                        "rep2", "\\bPR (\\d+)\\b", "PR#$1", true, false,
                        Collections.singletonList("com.Slack"), true));

        // 1. WhatsApp chat WITH IME_ACTION_SEND: strips ", hit send.", expands snippet, fires SEND.
        android.view.inputmethod.EditorInfo whatsappSend = new android.view.inputmethod.EditorInfo();
        whatsappSend.packageName = "com.whatsapp";
        whatsappSend.imeOptions = android.view.inputmethod.EditorInfo.IME_ACTION_SEND;

        final int[] dispatchedAction = {0};
        FakePcn fakePcn = new FakePcn(whatsappSend);
        RamblerTextPipeline.setActionDispatcherForTesting((p, action) -> {
            dispatchedAction[0] = action;
            RamblerTextPipeline.invokePerformEditorAction(p, action);
        });

        String out1 = RamblerTextPipeline.processCommitText(
                fakePcn, "Pls send g board details to my email, hit send.");
        assertEquals("Pls send Gboard details to alex.dev+work@example.com", out1);
        assertEquals(android.view.inputmethod.EditorInfo.IME_ACTION_SEND, dispatchedAction[0]);
        assertEquals(android.view.inputmethod.EditorInfo.IME_ACTION_SEND, fakePcn.lastPerformedAction);

        // 2. Same WhatsApp chat, normal message mentioning "send" WITHOUT trigger -> does NOT send!
        dispatchedAction[0] = 0;
        fakePcn.lastPerformedAction = 0;
        String out2 = RamblerTextPipeline.processCommitText(fakePcn, "Pls send me the money.");
        assertEquals("Pls send me the money", out2); // trailing period stripped!
        assertEquals(0, dispatchedAction[0]);

        // 3. Notes app (NO Send IME action) -> saying "hit send" does NOT strip or trigger!
        android.view.inputmethod.EditorInfo notesEditor = new android.view.inputmethod.EditorInfo();
        notesEditor.packageName = "com.oneplus.note";
        notesEditor.imeOptions = android.view.inputmethod.EditorInfo.IME_ACTION_NONE;
        FakePcn notesPcn = new FakePcn(notesEditor);
        String out3 = RamblerTextPipeline.processCommitText(notesPcn, "Remember to hit send...");
        assertEquals("Remember to hit send...", out3); // ellipsis preserved!
        assertEquals(0, notesPcn.lastPerformedAction);

        // 4. Multi-line field with IME_FLAG_NO_ENTER_ACTION -> NEVER triggers Send!
        android.view.inputmethod.EditorInfo noEnterSend = new android.view.inputmethod.EditorInfo();
        noEnterSend.packageName = "com.twitter.android";
        noEnterSend.imeOptions = android.view.inputmethod.EditorInfo.IME_ACTION_SEND
                | android.view.inputmethod.EditorInfo.IME_FLAG_NO_ENTER_ACTION;
        FakePcn xPcn = new FakePcn(noEnterSend);
        String out4 = RamblerTextPipeline.processCommitText(xPcn, "Draft tweet, hit send.");
        assertEquals("Draft tweet, hit send", out4);
        assertEquals(0, xPcn.lastPerformedAction);

        // 5. Search bar with IME_ACTION_SEARCH -> strips trigger and fires SEARCH!
        android.view.inputmethod.EditorInfo searchEditor = new android.view.inputmethod.EditorInfo();
        searchEditor.packageName = "com.android.chrome";
        searchEditor.imeOptions = android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH;
        FakePcn chromePcn = new FakePcn(searchEditor);
        String out5 = RamblerTextPipeline.processCommitText(chromePcn, "weather in tokyo, hit search.");
        assertEquals("weather in tokyo", out5);
        assertEquals(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH, chromePcn.lastPerformedAction);

        // 6. Per-app regex replace + literal $/\ snippet safety + abbreviation preservation.
        android.view.inputmethod.EditorInfo slackEditor = new android.view.inputmethod.EditorInfo();
        slackEditor.packageName = "com.Slack";
        FakePcn slackPcn = new FakePcn(slackEditor);
        String out6 = RamblerTextPipeline.processCommitText(
                slackPcn, "Merged PR 42 with dollar tag e.g.");
        assertEquals("Merged PR#42 with $100\\cash e.g.", out6);

        // 7. Standalone "Hit send." -> empty text commit + fires SEND!
        fakePcn.lastPerformedAction = 0;
        String out7 = RamblerTextPipeline.processCommitText(fakePcn, "Hit send.");
        assertEquals("", out7);
        assertEquals(android.view.inputmethod.EditorInfo.IME_ACTION_SEND, fakePcn.lastPerformedAction);

        // 8. Local dictation history recorded non-empty commits (newest first) & supports delete/clear.
        List<RamblerTextPipeline.HistoryEntry> hist = RamblerTextPipeline.readHistory(context);
        assertEquals(6, hist.size()); // out7 was empty so not stored
        assertEquals("Merged PR#42 with $100\\cash e.g.", hist.get(0).text);
        assertEquals("com.Slack", hist.get(0).packageName);
        assertTrue(RamblerTextPipeline.deleteHistoryEntry(context, hist.get(0).id));
        assertEquals(5, RamblerTextPipeline.readHistory(context).size());
        assertTrue(RamblerTextPipeline.clearHistory(context));
        assertTrue(RamblerTextPipeline.readHistory(context).isEmpty());
    }

    @Test
    public void perAppBehaviorOverridesRetryAndSessionDurationRefreshLiveFlags() {
        Context context = RuntimeEnvironment.getApplication();
        RamblerEnhancementsSettings.preferencesOrNull(context).edit().clear().commit();
        RamblerEnhancementsSettings.defaultPreferencesOrNull(context).edit().clear().commit();
        RamblerDynamicConfig.FEATURE_CURSOR_EDITING = true;
        RamblerDynamicConfig.FEATURE_APP_CONTEXT = true;
        RamblerDynamicConfig.FEATURE_CUSTOM_INSTRUCTIONS = true;
        RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS = true;
        RamblerDynamicConfig.FLAG_NAME_FIELD = "flagName";
        RamblerDynamicConfig.FLAG_RECOMPUTE_METHOD = "recompute";
        RamblerDynamicConfig.FLAG_NOTIFY_METHOD = "notifyListeners";
        RamblerDynamicConfig.AGENTIC_CONTEXT_FIELD = "ctx";

        // Global defaults: Append-only OFF, App context ON, Strip trailing period OFF.
        RamblerEnhancementsSettings.writeAppendOnly(context, false);
        RamblerEnhancementsSettings.writeAppContextEnabled(context, true);
        RamblerEnhancementsSettings.writeStripTrailingPeriod(context, false);

        // Behavior-only app rule for X: force Append-only ON, App context OFF, Strip period ON.
        RamblerCustomInstructionRules.upsertRule(
                context,
                new RamblerCustomInstructionRules.Rule(
                        "x_beh",
                        "X behavior",
                        "",
                        Collections.singletonList("com.twitter.android"),
                        false,
                        RamblerCustomInstructionRules.OVERRIDE_ON,
                        RamblerCustomInstructionRules.OVERRIDE_OFF,
                        RamblerCustomInstructionRules.OVERRIDE_ON));

        FakeOkiFlag surroundingLimit = new FakeOkiFlag(
                RamblerFlagRuntime.SURROUNDING_TEXT_LIMIT_FLAG, Long.valueOf(2000L));
        FakeOkiFlag appContext = new FakeOkiFlag(
                RamblerFlagRuntime.APP_CONTEXT_FLAG, Boolean.FALSE);
        FakeOkiFlag autoRetry = new FakeOkiFlag(
                RamblerFlagRuntime.AUTO_PARALLEL_RETRY_FLAG, Boolean.FALSE);
        FakeOkiFlag pcmCache = new FakeOkiFlag(
                RamblerFlagRuntime.PCM_AUDIO_CACHING_FLAG, Boolean.FALSE);
        FakeOkiFlag maxSession = new FakeOkiFlag(
                RamblerFlagRuntime.MAX_SESSION_DURATION_FLAG, Long.valueOf(300L));

        RamblerFlagRuntime.seedAndRefreshIfNeeded(context);
        surroundingLimit.recompute();
        appContext.recompute();
        autoRetry.recompute();
        pcmCache.recompute();
        maxSession.recompute();

        assertEquals(Long.valueOf(2000L), surroundingLimit.resolved);
        assertEquals(Boolean.TRUE, appContext.resolved);
        assertEquals(Boolean.FALSE, autoRetry.resolved);
        assertEquals(Long.valueOf(300L), maxSession.resolved);

        // Activate in X -> live flags flip immediately before session starts!
        android.view.inputmethod.EditorInfo xEd = new android.view.inputmethod.EditorInfo();
        xEd.packageName = "com.twitter.android";
        RamblerTextPipeline.onExtensionActivate(new FakeAgenticExtension(context, xEd), xEd);
        assertEquals(Long.valueOf(0L), surroundingLimit.resolved);
        assertEquals(Boolean.FALSE, appContext.resolved);
        assertTrue(RamblerTextPipeline.shouldStripTrailingPeriod(context, "com.twitter.android"));

        // Switch to Notes -> flags immediately revert to global defaults!
        android.view.inputmethod.EditorInfo notesEd = new android.view.inputmethod.EditorInfo();
        notesEd.packageName = "com.oneplus.note";
        RamblerTextPipeline.onExtensionActivate(new FakeAgenticExtension(context, notesEd), notesEd);
        assertEquals(Long.valueOf(2000L), surroundingLimit.resolved);
        assertEquals(Boolean.TRUE, appContext.resolved);
        assertFalse(RamblerTextPipeline.shouldStripTrailingPeriod(context, "com.oneplus.note"));

        // Toggle Auto parallel retry + Longer dictation session (10 min = 600s) -> live refresh!
        assertTrue(RamblerEnhancementsSettings.writeAutoParallelRetryEnabled(context, true));
        assertEquals(Boolean.TRUE, autoRetry.resolved);
        assertEquals(Boolean.TRUE, pcmCache.resolved);

        assertTrue(RamblerEnhancementsSettings.writeMaxSessionSeconds(context, 600));
        assertEquals(Long.valueOf(600L), maxSession.resolved);
        assertTrue(RamblerEnhancementsSettings.writeMaxSessionSeconds(context, 0));
        assertEquals(Long.valueOf(300L), maxSession.resolved);
    }

    @Test
    public void backupManagerRoundTripsAllSettingsCleanly() {
        Context context = RuntimeEnvironment.getApplication();
        RamblerWaveformSettings.preferencesOrNull(context).edit().clear().commit();
        RamblerEnhancementsSettings.preferencesOrNull(context).edit().clear().commit();
        RamblerEnhancementsSettings.defaultPreferencesOrNull(context).edit().clear().commit();

        final java.util.List<String> fakeDictWords = new java.util.ArrayList<String>(
                Arrays.asList("Morphe", "GboardWu"));
        final String[] fakeCustomInstr = {"Default prompt"};
        RamblerMuseStatsBridge.setBackendForTesting(new RamblerMuseStatsBridge.Backend() {
            @Override
            public List<String> readWords(Context c) {
                return new java.util.ArrayList<String>(fakeDictWords);
            }

            @Override
            public boolean addWords(Context c, java.util.Collection<String> words) {
                for (String w : words) {
                    if (!fakeDictWords.contains(w)) {
                        fakeDictWords.add(w);
                    }
                }
                return true;
            }

            @Override
            public boolean removeWord(Context c, String word) {
                return fakeDictWords.remove(word);
            }

            @Override
            public boolean clearAllWords(Context c) {
                fakeDictWords.clear();
                return true;
            }

            @Override
            public String readCustomInstruction(Context c) {
                return fakeCustomInstr[0];
            }

            @Override
            public boolean writeCustomInstruction(Context c, String value) {
                fakeCustomInstr[0] = value;
                return true;
            }
        });

        RamblerWaveformSettings.writeListeningStyle(
                context, RamblerWaveformSettings.LISTENING_HEX_ANDROID_WAVE);
        RamblerWaveformSettings.writeListeningCustomColor(context, "#22D3EE");
        RamblerEnhancementsSettings.writeAppendOnly(context, true);
        RamblerEnhancementsSettings.writeAutoParallelRetryEnabled(context, true);
        RamblerEnhancementsSettings.writeMaxSessionSeconds(context, 900);
        RamblerEnhancementsSettings.writeVoiceSendEnabled(context, true);
        RamblerEnhancementsSettings.writeVoiceSendTriggers(context, "fire away");
        RamblerCustomInstructionRules.upsertRule(
                context,
                new RamblerCustomInstructionRules.Rule(
                        "r1", "Chat", "Casual", Collections.singletonList("com.whatsapp"),
                        false, RamblerCustomInstructionRules.OVERRIDE_ON,
                        RamblerCustomInstructionRules.OVERRIDE_INHERIT,
                        RamblerCustomInstructionRules.OVERRIDE_ON));
        RamblerTextPipeline.upsertSnippet(
                context, new RamblerTextPipeline.SnippetRule("sn1", "sig", "Best, Alex", true));
        RamblerTextPipeline.upsertReplaceRule(
                context, new RamblerTextPipeline.ReplaceRule(
                        "rp1", "teh", "the", false, false, null, true));
        RamblerTextPipeline.recordHistory(context, "com.whatsapp", "Private secret", 1234L);

        String exported = RamblerBackupManager.exportJson(context);
        assertFalse("Private dictation history must not be included in backups",
                exported.contains("Private secret"));

        // Wipe everything and re-import!
        RamblerWaveformSettings.preferencesOrNull(context).edit().clear().commit();
        RamblerEnhancementsSettings.preferencesOrNull(context).edit().clear().commit();
        RamblerEnhancementsSettings.defaultPreferencesOrNull(context).edit().clear().commit();
        fakeDictWords.clear();
        fakeCustomInstr[0] = "";

        RamblerBackupManager.ImportResult res = RamblerBackupManager.importJson(context, exported);
        assertTrue(res.message, res.success);
        assertEquals(RamblerWaveformSettings.LISTENING_HEX_ANDROID_WAVE,
                RamblerWaveformSettings.snapshot(context).getListeningStyle());
        assertEquals("#22D3EE",
                RamblerWaveformSettings.snapshot(context).getListeningColorValue());
        assertTrue(RamblerEnhancementsSettings.readAppendOnly(context));
        assertTrue(RamblerEnhancementsSettings.readAutoParallelRetryEnabled(context));
        assertEquals(900, RamblerEnhancementsSettings.readMaxSessionSeconds(context));
        assertTrue(RamblerEnhancementsSettings.readVoiceSendEnabled(context));
        assertEquals("fire away", RamblerEnhancementsSettings.readVoiceSendTriggers(context));
        assertEquals("Default prompt", fakeCustomInstr[0]);
        assertEquals(1, RamblerCustomInstructionRules.readRules(context).size());
        assertEquals(RamblerCustomInstructionRules.OVERRIDE_ON,
                RamblerCustomInstructionRules.readRules(context).get(0).stripTrailingPeriodOverride);
        assertEquals(1, RamblerTextPipeline.readSnippets(context).size());
        assertEquals(1, RamblerTextPipeline.readReplaceRules(context).size());
        assertEquals(Arrays.asList("Morphe", "GboardWu"), fakeDictWords);
    }

    @Test
    public void settingsHubAndSectionNormalizationAvoidDuplication() {
        assertEquals(RamblerEnhancementsActivity.SECTION_DICTIONARY,
                RamblerEnhancementsActivity.normalizeSection(
                        RamblerEnhancementsActivity.SECTION_CONTACTS));
        assertEquals(RamblerEnhancementsActivity.SECTION_BEHAVIOR,
                RamblerEnhancementsActivity.normalizeSection(
                        RamblerEnhancementsActivity.SECTION_BEHAVIOR));
        assertNull(RamblerEnhancementsActivity.normalizeSection(""));
        assertNull(RamblerEnhancementsActivity.normalizeSection("unknown"));

        assertEquals("Rambler Enhancements",
                RamblerEnhancementsActivity.titleForSection(null));
        assertEquals("Instructions & app rules",
                RamblerEnhancementsActivity.titleForSection(
                        RamblerEnhancementsActivity.SECTION_CUSTOM_INSTRUCTIONS));
        assertEquals("Dictation & reliability",
                RamblerEnhancementsActivity.titleForSection(
                        RamblerEnhancementsActivity.SECTION_BEHAVIOR));
        assertEquals("Voice dictionary & contacts",
                RamblerEnhancementsActivity.titleForSection(
                        RamblerEnhancementsActivity.SECTION_CONTACTS));
        assertEquals("Dictation stats & history",
                RamblerEnhancementsActivity.titleForSection(
                        RamblerEnhancementsActivity.SECTION_HISTORY));
    }

    @Test
    public void onDeviceDictationStatsTrackWordsWpmLatencyTimeSavedPrivacyAndCardRender() {
        Context context = RuntimeEnvironment.getApplication();
        RamblerEnhancementsSettings.preferencesOrNull(context).edit().clear().commit();
        RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS = true;
        RamblerFlagRuntime.seedApplicationContext(context);

        // Word counter handles contractions, hyphens, punctuation, and CJK accurately.
        assertEquals(0, RamblerDictationStats.countWords("   ...   "));
        assertEquals(4, RamblerDictationStats.countWords("Don't stop well-known tests!"));
        assertEquals(6, RamblerDictationStats.countWords("今天天氣很好"));

        final long[] elapsed = {10_000L};
        final long[] wall = {1_795_600_000_000L}; // Day 1
        RamblerDictationStats.setClockForTesting(new RamblerDictationStats.Clock() {
            @Override
            public long elapsedRealtime() {
                return elapsed[0];
            }

            @Override
            public long currentTimeMillis() {
                return wall[0];
            }
        });

        android.view.inputmethod.EditorInfo ed = new android.view.inputmethod.EditorInfo();
        ed.packageName = "com.whatsapp";
        FakePcn pcn = new FakePcn(ed);

        // Session 1: 20 words spoken over 8,000 ms (150 WPM), 600 ms cloud latency.
        RamblerDictationStats.onVoiceStart();
        elapsed[0] += 8_000L;
        RamblerDictationStats.onListeningStop();
        elapsed[0] += 600L;
        String s1 = "one two three four five six seven eight nine ten "
                + "eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty";
        RamblerTextPipeline.processCommitText(pcn, s1);

        RamblerDictationStats.StatsSnapshot snap1 = RamblerDictationStats.readSnapshot(context);
        assertEquals(20L, snap1.totalWords);
        assertEquals(1L, snap1.totalSessions);
        assertEquals(150, snap1.averageWpm());
        assertEquals(150, snap1.bestWpm);
        assertEquals(600L, snap1.averageLatencyMs());
        assertEquals(600L, snap1.lastLatencyMs);
        // At 40 WPM baseline: 20 words = 30,000 ms typing - (8,000 + 600) ms = 21,400 ms saved!
        assertEquals(21_400L, snap1.estimatedTimeSavedMs(40));
        assertEquals("21s", RamblerDictationStats.formatTimeSaved(snap1.estimatedTimeSavedMs(40), true));
        assertEquals("600 ms", RamblerDictationStats.formatLatency(snap1.averageLatencyMs()));

        // Session 2 on next calendar day: 30 words over 12,000 ms (150 WPM), 1,400 ms latency.
        // Turning OFF text history must NOT stop anonymous stats tracking!
        RamblerEnhancementsSettings.writeHistoryEnabled(context, false);
        wall[0] += 86_400_000L; // +1 day
        elapsed[0] += 5_000L;
        RamblerDictationStats.onVoiceStart();
        elapsed[0] += 12_000L;
        RamblerDictationStats.onListeningStop();
        elapsed[0] += 1_400L;
        RamblerTextPipeline.processCommitText(pcn, s1 + " alpha beta gamma delta epsilon zeta eta theta iota kappa");

        RamblerDictationStats.StatsSnapshot snap2 = RamblerDictationStats.readSnapshot(context);
        assertEquals(50L, snap2.totalWords);
        assertEquals(2L, snap2.totalSessions);
        assertEquals(150, snap2.averageWpm()); // (50 * 60000) / 20000 = 150
        assertEquals(1000L, snap2.averageLatencyMs()); // (600 + 1400) / 2 = 1000
        assertEquals("1.00s", RamblerDictationStats.formatLatency(snap2.averageLatencyMs()));
        assertEquals(1400L, snap2.lastLatencyMs);
        // Daily counters rolled over cleanly for Day 2!
        assertEquals(30L, snap2.todayWordsFor(RamblerDictationStats.currentDayKey()));
        assertEquals(1L, snap2.todaySessionsFor(RamblerDictationStats.currentDayKey()));
        // Typing 50 words @ 40 WPM = 75,000 ms; actual = 20,000 + 2,000 = 22,000 ms -> 53,000 ms saved!
        assertEquals(53_000L, snap2.estimatedTimeSavedMs(40));

        // Disabling stats tracking ignores new commits cleanly.
        RamblerEnhancementsSettings.writeStatsEnabled(context, false);
        elapsed[0] += 2_000L;
        RamblerDictationStats.onVoiceStart();
        elapsed[0] += 3_000L;
        RamblerDictationStats.onListeningStop();
        elapsed[0] += 500L;
        RamblerTextPipeline.processCommitText(pcn, "ignored words while paused");
        assertEquals(50L, RamblerDictationStats.readSnapshot(context).totalWords);
        assertEquals(2L, RamblerDictationStats.readSnapshot(context).totalSessions);

        // JSON backup preserves typingBaselineWpm & statsEnabled but NEVER exports private counters!
        RamblerEnhancementsSettings.writeStatsEnabled(context, true);
        RamblerEnhancementsSettings.writeTypingBaselineWpm(context, 50);
        String backup = RamblerBackupManager.exportJson(context);
        assertTrue(backup.contains("\"typingBaselineWpm\": 50"));
        assertFalse("Private stats counters must not be exported", backup.contains("totalSpeakingMs"));
        assertFalse("Private stats counters must not be exported", backup.contains("latencySamples"));

        // Compact & full stats cards inflate cleanly in Robolectric with non-empty child views.
        android.widget.LinearLayout compactCard =
                RamblerStatsCardView.buildCard(context, true, () -> {}, null);
        android.widget.LinearLayout fullCard =
                RamblerStatsCardView.buildCard(context, false, null, () -> {});
        assertTrue(compactCard.getChildCount() >= 4);
        assertTrue(fullCard.getChildCount() >= 5);

        // Reset clears all counters cleanly.
        assertTrue(RamblerDictationStats.resetStats(context));
        RamblerDictationStats.StatsSnapshot cleared = RamblerDictationStats.readSnapshot(context);
        assertTrue(cleared.isEmpty());
        assertEquals(0L, cleared.totalWords);
        assertEquals(0, cleared.averageWpm());
        assertEquals("—", RamblerDictationStats.formatTimeSaved(0L, false));
    }

    @SuppressWarnings("unused")
    public static final class FakePcn {
        final android.view.inputmethod.EditorInfo editorInfo;
        int lastPerformedAction;

        FakePcn(android.view.inputmethod.EditorInfo editorInfo) {
            this.editorInfo = editorInfo;
        }

        public android.view.inputmethod.EditorInfo k() {
            return editorInfo;
        }

        public void y(int action) {
            lastPerformedAction = action;
        }
    }

    @SuppressWarnings("unused")
    private static final class FakeAgenticExtension {
        final Context ctx;
        final android.view.inputmethod.EditorInfo editor;

        FakeAgenticExtension(Context ctx, android.view.inputmethod.EditorInfo editor) {
            this.ctx = ctx;
            this.editor = editor;
        }
    }

    @SuppressWarnings("unused")
    public interface FakeGboardPrefListener {
        void onPrefChanged(FakeGboardPrefs prefs, String key);
    }

    @SuppressWarnings("unused")
    public static final class FakeGboardPrefs {
        static FakeGboardPrefs instance;
        static SharedPreferences backing;
        final java.util.function.Supplier<SharedPreferences> e = () -> backing;
        private final java.util.Map<String, java.util.List<FakeGboardPrefListener>> listeners =
                new java.util.HashMap<String, java.util.List<FakeGboardPrefListener>>();

        static void reset(Context context) {
            backing = context.getSharedPreferences("fake_gboard_proto_prefs", Context.MODE_PRIVATE);
            backing.edit().clear().commit();
            instance = new FakeGboardPrefs();
        }

        public static FakeGboardPrefs getInstance(Context context) {
            return instance;
        }

        public void registerListener(FakeGboardPrefListener listener, String key) {
            listeners.computeIfAbsent(key, k -> new java.util.ArrayList<FakeGboardPrefListener>())
                    .add(listener);
        }

        public void putBoolean(String key, boolean value) {
            backing.edit().putBoolean(key, value).commit();
            java.util.List<FakeGboardPrefListener> list = listeners.get(key);
            if (list != null) {
                for (FakeGboardPrefListener l : list) {
                    l.onPrefChanged(this, key);
                }
            }
        }
    }

    @SuppressWarnings("unused")
    private static final class FakePreference {
        final Context j;
        final android.content.Intent s;

        FakePreference(Context j, android.content.Intent s) {
            this.j = j;
            this.s = s;
        }
    }

    @SuppressWarnings("unused")
    private static final class FakeOkiFlag {
        final String flagName;
        final Object rawValue;
        Object resolved;
        int notifyCount;

        FakeOkiFlag(String flagName, Object rawValue) {
            this.flagName = flagName;
            this.rawValue = rawValue;
            this.resolved = rawValue;
        }

        boolean recompute() {
            Object next = RamblerFlagRuntime.applyResolvedFlag(this, rawValue);
            boolean changed = resolved == null ? next != null : !resolved.equals(next);
            resolved = next;
            return changed;
        }

        void notifyListeners() {
            notifyCount++;
        }
    }

    private static final class RecordingCanvas extends Canvas {
        int circleCount;
        int clipCount;
        int greenDominantDots;

        @Override
        public boolean clipPath(android.graphics.Path path) {
            clipCount++;
            return true;
        }

        @Override
        public void drawCircle(float cx, float cy, float radius, android.graphics.Paint paint) {
            if (paint == null || radius <= 0.0f) {
                return;
            }
            int color = paint.getColor();
            if (Color.alpha(color) > 0) {
                circleCount++;
                int r = Color.red(color);
                int g = Color.green(color);
                int b = Color.blue(color);
                if (g > r && g > b) {
                    greenDominantDots++;
                }
            }
        }
    }

    @SuppressWarnings("unused")
    private static final class RenamedRamblerDrawable extends Drawable {
        public final RenamedShaderState renamedShader = new RenamedShaderState();
        public float renamedRadius = 32.0f;

        @Override
        public void draw(Canvas canvas) {
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    @SuppressWarnings("unused")
    private static final class RenamedShaderState {
        public boolean renamedProc = false;
        public boolean renamedCollapse = false;
        public boolean renamedFade = false;
        public float renamedAlpha = 1.0f;
    }
}
