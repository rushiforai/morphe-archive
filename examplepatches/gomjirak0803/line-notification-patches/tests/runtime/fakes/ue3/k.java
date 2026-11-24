package ue3;

import kotlin.coroutines.Continuation;

public final class k {
    public ig3.k u1(String chatId) {
        testenv.FakeLineEnv.ChatRow row = testenv.FakeLineEnv.CHATS.get(chatId);
        if (row == null) return null;
        return new ig3.k(row.name, row.readUp, row.unread);
    }

    public Object p(String chatId, boolean desiredEnabled, Continuation cont) {
        return testenv.FakeLineEnv.handleNativeMuteCall(chatId, desiredEnabled, cont);
    }
}
