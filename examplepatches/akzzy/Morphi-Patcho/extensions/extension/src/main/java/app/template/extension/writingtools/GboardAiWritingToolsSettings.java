package app.template.extension.writingtools;

import android.content.Context;

public final class GboardAiWritingToolsSettings {
    private GboardAiWritingToolsSettings() {}

    public static Snapshot snapshot(Context context) {
        return new Snapshot(true, true);
    }

    public static final class Snapshot {
        public final boolean featureEnabled;
        public final boolean allKeyboardsEnabled;

        public Snapshot(boolean featureEnabled, boolean allKeyboardsEnabled) {
            this.featureEnabled = featureEnabled;
            this.allKeyboardsEnabled = allKeyboardsEnabled;
        }
    }
}
