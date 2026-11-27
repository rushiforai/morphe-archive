package ke8;

public final class z {
    public yl3.e t() {
        return new yl3.e();
    }

    public boolean z(String chatId) {
        testenv.FakeLineEnv.ChatRow row = testenv.FakeLineEnv.CHATS.get(chatId);
        return row == null || !row.nativeMuted;
    }
}
