package app.morphe.extension.chmate;

/** Structural screen containers can be empty while waiting for a Fragment. */
public final class AdContainerSafety {
    private AdContainerSafety() {}

    public static boolean isScreenHost(Class<?> type, int viewId) {
        if (viewId == 0x01020002) return true; // android.R.id.content
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            if ("androidx.fragment.app.FragmentContainerView".equals(current.getName())) return true;
            // ChMate keeps an empty response-popup stack for anchors and revealed
            // NG responses. It is not a FragmentContainerView and has no children
            // until the first tap. Collapsing it makes every later popup invisible.
            try {
                current.getDeclaredField("mActivePopup");
                return true;
            } catch (NoSuchFieldException ignored) {
                // Field names survive obfuscation in the supported releases.
            }
        }
        return false;
    }
}
