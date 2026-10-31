package io.github.emotionbug.patches.adot.security;

import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.List;

/** Suppress ADB/developer-setting detection reads, without changing Android settings. */
public final class UsbDebuggingDetectionPatch {
    public static final String ID="adot.security.disable-usb-debugging-detection";
    private UsbDebuggingDetectionPatch() {}

    public static List<MethodPatch> create() {
        return List.of(
            new DetectionMethodPatch("classes.dex",
                "Lcom/ahnlab/v3mobileplus/interfaces/Utils;->isDebugEnable(Landroid/content/Context;)Z",
                "f5fdc4375b6f70df2aea52c91ad1b01e07655d278ac19749be8282b50ea28beb",
                DetectionMethodPatch::returnZero),
            new DetectionMethodPatch("classes2.dex",
                "Lcom/kakao/adfit/lt/rdZSDnsJ;->gDzHvoVp(Landroid/content/Context;)Z",
                "8b8c7773c046146451a34b5492319a4d25dc56bba23dc79fe1f792e581862435",
                DetectionMethodPatch::returnZero),
            new DetectionMethodPatch("classes2.dex",
                "Lnet/nshc/ap/adbobserver/ADBCheckObserver;->execShell(Landroid/content/Context;)Z",
                "93c71514da47e9d5751eda0655b5930d39c2e3feec9209360e7c51b50e17f6ad",
                DetectionMethodPatch::returnZero),
            new DetectionMethodPatch("classes.dex", "Lsrl;->l(Landroid/content/Context;)V",
                "1c0c375f416dc8475830ba5d040ce11ae42d8b724a64cc846ed1a165e19632e0",
                DetectionMethodPatch::developerSetting));
    }
}
