/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.extension.chesscom.botunlock;

import app.noam.extension.chesscom.Features;

/** Versus Bots: every bot, including ones only Premium members may play, can be played. */
public final class BotUnlock {
    private BotUnlock() {}

    public static boolean enabled() {
        return Features.botUnlockPatched() && Features.isEnabled(Features.BOT_UNLOCK);
    }
}
