package org.swiftapps.swiftbackup.settings;

/** Preserve the native nested model name and constructor/restore signatures verified with REA. */
public final class SwiftBackupSettingsHelper {
    public static final class SettingsData {
        public static int restores;
        public SettingsData() {}
        public void restore() { restores++; }
    }
}
