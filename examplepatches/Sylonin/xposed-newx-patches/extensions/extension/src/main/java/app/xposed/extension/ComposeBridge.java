package app.xposed.extension;

import android.graphics.Bitmap;
import android.graphics.Canvas;

import java.util.List;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/**
 * Calls into X's Jetpack Compose and model classes. R8 renames them in every release, so each
 * body here is replaced at patch time with bytecode that uses the names found in that APK.
 * The Object types stand for the renamed classes named in each comment.
 */
@SuppressWarnings("unused")
public final class ComposeBridge {
    private ComposeBridge() {
    }

    private static UnsupportedOperationException notPatched() {
        return new UnsupportedOperationException("Not patched");
    }

    /** {@code Modifier.size(width, height)} in dp. */
    public static Object size(float widthDp, float heightDp) {
        throw notPatched();
    }

    /** {@code modifier.clickable(onClick)} with the theme's ripple. */
    public static Object clickable(Object modifier, Function0<?> onClick) {
        throw notPatched();
    }

    /** {@code modifier.drawWithContent(onDraw)}. onDraw receives the draw scope. */
    public static Object drawWithContent(Object modifier, Function1<?, ?> onDraw) {
        throw notPatched();
    }

    /** {@code ContentDrawScope.drawContent()}. */
    public static void drawContent(Object scope) {
        throw notPatched();
    }

    /** The android.graphics.Canvas behind a draw scope, or null if it isn't backed by one. */
    public static Canvas nativeCanvas(Object scope) {
        throw notPatched();
    }

    /** {@code DrawScope.size} in px: width in the high 32 bits, height in the low, as float bits. */
    public static long drawSize(Object scope) {
        throw notPatched();
    }

    /** A BitmapPainter for the bitmap. */
    public static Object bitmapPainter(Bitmap bitmap) {
        throw notPatched();
    }

    /** The {@code Image(painter, contentDescription, modifier)} composable, with its default Fit scaling. */
    public static void image(Object painter, String contentDescription, Object modifier, Object composer) {
        throw notPatched();
    }

    /** {@code mutableIntStateOf(value)}. */
    public static Object intState(int value) {
        throw notPatched();
    }

    /** Reads an int state; inside composition the read subscribes the current scope to it. */
    public static int readIntState(Object state) {
        throw notPatched();
    }

    public static void writeIntState(Object state, int value) {
        throw notPatched();
    }

    /** {@code toImmutableList()}, the list type of X's badge rows. */
    public static Object immutableList(List<?> list) {
        throw notPatched();
    }

    /** X's Affiliate badge item {@code (contentDescription, badgeImageUrl, onClickOpenUrl = null)}. */
    public static Object affiliateBadge(String contentDescription, String url) {
        throw notPatched();
    }

    /** X's RichText {@code (text, rtl = false, Natural alignment, no entities)}. */
    public static Object richText(String text) {
        throw notPatched();
    }

    /**
     * X's notice for posts it can't show: a bordered row with message and, when cta isn't
     * null, a tappable call to action that runs onClick. message and cta are RichText.
     */
    public static void notice(Object message, Object cta, Function1<?, ?> onLink, Object modifier, Function0<?> onClick,
                              Object composer) {
        throw notPatched();
    }

    /** {@code modifier.fillMaxWidth()}; null stands for an empty modifier. */
    public static Object fillMaxWidth(Object modifier) {
        throw notPatched();
    }

    /** {@code modifier.padding(paddingValues)}; null modifier stands for an empty one. */
    public static Object padding(Object modifier, Object paddingValues) {
        throw notPatched();
    }

    /** The timeline X is composing, from its CompositionLocal, or null outside timelines. */
    public static Object timelineHost(Object composer) {
        throw notPatched();
    }
}
