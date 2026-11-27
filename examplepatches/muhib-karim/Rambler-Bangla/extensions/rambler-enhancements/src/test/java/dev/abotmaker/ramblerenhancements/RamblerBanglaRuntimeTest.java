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
        GboardRamblerScriptFix.setActiveGboardLocale(null);
        GboardRamblerSegmentLock.resetPin();
        RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC = false;
        RamblerDynamicConfig.FEATURE_RAMBLER_EXTRAS = false;
        RamblerDynamicConfig.FEATURE_HIDDEN_FLAGS = false;
        RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS = false;
        RamblerAtMentionStore.resetCacheForTesting();
        RamblerFlagRuntime.clearForTesting();
    }

    @Test
    public void liteScriptRuntimePreservesNativeBengaliAndRespectsBnLatn() {
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
    }

    @Test
    public void phoneticVoiceEngineEndToEndBanglaLoanwordsAndMultilingual() {
        // 1. Pure Bangla phonetic voice dictation on multilingual AUTO (bn-Latn / EN+BN)
        GboardRamblerScriptFix.jvmLayoutKind = 2;
        String greeting = GboardRamblerScriptFix.processVoice("ami bhalo achi, tumi kemon acho?");
        Assert.assertTrue("Expected Bengali greeting, got: " + greeting, containsBengali(greeting));
        Assert.assertFalse("Should not remain ASCII Banglish: " + greeting, greeting.contains("bhalo"));

        // 2. Mixed Bangla + English loanwords (CMUdict loanword spellings in Bangla sentence)
        String loanwordSentence = GboardRamblerScriptFix.processVoice(
                "ami ajke office e jabo ar company er meeting korbo");
        Assert.assertTrue("Expected Bengali Unicode, got: " + loanwordSentence, containsBengali(loanwordSentence));
        Assert.assertFalse("Loanword 'company' should convert in Bangla sentence: " + loanwordSentence,
                loanwordSentence.toLowerCase().contains("company"));
        Assert.assertFalse("Loanword 'office' should convert in Bangla sentence: " + loanwordSentence,
                loanwordSentence.toLowerCase().contains("office"));

        // 3. Pure English sentence stays 100% byte-identical
        String enOut = GboardRamblerScriptFix.processVoice("Please send the project report tomorrow.");
        Assert.assertEquals("Please send the project report tomorrow.", enOut);

        // 4. Multi-sentence mixed dictation with protected spans (#tag, @handle, URL, time)
        String mixedOut = GboardRamblerScriptFix.processVoice(
                "ami kal office jabo #RamblerBangla @muhib https://example.com 5pm. Please check it.");
        Assert.assertTrue("Expected Bangla sentence in mixed output: " + mixedOut, containsBengali(mixedOut));
        Assert.assertTrue("Hashtag must stay Latin: " + mixedOut, mixedOut.contains("#RamblerBangla"));
        Assert.assertTrue("Handle must stay Latin: " + mixedOut, mixedOut.contains("@muhib"));
        Assert.assertTrue("URL must stay Latin: " + mixedOut, mixedOut.contains("https://example.com"));
        Assert.assertTrue("English sentence must stay English: " + mixedOut, mixedOut.endsWith("Please check it."));

        // 5. Native bn-BD active Gboard locale converts even short phrases
        GboardRamblerScriptFix.jvmLayoutKind = 0;
        GboardRamblerScriptFix.setActiveGboardLocale("bn-BD");
        String bnOnly = GboardRamblerScriptFix.processVoice("dhaka bhalo shomoy");
        Assert.assertTrue("bn-BD active locale must convert to Bengali: " + bnOnly, containsBengali(bnOnly));

        // 6. bn-Latn active Gboard locale uses multilingual AUTO (converts Bangla, preserves English)
        GboardRamblerScriptFix.setActiveGboardLocale("bn-Latn");
        Assert.assertTrue(containsBengali(GboardRamblerScriptFix.processVoice("ami ekhon bari jabo")));
        Assert.assertEquals("Good morning everyone.", GboardRamblerScriptFix.processVoice("Good morning everyone."));

        // 7. English-only layout (k3) stays untouched when explicitly forced
        GboardRamblerScriptFix.setActiveGboardLocale(null);
        GboardRamblerScriptFix.jvmLayoutKind = 3;
        Assert.assertEquals("ami bhalo achi", GboardRamblerScriptFix.processVoice("ami bhalo achi"));
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
        // 1. Completed token extraction (handles + email domains, ignores partial tail)
        java.util.List<String> extracted = RamblerAtMentionStore.extractCompletedTokens(
                "ask @grok and @claude, then email muhib@gmail.com or @partial");
        Assert.assertEquals(
                java.util.Arrays.asList("@grok", "@claude", "@gmail.com"),
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

    private static boolean containsBengali(String s) {
        if (s == null) return false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= '\u0980' && c <= '\u09ff') return true;
        }
        return false;
    }
}
