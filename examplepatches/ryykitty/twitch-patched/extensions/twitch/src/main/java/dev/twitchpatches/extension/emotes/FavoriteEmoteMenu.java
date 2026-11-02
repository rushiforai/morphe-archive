package dev.twitchpatches.extension.emotes;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.TextView;

final class FavoriteEmoteMenu {
    static final String STAR_EMPTY = "ic_subscribe_button_star_empty";
    private static final String STAR_FILLED = "ic_subscribe_button_star_filled";
    private static final String BACKGROUND = "rounded_gray_box_gray_border";
    private static final String TEXT_COLOR = "text_base";
    private static PopupWindow active;

    private FavoriteEmoteMenu() { }

    static void show(View tile, boolean favorite, boolean belowTile, Runnable toggle) {
        dismiss();
        Context context = tile.getContext();
        View content = content(context, favorite);
        PopupWindow popup = new PopupWindow(content, ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, false);
        popup.setBackgroundDrawable(new ColorDrawable(0));
        popup.setOutsideTouchable(true);
        popup.setElevation(dp(context, 8));
        content.setOnClickListener(clicked -> {
            dismiss();
            toggle.run();
        });
        content.measure(View.MeasureSpec.UNSPECIFIED, View.MeasureSpec.UNSPECIFIED);
        int[] location = new int[2];
        tile.getLocationOnScreen(location);
        int screen = context.getResources().getDisplayMetrics().widthPixels;
        int margin = dp(context, 8);
        int x = Math.max(margin, Math.min(location[0] + (tile.getWidth() - content.getMeasuredWidth()) / 2,
                screen - content.getMeasuredWidth() - margin));
        int y = belowTile ? location[1] + tile.getHeight() + margin : location[1] - content.getMeasuredHeight() - margin;
        popup.showAtLocation(tile, Gravity.NO_GRAVITY, x, y);
        active = popup;
    }

    static void dismiss() {
        PopupWindow popup = active;
        active = null;
        if (popup != null && popup.isShowing()) popup.dismiss();
    }

    static int drawable(Context context, String name) { return resource(context, name, "drawable"); }

    private static View content(Context context, boolean favorite) {
        Resources resources = context.getResources();
        ColorStateList color = resources.getColorStateList(resource(context, TEXT_COLOR, "color"), context.getTheme());
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setBackgroundResource(drawable(context, BACKGROUND));
        row.setPadding(dp(context, 12), dp(context, 10), dp(context, 16), dp(context, 10));
        row.setClickable(true);
        ImageView star = new ImageView(context);
        star.setImageResource(drawable(context, favorite ? STAR_FILLED : STAR_EMPTY));
        star.setImageTintList(color);
        LinearLayout.LayoutParams icon = new LinearLayout.LayoutParams(dp(context, 20), dp(context, 20));
        icon.setMarginEnd(dp(context, 10));
        row.addView(star, icon);
        TextView label = new TextView(context);
        label.setText(favorite ? "Remove from Favorites" : "Add to Favorites");
        label.setTextColor(color);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        row.addView(label);
        row.setContentDescription(label.getText());
        return row;
    }

    private static int resource(Context context, String name, String type) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
