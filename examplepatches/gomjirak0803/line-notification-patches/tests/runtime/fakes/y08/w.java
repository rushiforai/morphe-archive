package y08;

public final class w extends q08.a {
    private final String chatId;

    public w(String chatId) {
        this.chatId = chatId;
    }

    @Override public void a(q08.b observer) {
        testenv.FakeLineEnv.handleNativeReadCall(chatId, observer);
    }
}
