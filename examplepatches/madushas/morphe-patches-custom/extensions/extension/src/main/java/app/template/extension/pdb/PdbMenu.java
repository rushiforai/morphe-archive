package app.template.extension.pdb;

import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ScrollView;

import java.util.List;

/**
 * A lightweight power-menu popup for long-presses on app rows (user rows, chat rows).
 *
 * <p>The app's own {@code AlertDialog} theme renders no list panel (device-confirmed),
 * so options are drawn as native {@code ActionCell} rows inside a {@link PopupWindow}
 * instead. Used by the injected row hooks (copy ID, open profile, direct chat…).
 */
public final class PdbMenu {

    /** One menu entry. */
    public interface Item {
        String label();

        void run();
    }

    private PdbMenu() {}

    public static void show(final View anchor, final List<Item> items) {
        if (anchor == null || items == null || items.isEmpty()) return;
        try {
            final android.content.Context ctx = anchor.getContext();
            final PopupWindow[] holder = new PopupWindow[1];

            LinearLayout box = new LinearLayout(ctx);
            box.setOrientation(LinearLayout.VERTICAL);

            ScrollView scroll = new ScrollView(ctx);
            scroll.addView(box);

            for (final Item item : items) {
                box.addView(PdbUi.actionCell(ctx, item.label(), new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if (holder[0] != null) {
                            try {
                                holder[0].dismiss();
                            } catch (Throwable ignored) {
                            }
                        }
                        try {
                            item.run();
                        } catch (Throwable ignored) {
                        }
                    }
                }), new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }

            int pad = PdbUi.dp(ctx, 2);
            // content_bg is transparent in the dark theme; use the same opaque
            // rounded drawable as the settings cards so the popup is not see-through.
            LinearLayout outer = PdbUi.card(ctx);
            outer.setPadding(pad, pad, pad, pad);
            outer.addView(scroll);

            // Long lists (launcher aliases, hidden screens) must stay on screen and
            // scroll inside the popup instead of growing past the display edges.
            int width = Math.min(PdbUi.dp(ctx, 300),
                ctx.getResources().getDisplayMetrics().widthPixels - PdbUi.dp(ctx, 32));
            int maxHeight = Math.round(
                ctx.getResources().getDisplayMetrics().heightPixels * 0.65f);
            outer.measure(
                View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.AT_MOST),
                View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST));
            int height = Math.min(outer.getMeasuredHeight(), maxHeight);

            PopupWindow popup = new PopupWindow(outer, width, height, true);
            holder[0] = popup;
            popup.setOutsideTouchable(true);
            popup.setFocusable(true);
            popup.setBackgroundDrawable(new ColorDrawable(0x00000000));
            popup.showAtLocation(anchor, Gravity.CENTER, 0, 0);
        } catch (Throwable ignored) {
            // A failed popup must never break the host row.
        }
    }
}
