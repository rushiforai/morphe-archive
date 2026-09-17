/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class CameraMicIndicator {

    public static void onCameraAccess() {
        Logger.printInfo(() -> "Camera/mic indicator: camera accessed");
    }

    public static void onMicAccess() {
        Logger.printInfo(() -> "Camera/mic indicator: microphone accessed");
    }

    private CameraMicIndicator() {}
}
