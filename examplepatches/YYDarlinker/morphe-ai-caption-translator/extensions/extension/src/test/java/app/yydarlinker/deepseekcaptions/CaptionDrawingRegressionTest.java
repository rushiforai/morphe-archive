package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/** Exercise the real custom TextView paint path, including reuse of a scrolled TextView. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CaptionDrawingRegressionTest {
    private Activity activity;
    private TextView text;
    private Object previousBackground;
    private Field background;

    @Before public void setUp() throws Exception {
        activity = Robolectric.buildActivity(Activity.class).setup().visible().get();
        Constructor<?> constructor = Class.forName(CaptionOverlay.class.getName() + "$CaptionText")
                .getDeclaredConstructor(android.content.Context.class);
        constructor.setAccessible(true);
        text = (TextView) constructor.newInstance(activity);
        text.setLayoutParams(new FrameLayout.LayoutParams(860, -2));
        text.setGravity(android.view.Gravity.CENTER);
        text.setIncludeFontPadding(false);
        text.setPadding(21, 14, 21, 14);
        text.setTextSize(TypedValue.COMPLEX_UNIT_PX, 48.68376f);
        text.setTextColor(Color.WHITE);
        text.setMaxLines(2);
        background = CaptionOverlay.class.getDeclaredField("captionBackground");
        background.setAccessible(true);
        previousBackground = background.get(null);
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(Color.BLACK);
        drawable.setCornerRadius(14);
        background.set(null, drawable);
    }

    @After public void tearDown() throws Exception {
        background.set(null, previousBackground);
        activity.finish();
    }

    private void layout(int width) {
        text.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        text.layout(0, 0, width, text.getMeasuredHeight());
    }

    private Bitmap draw() {
        int scrollX = text.getScrollX(), scrollY = text.getScrollY();
        if (text.getParent() instanceof FrameLayout) ((FrameLayout) text.getParent()).removeView(text);
        FrameLayout parent = new FrameLayout(activity);
        parent.addView(text, new FrameLayout.LayoutParams(text.getWidth(), text.getHeight()));
        parent.measure(View.MeasureSpec.makeMeasureSpec(text.getWidth(), View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(text.getHeight(), View.MeasureSpec.EXACTLY));
        parent.layout(0, 0, text.getWidth(), text.getHeight());
        text.scrollTo(scrollX, scrollY);
        Bitmap bitmap = Bitmap.createBitmap(text.getWidth(), text.getHeight(), Bitmap.Config.ARGB_8888);
        parent.draw(new Canvas(bitmap));
        return bitmap;
    }

    @Test public void waitingMessageKeepsRoundedBackgroundAfterTextViewScroll() {
        text.setText("翻译中…");
        layout(217);
        Bitmap unscrolled = draw();
        text.scrollTo(35, 12);
        Bitmap image = draw();
        // The background belongs to the visible viewport, rather than the scrolled text origin.
        assertEquals("top left corner must stay rounded", 0, Color.alpha(image.getPixel(0, 0)));
        assertEquals("bottom right corner must stay rounded", 0,
                Color.alpha(image.getPixel(image.getWidth() - 1, image.getHeight() - 1)));
        assertEquals("background reaches the viewport's lower edge", 255,
                Color.alpha(image.getPixel(image.getWidth() / 2, image.getHeight() - 2)));
        assertTrue("all glyphs and the rounded background retain the same visible pixels",
                unscrolled.sameAs(image));
    }

    @Test public void waitingMessageHasRoundedCornersWithoutScroll() {
        text.setText("翻译中…");
        layout(217);
        Bitmap image = draw();
        assertEquals(0, Color.alpha(image.getPixel(0, 0)));
        assertEquals(255, Color.alpha(image.getPixel(image.getWidth() / 2, image.getHeight() / 2)));
    }
}
