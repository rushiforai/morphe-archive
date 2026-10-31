package io.github.emotionbug.patches.adot.security;

import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.List;

/** Debugger/RE detection only; root, signatures, antivirus and AppProtect remain intact. */
public final class DebuggerDetectionPatch {
    public static final String ID="adot.security.disable-debugger-detection";
    private DebuggerDetectionPatch() {}

    public static List<MethodPatch> create() {
        return List.of(
            new DetectionMethodPatch("classes.dex",
                "Lcom/ahnlab/v3mobileplus/interfaces/DebuggerManager;->getDebuggerResult()I",
                "ff9f2ec97352b85155a74ec3f4367fca2b02ec26386f05147c6269b91f93218b",
                DetectionMethodPatch::returnZero),
            new DetectionMethodPatch("classes.dex",
                "Lcom/ahnlab/v3mobileplus/interfaces/DebuggerManager;->isDebuggerConnected()Z",
                "ee357bf28b9a7acb6174bf690c0f3904d7b3cd9ed0aaeaf3111df392ab36cd82",
                DetectionMethodPatch::returnZero),
            new DetectionMethodPatch("classes.dex",
                "Lcom/ahnlab/v3mobileplus/interfaces/MemoryCheckManager;->checkMemory()I",
                "1d73fe0db46a70644e38aa3a4be91fbcb460d1050dfd4048978fac5cc0c8be3b",
                DetectionMethodPatch::returnZero),
            new DetectionMethodPatch("classes2.dex", "Lyw6;->O()I",
                "2d944b53fb64e7851ce79c018bd078e16141296e727fd72a09b9b8b5d5f363d5",
                DetectionMethodPatch::debuggerState),
            new DetectionMethodPatch("classes.dex",
                "Lcom/appsflyer/internal/AFf1iSDK;->AFKeystoreWrapper()Ljava/lang/String;",
                "71ded0865ef109ca47125b9e6faee2538b3df5cbbea3b743a43115ea484757ca",
                DetectionMethodPatch::normalHookMarker),
            new DetectionMethodPatch("classes.dex",
                "Lcom/appsflyer/internal/AFf1iSDK;->unregisterClient(Landroid/content/Context;)Lcom/appsflyer/internal/AFg1gSDK;",
                "7f5ff5bca7acce9cc7ffb11f99f50c71e67d17e078f34cd0468f42b54cdc0d9f",
                original -> DetectionMethodPatch.zeroFlags(original,24)),
            new DetectionMethodPatch("classes2.dex",
                "Lcom/microsoft/identity/common/internal/telemetry/Telemetry$Builder;->withContext(Landroid/content/Context;)V",
                "310948a4e9049a748567b42d7c86270cefc6c2c09cf29c373399b00952a8027b",
                original -> DetectionMethodPatch.zeroFlags(original,181)),
            new DetectionMethodPatch("classes2.dex", "Lu98;->j()V",
                "bb0ba614b8ec3f9a6a2781733083ac083ceeeb5720be82e03829f54b6d589af7",
                original -> DetectionMethodPatch.zeroFlags(original,30)),
            new DetectionMethodPatch("classes2.dex", "Lv98;->run()V",
                "b7fc63ba096484ffb2b399482b4e9fc0b1e83fc8a47b6bdd8370f1fdc26682cc",
                original -> DetectionMethodPatch.zeroFlags(original,195)));
    }
}
