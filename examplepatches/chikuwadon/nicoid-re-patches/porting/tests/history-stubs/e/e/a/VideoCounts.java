package e.e.a;
// Records the production binder's call to the shared icon renderer.
public final class VideoCounts {
    public static int calls;
    public static long[] counts;
    public static void setText(android.widget.TextView view, CharSequence original) {
        calls++;
        counts = VideoCountRules.parse(original);
        view.setText("icons");
        view.setContentDescription("statistics");
    }
}
