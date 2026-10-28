package io.github.sabopura.morphe.extension.youtube.shared;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;

import java.lang.reflect.Method;

/**
 * YouTube-themed settings screen composed entirely of platform preference widgets, so rows,
 * switches and dialogs look identical to YouTube's own settings. Subclasses only name the
 * preference XML injected by their resource patch.
 */
@SuppressWarnings("deprecation")
public abstract class NativeSettingsActivity extends Activity {
    static final String ARG_XML = "sabopura_preferences_xml";
    static final String ARG_RESET_KEY = "sabopura_reset_key";

    /** Preference XML resource name, e.g. {@code danmaku_preferences}. */
    protected abstract String preferencesXml();

    /** Toolbar layout injected by the resource patch, titled in XML. */
    protected abstract String layoutResource();

    /** String resource name used for the toolbar title. */
    protected abstract String titleResource();

    protected abstract String fallbackTitle();

    /** Key of an optional "reset to defaults" row in the XML. */
    protected abstract String resetKey();

    /** Prepares stored values before Android's preference widgets read them. */
    protected abstract void prepare(Context context, SharedPreferences preferences);

    /** Called once the preference rows exist, e.g. to fill in dynamic summaries. */
    protected void onPreferencesCreated(PreferenceFragment fragment) {
    }

    /** Called on the main thread whenever a value on this screen changed. */
    protected void onSettingChanged(PreferenceFragment fragment, String key) {
    }

    /** @return true when the click was handled by the screen. */
    protected boolean onPreferenceClicked(Preference preference) {
        return false;
    }

    /** Restores every value of this screen to its defaults. */
    protected abstract void resetToDefaults(Context context);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        applyYouTubeTheme();
        super.onCreate(savedInstanceState);
        int layout = Views.resource(this, "layout", layoutResource());
        int content = Views.resource(this, "id", "sabopura_settings_content");
        if (layout == 0 || content == 0) {
            finish();
            return;
        }
        setContentView(layout);
        String title = Views.string(this, titleResource(), fallbackTitle());
        setTitle(title);
        setupYouTubeToolbar(title);
        if (savedInstanceState == null) {
            Fragment fragment = new Fragment();
            Bundle arguments = new Bundle();
            arguments.putString(ARG_XML, preferencesXml());
            arguments.putString(ARG_RESET_KEY, resetKey());
            fragment.setArguments(arguments);
            getFragmentManager().beginTransaction().replace(content, fragment).commit();
        }
    }

    private void applyYouTubeTheme() {
        boolean dark = (getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        int theme = Views.resource(this, "style",
                dark ? "Theme.YouTube.Settings.Dark" : "Theme.YouTube.Settings");
        if (theme != 0) setTheme(theme);
    }

    private void setupYouTubeToolbar(String title) {
        int toolbarId = Views.resource(this, "id", "toolbar");
        View toolbar = toolbarId == 0 ? null : findViewById(toolbarId);
        if (toolbar == null) return;
        // YouTube's bundled Toolbar is obfuscated, so the title comes from the layout XML and
        // the navigation arrow is located as the toolbar's ImageButton.
        View navigation = findImageButton(toolbar);
        if (navigation != null) {
            navigation.setOnClickListener(ignored -> finish());
        } else {
            try {
                Method setNavigationClick = toolbar.getClass().getMethod(
                        "setNavigationOnClickListener", View.OnClickListener.class);
                setNavigationClick.invoke(toolbar, (View.OnClickListener) ignored -> finish());
            } catch (ReflectiveOperationException ignored) {
                // The system back gesture still closes the screen.
            }
        }
    }

    private static View findImageButton(View view) {
        if (view instanceof ImageButton) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                View found = findImageButton(group.getChildAt(index));
                if (found != null) return found;
            }
        }
        return null;
    }

    /** Framework preference fragment keeps all rows and dialogs identical to YouTube settings. */
    public static final class Fragment extends PreferenceFragment {
        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            NativeSettingsActivity activity = (NativeSettingsActivity) getActivity();
            // Fixed file shared with the player side; see SettingsStore for why the name
            // must not depend on the package name.
            SettingsStore.open(activity);
            getPreferenceManager().setSharedPreferencesName(SettingsStore.NAME);
            activity.prepare(activity, getPreferenceManager().getSharedPreferences());
            String xml = getArguments() == null ? null : getArguments().getString(ARG_XML);
            int preferences = xml == null ? 0 : Views.resource(activity, "xml", xml);
            if (preferences != 0) addPreferencesFromResource(preferences);
            activity.onPreferencesCreated(this);
        }

        @Override
        public void onViewCreated(View view, Bundle savedInstanceState) {
            super.onViewCreated(view, savedInstanceState);
            // YouTube's own settings screens have no lines between the rows.
            View list = view.findViewById(android.R.id.list);
            if (list instanceof android.widget.ListView) {
                ((android.widget.ListView) list).setDivider(null);
                ((android.widget.ListView) list).setDividerHeight(0);
            }
        }

        private final SharedPreferences.OnSharedPreferenceChangeListener changeListener =
                (sharedPreferences, key) -> {
                    NativeSettingsActivity activity = (NativeSettingsActivity) getActivity();
                    if (activity != null && key != null) activity.onSettingChanged(this, key);
                };

        @Override
        public void onResume() {
            super.onResume();
            getPreferenceManager().getSharedPreferences()
                    .registerOnSharedPreferenceChangeListener(changeListener);
            // Values may have changed elsewhere (player menu) while this screen was hidden.
            ((NativeSettingsActivity) getActivity()).onPreferencesCreated(this);
        }

        @Override
        public void onPause() {
            super.onPause();
            getPreferenceManager().getSharedPreferences()
                    .unregisterOnSharedPreferenceChangeListener(changeListener);
        }

        @Override
        public boolean onPreferenceTreeClick(PreferenceScreen screen, Preference preference) {
            String resetKey = getArguments() == null
                    ? null : getArguments().getString(ARG_RESET_KEY);
            if (resetKey != null && resetKey.equals(preference.getKey())) {
                confirmReset();
                return true;
            }
            if (((NativeSettingsActivity) getActivity()).onPreferenceClicked(preference)) {
                return true;
            }
            return super.onPreferenceTreeClick(screen, preference);
        }

        private void confirmReset() {
            NativeSettingsActivity activity = (NativeSettingsActivity) getActivity();
            boolean japanese = Views.isJapanese();
            new AlertDialog.Builder(activity)
                    .setTitle(Views.string(activity, "sabopura_reset_title",
                            japanese ? "初期設定に戻す" : "Reset to defaults"))
                    .setMessage(Views.string(activity, "sabopura_reset_message",
                            japanese ? "この画面の設定をすべて初期値に戻します。"
                                    : "Restore every setting on this screen to its default."))
                    .setNegativeButton(android.R.string.cancel, null)
                    .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                        activity.resetToDefaults(activity);
                        // Re-inflate so every widget shows the restored value.
                        activity.recreate();
                    })
                    .show();
        }
    }
}
