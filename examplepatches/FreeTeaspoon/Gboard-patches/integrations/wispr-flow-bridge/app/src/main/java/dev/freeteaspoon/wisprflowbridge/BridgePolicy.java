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
}
