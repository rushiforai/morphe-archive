package dev.abotmaker.ramblerenhancements;

import android.text.InputType;
import android.view.inputmethod.EditorInfo;

import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix;
import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerSegmentLock;
import com.akshaykadam.pixelboard.extension.ramblerlite.GboardRamblerLiteScriptRuntime;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

public class RamblerBanglaRuntimeTest {

    @After
    public void tearDown() {
        GboardRamblerScriptFix.jvmLayoutKind = 0;
        GboardRamblerScriptFix.setActiveGboardKeyboard(null, null);
        GboardRamblerLiteScriptRuntime.resetActiveKeyboardModeForTesting();
        GboardRamblerSegmentLock.resetPin();
        RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC = false;
        RamblerDynamicConfig.FEATURE_RAMBLER_EXTRAS = false;
        RamblerDynamicConfig.FEATURE_HIDDEN_FLAGS = false;
        RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS = false;
        RamblerAtMentionStore.resetCacheForTesting();
        RamblerFlagRuntime.clearForTesting();
    }

    @Test
    public void liteScriptRuntimePreservesNativeBengaliAndFollowsActiveKeyboardModes() {
        String stockRule = "\n3. Hinglish Override: force Banglish\n";
        Assert.assertEquals(
                GboardRamblerLiteScriptRuntime.NATIVE_SCRIPT_RULE,
                GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(stockRule, "en-US, bn-BD"));
        Assert.assertEquals(
                stockRule,
                GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(stockRule, "en-US, bn-Latn"));
        Assert.assertEquals(
                "",
                GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(stockRule, "en-US, fr-FR"));
        Assert.assertEquals(
                stockRule,
                GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(stockRule, ""));

        String samplePrompt =
                "Header\n"
                        + "   * Mandatory Indic Romanization (Anti-Gravity Gate): Bengali NEVER revert\n"
                        + "   * Universal Latin: keep.\n";
        String rewritten =
                GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(samplePrompt, "bn-BD");
        Assert.assertTrue(rewritten.contains("Enabled-Language Script Policy"));
        Assert.assertFalse(rewritten.contains("Mandatory Indic Romanization"));
        Assert.assertEquals(
                samplePrompt,
                GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(samplePrompt, "bn-Latn"));

        // Active keyboard mode overrides global enabledLanguages ("en-US, bn-BD, bn-XU")
        GboardRamblerScriptFix.setActiveGboardKeyboard("en-US", "qwerty");
        Assert.assertEquals(
                GboardRamblerLiteScriptRuntime.ENGLISH_LATIN_SCRIPT_RULE,
                GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(stockRule, "en-US, bn-BD"));
        String enPrompt = GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(samplePrompt, "en-US, bn-BD");
        Assert.assertTrue(enPrompt.contains("ENGLISH / PHONETIC LATIN"));

        GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh|bengali_bangladesh");
        Assert.assertEquals(
                GboardRamblerLiteScriptRuntime.ALL_BANGLA_SCRIPT_RULE,
                GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(stockRule, "en-US, bn-BD"));
        String bnPrompt = GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(samplePrompt, "en-US, bn-BD");
        Assert.assertTrue(bnPrompt.contains("ALL BANGLA"));

        GboardRamblerScriptFix.setActiveGboardKeyboard("bn-XU", "ime_bengali_india_transliteration|qwerty");
        Assert.assertEquals(
                GboardRamblerLiteScriptRuntime.MIXED_BN_EN_SCRIPT_RULE,
                GboardRamblerLiteScriptRuntime.selectHinglishOverrideRule(stockRule, "en-US, bn-BD"));
        String mixPrompt = GboardRamblerLiteScriptRuntime.rewriteCleanupPromptScriptGate(samplePrompt, "en-US, bn-BD");
        Assert.assertTrue(mixPrompt.contains("MIXED BANGLA + ENGLISH"));
    }

    @Test
    public void threeKeyboardModesHandleAllBanglaMixedAndEnglishPhoneticCleanly() {
        // Verify exact Gboard 18.5.4 keyboard classification:
        // 1 = All Bangla, 2 = Mixed Bangla + English, 3 = English / Phonetic Latin
        Assert.assertEquals(1, GboardRamblerScriptFix.classifyActiveKeyboard("bn-BD", "ime_bengali_bangladesh|bengali_bangladesh"));
        Assert.assertEquals(1, GboardRamblerScriptFix.classifyActiveKeyboard("bn-IN", "ime_bengali_india|bengali_india"));
        Assert.assertEquals(2, GboardRamblerScriptFix.classifyActiveKeyboard("bn-XU", "ime_bengali_india_transliteration"));
        Assert.assertEquals(2, GboardRamblerScriptFix.classifyActiveKeyboard("bn-BD", "qwerty"));
        Assert.assertEquals(3, GboardRamblerScriptFix.classifyActiveKeyboard("en-US", "qwerty"));
        Assert.assertEquals(3, GboardRamblerScriptFix.classifyActiveKeyboard("bn-XA", "ime_bengali_latin"));
        Assert.assertEquals(3, GboardRamblerScriptFix.classifyActiveKeyboard("bn-Latn", null));

        // MODE 1: All Bangla (বাংলা) — converts EVERYTHING (including English loanwords and already-mixed commits)
        GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
        String allBnLoan = GboardRamblerScriptFix.processVoice(
                "ami ajke office e jabo ar company er meeting korbo");
        Assert.assertTrue("Expected Bengali Unicode, got: " + allBnLoan, containsBengali(allBnLoan));
        Assert.assertFalse("Loanword 'company' should convert in All Bangla mode: " + allBnLoan,
                allBnLoan.toLowerCase().contains("company"));
        Assert.assertTrue("Loanword 'company' must spell 'কোম্পানি': " + allBnLoan,
                allBnLoan.contains("কোম্পানি"));
        Assert.assertFalse("Loanword 'office' should convert in All Bangla mode: " + allBnLoan,
                allBnLoan.toLowerCase().contains("office"));
        String allBnPartial = GboardRamblerScriptFix.processVoice(
                "Bangla English mishano bujhi na. বাংলা ইংলিশ কথা মিশাই বুঝে.");
        Assert.assertFalse("All Bangla must convert leftover Latin even when Bengali already exists: " + allBnPartial,
                allBnPartial.toLowerCase().contains("mishano"));
        Assert.assertTrue("All Bangla must spell 'English' as 'ইংলিশ' (never 'ইংগলিশ'): " + allBnPartial,
                allBnPartial.contains("ইংলিশ") && !allBnPartial.contains("ইংগলিশ"));

        // Exact Screenshot regression: Pure Bangla narration spelling accuracy
        String pureNarration = GboardRamblerScriptFix.processVoice(
                "বাংলা লিখলে বাংলা বুঝে, English বললে English বুঝে. It understands Bangla, English clearly.");
        Assert.assertTrue("Expected natural 'ইংলিশ', got: " + pureNarration, pureNarration.contains("ইংলিশ"));
        Assert.assertFalse("Must not produce 'ইংগলিশ': " + pureNarration, pureNarration.contains("ইংগলিশ"));
        Assert.assertTrue("Expected natural 'আন্ডারস্ট্যান্ডস', got: " + pureNarration,
                pureNarration.contains("আন্ডারস্ট্যান্ডস"));
        Assert.assertTrue("Expected natural 'ক্লিয়ারলি', got: " + pureNarration,
                pureNarration.contains("ক্লিয়ারলি"));

        // MODE 2: Mixed Bangla + English (abc -> বাংলা) — Bangla clauses/words in বাংলা, English words/clauses in English
        GboardRamblerScriptFix.setActiveGboardKeyboard("bn-XU", "ime_bengali_india_transliteration");
        // Exact Screenshot regression: hyphenated Bengali enclitic 'সব-i' -> 'সবই' (never 'সব-আই')
        String encliticMixed = GboardRamblerScriptFix.processVoice(
                "তারপর কি বাংলার পর English বললে English-ও বুঝবে, বাংলা-ও বুঝবে, সব-i বুঝবে?");
        Assert.assertTrue("Hyphenated 'সব-i' must convert to 'সবই': " + encliticMixed,
                encliticMixed.contains("সবই") && !encliticMixed.contains("সব-i") && !encliticMixed.contains("সব-আই"));
        Assert.assertTrue("English words must stay English: " + encliticMixed,
                encliticMixed.contains("English-ও"));
        String greeting = GboardRamblerScriptFix.processVoice("ami bhalo achi, tumi kemon acho?");
        Assert.assertTrue("Expected Bengali greeting, got: " + greeting, containsBengali(greeting));
        Assert.assertFalse("Should not remain ASCII Banglish: " + greeting, greeting.contains("bhalo"));

        // Pure English stays byte-identical
        Assert.assertEquals("Please send the project report tomorrow.",
                GboardRamblerScriptFix.processVoice("Please send the project report tomorrow."));

        // Real Screenshot 1 mixed sentence #1 (already contains Bengali + Romanized Bangla + English word)
        String mix1 = GboardRamblerScriptFix.processVoice(
                "Bangla English mishano bujhi na. বাংলা ইংলিশ কথা মিশাই বুঝে.");
        Assert.assertTrue("Bangla words must convert in Mixed mode: " + mix1, mix1.contains("বাংলা"));
        Assert.assertTrue("English word must stay English in Mixed mode: " + mix1, mix1.contains("English"));
        Assert.assertFalse("Romanized 'mishano' must convert in Mixed mode: " + mix1,
                mix1.toLowerCase().contains("mishano"));
        Assert.assertTrue("Existing Bengali tail must stay intact: " + mix1,
                mix1.contains("বাংলা ইংলিশ কথা মিশাই বুঝে."));

        // Real Screenshot 1 mixed sentence #2 (Bangla clauses + English word + English tail clause)
        String mix2 = GboardRamblerScriptFix.processVoice(
                "Pura ta Bangla ashtese, English e ashe na, and then it should understand Bangla English altogether.");
        Assert.assertTrue("First Bangla clause must convert: " + mix2, containsBengali(mix2));
        Assert.assertFalse("'ashtese' must convert in Mixed mode: " + mix2, mix2.toLowerCase().contains("ashtese"));
        Assert.assertTrue("English word inside Bangla clause must stay English: " + mix2, mix2.contains("English"));
        Assert.assertTrue("English tail clause must stay English: " + mix2,
                mix2.endsWith("and then it should understand Bangla English altogether."));

        // Protected spans stay untouched in Mixed mode
        String mixProt = GboardRamblerScriptFix.processVoice(
                "ami kal office jabo #RamblerBangla @muhib https://example.com 5pm. Please check it.");
        Assert.assertTrue(containsBengali(mixProt));
        Assert.assertTrue(mixProt.contains("office"));
        Assert.assertTrue(mixProt.contains("#RamblerBangla"));
        Assert.assertTrue(mixProt.contains("@muhib"));
        Assert.assertTrue(mixProt.contains("https://example.com"));
        Assert.assertTrue(mixProt.endsWith("Please check it."));

        // MODE 3: English (US) — NEVER hijacked into Bengali Unicode, stays phonetic Latin / English
        GboardRamblerScriptFix.setActiveGboardKeyboard("en-US", "qwerty");
        Assert.assertEquals("ami bhalo achi", GboardRamblerScriptFix.processVoice("ami bhalo achi"));
        Assert.assertEquals("Pura ta Bangla ashtese, English e ashe na.",
                GboardRamblerScriptFix.processVoice("Pura ta Bangla ashtese, English e ashe na."));

        // Optional Bangla (Latin) (bn-XA) also stays phonetic Latin
        GboardRamblerScriptFix.setActiveGboardKeyboard("bn-XA", "ime_bengali_latin");
        Assert.assertEquals("ami ekhon bari jabo", GboardRamblerScriptFix.processVoice("ami ekhon bari jabo"));
    }

    @Test
    public void ramblerPlusCoreFlagsAndNlExtrasAreForcedInFlagRuntime() {
        RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC = true;
        RamblerDynamicConfig.FEATURE_RAMBLER_EXTRAS = true;
        RamblerDynamicConfig.FEATURE_HIDDEN_FLAGS = true;

        Assert.assertEquals(Boolean.TRUE, RamblerFlagRuntime.applyFlagByName(
                null, RamblerFlagRuntime.ENABLE_AGENTIC_DICTATION_FLAG, Boolean.FALSE));
        Assert.assertEquals(Boolean.TRUE, RamblerFlagRuntime.applyFlagByName(
                null, RamblerFlagRuntime.CONFIG_AGENTIC_DICTATION_FLAG, Boolean.FALSE));
        Assert.assertEquals(Boolean.TRUE, RamblerFlagRuntime.applyFlagByName(
                null, RamblerFlagRuntime.ENABLE_JETSON_IN_TOOLBAR_FLAG, Boolean.FALSE));
        Assert.assertEquals(Long.valueOf(2L), RamblerFlagRuntime.applyFlagByName(
                null, RamblerFlagRuntime.AD_ACTIVATION_TYPE_FLAG, Long.valueOf(1L)));
        Assert.assertEquals(Boolean.TRUE, RamblerFlagRuntime.applyFlagByName(
                null, RamblerFlagRuntime.RAMBLER_OVERFLOW_MENU_FLAG, Boolean.FALSE));
        Assert.assertEquals(Boolean.TRUE, RamblerFlagRuntime.applyFlagByName(
                null, RamblerFlagRuntime.RAMBLER_PRESERVE_REWRITTEN_FLAG, Boolean.FALSE));
        Assert.assertEquals(Boolean.TRUE, RamblerFlagRuntime.applyFlagByName(
                null, RamblerFlagRuntime.QUICK_PASTE_DIRECT_CHIP_FLAG, Boolean.FALSE));
    }

    @Test
    public void commitPipelineRunsBanglaPhoneticEngineAndSkipsPasswordFields() {
        RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC = true;
        GboardRamblerScriptFix.jvmLayoutKind = 2;

        String committed = RamblerTextPipeline.processCommitText(null, "ami ajke bhalo achi");
        Assert.assertTrue("Commit pipeline must output Bengali Unicode: " + committed, containsBengali(committed));

        EditorInfo normal = new EditorInfo();
        normal.inputType = InputType.TYPE_CLASS_TEXT;
        Assert.assertFalse(RamblerTextPipeline.isSensitiveOrIncognitoField(normal));

        EditorInfo password = new EditorInfo();
        password.inputType = InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD;
        Assert.assertTrue(RamblerTextPipeline.isSensitiveOrIncognitoField(password));

        EditorInfo incognito = new EditorInfo();
        incognito.inputType = InputType.TYPE_CLASS_TEXT;
        incognito.imeOptions = EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING;
        Assert.assertTrue(RamblerTextPipeline.isSensitiveOrIncognitoField(incognito));
    }

    @Test
    public void atMentionStoreLearnsRanksFiltersAndRespectsEmailContext() {
        // 1. Completed token extraction (handles + full emails + email domains, ignores partial tail)
        java.util.List<String> extracted = RamblerAtMentionStore.extractCompletedTokens(
                "ask @grok and @claude, then email muhib@gmail.com or @partial");
        Assert.assertEquals(
                java.util.Arrays.asList("@grok", "@claude", "muhib@gmail.com", "@gmail.com"),
                extracted);

        // 2. Active prefix extraction
        RamblerAtMentionStore.ActivePrefix bare =
                RamblerAtMentionStore.extractActivePrefix("hey @");
        Assert.assertNotNull(bare);
        Assert.assertEquals("@", bare.prefix);
        Assert.assertEquals(1, bare.deleteCount);
        Assert.assertFalse(bare.emailDomainContext);

        RamblerAtMentionStore.ActivePrefix handlePrefix =
                RamblerAtMentionStore.extractActivePrefix("ask @gr");
        Assert.assertNotNull(handlePrefix);
        Assert.assertEquals("@gr", handlePrefix.prefix);
        Assert.assertEquals(3, handlePrefix.deleteCount);
        Assert.assertFalse(handlePrefix.emailDomainContext);

        RamblerAtMentionStore.ActivePrefix emailPrefix =
                RamblerAtMentionStore.extractActivePrefix("muhib@g");
        Assert.assertNotNull(emailPrefix);
        Assert.assertEquals("@g", emailPrefix.prefix);
        Assert.assertEquals(2, emailPrefix.deleteCount);
        Assert.assertTrue(emailPrefix.emailDomainContext);

        Assert.assertNull(RamblerAtMentionStore.extractActivePrefix("hello world"));

        // 3. Frequency + recency ranking & personalized-only standalone '@' behavior
        java.util.List<RamblerAtMentionStore.Entry> learned = java.util.Arrays.asList(
                new RamblerAtMentionStore.Entry("@claude", 5, 2000L),
                new RamblerAtMentionStore.Entry("@grok", 9, 1000L),
                new RamblerAtMentionStore.Entry("@anthropic.com", 4, 1500L));

        // Standalone '@' must show ONLY learned entries (never fixed hardcoded email domains)
        java.util.List<String> onBareAt = RamblerAtMentionStore.suggest(learned, bare, 8);
        Assert.assertEquals(
                java.util.Arrays.asList("@grok", "@claude", "@anthropic.com"),
                onBareAt);
        Assert.assertFalse(onBareAt.contains("@gmail.com"));
        Assert.assertTrue(RamblerAtMentionStore.suggest(
                java.util.Collections.emptyList(), bare, 8).isEmpty());

        java.util.List<String> onGr = RamblerAtMentionStore.suggest(learned, handlePrefix, 5);
        Assert.assertEquals(java.util.Collections.singletonList("@grok"), onGr);

        // Explicit email-domain context ("muhib@g") still suggests matching email domains
        java.util.List<String> onEmailG = RamblerAtMentionStore.suggest(learned, emailPrefix, 5);
        Assert.assertEquals(java.util.Collections.singletonList("@gmail.com"), onEmailG);

        // 4. Pending-token commit validation (Send/Enter/Hide) & full-text extraction
        Assert.assertTrue(RamblerAtMentionStore.isValidPendingTokenForCommit("@grok", false));
        Assert.assertFalse(RamblerAtMentionStore.isValidPendingTokenForCommit("@g", false));
        Assert.assertFalse(RamblerAtMentionStore.isValidPendingTokenForCommit("@", false));
        Assert.assertTrue(RamblerAtMentionStore.isValidPendingTokenForCommit("@gmail.com", true));
        Assert.assertFalse(RamblerAtMentionStore.isValidPendingTokenForCommit("@grok", true));
        Assert.assertEquals(
                java.util.Arrays.asList("@grok", "@claude"),
                RamblerAtMentionStore.extractAllTokens("ask @grok and @claude"));

        // 5. In-memory record + forget + serialization round-trip
        RamblerAtMentionStore.recordToken(null, "@grok", 100L);
        RamblerAtMentionStore.recordToken(null, "@claude", 200L);
        RamblerAtMentionStore.recordToken(null, "@grok", 300L);
        java.util.List<RamblerAtMentionStore.Entry> stored = RamblerAtMentionStore.readEntries(null);
        Assert.assertEquals(2, stored.size());
        String serialized = RamblerAtMentionStore.serializeEntries(stored);
        java.util.List<RamblerAtMentionStore.Entry> roundTrip =
                RamblerAtMentionStore.deserializeEntries(serialized);
        Assert.assertEquals(2, roundTrip.size());
        Assert.assertTrue(RamblerAtMentionStore.forgetToken(null, "@grok"));
        Assert.assertEquals(1, RamblerAtMentionStore.countLearned(null));

        // 6. Native Gboard fixed email_provider_completion stays OFF by default so fixed domains
        // do not override personalized @mentions
        RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS = true;
        RamblerDynamicConfig.FEATURE_HIDDEN_FLAGS = true;
        Assert.assertEquals(Boolean.FALSE, RamblerFlagRuntime.applyFlagByName(
                null, RamblerFlagRuntime.EMAIL_PROVIDER_COMPLETION_FLAG, Boolean.TRUE));
    }

    @Test
    public void amoledDefaultsOffAndClipboardDragReorderValidatesSectionsAndTimestamps() {
        // AMOLED Dark Keyboard defaults OFF so stock Material You dark theme keeps layered contrast
        Assert.assertFalse(RamblerEnhancementsSettings.DEFAULT_AMOLED_DARK_KEYBOARD);
        Assert.assertFalse(RamblerEnhancementsSettings.readAmoledDarkKeyboardEnabled(null));
        Assert.assertFalse(RamblerEnhancementsSettings.isAmoledDarkKeyboardEnabled());

        // Clipboard drag-to-reorder defaults ON; Hide launcher icon defaults OFF
        Assert.assertTrue(RamblerEnhancementsSettings.DEFAULT_CLIPBOARD_DRAG_REORDER);
        Assert.assertTrue(RamblerEnhancementsSettings.readClipboardDragReorderEnabled(null));
        Assert.assertFalse(RamblerEnhancementsSettings.DEFAULT_HIDE_LAUNCHER_ICON);
        Assert.assertFalse(RamblerEnhancementsSettings.readHideLauncherIcon(null));

        // Header (0), Recent (1), Pinned (2): only same-section moves without crossing headers allowed
        int[] sections = new int[] { 0, 1, 1, 1, 0, 2, 2, 2 };
        Assert.assertTrue(RamblerClipboardReorderRuntime.canMoveWithinSameSection(sections, 1, 3));
        Assert.assertTrue(RamblerClipboardReorderRuntime.canMoveWithinSameSection(sections, 7, 5));
        Assert.assertFalse(RamblerClipboardReorderRuntime.canMoveWithinSameSection(sections, 0, 1));
        Assert.assertFalse(RamblerClipboardReorderRuntime.canMoveWithinSameSection(sections, 1, 4));
        Assert.assertFalse(RamblerClipboardReorderRuntime.canMoveWithinSameSection(sections, 2, 6));
        Assert.assertFalse(RamblerClipboardReorderRuntime.canMoveWithinSameSection(sections, 2, 2));

        // Timestamps stay within original section range and are strictly descending (even with duplicates)
        long[] desc = RamblerClipboardReorderRuntime.computeStrictlyDescendingTimestamps(
                new long[] { 1000L, 5000L, 5000L, 2000L });
        Assert.assertArrayEquals(new long[] { 5000L, 4999L, 2000L, 1000L }, desc);

        // Zero stock flags (headers / popup open) remain locked at 0
        Assert.assertEquals(0, RamblerClipboardReorderRuntime.computeMovementFlags(null, null, 0));
    }

    @Test
    public void autoUpdaterVersionCompareJsonParsingAllowlistAndSha256() {
        Assert.assertTrue(RamblerAutoUpdater.isNewerVersion("v31.6.0", "31.5.0"));
        Assert.assertTrue(RamblerAutoUpdater.isNewerVersion("v32.0.0", "31.5.0"));
        Assert.assertFalse(RamblerAutoUpdater.isNewerVersion("v31.5.0", "31.5.0"));
        Assert.assertFalse(RamblerAutoUpdater.isNewerVersion("v31.4.0", "31.5.0"));
        Assert.assertTrue(RamblerEnhancementsSettings.DEFAULT_AUTO_CHECK_UPDATES);
        Assert.assertTrue(RamblerEnhancementsSettings.readAutoCheckUpdates(null));

        // Strict download URL allowlist
        Assert.assertTrue(RamblerAutoUpdater.isAllowedDownloadUrl(
                "https://github.com/muhib-karim/Rambler-Bangla/releases/download/v31.6.0/RamblerBangla-v31.6.0-gboard-18.5.4-arm64-v8a.apk"));
        Assert.assertFalse(RamblerAutoUpdater.isAllowedDownloadUrl(
                "https://evil.example.com/RamblerBangla.apk"));
        Assert.assertFalse(RamblerAutoUpdater.isAllowedDownloadUrl(
                "https://github.com/other-user/Rambler-Bangla/releases/download/v99/a.apk"));

        // Pure-Java GitHub release JSON parser
        String sampleJson = "{"
                + "\"tag_name\":\"v31.6.0\","
                + "\"html_url\":\"https://github.com/muhib-karim/Rambler-Bangla/releases/tag/v31.6.0\","
                + "\"body\":\"## Rambler Bangla v31.6.0\\n- Better Bangla spellings\\n- Auto updater\","
                + "\"assets\":["
                + "  {\"name\":\"patches-31.6.0.mpp\",\"size\":10369380,\"browser_download_url\":\"https://github.com/muhib-karim/Rambler-Bangla/releases/download/v31.6.0/patches-31.6.0.mpp\"},"
                + "  {\"name\":\"RamblerBangla-v31.6.0-gboard-18.5.4-arm64-v8a.apk\",\"size\":92619004,\"browser_download_url\":\"https://github.com/muhib-karim/Rambler-Bangla/releases/download/v31.6.0/RamblerBangla-v31.6.0-gboard-18.5.4-arm64-v8a.apk\"},"
                + "  {\"name\":\"SHA256SUMS.txt\",\"size\":201,\"browser_download_url\":\"https://github.com/muhib-karim/Rambler-Bangla/releases/download/v31.6.0/SHA256SUMS.txt\"}"
                + "]}";
        RamblerAutoUpdater.ReleaseInfo info = RamblerAutoUpdater.parseLatestReleaseJson(sampleJson);
        Assert.assertNotNull(info);
        Assert.assertEquals("v31.6.0", info.tagName);
        Assert.assertEquals("31.6.0", info.version);
        Assert.assertTrue(info.hasDirectApk());
        Assert.assertEquals("RamblerBangla-v31.6.0-gboard-18.5.4-arm64-v8a.apk", info.apkName);
        Assert.assertEquals(92619004L, info.apkSizeBytes);
        Assert.assertTrue(info.sha256SumsUrl.endsWith("/SHA256SUMS.txt"));

        // SHA256SUMS.txt parsing
        String sha = "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";
        String sums = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  patches-31.6.0.mpp\n"
                + sha + "  RamblerBangla-v31.6.0-gboard-18.5.4-arm64-v8a.apk\n";
        Assert.assertEquals(sha, RamblerAutoUpdater.parseExpectedSha256(sums, info.apkName));
        Assert.assertNull(RamblerAutoUpdater.parseExpectedSha256(sums, "missing.apk"));

        // About → App auto-updates section routes directly to SECTION_UPDATES
        Assert.assertEquals("32.4.0", RamblerAutoUpdater.CURRENT_VERSION);
        Assert.assertEquals(
                RamblerEnhancementsActivity.SECTION_UPDATES,
                RamblerEnhancementsActivity.normalizeSection("updates"));
        Assert.assertEquals(
                "App updates",
                RamblerEnhancementsActivity.titleForSection("updates"));
        // Voice-only flags exclude keyboard/clipboard flags moved to Patches
        for (RamblerHiddenFlagOverrideRuntime.Entry e : RamblerHiddenFlagOverrideRuntime.voiceEntries()) {
            Assert.assertNotEquals("enable_system_clipboard_direct_paste_for_quick_paste", e.flagName);
            Assert.assertNotEquals("enable_email_provider_completion", e.flagName);
        }
    }

    @Test
    public void pureBanglaOrthographyNormalizerFixesAllScreenshotSpellings() {
        GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
        GboardRamblerScriptFix.jvmLayoutKind = 1;
        try {
            // Exact Screenshot 1: Pure Bengali LLM output with spelling mistakes (zero Latin!)
            String s1Llm = "পুরা বাংলা বুঝে, ইংলিশ-ও বুঝে, শবকিছু-আই বুঝে. "
                    + "এবং পুরা ক্লিয়ারলি শবকিছু বুযে সুন্দর ভাবে লিখতে পারে. ভালে তো দেখতে দেয়া যায়.";
            String out1 = GboardRamblerScriptFix.processVoice(s1Llm);
            Assert.assertTrue("Expected সবকিছুই, got: " + out1, out1.contains("সবকিছুই বুঝে।"));
            Assert.assertTrue("Expected সবকিছু বুঝে সুন্দরভাবে, got: " + out1, out1.contains("সবকিছু বুঝে সুন্দরভাবে"));
            Assert.assertTrue("Expected ভালো তো, got: " + out1, out1.contains("ভালো তো দেখতে"));
            Assert.assertTrue("Expected Bengali dari, got: " + out1, out1.endsWith("যায়।"));
            Assert.assertFalse("Must not keep শবকিছু: " + out1, out1.contains("শবকিছু"));
            Assert.assertFalse("Must not keep -আই: " + out1, out1.contains("-আই"));
            Assert.assertFalse("Must not keep বুযে: " + out1, out1.contains("বুযে"));
            Assert.assertFalse("Must not keep ভালে: " + out1, out1.contains("ভালে"));

            // Exact Screenshot 1: Romanized ASR input path
            String s1Rom = "pura bangla bujhe, english-o bujhe, shobkichu-i bujhe. "
                    + "ebong pura clearly shobkichu buje shundor bhabe likhte pare. bhale to dekhte deya jay.";
            String out1Rom = GboardRamblerScriptFix.processVoice(s1Rom);
            Assert.assertTrue("Expected সবকিছুই, got: " + out1Rom, out1Rom.contains("সবকিছুই"));
            Assert.assertTrue("Expected সবকিছু বুঝে সুন্দরভাবে, got: " + out1Rom, out1Rom.contains("সবকিছু বুঝে সুন্দরভাবে"));
            Assert.assertTrue("Expected ভালো, got: " + out1Rom, out1Rom.contains("ভালো"));
            Assert.assertFalse("Must not produce -আই: " + out1Rom, out1Rom.contains("-আই"));
            Assert.assertFalse("Must not produce বুযে: " + out1Rom, out1Rom.contains("বুযে"));

            // Exact Screenshot 2: Loanword & phonetic English-in-Bangla spellings
            String s2Llm = "সো ওয়টেভার আই'ম সেইং ইন ইংলিশ, ইট শুড বি রিটেন ইন বাংলা ফনেটিকস অ্যাজ ওয়েল রাইট নাউ, রাইট?";
            String out2 = GboardRamblerScriptFix.processVoice(s2Llm);
            Assert.assertTrue("Expected হোয়াটেভার, got: " + out2, out2.contains("হোয়াটেভার"));
            Assert.assertTrue("Expected ফোনেটিকস, got: " + out2, out2.contains("ফোনেটিকস"));
            Assert.assertTrue("Expected রাইট নাও, got: " + out2, out2.contains("রাইট নাও"));

            String s2Rom = "so whatever saying in english, it should be written in bangla phonetics as well right now, right?";
            String out2Rom = GboardRamblerScriptFix.processVoice(s2Rom);
            Assert.assertTrue("Expected হোয়াটেভার, got: " + out2Rom, out2Rom.contains("হোয়াটেভার"));
            Assert.assertTrue("Expected ফোনেটিকস, got: " + out2Rom, out2Rom.contains("ফোনেটিকস"));
            Assert.assertTrue("Expected রাইট নাও, got: " + out2Rom, out2Rom.contains("রাইট নাও"));

            // Preserve valid words containing শব as a real prefix (শবদেহ, শব্দ) and preserve ellipsis (...)
            String valid = "শবদেহ এবং শব্দ... ঠিক আছে.";
            String outValid = GboardRamblerScriptFix.processVoice(valid);
            Assert.assertTrue("Must preserve শবদেহ: " + outValid, outValid.contains("শবদেহ"));
            Assert.assertTrue("Must preserve শব্দ: " + outValid, outValid.contains("শব্দ..."));
            Assert.assertTrue("Must convert sentence period to dari: " + outValid, outValid.endsWith("আছে।"));
        } finally {
            GboardRamblerScriptFix.jvmLayoutKind = 0;
        }
    }

    @Test
    public void fullLanguageBanglaLexiconFixesUnseenSpellingsWithZeroFalsePositives() {
        int count = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerBanglaLexicon.loadBlockingForTesting();
        Assert.assertTrue("Expected lean ~89k Bengali lexicon loaded, got: " + count, count > 80000);
        long loadMs = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerBanglaLexicon.getLoadMs();
        Assert.assertTrue("Lexicon must record load time >= 0ms, got: " + loadMs + "ms", loadMs >= 0L);

        GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
        GboardRamblerScriptFix.jvmLayoutKind = 1;
        try {
            // Unseen words NOT in the 120-entry manual SPELLING_FIXES list, repaired automatically
            // by the OpenBangla + bn_BD phonetic-skeleton + suffix engine:
            String unseen = "পরিক্ষা এবং বিস্ববিদ্যালয় এর ভবিস্যত প্রস্ন অবস্যই বৈসিস্ট্য পোষাক বাংলাদেস জিনীষ মানুস পৃথিবি সুনতে খুসি বেবহার সিক্ষক উপস্তিত.";
            String out = GboardRamblerScriptFix.processVoice(unseen);
            String[] expected = {
                "পরীক্ষা", "বিশ্ববিদ্যালয়", "ভবিষ্যৎ", "প্রশ্ন", "অবশ্যই",
                "বৈশিষ্ট্য", "পোশাক", "বাংলাদেশ", "জিনিস", "মানুষ",
                "পৃথিবী", "শুনতে", "খুশি", "ব্যবহার", "শিক্ষক", "উপস্থিত।"
            };
            for (String w : expected) {
                Assert.assertTrue("Missing expected corrected word '" + w + "' in: " + out, out.contains(w));
            }
            // Agglutinative inflected suffix repair
            String inflected = GboardRamblerScriptFix.processVoice("পরিক্ষাতে এবং অবস্যই এবং বিস্ববিদ্যালয়গুলো.");
            Assert.assertTrue("Expected পরীক্ষাতে: " + inflected, inflected.contains("পরীক্ষাতে"));
            Assert.assertTrue("Expected অবশ্যই: " + inflected, inflected.contains("অবশ্যই"));
            Assert.assertTrue("Expected বিশ্ববিদ্যালয়গুলো: " + inflected, inflected.contains("বিশ্ববিদ্যালয়গুলো"));

            // User screenshot #3 regressions: "বানান তা এখনো ভুল হৈতেচে।" -> "বানানটা এখনো ভুল হচ্ছে।"
            String shot3Pure = GboardRamblerScriptFix.processVoice("বানান তা এখনো ভুল হৈতেচে।");
            Assert.assertEquals("বানানটা এখনো ভুল হচ্ছে।", shot3Pure);
            String shot3Rom = GboardRamblerScriptFix.processVoice("banan ta ekhono bhul hoitese.");
            Assert.assertTrue("Expected হচ্ছে (never হৈতেচে): " + shot3Rom, shot3Rom.contains("হচ্ছে") && !shot3Rom.contains("হৈতেচে"));

            // Valid Bengali words must NEVER be falsely altered
            String validSentence = "দরকার অনেক পৃথিবী ব্যবহার শিক্ষক উপস্থিত জিনিস শুনতে শবদেহ শব্দ।";
            Assert.assertEquals(validSentence, GboardRamblerScriptFix.processVoice(validSentence));

            // User v32.0.0 real-phone dictation regressions (L3 dental/retroflex, L4 vowel, jofola ্য়->্য, ৈ->ই, -তেসি->-তেছি)
            String real1 = GboardRamblerScriptFix.processVoice(
                    "এখান তো মনে হচ্ছে পুরা কথাই বুঝতেছে, একদাম কলিরলি বুঝতেছে। মজার ব্য়াপার, সবৈ থিকমতো বুঝতেছে।");
            Assert.assertTrue("Expected এখন তো: " + real1, real1.contains("এখন তো"));
            Assert.assertTrue("Expected একদম ক্লিয়ারলি: " + real1, real1.contains("একদম ক্লিয়ারলি"));
            Assert.assertTrue("Expected ব্যাপার (not ব্য়াপার): " + real1, real1.contains("ব্যাপার") && !real1.contains("ব্য়াপার"));
            Assert.assertTrue("Expected সবই ঠিকমতো: " + real1, real1.contains("সবই ঠিকমতো"));

            String real2 = GboardRamblerScriptFix.processVoice(
                    "বেশিভাগ বাংলা লিখতেসি মাছ অ্যাকিউরেট। প্রিটি অ্যাকিউরেট হলে তো ফাতাফাতি অবস্থা। ফতাফাতি। ফাতাফাতি আবস্থা।");
            Assert.assertTrue("Expected বেশিরভাগ: " + real2, real2.contains("বেশিরভাগ"));
            Assert.assertTrue("Expected লিখতেছি: " + real2, real2.contains("লিখতেছি"));
            Assert.assertTrue("Expected মাচ অ্যাকিউরেট: " + real2, real2.contains("মাচ অ্যাকিউরেট"));
            Assert.assertTrue("Expected ফাটাফাটি অবস্থা: " + real2, real2.contains("ফাটাফাটি অবস্থা"));
            Assert.assertFalse("Must not keep ফাতাফাতি/ফতাফাতি/আবস্থা: " + real2,
                    real2.contains("ফাতাফাতি") || real2.contains("ফতাফাতি") || real2.contains("আবস্থা"));

            // Language-wide unseen L3/L4 dental<->retroflex, jofola, initial আ<->অ, and colloquial verb repairs
            String unseenL3 = GboardRamblerScriptFix.processVoice(
                    "মোটামুতি তারাতারি কথিন দুস্তু মিস্তি চেস্তা স্পস্ত অনুস্থান আনেক ব্য়বহার বলতেসি করতেসি বুঝতেসে।");
            for (String exp : new String[] {
                    "মোটামুটি", "তাড়াতাড়ি", "কঠিন", "দুষ্টু", "মিষ্টি",
                    "চেষ্টা", "স্পষ্ট", "অনুষ্ঠান", "অনেক", "ব্যবহার", "বলতেছি", "করতেছি", "বুঝতেছে"
            }) {
                Assert.assertTrue("Expected L3/L4 repair '" + exp + "' in: " + unseenL3, unseenL3.contains(exp));
            }
            // Source-level Avro transliteration must emit valid ্য (not ্য়) for byapar
            String romByapar = GboardRamblerScriptFix.processVoice("mojar byapar soboi thikmoto fatafati obostha.");
            Assert.assertTrue("Expected ব্যাপার: " + romByapar, romByapar.contains("ব্যাপার") && !romByapar.contains("ব্য়াপার"));
            Assert.assertTrue("Expected সবই ঠিকমতো ফাটাফাটি অবস্থা: " + romByapar,
                    romByapar.contains("সবই") && romByapar.contains("ঠিকমতো") && romByapar.contains("ফাটাফাটি") && romByapar.contains("অবস্থা"));

            // User screenshot #3 Mixed mode regressions: ASCII '-', en-dash '–', and non-breaking hyphen '‑'
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-XU", "ime_bengali_india_transliteration");
            GboardRamblerScriptFix.jvmLayoutKind = 2;
            for (String dash : new String[] { "-", "\u2013", "\u2011" }) {
                String shot3Mix = GboardRamblerScriptFix.processVoice(
                        "বাংলা English সব" + dash + "i বলতেসি, তাহলে কাজ করতেসে না কেনো ঠিকমত? So it's supposed to understand and work perfectly, right?");
                Assert.assertTrue("Expected সবই for dash '" + dash + "', got: " + shot3Mix,
                        shot3Mix.contains("সবই") && !shot3Mix.contains("সব" + dash + "i"));
                Assert.assertTrue("Expected ঠিকমতো: " + shot3Mix, shot3Mix.contains("ঠিকমতো"));
                Assert.assertTrue("Expected English preserved: " + shot3Mix,
                        shot3Mix.contains("English") && shot3Mix.endsWith("So it's supposed to understand and work perfectly, right?"));
            }

            // User v32.1.0 real-phone dictation regressions: loanword cold-miss + hyphenated কাল-কে + English-heavy mixed
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
            GboardRamblerScriptFix.jvmLayoutKind = 1;
            String v321Pure = GboardRamblerScriptFix.processVoice(
                    "আমি যদি বাংলা-ইংলিশ সবাই বুঝে এবং যেমনে বলব তেমনে বুঝতে পারে তাহলে তো ভালোই হয়। আজকে কাল-কে client meeting and everything.");
            Assert.assertTrue("Expected বাংলা-ইংলিশ preserved: " + v321Pure, v321Pure.contains("বাংলা-ইংলিশ"));
            Assert.assertTrue("Expected কালকে (not কাল-কে): " + v321Pure, v321Pure.contains("কালকে") && !v321Pure.contains("কাল-কে"));
            Assert.assertTrue("Expected ক্লায়েন্ট মিটিং অ্যান্ড এভরিথিং (never কলিএনত/এভেরয়থিং): " + v321Pure,
                    v321Pure.contains("ক্লায়েন্ট মিটিং অ্যান্ড এভরিথিং")
                            && !v321Pure.contains("কলিএনত") && !v321Pure.contains("এভেরয়থিং"));

            String v321Loans = GboardRamblerScriptFix.processVoice(
                    "android fluency updated downloaded clients everybody everyone eventually multilingual.");
            for (String exp : new String[] {
                    "অ্যান্ড্রয়েড", "ফ্লুয়েন্সি", "আপডেটেড", "ডাউনলোডেড",
                    "ক্লায়েন্টস", "এভরিবডি", "এভরিওয়ান", "ইভেনচুয়ালি", "মাল্টিলিঙ্গুয়াল"
            }) {
                Assert.assertTrue("Expected natural loanword '" + exp + "' in: " + v321Loans, v321Loans.contains(exp));
            }

            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-XU", "ime_bengali_india_transliteration");
            GboardRamblerScriptFix.jvmLayoutKind = 2;
            String v321Mix = GboardRamblerScriptFix.processVoice("Ajke kalke client meeting and everything.");
            Assert.assertTrue("Expected আজকে কালকে + English Latin preserved in English-heavy mixed clause: " + v321Mix,
                    v321Mix.contains("আজকে") && v321Mix.contains("কালকে") && v321Mix.contains("client meeting and everything"));
            String v321MixBn = GboardRamblerScriptFix.processVoice("আজকে কাল-কে client meeting and everything.");
            Assert.assertEquals("আজকে কালকে client meeting and everything.", v321MixBn);
            String v321MixEn = GboardRamblerScriptFix.processVoice("Today we have a client meeting and everything.");
            Assert.assertEquals("Today we have a client meeting and everything.", v321MixEn);

            // Live Gemini Rambler+ prompt injection matches active keyboard mode cleanly
            RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC = true;
            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-BD", "ime_bengali_bangladesh");
            GboardRamblerScriptFix.jvmLayoutKind = 1;
            String purePrompt = RamblerCustomInstructionRules.buildActiveBanglaScriptInstruction(null);
            Assert.assertNotNull(purePrompt);
            Assert.assertTrue(purePrompt.contains("Bangla Academy"));
            Assert.assertTrue(purePrompt.contains("NEVER output any Romanized Banglish"));

            GboardRamblerScriptFix.setActiveGboardKeyboard("bn-XU", "ime_bengali_india_transliteration");
            GboardRamblerScriptFix.jvmLayoutKind = 2;
            String mixedPrompt = RamblerCustomInstructionRules.buildActiveBanglaScriptInstruction(null);
            Assert.assertNotNull(mixedPrompt);
            Assert.assertTrue(mixedPrompt.contains("Mixed Bengali + English"));
            Assert.assertTrue(mixedPrompt.contains("সবই"));

            GboardRamblerScriptFix.setActiveGboardKeyboard("en-US", "qwerty");
            GboardRamblerScriptFix.jvmLayoutKind = 3;
            Assert.assertNull("English keyboard must not inject Bangla instruction",
                    RamblerCustomInstructionRules.buildActiveBanglaScriptInstruction(null));
        } finally {
            GboardRamblerScriptFix.jvmLayoutKind = 0;
            GboardRamblerScriptFix.setActiveGboardKeyboard(null, null);
        }
    }

    private static boolean containsBengali(String s) {
        if (s == null) return false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= '\u0980' && c <= '\u09ff') return true;
        }
        return false;
    }
}
