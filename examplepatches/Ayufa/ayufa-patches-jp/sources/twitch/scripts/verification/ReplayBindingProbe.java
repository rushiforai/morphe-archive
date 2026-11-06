public final class ReplayBindingProbe {
    public static void main(String[] args) {
        try { verify(args); }
        catch (Throwable error) { error.printStackTrace(); System.exit(1); }
    }

    private static void verify(String[] args) throws Exception {
        if (android.os.Looper.myLooper() == null) android.os.Looper.prepareMainLooper();
        Class<?> row = Class.forName(args[0]);
        String expected = args.length > 1 ? args[1] : "twitchPatchReplayEmotes";
        boolean bridge = false;
        for (var method : row.getDeclaredMethods()) {
            if (method.getName().equals(expected)) bridge = true;
        }
        if (!bridge) throw new AssertionError("Patched binding is missing.");
        System.out.println("PASS Android binding class and method verification");
    }
}
