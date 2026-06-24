package dev.jason.gboardpatches.extension.writingtools;

import org.junit.Assert;
import org.junit.Test;

public final class GboardAiWritingToolsDependencyRuntimeTest {
    @Test
    public void userServerConsentFollowsWritingToolsSwitchWhenEditTextWithAiIsEnabled() {
        Assert.assertTrue(GboardAiWritingToolsDependencyRuntime.computeUserAllowsServer(
                false,
                false,
                true,
                true));
        Assert.assertTrue(GboardAiWritingToolsDependencyRuntime.computeUserAllowsServer(
                true,
                true,
                false,
                true));
    }

    @Test
    public void userServerConsentFallsBackToProofreadSwitchWhenEditTextWithAiIsDisabled() {
        Assert.assertTrue(GboardAiWritingToolsDependencyRuntime.computeUserAllowsServer(
                true,
                true,
                false,
                false));
        Assert.assertFalse(GboardAiWritingToolsDependencyRuntime.computeUserAllowsServer(
                true,
                false,
                true,
                false));
    }

    @Test
    public void userServerConsentMatchesAllowGenAiServerFlagWhenAnyEnabledFeatureAllowsServer() {
        GboardAiWritingToolsOfficialPreferences.Snapshot snapshot =
                new GboardAiWritingToolsOfficialPreferences.Snapshot(
                        Boolean.TRUE,
                        Boolean.TRUE,
                        Boolean.FALSE,
                        Boolean.TRUE);

        Assert.assertEquals(Boolean.TRUE, snapshot.overrideAllowAnyServerFlagValue());
        Assert.assertEquals(
                Boolean.TRUE,
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        GboardAiWritingToolsRuntime.FLAG_ALLOW_GEN_AI_SERVER,
                        true,
                        false,
                        snapshot));
        Assert.assertTrue(GboardAiWritingToolsDependencyRuntime.computeUserAllowsServer(
                true,
                true,
                false,
                true));
    }

    @Test
    public void decisionLogIncludesDependencyInputsAndSelectedMode() {
        String message = GboardAiWritingToolsDependencyRuntime.buildDecisionLog(
                "hcv#f",
                "Google",
                "AI_CORE_CONNECTION_ERROR",
                true,
                true,
                true,
                false,
                true,
                true,
                true,
                "READY");

        Assert.assertTrue(message.contains("reason=hcv#f"));
        Assert.assertTrue(message.contains("mode=ServerSideGenAi"));
        Assert.assertTrue(message.contains("dependencyState=AI_CORE_CONNECTION_ERROR"));
        Assert.assertTrue(message.contains("allowGenAiServer=true"));
        Assert.assertTrue(message.contains("proofreadEnabled=true"));
        Assert.assertTrue(message.contains("proofreadServerEnabled=true"));
        Assert.assertTrue(message.contains("writingToolsServerEnabled=false"));
        Assert.assertTrue(message.contains("editTextWithAiEnabled=true"));
        Assert.assertTrue(message.contains("userAllowsServer=true"));
        Assert.assertTrue(message.contains("facadeState=READY"));
    }

    @Test
    public void skipLogIncludesEarlyReturnInputs() {
        String message = GboardAiWritingToolsDependencyRuntime.buildSkipLog(
                "hcv#i",
                true,
                true,
                false);

        Assert.assertTrue(message.contains("reason=hcv#i"));
        Assert.assertTrue(message.contains("hasDependencyMonitor=true"));
        Assert.assertTrue(message.contains("hasContext=true"));
        Assert.assertTrue(message.contains("featureEnabled=false"));
    }

    @Test
    public void serverFallbackRequiresRuntimeAndUserConsent() {
        Assert.assertFalse(GboardAiWritingToolsDependencyRuntime.shouldUseServerSideFallback(
                "Xiaomi",
                "AI_CORE_CONNECTION_ERROR",
                false,
                true));
        Assert.assertFalse(GboardAiWritingToolsDependencyRuntime.shouldUseServerSideFallback(
                "Xiaomi",
                "AI_CORE_CONNECTION_ERROR",
                true,
                false));
    }

    @Test
    public void nonGoogleDevicesFallbackWhenServerUseIsAllowed() {
        Assert.assertTrue(GboardAiWritingToolsDependencyRuntime.shouldUseServerSideFallback(
                "Xiaomi",
                "AI_CORE_CONNECTION_ERROR",
                true,
                true));
    }

    @Test
    public void googleDevicesFallbackOnlyForKnownAiCoreFailureStates() {
        Assert.assertTrue(GboardAiWritingToolsDependencyRuntime.shouldUseServerSideFallback(
                "Google",
                "AI_CORE_MODEL_DOWNLOADABLE",
                true,
                true));
        Assert.assertFalse(GboardAiWritingToolsDependencyRuntime.shouldUseServerSideFallback(
                "Google",
                "READY",
                true,
                true));
        Assert.assertFalse(GboardAiWritingToolsDependencyRuntime.shouldUseServerSideFallback(
                "Google",
                null,
                true,
                true));
    }
}
