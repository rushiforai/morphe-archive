/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.extension.chesscom.coach;

import app.noam.extension.chesscom.Features;

/** Play Coach's one-free-game-per-day quota never runs out, and playing one is not reported. */
public final class Coach {
    private Coach() {}

    public static boolean enabled() {
        return Features.unlimitedCoachPatched() && Features.isEnabled(Features.UNLIMITED_COACH);
    }
}
