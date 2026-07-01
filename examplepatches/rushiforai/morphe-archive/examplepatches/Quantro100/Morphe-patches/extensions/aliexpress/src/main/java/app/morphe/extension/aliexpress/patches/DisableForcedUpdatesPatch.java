package app.morphe.extension.aliexpress.patches;

@SuppressWarnings("unused")
public final class DisableForcedUpdatesPatch {

    public static boolean shouldShowUpdateDialog() {
        return false;
    }

    public static int getMinSupportedVersionCode(int originalVersionCode) {
        return Integer.MAX_VALUE;
    }
}
