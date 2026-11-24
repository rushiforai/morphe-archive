package dev.jason.gboardpatches.extension.writingtools;

public final class GboardAiWritingToolsOfficialPreferences {
    // 18.8 string ids of the keys the stock writing-tools settings controller (kar) removes:
    // "show_fix_it_button" (proofread), "writing_tools_cooperative_mode" and
    // "setting_writing_tools_category_key".
    public static final int PROOFREAD_PREF_KEY = 0x7f1409b2;
    public static final int WRITING_TOOLS_PREF_KEY = 0x7f140ab4;
    public static final int WRITING_TOOLS_CATEGORY_KEY = 0x7f140cc9;

    private static final Object LOCK = new Object();
    private static volatile Snapshot observedSnapshot = new Snapshot(null, null);

    private GboardAiWritingToolsOfficialPreferences() {
    }

    public static void notePreferenceValue(int keyResId, boolean value) {
        synchronized (LOCK) {
            Snapshot current = observedSnapshot;
            Boolean proofreadEnabled = current.proofreadEnabled;
            Boolean writingToolsEnabled = current.writingToolsEnabled;

            if (keyResId == PROOFREAD_PREF_KEY) {
                proofreadEnabled = Boolean.valueOf(value);
            } else if (keyResId == WRITING_TOOLS_PREF_KEY) {
                writingToolsEnabled = Boolean.valueOf(value);
            } else {
                return;
            }

            observedSnapshot = new Snapshot(proofreadEnabled, writingToolsEnabled);
        }
    }

    public static Snapshot snapshot() {
        return observedSnapshot;
    }

    public static void clearForTest() {
        synchronized (LOCK) {
            observedSnapshot = new Snapshot(null, null);
        }
    }

    public static final class Snapshot {
        public final Boolean proofreadEnabled;
        public final Boolean writingToolsEnabled;

        public Snapshot(Boolean proofreadEnabled, Boolean writingToolsEnabled) {
            this.proofreadEnabled = proofreadEnabled;
            this.writingToolsEnabled = writingToolsEnabled;
        }

        public boolean shouldEnableProofread() {
            return !Boolean.FALSE.equals(proofreadEnabled);
        }

        public boolean shouldEnableWritingTools() {
            return !Boolean.FALSE.equals(writingToolsEnabled);
        }

        public boolean shouldEnableAnyFeature() {
            return shouldEnableProofread() || shouldEnableWritingTools();
        }

    }
}
