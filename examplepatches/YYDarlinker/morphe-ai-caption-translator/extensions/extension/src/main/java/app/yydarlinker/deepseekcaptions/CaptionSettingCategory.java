package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import java.lang.ref.WeakReference;

/** Keeps the framework category's original absent key, sorting and lifecycle. */
@SuppressWarnings("deprecation")
public final class CaptionSettingCategory extends android.preference.PreferenceCategory {
    private final String titleSlot;
    private WeakReference<View> row = new WeakReference<>(null);
    public CaptionSettingCategory(Context c, AttributeSet a) { super(c, a); titleSlot = CaptionSettingPreference.slot(c, a, "title"); }
    void refreshCaptionText() {
        if (titleSlot != null) setTitle(CaptionStrings.settings(getContext(), titleSlot));
        View view = row.get();
        if (view != null) {
            CaptionTextResolver.direction(view, false);
            TextView title = view.findViewById(android.R.id.title);
            if (title != null) { title.setText(getTitle()); CaptionTextResolver.direction(title, false); }
        }
    }
    @Override protected void onBindView(View view) {
        row = new WeakReference<>(view); refreshCaptionText(); super.onBindView(view);
    }
}
