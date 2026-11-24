package nn8;

public final class c {
    public c(boolean unused) {
    }

    public pn8.c a(String chatId) {
        testenv.FakeLineEnv.ChatRow row = testenv.FakeLineEnv.CHATS.get(chatId);
        return new pn8.c(row == null || !row.nativeMuted);
    }
}
