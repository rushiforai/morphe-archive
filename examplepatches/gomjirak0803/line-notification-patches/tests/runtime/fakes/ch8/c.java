package ch8;

public final class c {
    public static final class a extends bd0.a {
        public static final a c = new a();
    }

    public eh8.e a(String chatId) {
        Runnable hook = testenv.FakeLineEnv.onMutedCheck;
        if (hook != null) hook.run();
        testenv.FakeLineEnv.ChatRow row = testenv.FakeLineEnv.CHATS.get(chatId);
        return new eh8.e(row == null || !row.nativeMuted);
    }
}
