package nn8;

public final class i {
    public static boolean c() {
        Runnable hook = testenv.FakeLineEnv.onPreviewsAllowedCheck;
        if (hook != null) hook.run();
        if (testenv.FakeLineEnv.throwOnPreviewsAllowed) {
            throw new IllegalStateException("Preview privacy unavailable");
        }
        return testenv.FakeLineEnv.previewsAllowed;
    }
}
