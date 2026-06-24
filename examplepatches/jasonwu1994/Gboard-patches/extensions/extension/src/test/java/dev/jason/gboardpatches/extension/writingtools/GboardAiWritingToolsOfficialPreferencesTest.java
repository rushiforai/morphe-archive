package dev.jason.gboardpatches.extension.writingtools;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

public final class GboardAiWritingToolsOfficialPreferencesTest {
    @After
    public void tearDown() {
        GboardAiWritingToolsOfficialPreferences.clearForTest();
    }

    @Test
    public void snapshotDefaultsToUnknownOverrideSemanticsWhenNothingObservedYet() {
        GboardAiWritingToolsOfficialPreferences.Snapshot snapshot =
                GboardAiWritingToolsOfficialPreferences.snapshot();

        Assert.assertNull(snapshot.overrideProofreadFlagValue());
        Assert.assertNull(snapshot.overrideEditTextWithAiFlagValue());
        Assert.assertNull(snapshot.overrideAnyFeatureFlagValue());
        Assert.assertNull(snapshot.overrideAllowAnyServerFlagValue());
    }

    @Test
    public void notedOfficialPreferenceValuesDriveRuntimeSemantics() {
        GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                GboardAiWritingToolsOfficialPreferences.SHOW_FIX_IT_BUTTON_PREF_KEY,
                false);
        GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                GboardAiWritingToolsOfficialPreferences.SERVER_PROOFREAD_PREF_KEY,
                false);
        GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                GboardAiWritingToolsOfficialPreferences.SERVER_WRITING_TOOLS_PREF_KEY,
                true);
        GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                GboardAiWritingToolsOfficialPreferences.WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY,
                true);

        GboardAiWritingToolsOfficialPreferences.Snapshot snapshot =
                GboardAiWritingToolsOfficialPreferences.snapshot();

        Assert.assertEquals(Boolean.FALSE, snapshot.overrideProofreadFlagValue());
        Assert.assertEquals(Boolean.TRUE, snapshot.overrideEditTextWithAiFlagValue());
        Assert.assertEquals(Boolean.TRUE, snapshot.overrideAnyFeatureFlagValue());
        Assert.assertEquals(Boolean.TRUE, snapshot.overrideAllowAnyServerFlagValue());
    }

    @Test
    public void denyingBothServerSwitchesDisablesServerFallback() {
        GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                GboardAiWritingToolsOfficialPreferences.SERVER_PROOFREAD_PREF_KEY,
                false);
        GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                GboardAiWritingToolsOfficialPreferences.SERVER_WRITING_TOOLS_PREF_KEY,
                false);

        Assert.assertEquals(
                Boolean.FALSE,
                GboardAiWritingToolsOfficialPreferences.snapshot().overrideAllowAnyServerFlagValue());
    }

    @Test
    public void compositeOverridesStayUnknownUntilOutcomeIsProvable() {
        GboardAiWritingToolsOfficialPreferences.Snapshot snapshot =
                new GboardAiWritingToolsOfficialPreferences.Snapshot(
                        Boolean.FALSE,
                        null,
                        null,
                        null);

        Assert.assertNull(snapshot.overrideAnyFeatureFlagValue());
        Assert.assertNull(snapshot.overrideAllowAnyServerFlagValue());
    }

    @Test
    public void compositeOverridesResolveWhenOnePathIsKnownTrue() {
        GboardAiWritingToolsOfficialPreferences.Snapshot snapshot =
                new GboardAiWritingToolsOfficialPreferences.Snapshot(
                        Boolean.FALSE,
                        null,
                        Boolean.TRUE,
                        Boolean.TRUE);

        Assert.assertEquals(Boolean.TRUE, snapshot.overrideAnyFeatureFlagValue());
        Assert.assertEquals(Boolean.TRUE, snapshot.overrideAllowAnyServerFlagValue());
    }
}
