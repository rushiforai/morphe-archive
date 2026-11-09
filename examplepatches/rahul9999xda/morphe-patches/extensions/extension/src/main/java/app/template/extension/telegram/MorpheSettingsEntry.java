package app.template.extension.telegram;

import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Adds a Telegram Help-card-style Morphe section to the Settings screen.
 *
 * The public factory name and return type intentionally remain unchanged:
 * the existing Telegram 13.1.1 settings injection calls this method.
 */
public final class MorpheSettingsEntry {
    private static final int MORPHE_BLUE = 0xff079fc5;

    private MorpheSettingsEntry() { }

    public static View createSettingsRow(Context context) {
        if (context == null) {
            throw new IllegalStateException("Telegram application context is not ready");
        }
        final Context appContext = context;

        // A single Help-style card. No separate Morphe heading above it.
        LinearLayout section = new LinearLayout(context);
        section.setOrientation(LinearLayout.VERTICAL);
        section.setPadding(dp(context, 12), dp(context, 8),
                dp(context, 12), dp(context, 8));
        section.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(context, 22), dp(context, 12),
                dp(context, 18), dp(context, 12));
        card.setBackground(createCardBackground(context));
        section.addView(card, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        LinearLayout item = new LinearLayout(context);
        item.setOrientation(LinearLayout.HORIZONTAL);
        item.setGravity(Gravity.CENTER_VERTICAL);
        item.setMinimumHeight(dp(context, 76));
        item.setBackground(selectableBackground(context));
        item.setClickable(true);
        item.setFocusable(true);
        item.setContentDescription("Morphe Settings");
        card.addView(item, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        MorpheMarkView icon = new MorpheMarkView(context);
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(
                dp(context, 56), dp(context, 56));
        item.addView(icon, iconParams);

        LinearLayout labels = new LinearLayout(context);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams labelsParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        labelsParams.leftMargin = dp(context, 18);
        item.addView(labels, labelsParams);

        TextView title = new TextView(context);
        title.setText("Morphe Settings");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        title.setTypeface(android.graphics.Typeface.create("sans-serif-medium",
                android.graphics.Typeface.NORMAL));
        title.setTextColor(0xff202124);
        labels.addView(title, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        TextView subtitle = new TextView(context);
        subtitle.setText("Automatic forwarding and custom options");
        subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        subtitle.setLineSpacing(0f, 1.0f);
        subtitle.setTextColor(0xff555555);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        subtitleParams.topMargin = dp(context, 3);
        labels.addView(subtitle, subtitleParams);

        TextView chevron = new TextView(context);
        chevron.setText("›");
        chevron.setTextSize(TypedValue.COMPLEX_UNIT_SP, 30);
        chevron.setTextColor(0xff555555);
        chevron.setGravity(Gravity.CENTER);
        item.addView(chevron, new LinearLayout.LayoutParams(
                dp(context, 24), dp(context, 48)));

        item.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                try {
                    Intent intent = new Intent(appContext, MorpheSettingsActivity.class);
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    appContext.startActivity(intent);
                } catch (android.content.ActivityNotFoundException missingActivity) {
                    Toast.makeText(appContext,
                            "Morphe Settings activity is not registered in this build",
                            Toast.LENGTH_LONG).show();
                }
            }
        });
        return section;
    }

    /**
     * Telegram-style filled app tile: a single solid brand colour with a simple,
     * high-contrast white Morphe "M" mark. Avoids emoji fonts and puzzle silhouettes.
     */
    private static final class MorpheMarkView extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path mark = new Path();
        private final GradientDrawable tile = new GradientDrawable();

        MorpheMarkView(Context context) {
            super(context);
            tile.setColor(MORPHE_BLUE);
            tile.setCornerRadius(dp(context, 15));
            setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float side = Math.min(getWidth(), getHeight());
            float left = (getWidth() - side) * 0.5f;
            float top = (getHeight() - side) * 0.5f;
            canvas.save();
            canvas.translate(left, top);
            tile.setBounds(0, 0, (int) side, (int) side);
            tile.draw(canvas);

            // A compact, geometric M monogram drawn as a filled path.
            // It remains crisp at Telegram's standard 56dp settings-icon size.
            float unit = side / 56f;
            canvas.translate(0f, 0f);
            canvas.scale(unit, unit);
            mark.reset();
            mark.moveTo(13f, 39f);
            mark.lineTo(13f, 17f);
            mark.cubicTo(13f, 14.5f, 16f, 13.5f, 18f, 15.5f);
            mark.lineTo(28f, 27f);
            mark.lineTo(38f, 15.5f);
            mark.cubicTo(40f, 13.5f, 43f, 14.5f, 43f, 17f);
            mark.lineTo(43f, 39f);
            mark.lineTo(36.5f, 39f);
            mark.lineTo(36.5f, 25.5f);
            mark.lineTo(30.5f, 32.5f);
            mark.cubicTo(29f, 34.2f, 27f, 34.2f, 25.5f, 32.5f);
            mark.lineTo(19.5f, 25.5f);
            mark.lineTo(19.5f, 39f);
            mark.close();
            paint.setColor(Color.WHITE);
            paint.setStyle(Paint.Style.FILL);
            canvas.drawPath(mark, paint);
            canvas.restore();
        }
    }

    private static int dp(Context context, float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static int themeColor(Context context, int attribute, int fallback) {
        TypedValue value = new TypedValue();
        if (context.getTheme().resolveAttribute(attribute, value, true)) {
            if (value.resourceId != 0) {
                try { return context.getResources().getColor(value.resourceId); }
                catch (Throwable ignored) { }
            }
            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                    && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return value.data;
            }
        }
        return fallback;
    }

    private static android.graphics.drawable.Drawable createCardBackground(Context context) {
        // Match Telegram's Help card: white rounded surface on the Settings page background.
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(Color.WHITE);
        shape.setCornerRadius(dp(context, 24));
        return shape;
    }

    private static android.graphics.drawable.Drawable selectableBackground(Context context) {
        TypedArray array = context.obtainStyledAttributes(
                new int[]{android.R.attr.selectableItemBackground});
        try {
            int resource = array.getResourceId(0, 0);
            return resource != 0 ? context.getDrawable(resource) : new GradientDrawable();
        } catch (Throwable ignored) {
            return new GradientDrawable();
        } finally {
            array.recycle();
        }
    }
}
