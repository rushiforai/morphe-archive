package e.e.a;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;

// Compile-time signatures provided by the verified base DEX. These classes are never bundled.
final class CommentMotion {
    static float position(Object renderer) { throw new AssertionError(); }
    static long generation(Object renderer) { throw new AssertionError(); }
}
final class CommentOptions {
    static SharedPreferences prefs(Context context) { throw new AssertionError(); }
    static int value(Context context, String key, int def, int min, int max) { throw new AssertionError(); }
    static int size(Context context) { throw new AssertionError(); }
    static int opacity(Context context) { throw new AssertionError(); }
    static float shadow(Context context) { throw new AssertionError(); }
}
final class CommentStyle {
    static boolean apply(Paint paint, Context context) { throw new AssertionError(); }
}
final class CommentViewport190 {
    static int width(Object renderer, Canvas canvas) { throw new AssertionError(); }
    static int height(Object renderer, Canvas canvas) { throw new AssertionError(); }
}
final class CommentContinuity118 {
    static String key(Object comment) { throw new AssertionError(); }
}
final class CommentOutlineOpacity {
    static void drawLive(Canvas canvas, String text, float x, float y, Paint outline, Paint fill) {
        throw new AssertionError();
    }
}
final class FixedCommentCollision {
    static void begin(Canvas canvas, boolean strict, boolean secondary, float time, float padding) {
        throw new AssertionError();
    }
}
final class CommentClockRules {
    int position(long raw, boolean playing, float speed, long now) { throw new AssertionError(); }
}
