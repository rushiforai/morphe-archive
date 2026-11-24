package app.template.extension.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.reflect.Method;

final class SpeedWidgetDial {
    private final View layout;
    private final TextView speedText;
    private final TextView speedUnits;
    private final View badge;
    private final TextView limitText;
    private final TextView usOverlay;
    private final View ring;
    private final Method ringColor;
    private final Method ringOverlap;
    private final Method ringSweep;
    private final int regularColor;
    private final int warningColor;
    private final int worldSign;
    private final int usSign;

    SpeedWidgetDial(Context context) throws ReflectiveOperationException {
        layout = LayoutInflater.from(context).inflate(resource(context, "layout", "speedometer"), new FrameLayout(context), false);
        speedText = find(context, "speedText");
        speedUnits = find(context, "speedUnits");
        badge = find(context, "speedLimitWarnLayout");
        limitText = find(context, "speedLimitWarn");
        usOverlay = find(context, "speedLimitWarnUsOverlay");
        ring = find(context, "SpeedometerColoredView");
        Class<?> ringType = ring.getClass();
        ringColor = ringType.getMethod("a", int.class);
        ringOverlap = ringType.getMethod("b", boolean.class, int.class);
        ringSweep = ringType.getMethod("c", float.class);
        regularColor = layout.getResources().getColor(resource(context, "color", "White"), context.getTheme());
        warningColor = layout.getResources().getColor(resource(context, "color", "RedSweet"), context.getTheme());
        worldSign = resource(context, "drawable", "speedlimit_world");
        usSign = resource(context, "drawable", "speedlimit_us_notext");
    }

    Bitmap draw(String speed, String units, String limit, boolean useUsSign) throws ReflectiveOperationException {
        int current = number(speed);
        int posted = number(limit);
        boolean over = posted > 0 && current > posted;
        speedText.setText(current < 0 ? "--" : speed);
        speedText.setTextColor(over ? warningColor : regularColor);
        speedUnits.setText(units);
        badge.setVisibility(posted > 0 ? View.VISIBLE : View.GONE);
        limitText.setBackgroundResource(useUsSign ? usSign : worldSign);
        limitText.setText(limit);
        usOverlay.setText(limit);
        usOverlay.setVisibility(useUsSign ? View.VISIBLE : View.GONE);

        ring.setVisibility(posted > 0 && current >= 0 ? View.VISIBLE : View.GONE);
        boolean overlap = posted > 0 && current >= posted * 2;
        float sweep = 0f;
        if (posted > 0 && current > 0 && !overlap) {
            int remainder = current % posted;
            sweep = remainder == 0 ? 359f : remainder * 360f / posted;
        }
        ringColor.invoke(ring, over ? 2 : 1);
        ringOverlap.invoke(ring, overlap, over ? 2 : 1);
        ringSweep.invoke(ring, sweep);

        // RemoteViews hosts an ImageView. Draw Waze's own view hierarchy offscreen.
        int width = layout.getLayoutParams().width;
        int height = layout.getLayoutParams().height;
        layout.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        layout.layout(0, 0, width, height);
        float ratio = Math.min(1f, 352f / Math.max(width, height));
        Bitmap bitmap = Bitmap.createBitmap(Math.round(width * ratio), Math.round(height * ratio), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        canvas.scale(ratio, ratio);
        layout.draw(canvas);
        return bitmap;
    }

    private <T extends View> T find(Context context, String name) {
        return layout.requireViewById(resource(context, "id", name));
    }

    private static int resource(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    private static int number(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }
}
