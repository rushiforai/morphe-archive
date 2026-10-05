package dev.twitchpatches.extension.settings;

import android.app.DialogFragment;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;

@SuppressWarnings("deprecation") // Platform fragment avoids depending on Twitch's obfuscated AndroidX router.
public final class PatchSettingsPage extends DialogFragment {
    static final String TAG = "twitch_patches_settings";

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        setStyle(STYLE_NO_TITLE, 0);
    }

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle state) {
        Context context = getActivity();
        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(TwitchSettingsResources.color(context, "background_body"));
        page.addView(TwitchSettingsToolbar.create(context, this::closePage),
                new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        ScrollView scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        LinearLayout contents = new LinearLayout(context);
        contents.setOrientation(LinearLayout.VERTICAL);
        int padding = TwitchSettingsResources.spacing(context, "space_16");
        contents.setPadding(0, 0, 0, padding);
        TwitchSettingsRows.populate(contents, PatchSettings.options());
        scroll.addView(contents, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        return page;
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
