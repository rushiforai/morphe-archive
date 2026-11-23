package app.ftl.extension.videodownloader;

import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.graphics.Typeface;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;

final class PopupPrompt {
    static final int ALLOW_ONCE = 1;
    static final int BLOCK_ONCE = 2;
    static final int ALWAYS_BLOCK = 3;
    static final int ALWAYS_ALLOW = 4;

    interface Callback {
        void onChoice(int choice, String key);
    }

    private PopupPrompt() {
    }

    static void show(Activity activity, String from, String url, String subtitle,
                     String ruleHost, int[] choices, Callback callback) {
        try {
            build(activity, from, url, subtitle, ruleHost, choices, callback);
        } catch (Throwable t) {
            PopupUtil.release();
        }
    }

    private static CharSequence styleUrl(String url) {
        String s = PopupUtil.shorten(url);
        SpannableString out = new SpannableString(s);
        int slash = s.indexOf('/');
        int hostEnd = slash < 0 ? s.length() : slash;
        out.setSpan(new StyleSpan(Typeface.BOLD), 0, hostEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (hostEnd < s.length()) {
            out.setSpan(new ForegroundColorSpan(PopupUi.MUTED), hostEnd, s.length(),
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        return out;
    }

    private static void addInfo(PopupUi ui, LinearLayout card, String label, CharSequence value) {
        TextView l = ui.text(11f, PopupUi.MUTED, true);
        l.setText(label);
        l.setLetterSpacing(0.08f);
        card.addView(l);
        TextView v = ui.text(14f, PopupUi.INK, false);
        v.setText(value);
        v.setMaxLines(2);
        v.setEllipsize(TextUtils.TruncateAt.END);
        v.setLineSpacing(ui.dp(2), 1f);
        card.addView(v, ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, 0, 5, 0, 0));
    }

    private static void addOptions(final PopupUi ui, LinearLayout root,
                                   final ArrayList<String> options, final String[] selected) {
        TextView label = ui.text(13f, PopupUi.INK, true);
        label.setText("Apply rule to");
        root.addView(label, ui.lp(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, 4, 18, 0, 0));

        final ArrayList<LinearLayout> rows = new ArrayList<LinearLayout>();
        final ArrayList<View> dots = new ArrayList<View>();
        final int last = options.size() - 1;

        final Runnable refresh = new Runnable() {
            @Override
            public void run() {
                for (int i = 0; i < rows.size(); i++) {
                    boolean on = options.get(i).equals(selected[0]);
                    rows.get(i).setBackground(ui.shape(on ? PopupUi.ACCENT_SOFT : PopupUi.CARD, 14f,
                            on ? PopupUi.ACCENT : PopupUi.LINE));
                    dots.get(i).setBackground(ui.oval(on ? PopupUi.ACCENT : PopupUi.CARD,
                            on ? PopupUi.ACCENT : 0xFFB8BECC));
                }
            }
        };

        for (int i = 0; i < options.size(); i++) {
            final String option = options.get(i);
            LinearLayout row = new LinearLayout(ui.activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(ui.dp(14), 0, ui.dp(14), 0);

            View dot = new View(ui.activity);
            row.addView(dot, new LinearLayout.LayoutParams(ui.dp(18), ui.dp(18)));

            TextView name = ui.text(15f, PopupUi.INK, true);
            name.setText(option);
            name.setSingleLine(true);
            name.setEllipsize(TextUtils.TruncateAt.MIDDLE);
            LinearLayout.LayoutParams np = ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 12, 0, 8, 0);
            np.weight = 1f;
            row.addView(name, np);

            if (i == 0 || i == last) {
                TextView tag = ui.text(11f, PopupUi.MUTED, false);
                tag.setText(i == 0 ? "Exact" : "Whole site");
                row.addView(tag);
            }

            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    selected[0] = option;
                    refresh.run();
                }
            });
            rows.add(row);
            dots.add(dot);
            root.addView(row, ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(46), 0, i == 0 ? 8 : 6, 0, 0));
        }
        refresh.run();
    }

    private static void build(final Activity activity, String from, String url, String subtitle,
                              String ruleHost, int[] choices, final Callback callback) {
        final PopupUi ui = new PopupUi(activity);
        final Dialog dialog = ui.newSheet();
        LinearLayout root = ui.sheetRoot(20);

        LinearLayout head = new LinearLayout(activity);
        head.setOrientation(LinearLayout.HORIZONTAL);
        head.setGravity(Gravity.CENTER_VERTICAL);
        ImageView badge = new ImageView(activity);
        badge.setImageDrawable(new PopupGlyph(PopupGlyph.BLOCK, PopupUi.RED));
        badge.setScaleType(ImageView.ScaleType.FIT_XY);
        badge.setBackground(ui.oval(PopupUi.RED_SOFT, 0));
        badge.setPadding(ui.dp(11), ui.dp(11), ui.dp(11), ui.dp(11));
        head.addView(badge, new LinearLayout.LayoutParams(ui.dp(44), ui.dp(44)));

        LinearLayout titles = new LinearLayout(activity);
        titles.setOrientation(LinearLayout.VERTICAL);
        TextView title = ui.text(20f, PopupUi.INK, true);
        title.setText("Popup blocked");
        TextView sub = ui.text(13f, PopupUi.MUTED, false);
        sub.setText(subtitle);
        titles.addView(title);
        titles.addView(sub, ui.lp(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, 0, 5, 0, 0));
        LinearLayout.LayoutParams tp = ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 12, 0, 0, 0);
        tp.weight = 1f;
        head.addView(titles, tp);
        root.addView(head, ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, 0, 16, 0, 0));

        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(ui.shape(PopupUi.CARD, 18f, PopupUi.LINE));
        card.setPadding(ui.dp(16), ui.dp(14), ui.dp(16), ui.dp(14));
        boolean hasFrom = from != null && from.length() > 0;
        addInfo(ui, card, "FROM", hasFrom ? styleUrl(from) : "Unknown page");
        View divider = new View(activity);
        divider.setBackgroundColor(PopupUi.LINE);
        card.addView(divider, ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, 1, 0, 12, 0, 12));
        addInfo(ui, card, "OPENED", url != null ? styleUrl(url) : "No address (script popup)");
        root.addView(card, ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, 0, 16, 0, 0));

        final String[] selected = new String[]{ruleHost};
        if (ruleHost != null) {
            ArrayList<String> options = PopupUtil.options(ruleHost);
            if (!options.isEmpty()) {
                selected[0] = options.get(0);
            }
            if (options.size() > 1) {
                addOptions(ui, root, options, selected);
            }
        }

        LinearLayout buttons = new LinearLayout(activity);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        for (int i = 0; i < choices.length; i++) {
            final int choice = choices[i];
            int fill;
            int ink;
            String label;
            if (choice == ALWAYS_BLOCK) {
                fill = PopupUi.RED;
                ink = 0xFFFFFFFF;
                label = "Always block";
            } else if (choice == ALWAYS_ALLOW) {
                fill = PopupUi.GREEN_SOFT;
                ink = PopupUi.GREEN;
                label = "Always allow";
            } else if (choice == BLOCK_ONCE) {
                fill = PopupUi.RED_SOFT;
                ink = PopupUi.RED;
                label = choices.length > 2 ? "Block once" : "Block";
            } else {
                fill = PopupUi.CHIP_GRAY;
                ink = PopupUi.INK;
                label = "Allow once";
            }
            TextView b = ui.text(13f, ink, true);
            b.setText(label);
            b.setGravity(Gravity.CENTER);
            b.setSingleLine(true);
            b.setEllipsize(TextUtils.TruncateAt.END);
            b.setPadding(ui.dp(6), 0, ui.dp(6), 0);
            b.setBackground(ui.ripple(ui.shape(fill, 14f, 0)));
            b.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    try {
                        callback.onChoice(choice, selected[0]);
                    } catch (Throwable ignored) {
                    }
                    dialog.dismiss();
                }
            });
            LinearLayout.LayoutParams bp = ui.lp(0, ui.dp(46), i == 0 ? 0 : 8, 0, 0, 0);
            bp.weight = 1f;
            buttons.addView(b, bp);
        }
        root.addView(buttons, ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, 0, 20, 0, 0));

        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(DialogInterface d) {
                PopupUtil.release();
            }
        });
        ui.present(dialog, root, 0, false);
    }
}
