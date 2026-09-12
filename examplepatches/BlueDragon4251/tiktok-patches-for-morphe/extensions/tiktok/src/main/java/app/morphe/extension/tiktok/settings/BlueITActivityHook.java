/*
 * BlueIT Service settings activity bridge for TikTok.
 */
package app.morphe.extension.tiktok.settings;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.preference.BlueITPreferenceFragment;

import com.bytedance.ies.ugc.aweme.commercialize.compliance.personalization.AdPersonalizationActivity;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

/** Hooks AdPersonalizationActivity to inject the BlueIT Service settings UI. */
@SuppressWarnings({"deprecation", "NewApi", "unused"})
public class BlueITActivityHook {
    private static final String SETTINGS_ACTION = "blueit_service_settings";
    private static final String SETTINGS_EXTRA = "blueit_service";

    public static Object createSettingsEntry(String entryClazzName, String entryInfoClazzName) {
        try {
            Class entryClazz = Class.forName(entryClazzName);
            Class entryInfoClazz = Class.forName(entryInfoClazzName);
            Constructor entryConstructor = entryClazz.getConstructor(entryInfoClazz);
            Constructor entryInfoConstructor = entryInfoClazz.getDeclaredConstructors()[0];
            Object buttonInfo = entryInfoConstructor.newInstance(
                    "BlueIT Service",
                    null,
                    (View.OnClickListener) view -> startSettingsActivity(),
                    "blueit_service"
            );
            return entryConstructor.newInstance(buttonInfo);
        } catch (ClassNotFoundException | NoSuchMethodException | InvocationTargetException | IllegalAccessException |
                 InstantiationException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean initialize(AdPersonalizationActivity base) {
        Intent intent = base.getIntent();
        Bundle extras = intent.getExtras();
        if ((extras == null || !extras.getBoolean(SETTINGS_EXTRA, false)) && !SETTINGS_ACTION.equals(intent.getAction())) {
            return false;
        }

        SettingsStatus.load();

        LinearLayout linearLayout = new LinearLayout(base);
        linearLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
        linearLayout.setOrientation(LinearLayout.VERTICAL);
        linearLayout.setFitsSystemWindows(true);
        linearLayout.setTransitionGroup(true);

        FrameLayout fragment = new FrameLayout(base);
        fragment.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        int fragmentId = View.generateViewId();
        fragment.setId(fragmentId);

        linearLayout.addView(fragment);
        base.setContentView(linearLayout);

        PreferenceFragment preferenceFragment = new BlueITPreferenceFragment();
        base.getFragmentManager().beginTransaction().replace(fragmentId, preferenceFragment).commit();

        return true;
    }

    public static boolean handleBackPressed(AdPersonalizationActivity activity) {
        Intent intent = activity.getIntent();
        if (intent == null
                || (!SETTINGS_ACTION.equals(intent.getAction())
                && !intent.getBooleanExtra(SETTINGS_EXTRA, false))) {
            return false;
        }

        if (activity.getFragmentManager().getBackStackEntryCount() > 0) {
            activity.getFragmentManager().popBackStack();
        } else {
            activity.finish();
        }
        return true;
    }

    private static void startSettingsActivity() {
        Context appContext = Utils.getContext();
        if (appContext != null) {
            Intent intent = new Intent(appContext, AdPersonalizationActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            intent.setAction(SETTINGS_ACTION);
            intent.putExtra(SETTINGS_EXTRA, true);
            appContext.startActivity(intent);
        } else {
            Logger.printDebug(() -> "BlueIT Service: Utils.getContext() returned null");
        }
    }
}
