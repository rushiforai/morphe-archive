package dev.freeteaspoon.wisprflowbridge;

final class BridgePolicy {
    private BridgePolicy() {}

    static boolean acceptsSender(int senderUid, int imeUid) {
        return senderUid >= 0 && imeUid >= 0 && senderUid == imeUid;
    }

    static boolean showOverlay(boolean keyboardMode, String stateClass) {
        if (!keyboardMode) return true;
        // These are the actual FlowState subclasses in Wispr Flow 2.8.5.
        return "Recording".equals(stateClass) || "Processing".equals(stateClass)
                || "Error".equals(stateClass) || "Repair".equals(stateClass);
    }
}
