/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/ReVancedTikTokAboutPreference.java
 */

package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.Preference;
import android.view.View;

import app.morphe.extension.tiktok.Utils;

@SuppressWarnings("deprecation")
public class ReVancedTikTokAboutPreference extends Preference {

    public ReVancedTikTokAboutPreference(Context context) {
        super(context);

        setTitle("About");
        setSummary("About De-ReVanced");

        setOnPreferenceClickListener(pref -> {
            // Redirect to De-ReVanced GitHub repo when user clicks the "About" row.
            app.morphe.extension.shared.Utils.openLink("https://github.com/RookieEnough/De-ReVanced");
            return true;
        });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        Utils.setTitleAndSummaryColor(view);
    }
}

