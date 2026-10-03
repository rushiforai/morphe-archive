package app.template.extension.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Every product the app has loaded so far, across all pages, ranked by number of
 * ratings or by average rating. This is what a per-page rewrite cannot give: a
 * well-rated product on page 3 sits above a poorly rated one on page 1.
 *
 * <p>A full-screen dialog drawn with plain views (the extension carries no
 * resources). Tapping a row opens the product in the app itself.
 */
final class RankedPanel {

    private RankedPanel() {}

    private static final int DARK = 0xFF232F3E;
    private static final int GREEN = 0xFF067D62;

    /** The panel's own mode: it can't be "off" — a ranked list needs an order. */
    private static SortState.Mode sMode = SortState.Mode.COUNT;
    private static boolean sMinFour;

    static void show(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        if (SortState.mode() != SortState.Mode.OFF) sMode = SortState.mode();
        sMinFour = SortState.minFour();

        final Dialog dialog = new Dialog(activity, android.R.style.Theme_Material_Light_NoActionBar);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.WHITE);

        final TextView title = text(activity, 16, true, Color.WHITE);
        title.setPadding(dp(activity, 16), dp(activity, 14), dp(activity, 16), dp(activity, 4));
        title.setBackgroundColor(DARK);
        final TextView note = text(activity, 12, false, 0xFFC5CCD3);
        note.setPadding(dp(activity, 16), 0, dp(activity, 16), dp(activity, 10));
        note.setBackgroundColor(DARK);
        note.setText("Everything the app has loaded so far, across all pages. "
            + "Scroll the app's own list to load more.");

        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setBackgroundColor(DARK);
        bar.setPadding(dp(activity, 10), 0, dp(activity, 10), dp(activity, 10));
        final TextView mode = chip(activity);
        final TextView four = chip(activity);
        final TextView clear = chip(activity);
        final TextView close = chip(activity);
        clear.setText("Clear");
        close.setText("Close");
        bar.addView(mode, weight(activity));
        bar.addView(four, weight(activity));
        bar.addView(clear, weight(activity));
        bar.addView(close, weight(activity));

        final ListView list = new ListView(activity);
        list.setDividerHeight(1);
        final Adapter adapter = new Adapter(activity);
        list.setAdapter(adapter);

        final Runnable refresh = new Runnable() {
            @Override public void run() {
                List<Product> ranked = RankedStore.ranked(sMode, sMinFour);
                adapter.set(ranked);
                int total = RankedStore.size();
                title.setText(ranked.size() == total
                    ? "Ranked: " + total + " products"
                    : "Ranked: " + ranked.size() + " of " + total + " products");
                paint(mode, true, sMode == SortState.Mode.RATING ? "Top rated" : "Most rated");
                paint(four, sMinFour, sMinFour ? "4★+ ✓" : "4★+");
                paint(clear, false, "Clear");
                paint(close, false, "Close");
            }
        };

        mode.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                sMode = sMode == SortState.Mode.COUNT ? SortState.Mode.RATING : SortState.Mode.COUNT;
                refresh.run();
                list.setSelection(0);
            }
        });
        four.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                sMinFour = !sMinFour;
                refresh.run();
            }
        });
        clear.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                RankedStore.clear();
                refresh.run();
                toast(activity, "Cleared. Products you scroll to from now on are collected again.");
            }
        });
        close.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { dialog.dismiss(); }
        });
        list.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(android.widget.AdapterView<?> parent, View view, int position, long id) {
                Product p = adapter.get(position);
                if (p == null) return;
                if (open(activity, p)) dialog.dismiss();
            }
        });

        root.addView(title);
        root.addView(note);
        root.addView(bar);
        root.addView(list, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        dialog.setContentView(root);
        refresh.run();
        dialog.show();
        Window w = dialog.getWindow();
        if (w != null) w.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    /** Opens the product in the app itself, falling back to any handler of the link. */
    private static boolean open(Activity activity, Product p) {
        if (p.url == null) return false;
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(p.url));
        try {
            intent.setPackage(activity.getPackageName());
            activity.startActivity(intent);
            return true;
        } catch (Throwable inApp) {
            try {
                activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(p.url)));
                return true;
            } catch (Throwable ignored) {
                toast(activity, "Couldn't open this product.");
                return false;
            }
        }
    }

    /** "₹1,234 · ★ 4.5 · 12,345 ratings"; unknown parts are left out, never shown as 0. */
    static String meta(Product p) {
        NumberFormat inr = NumberFormat.getInstance(new Locale("en", "IN"));
        inr.setMaximumFractionDigits(0);
        StringBuilder sb = new StringBuilder();
        if (p.price > 0) sb.append("₹").append(inr.format(p.price));
        if (p.hasRating()) {
            if (sb.length() > 0) sb.append("  ·  ");
            sb.append("★ ").append(String.format(Locale.US, "%.1f", p.rating));
        }
        if (p.hasCount()) {
            if (sb.length() > 0) sb.append("  ·  ");
            sb.append(inr.format(p.count)).append(p.count == 1 ? " rating" : " ratings");
        } else if (!p.hasRating()) {
            if (sb.length() > 0) sb.append("  ·  ");
            sb.append("no rating shown");
        }
        return sb.toString();
    }

    private static final class Adapter extends BaseAdapter {
        private final Activity activity;
        private List<Product> items = new ArrayList<>();

        Adapter(Activity activity) {
            this.activity = activity;
        }

        void set(List<Product> next) {
            items = next;
            notifyDataSetChanged();
        }

        Product get(int position) {
            return position >= 0 && position < items.size() ? items.get(position) : null;
        }

        @Override public int getCount() { return items.size(); }
        @Override public Object getItem(int position) { return get(position); }
        @Override public long getItemId(int position) { return position; }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            LinearLayout row;
            TextView head;
            TextView sub;
            if (convertView instanceof LinearLayout) {
                row = (LinearLayout) convertView;
                head = (TextView) row.getChildAt(0);
                sub = (TextView) row.getChildAt(1);
            } else {
                row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.VERTICAL);
                row.setPadding(dp(activity, 16), dp(activity, 10), dp(activity, 16), dp(activity, 10));
                head = text(activity, 15, true, 0xFF111111);
                sub = text(activity, 13, false, 0xFF55606B);
                row.addView(head);
                row.addView(sub);
            }
            Product p = items.get(position);
            head.setText((position + 1) + ".  " + p.title);
            sub.setText(meta(p));
            return row;
        }
    }

    private static TextView text(Activity a, int sp, boolean bold, int color) {
        TextView t = new TextView(a);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        if (bold) t.setTypeface(t.getTypeface(), android.graphics.Typeface.BOLD);
        return t;
    }

    private static TextView chip(Activity a) {
        TextView t = text(a, 13, true, Color.WHITE);
        t.setGravity(Gravity.CENTER);
        t.setPadding(dp(a, 6), dp(a, 9), dp(a, 6), dp(a, 9));
        t.setClickable(true);
        return t;
    }

    private static void paint(TextView t, boolean on, String label) {
        t.setText(label);
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(1000f);
        bg.setColor(on ? GREEN : 0xFF3B4651);
        t.setBackground(bg);
    }

    private static LinearLayout.LayoutParams weight(Activity a) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        lp.leftMargin = dp(a, 3);
        lp.rightMargin = dp(a, 3);
        return lp;
    }

    private static void toast(Activity a, String msg) {
        try {
            Toast.makeText(a, msg, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // cosmetic
        }
    }

    private static int dp(Activity a, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
            a.getResources().getDisplayMetrics()));
    }
}
