/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet.tl;

/** Test stand-ins for account requests, named and shaped as Telegram's own. */
public final class TL_account {
    private TL_account() { }

    /** Sets the account online or offline: offline is true when the app goes to the background. */
    public static class updateStatus {
        public boolean offline;
    }
}
