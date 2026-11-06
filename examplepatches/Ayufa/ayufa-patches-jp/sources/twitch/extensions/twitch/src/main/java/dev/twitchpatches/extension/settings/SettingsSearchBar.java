package dev.twitchpatches.extension.settings;

import android.content.Context;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.widget.ImageView;
import android.widget.SearchView;
import android.widget.TextView;

final class SettingsSearchBar {
    private SettingsSearchBar() { }

    static SearchView create(Context context) {
        int theme = TwitchSettingsResources.resource(context, "style", "Theme.Twitch.SearchViewActionBar");
        SearchView search = new SearchView(new ContextThemeWrapper(context, theme));
        search.setIconifiedByDefault(false);
        search.setQueryHint("すべての設定を検索");
        search.setSubmitButtonEnabled(false);
        search.setMaxWidth(Integer.MAX_VALUE);
        search.setMinimumHeight(Math.round(48 * context.getResources().getDisplayMetrics().density));
        search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_DONE |
                android.view.inputmethod.EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        int padding = TwitchSettingsResources.spacing(context, "space_16");
        search.setPadding(padding, 0, padding, 0);
        search.setBackgroundColor(TwitchSettingsResources.color(context, "background_body"));
        int textId = context.getResources().getIdentifier("search_src_text", "id", "android");
        View field = search.findViewById(textId);
        if (field instanceof TextView) {
            TextView text = (TextView) field;
            text.setTextColor(TwitchSettingsResources.color(context, "text_base"));
            text.setHintTextColor(TwitchSettingsResources.color(context, "text_alt_2"));
            text.setTextSize(16);
            text.setFontFeatureSettings("kern");
        }
        image(search, "search_mag_icon", "ic_search", null);
        image(search, "search_close_btn", "ic_cancel_grey_9", "検索をクリア");
        search.clearFocus();
        return search;
    }

    private static void image(SearchView search, String id, String drawable, String label) {
        View view = search.findViewById(search.getResources().getIdentifier(id, "id", "android"));
        if (!(view instanceof ImageView)) return;
        ((ImageView) view).setImageDrawable(TwitchSettingsIcons.drawable(search.getContext(), drawable));
        if (label != null) {
            view.setContentDescription(label);
            view.setMinimumWidth(Math.round(48 * search.getResources().getDisplayMetrics().density));
            view.setMinimumHeight(view.getMinimumWidth());
        } else view.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
    }
}
