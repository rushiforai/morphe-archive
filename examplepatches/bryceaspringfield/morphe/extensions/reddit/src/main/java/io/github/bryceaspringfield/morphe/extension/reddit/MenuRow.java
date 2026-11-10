package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.Strings.t;

import android.content.Context;
import android.preference.Preference;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * A settings row with a three-dot button at its end, which opens the row's menu. Where the row's layout has no place
 * for the button, a tap on the row opens the menu.
 */
@SuppressWarnings("deprecation")
final class MenuRow extends Preference {

    private final Runnable onMenu;
    private boolean dotsShown;

    MenuRow(Context context, Runnable onMenu) {
        super(context);
        this.onMenu = onMenu;
    }

    /** Whether the row shows its three-dot button, after Android drew the row. */
    boolean dotsShown() {
        return dotsShown;
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        ViewGroup frame = view.findViewById(android.R.id.widget_frame);
        if (frame == null) {
            dotsShown = false;
            return;
        }
        frame.removeAllViews();
        frame.setVisibility(View.VISIBLE);
        TextView dots = new TextView(getContext());
        dots.setText("⋮");
        dots.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24);
        TextView title = view.findViewById(android.R.id.title);
        if (title != null) dots.setTextColor(title.getCurrentTextColor());
        int pad = (int) (12 * getContext().getResources().getDisplayMetrics().density);
        dots.setPaddingRelative(pad, pad / 2, pad / 2, pad / 2);
        dots.setContentDescription(t("More options"));
        dots.setOnClickListener(v -> onMenu.run());
        frame.addView(dots);
        dotsShown = true;
    }
}
