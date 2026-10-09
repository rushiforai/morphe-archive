/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet;

/** Test stand-ins carrying the names and public fields the push answer hook reads from Telegram's own classes. */
public final class TLRPC {
    private TLRPC() { }

    public static class TL_boolTrue { }

    public static class TL_boolFalse { }

    public static class TL_error {
        public int code;
        public String text;

        public TL_error(int code, String text) {
            this.code = code;
            this.text = text;
        }
    }
}
