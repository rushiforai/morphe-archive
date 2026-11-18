package app.template.extension.extension;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/** Adds cache controls to Brother's existing service settings. */
public final class SettingsIntegration {
    public static void attach(Activity activity) {
        AutoCache.init(activity.getApplicationContext());
        int id = activity.getResources().getIdentifier("scrollView_settings", "id", activity.getPackageName());
        View view = activity.findViewById(id);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup scroll = (ViewGroup) view;
        if (scroll.getChildCount() != 1 || !(scroll.getChildAt(0) instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) scroll.getChildAt(0);
        View previous = parent.findViewWithTag("morphe-fast-preview-controls");
        if (previous != null) parent.removeView(previous);
        LinearLayout section = new LinearLayout(activity);
        section.setTag("morphe-fast-preview-controls");
        section.setOrientation(LinearLayout.VERTICAL);
        float density = activity.getResources().getDisplayMetrics().density;
        int pad = (int) (16 * density);
        section.setPadding(pad, (int)(24 * density), pad, pad);
        TextView heading = new TextView(activity);
        heading.setText("Faster Print Previews Mod");
        heading.setTextSize(12);
        heading.setTextColor(0xff000000);
        heading.setTypeface(null, 1);
        section.addView(heading);
        View divider = new View(activity);
        divider.setBackgroundColor(0xff8c8c8c);
        LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, Math.max(1,(int)(2 * density)));
        dividerParams.topMargin = (int)(2 * density);
        section.addView(divider, dividerParams);
        TextView attribution = new TextView(activity);
        attribution.setText("Unofficial community patch · Not affiliated with Brother");
        attribution.setTextSize(12);
        attribution.setTextColor(0xff666666);
        attribution.setTypeface(null, 2);
        section.addView(attribution);
        Switch cache = new Switch(activity);
        cache.setText("Speed up previews with saved printer responses");
        cache.setChecked(AutoCache.enabled());
        cache.setOnCheckedChangeListener((button, checked) -> AutoCache.setEnabled(checked));
        section.addView(cache);
        Button manage = new Button(activity);
        manage.setText("Manage saved printer data");
        manage.setOnClickListener(button -> activity.startActivity(new Intent(activity, CacheSettingsActivity.class)));
        section.addView(manage);
        parent.addView(section);
    }
    private SettingsIntegration() {}
}

