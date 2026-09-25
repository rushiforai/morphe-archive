/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.tiktok.settings.preference;

import app.morphe.extension.tiktok.settings.L10n;
import android.content.Context;
import android.os.Build;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

@SuppressWarnings("deprecation")
public final class SectionHeadingPreference extends Preference {
    public SectionHeadingPreference(Context context, String title) {
        super(context);
        setTitle(L10n.t(context, title));
        setSelectable(false);
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        Context context = getContext();
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        int side = SettingsUi.dp(context, 18);
        layout.setPadding(side, SettingsUi.dp(context, 16), side, SettingsUi.dp(context, 4));

        TextView title = new TextView(context);
        title.setId(android.R.id.title);
        title.setTextColor(SettingsUi.accent());
        title.setTextSize(13);
        title.setTypeface(title.getTypeface(), android.graphics.Typeface.BOLD);
        title.setText(getTitle());
        if (Build.VERSION.SDK_INT >= 28) {
            title.setAccessibilityHeading(true);
        }
        layout.addView(title, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return layout;
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        TextView title = view.findViewById(android.R.id.title);
        if (title != null) {
            title.setText(getTitle());
            title.setTextColor(SettingsUi.accent());
        }
    }
}
