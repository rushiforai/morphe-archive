/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Method;

import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;

/**
 * Telegram's {@code auth.importBotAuthorization}, which this build of Telegram has no class for.
 * The patch makes this class a {@code TLObject} and gives it the two methods Telegram's connection
 * manager calls on a request: one that writes it out, which comes here, and one that reads the
 * answer as an {@code auth.Authorization}. The token lives only in this object, which Telegram drops
 * once the request has gone out; it's never logged, and {@link #toString()} leaves it out.
 */
public final class BotTokenRequest {
    /** {@code auth.importBotAuthorization#67a3ff2c flags:int api_id:int api_hash:string bot_auth_token:string}. */
    static final int CONSTRUCTOR = 0x67a3ff2c;
    /** No flags are defined for it. */
    static final int FLAGS = 0;
    static final String STREAM = "org.telegram.tgnet.OutputSerializedData";

    final int apiId;
    final String apiHash;
    final String token;

    public BotTokenRequest(int apiId, String apiHash, String token) {
        this.apiId = apiId;
        this.apiHash = apiHash;
        this.token = token;
    }

    /**
     * Writes the request to Telegram's {@code OutputSerializedData}. The patch's
     * {@code serializeToStream} hands its stream here; Telegram calls it once to measure and once to
     * write. Never throws, since it runs on Telegram's network queue.
     */
    public void write(Object stream) {
        try {
            Class<?> face = Class.forName(STREAM, false, stream.getClass().getClassLoader());
            Method int32 = HostNames.method(face, "writeInt32", int.class);
            Method string = HostNames.method(face, "writeString", String.class);
            int32.invoke(stream, CONSTRUCTOR);
            int32.invoke(stream, FLAGS);
            int32.invoke(stream, apiId);
            string.invoke(stream, apiHash);
            string.invoke(stream, token);
        } catch (Throwable failure) {
            // HookStatus keeps only the failure's class name, so nothing of the token reaches a log.
            HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "write request", failure);
        }
    }

    @Override
    public String toString() {
        return "auth.importBotAuthorization";
    }
}
