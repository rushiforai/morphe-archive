/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.messenger;

/** Test stand-in for the API ID and hash Telegram signs in with, set by each test. */
public final class BuildVars {
    private BuildVars() { }

    public static int APP_ID;
    public static String APP_HASH;
}
