package app.fakh.extension.smartlife;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.Map;

import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.RestartBar;

/**
 * The Fakh Patches page, opened from its row in Settings: the switches of the patches in the app, in sections by
 * where they act. It is built from the app's own toolbar and switch row layouts, so it looks like the app's pages.
 */
public final class FakhPatchesActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Resources res = getResources();
        float density = res.getDisplayMetrics().density;
        LayoutInflater inflater = LayoutInflater.from(this);

        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(color("thing_theme_color_b1"));
        page.setFitsSystemWindows(true);

        View toolbar = inflater.inflate(id("uispecs_toolbar_top_view", "layout"), page, false);
        TextView title = toolbar.findViewById(id("toolbar_title", "id"));
        if (title == null) title = toolbar.findViewById(id("toolbar_left_title", "id"));
        if (title != null) {
            title.setText("Fakh Patches");
            title.setVisibility(View.VISIBLE);
        }
        // The toolbar takes the page's color, as the app's own Settings page does, and the back arrow the title's.
        toolbar.setBackgroundColor(color("thing_theme_color_b1"));
        View bar = toolbar.findViewById(id("toolbar_top_view", "id"));
        if (bar != null) bar.setBackgroundColor(color("thing_theme_color_b1"));
        View back = toolbar.findViewById(id("iv_menu_left_1", "id"));
        if (back != null) {
            back.setVisibility(View.VISIBLE);
            back.setOnClickListener(view -> finish());
            if (back instanceof ImageView && title != null) {
                ((ImageView) back).setImageTintList(ColorStateList.valueOf(title.getCurrentTextColor()));
            }
        }
        page.addView(toolbar);

        LinearLayout sections = new LinearLayout(this);
        sections.setOrientation(LinearLayout.VERTICAL);
        int side = Math.round(16 * density);
        sections.setPadding(side, 0, side, side);
        for (Map.Entry<String, Map<String, String>> section : Switches.SECTIONS.entrySet()) {
            LinearLayout card = null;
            for (Map.Entry<String, String> entry : section.getValue().entrySet()) {
                if (!Switches.present(entry.getKey())) continue;
                if (card == null) {
                    sections.addView(header(I18n.tr(section.getKey()), density));
                    card = card(density);
                    sections.addView(card);
                }
                card.addView(row(inflater, card, entry.getKey(), I18n.tr(entry.getValue())));
            }
        }
        ScrollView scroll = new ScrollView(this);
        scroll.addView(sections);
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(page);
    }

    /** The title above a section's card, in the app's secondary text color. */
    private TextView header(String text, float density) {
        TextView header = new TextView(this);
        header.setText(text);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        header.setTextColor(color("thing_theme_color_b6_n3"));
        int side = Math.round(16 * density);
        header.setPadding(side, Math.round(20 * density), side, Math.round(8 * density));
        return header;
    }

    /** A section's card, rounded like the app's own setting groups. */
    private LinearLayout card(float density) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable background = new GradientDrawable();
        background.setColor(color("thing_theme_color_b6"));
        int corner = id("thing_theme_dimen_c3_1", "dimen");
        background.setCornerRadius(corner == 0 ? 16 * density : getResources().getDimension(corner));
        card.setBackground(background);
        card.setClipToOutline(true);
        return card;
    }

    /**
     * A switch row from the app's Touch Tone row layout. A change is saved at once; everything but dark device panels
     * is set up when the app builds its screens, so a restart is offered for those.
     */
    private View row(LayoutInflater inflater, ViewGroup card, String key, String label) {
        View row = inflater.inflate(id("baselist_delegate_text_switch2", "layout"), card, false);
        row.setBackground(null);
        TextView title = row.findViewById(id("menu_list_title", "id"));
        CompoundButton toggle = row.findViewById(id("sb_subtitle", "id"));
        title.setText(label);
        toggle.setContentDescription(label);
        String description = Switches.DESCRIPTIONS.get(key);
        if (description != null) {
            // The row has no line for a description: it goes under the title, in the app's secondary text color.
            TextView about = new TextView(this);
            about.setText(I18n.tr(description));
            about.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            about.setTextColor(color("thing_theme_color_b6_n3"));
            about.setPadding(0, Math.round(2 * getResources().getDisplayMetrics().density), 0, 0);
            ViewGroup box = (ViewGroup) title.getParent();
            ((LinearLayout) box).setOrientation(LinearLayout.VERTICAL);
            ((LinearLayout) box).setGravity(android.view.Gravity.CENTER_VERTICAL);
            // The title's box wraps its text, which would wrap the description in a narrow column; its right margin
            // already leaves room for the switch.
            ViewGroup.LayoutParams boxParams = box.getLayoutParams();
            boxParams.width = ViewGroup.LayoutParams.MATCH_PARENT;
            box.setLayoutParams(boxParams);
            // A description can take three lines, which would touch the card's edges at the row's minimum height.
            int gap = Math.round(12 * getResources().getDisplayMetrics().density);
            box.setPadding(box.getPaddingLeft(), gap, box.getPaddingRight(), gap);
            title.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            box.addView(about);
        }
        // The app's SwitchButton animates setChecked and shows the state at once only through setCheckedImmediately.
        try {
            toggle.getClass().getMethod("setCheckedImmediately", boolean.class).invoke(toggle, Switches.on(key));
        } catch (ReflectiveOperationException failure) {
            toggle.setChecked(Switches.on(key));
        }
        toggle.setOnCheckedChangeListener((button, checked) -> {
            Switches.set(key, checked);
            if (!Switches.DARK_PANELS.equals(key)) RestartBar.show(this, 0);
        });
        return row;
    }

    private int id(String name, String type) {
        return getResources().getIdentifier(name, type, getPackageName());
    }

    private int color(String name) {
        int id = id(name, "color");
        return id == 0 ? 0 : getColor(id);
    }
}
