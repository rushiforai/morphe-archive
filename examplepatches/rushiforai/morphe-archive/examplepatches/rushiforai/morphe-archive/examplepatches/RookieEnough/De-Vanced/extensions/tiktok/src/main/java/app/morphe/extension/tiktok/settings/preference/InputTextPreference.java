/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/InputTextPreference.java
 */

package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.EditTextPreference;
import android.view.View;

import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.Utils;

@SuppressWarnings("deprecation")
public class InputTextPreference extends EditTextPreference {

    public InputTextPreference(Context context, String title, String summary, StringSetting setting) {
        super(context);
        setTitle(title);
        setSummary(summary);
        setKey(setting.key);
        setText(setting.get());
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        Utils.setTitleAndSummaryColor(view);
    }
}

