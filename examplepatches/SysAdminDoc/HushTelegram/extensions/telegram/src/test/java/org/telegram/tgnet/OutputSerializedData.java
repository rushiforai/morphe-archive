/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet;

/** Test stand-in for the stream Telegram writes a request into, with the two writes a bot sign-in uses. */
public interface OutputSerializedData {
    void writeInt32(int value);

    void writeString(String value);
}
