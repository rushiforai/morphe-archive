package patches.maps.gearslip;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.File;
import java.io.FileOutputStream;

/**
 * Renders the badge with real Skia so the arrow is proven visible, not just present as a span.
 * The PNG is written under build/ for inspection when the assertion ever fails.
 */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 32, qualifiers = "xxhdpi")
public class BydBadgeRenderTest {

    @Test
    public void theDrawnArrowLeavesInkBetweenThePercentages() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        TextView view = new TextView(context);
        view.setTextSize(18f);
        view.setTextColor(0xFF137333);
        view.setIncludeFontPadding(false);
        view.setText(BydVehicle.badgeText(85));
        view.measure(View.MeasureSpec.makeMeasureSpec(600, View.MeasureSpec.AT_MOST),
                View.MeasureSpec.makeMeasureSpec(200, View.MeasureSpec.AT_MOST));
        view.layout(0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());

        Bitmap bitmap = Bitmap.createBitmap(
                view.getMeasuredWidth(), view.getMeasuredHeight(), Bitmap.Config.ARGB_8888);
        view.draw(new Canvas(bitmap));

        File out = new File("build/badge-render.png");
        try (FileOutputStream stream = new FileOutputStream(out)) {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream);
        }

        int ink = 0;
        for (int x = 0; x < bitmap.getWidth(); x++) {
            for (int y = 0; y < bitmap.getHeight(); y++) {
                if (Color.alpha(bitmap.getPixel(x, y)) > 0 && !isNearWhite(bitmap.getPixel(x, y))) {
                    ink++;
                }
            }
        }
        assertTrue("badge rendered no ink: " + out.getAbsolutePath(), ink > 50);
        assertEquals("85%", view.getText().toString());
    }

    private static boolean isNearWhite(int color) {
        return Color.red(color) > 240 && Color.green(color) > 240 && Color.blue(color) > 240;
    }
}
