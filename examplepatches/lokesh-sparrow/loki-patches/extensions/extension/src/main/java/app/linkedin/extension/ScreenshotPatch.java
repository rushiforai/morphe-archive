/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

/**
 * UpdateScreenCaptureManagerImpl.register() hooks Activity.registerScreenCaptureCallback so that a screenshot of a
 * post opens a share sheet. Skipping the registration is all it takes to switch the sheet off.
 */
@SuppressWarnings("unused")
public final class ScreenshotPatch {

    /** Injected at the top of register(): true means return without registering the callback. */
    public static boolean skipRegistration() {
        return Settings.disableScreenshotSheet();
    }
}
