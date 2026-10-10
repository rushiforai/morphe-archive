package dev.twitchpatches.extension.settings;

import android.app.DialogFragment;
import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Toolbar;

@SuppressWarnings("deprecation") // Platform fragment avoids depending on Twitch's obfuscated AndroidX router.
public final class PatchSettingsPage extends DialogFragment {
    static final String TAG = "twitch_patches_settings";
    private String groupKey;
    private int rootScroll;
    private LinearLayout contents;
    private ScrollView scroll;
    private Toolbar toolbar;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        setStyle(STYLE_NO_TITLE, 0);
        if (state != null) {
            groupKey = state.getString("group");
            rootScroll = state.getInt("root_scroll");
        }
    }

    @Override public Dialog onCreateDialog(Bundle state) {
        return new Dialog(getActivity(), getTheme()) {
            @Override public void onBackPressed() { back(); }
        };
    }

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle state) {
        Context context = getActivity();
        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(TwitchSettingsResources.color(context, "background_body"));
        toolbar = TwitchSettingsToolbar.create(context, this::back);
        page.addView(toolbar,
                new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        contents = new LinearLayout(context);
        contents.setOrientation(LinearLayout.VERTICAL);
        int padding = TwitchSettingsResources.spacing(context, "space_16");
        contents.setPadding(0, 0, 0, padding);
        renderPage();
        scroll.addView(contents, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        return page;
    }

    private void open(SettingGroup group) {
        rootScroll = scroll.getScrollY();
        groupKey = group.key();
        renderPage();
        scroll.scrollTo(0, 0);
    }

    private void renderPage() {
        SettingGroup group = PatchSettings.group(groupKey);
        if (group == null) groupKey = null;
        toolbar.setTitle(group == null ? "Patch settings" : group.title());
        contents.removeAllViews();
        TwitchSettingsRows.populate(contents, group == null ? PatchSettings.options() : group.children(), this::open, group == null);
    }

    private void back() {
        if (groupKey == null) { closePage(); return; }
        groupKey = null;
        renderPage();
        scroll.post(() -> { if (scroll != null) scroll.scrollTo(0, rootScroll); });
    }

    @Override public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putString("group", groupKey);
        state.putInt("root_scroll", rootScroll);
    }

    @Override public void onDestroyView() {
        super.onDestroyView();
        contents = null;
        scroll = null;
        toolbar = null;
    }

    @Override public void onStart() {
        super.onStart();
        android.app.Dialog dialog = getDialog();
        if (dialog == null || getActivity() == null) return;
        Window window = dialog.getWindow();
        if (window == null) return;
        window.setBackgroundDrawable(new ColorDrawable(TwitchSettingsResources.color(getActivity(), "background_body")));
        window.setDimAmount(0);
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    private void closePage() {
        android.app.FragmentManager manager = getFragmentManager();
        if (manager == null || manager.isStateSaved()) dismissAllowingStateLoss();
        else dismiss();
    }
}
