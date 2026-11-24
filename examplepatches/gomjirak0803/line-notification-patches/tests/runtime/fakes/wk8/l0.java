package wk8;

public final class l0 {
    public ue3.k r() {
        return new ue3.k();
    }

    public boolean x(String chatId) {
        testenv.FakeLineEnv.ChatRow row = testenv.FakeLineEnv.CHATS.get(chatId);
        return row == null || !row.nativeMuted;
    }
}
