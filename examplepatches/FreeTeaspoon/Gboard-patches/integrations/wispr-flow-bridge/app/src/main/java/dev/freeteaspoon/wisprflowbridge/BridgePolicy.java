package dev.freeteaspoon.wisprflowbridge;

final class BridgePolicy {
    private BridgePolicy() {}

    static boolean supportsVersion(String versionName) {
        return "2.8.5".equals(versionName) || "2.8.7".equals(versionName);
    }

    static boolean acceptsSender(int senderUid, int imeUid) {
        return senderUid >= 0 && imeUid >= 0 && senderUid == imeUid;
    }

    static boolean showOverlay(boolean keyboardMode, String stateClass) {
        if (!keyboardMode) return true;
        return "Recording".equals(stateClass) || "Processing".equals(stateClass)
                || "Error".equals(stateClass) || "Repair".equals(stateClass);
    }

    static boolean canStart(String status) {
        return "Idle".equals(status) || "Error".equals(status) || "Dismissed".equals(status);
    }

    static boolean canStop(String status, boolean submit) {
        return "Listening".equals(status) || (!submit && "Initializing".equals(status));
    }

    static int voiceLevel(float normalizedLevel) {
        return Math.round(Math.max(0f, Math.min(1f, normalizedLevel)) * 100f);
    }
}
