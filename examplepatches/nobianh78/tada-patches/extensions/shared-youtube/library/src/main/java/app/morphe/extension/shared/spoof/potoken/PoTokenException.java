/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2533
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.shared.spoof.potoken;

public class PoTokenException extends Exception {
    public PoTokenException(String message) {
        super(message);
    }

    public static class BadWebViewException extends Exception {
        public BadWebViewException(String message) {
            super(message);
        }
    }

    public static Exception buildExceptionForJsError(String error) {
        if (error != null && error.contains("SyntaxError")) {
            return new BadWebViewException(error);
        }
        return new PoTokenException(error);
    }
}