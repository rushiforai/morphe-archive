package dev.jason.gboardpatches.extension.writingtools;

public final class GboardAiWritingToolsOfficialPreferences {
    public static final int SHOW_FIX_IT_BUTTON_PREF_KEY = 0x7f1409d1;
    public static final int SERVER_PROOFREAD_PREF_KEY = 0x7f140ab9;
    public static final int SERVER_WRITING_TOOLS_PREF_KEY = 0x7f140aba;
    public static final int WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY = 0x7f140b0c;

    private static final Object LOCK = new Object();

    private static volatile Snapshot observedSnapshot = new Snapshot(
            null, null, null, null);

    private GboardAiWritingToolsOfficialPreferences() {
    }

    public static void notePreferenceValue(int keyResId, boolean value) {
        synchronized (LOCK) {
            Snapshot current = observedSnapshot;
            Boolean proofreadEnabled = current.proofreadEnabled;
            Boolean proofreadServerEnabled = current.proofreadServerEnabled;
            Boolean writingToolsServerEnabled = current.writingToolsServerEnabled;
            Boolean editTextWithAiEnabled = current.editTextWithAiEnabled;

            if (keyResId == SHOW_FIX_IT_BUTTON_PREF_KEY) {
                proofreadEnabled = Boolean.valueOf(value);
            } else if (keyResId == SERVER_PROOFREAD_PREF_KEY) {
                proofreadServerEnabled = Boolean.valueOf(value);
            } else if (keyResId == SERVER_WRITING_TOOLS_PREF_KEY) {
                writingToolsServerEnabled = Boolean.valueOf(value);
            } else if (keyResId == WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY) {
                editTextWithAiEnabled = Boolean.valueOf(value);
            } else {
                return;
            }

            observedSnapshot = new Snapshot(
                    proofreadEnabled,
                    proofreadServerEnabled,
                    writingToolsServerEnabled,
                    editTextWithAiEnabled);
        }
    }

    public static Snapshot snapshot() {
        return observedSnapshot;
    }

    public static void clearForTest() {
        observedSnapshot = new Snapshot(null, null, null, null);
    }

    public static final class Snapshot {
        public final Boolean proofreadEnabled;
        public final Boolean proofreadServerEnabled;
        public final Boolean writingToolsServerEnabled;
        public final Boolean editTextWithAiEnabled;

        public Snapshot(Boolean proofreadEnabled, Boolean proofreadServerEnabled,
                Boolean writingToolsServerEnabled, Boolean editTextWithAiEnabled) {
            this.proofreadEnabled = proofreadEnabled;
            this.proofreadServerEnabled = proofreadServerEnabled;
            this.writingToolsServerEnabled = writingToolsServerEnabled;
            this.editTextWithAiEnabled = editTextWithAiEnabled;
        }

        public Boolean overrideProofreadFlagValue() {
            return proofreadEnabled;
        }

        public Boolean overrideEditTextWithAiFlagValue() {
            return editTextWithAiEnabled;
        }

        public Boolean overrideAnyFeatureFlagValue() {
            return resolveAnyEnabled(
                    proofreadEnabled,
                    editTextWithAiEnabled);
        }

        public Boolean overrideAllowAnyServerFlagValue() {
            return resolveAllowServerForAnyEnabledFeature(
                    proofreadEnabled,
                    proofreadServerEnabled,
                    writingToolsServerEnabled,
                    editTextWithAiEnabled);
        }
    }

    static Boolean resolveAllowServerForAnyEnabledFeature(Boolean proofreadEnabled,
            Boolean proofreadServerEnabled, Boolean writingToolsServerEnabled,
            Boolean editTextWithAiEnabled) {
        return resolveAnyEnabled(
                resolveEnabledPath(proofreadEnabled, proofreadServerEnabled),
                resolveEnabledPath(editTextWithAiEnabled, writingToolsServerEnabled));
    }

    private static Boolean resolveAnyEnabled(Boolean first, Boolean second) {
        if (Boolean.TRUE.equals(first) || Boolean.TRUE.equals(second)) {
            return Boolean.TRUE;
        }
        if (Boolean.FALSE.equals(first) && Boolean.FALSE.equals(second)) {
            return Boolean.FALSE;
        }
        return null;
    }

    private static Boolean resolveEnabledPath(Boolean featureEnabled, Boolean serverEnabled) {
        if (Boolean.FALSE.equals(featureEnabled) || Boolean.FALSE.equals(serverEnabled)) {
            return Boolean.FALSE;
        }
        if (Boolean.TRUE.equals(featureEnabled) && Boolean.TRUE.equals(serverEnabled)) {
            return Boolean.TRUE;
        }
        return null;
    }
}
