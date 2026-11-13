package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

/**
 * setlog のダークテーマに合わせた色と部品。値は setlog の res/values-night/colors.xml から取った。
 */
final class Ui {
    /** collections_home_background */
    static final int BACKGROUND = 0xFF000000;
    /** 送信先の行やカメラ画面のボタンと同じ面の色 */
    static final int SURFACE = 0xFF1C1C1E;
    /** collections_home_surface_pressed */
    static final int SURFACE_RAISED = 0xFF2C2C2E;
    /** collection_header_stroke */
    static final int STROKE = 0x1FFFFFFF;
    /** collections_home_text_primary */
    static final int TEXT_PRIMARY = 0xFFFFFFFF;
    /** collections_home_text_secondary */
    static final int TEXT_SECONDARY = 0x99EBEBF5;
    /** account_color_pink。送信ボタンや選択中の印に使われている */
    static final int ACCENT = 0xFFFE75F5;
    /** 動画の上に重ねるボタンの下地 */
    static final int SCRIM = 0x66000000;

    private Ui() {}

    static int dp(Context context, float value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }

    static GradientDrawable rounded(Context context, int color, float radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(context, radiusDp));
        return drawable;
    }

    static GradientDrawable pill(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(10_000f);
        return drawable;
    }

    static GradientDrawable circle(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(color);
        return drawable;
    }

    static TextView text(Context context, String value, float sizeSp, int color, boolean bold) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        view.setTextColor(color);
        view.setIncludeFontPadding(false);
        if (bold) {
            view.setTypeface(Typeface.DEFAULT_BOLD);
        }
        return view;
    }

    /** 押せる文字ボタン。setlog のボタンと同じく丸い下地に白い文字。 */
    static TextView pillButton(Context context, String label) {
        TextView button = text(context, label, 15, TEXT_PRIMARY, false);
        button.setGravity(Gravity.CENTER);
        button.setPadding(dp(context, 18), dp(context, 11), dp(context, 18), dp(context, 11));
        button.setBackground(pill(SURFACE));
        button.setClickable(true);
        return button;
    }

    /** 選択状態の見た目。選ばれている項目はピンクの縁取り。 */
    static void setChipSelected(Context context, TextView chip, boolean selected) {
        GradientDrawable background = pill(SURFACE);
        if (selected) {
            background.setStroke(dp(context, 2), ACCENT);
        }
        chip.setBackground(background);
        chip.setTextColor(selected ? TEXT_PRIMARY : TEXT_SECONDARY);
    }

    static SeekBar seekBar(Context context, int max, int progress) {
        SeekBar bar = new SeekBar(context);
        bar.setMax(max);
        bar.setProgress(progress);
        bar.setProgressTintList(accentTint());
        bar.setProgressBackgroundTintList(trackTint());
        bar.setThumbTintList(ColorStateList.valueOf(Color.WHITE));
        return bar;
    }

    static LinearLayout row(Context context) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        return row;
    }

    static LinearLayout column(Context context) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(0, dp(context, 12), 0, 0);
        return column;
    }

    /** 必要なメソッドだけ上書きできる {@link SeekBar.OnSeekBarChangeListener}。 */
    abstract static class SeekListener implements SeekBar.OnSeekBarChangeListener {
        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {}

        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {}

        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {}
    }

    static ColorStateList accentTint() {
        return ColorStateList.valueOf(ACCENT);
    }

    static ColorStateList trackTint() {
        return ColorStateList.valueOf(Color.argb(80, 255, 255, 255));
    }
}
