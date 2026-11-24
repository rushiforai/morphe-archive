/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.warunglife;

import app.fakh.extension.shared.GmsCoreCheck;

/** Tells the user when Google sign-in is started without GmsCore installed. */
public final class GmsCore {
    private GmsCore() {
    }

    /** Called where the game starts the Google sign-in. */
    public static void require() {
        GmsCoreCheck.require("Tautkan akun");
    }
}
