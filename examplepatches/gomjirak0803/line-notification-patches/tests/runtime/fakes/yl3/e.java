package yl3;

import kotlin.coroutines.Continuation;

public final class e {
    public ln3.k y1(String chatId) {
        testenv.FakeLineEnv.ChatRow row = testenv.FakeLineEnv.CHATS.get(chatId);
        if (row == null) return null;
        return new ln3.k(row.name, row.readUp, row.unread);
    }

    public Object t(String chatId, boolean desiredEnabled, Continuation cont) {
        return testenv.FakeLineEnv.handleNativeMuteCall(chatId, desiredEnabled, cont);
    }
}
