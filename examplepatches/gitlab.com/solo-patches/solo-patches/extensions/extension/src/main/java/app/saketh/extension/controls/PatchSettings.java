package app.saketh.extension.controls;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;

public final class PatchSettings {
    private static volatile SharedPreferences preferences;
    public static volatile Context context;
    private static Bundle features = Bundle.EMPTY;
    private static volatile boolean ads = true, popups = true, featuredWorks = true, materialYou, readerColors;
    private static volatile boolean disableRewardTimer, amoled, giphy;
    private static final SharedPreferences.OnSharedPreferenceChangeListener CHANGED = (prefs, key) -> refresh();

    private PatchSettings() {}

    public static synchronized void initialize(Context supplied) {
        if (preferences != null) return;
        context = supplied.getApplicationContext();
        try {
            Bundle metadata = context.getPackageManager().getApplicationInfo(
                    context.getPackageName(), PackageManager.GET_META_DATA).metaData;
            if (metadata != null) features = metadata;
        } catch (PackageManager.NameNotFoundException impossible) {
            throw new IllegalStateException("Cannot read this app's patch information", impossible);
        }
        preferences = context.getSharedPreferences("saketh_patch_controls", Context.MODE_PRIVATE);
        preferences.registerOnSharedPreferenceChangeListener(CHANGED);
        refresh();
    }

    private static void refresh() {
        ads = preferences.getBoolean("hide_ads", true);
        popups = preferences.getBoolean("hide_popups", true);
        featuredWorks = preferences.getBoolean("hide_featured_works", true);
        materialYou = installed("material_you") && preferences.getBoolean("material_you", false);
        readerColors = installed("reader_material_you") && preferences.getBoolean("reader_material_you", true);
        disableRewardTimer = installed("disable_reward_timer") && preferences.getBoolean("disable_reward_timer", false);
        amoled = installed("amoled") && preferences.getBoolean("amoled", true);
        giphy = installed("gif_providers") && "giphy".equals(preferences.getString("gif_provider", "klipy"));
    }

    public static boolean hideAds() { return ads; }
    public static boolean hidePopups() { return popups; }
    public static boolean hideFeaturedWorks() { return featuredWorks; }
    public static boolean materialYou() { return materialYou; }
    public static boolean readerMaterialYou() { return materialYou && readerColors && android.os.Build.VERSION.SDK_INT >= 31; }
    public static boolean disableRewardTimer() { return disableRewardTimer; }
    public static boolean amoled() { return amoled; }
    public static boolean giphy() { return giphy; }
    public static SharedPreferences preferences() { return preferences; }
    public static boolean installed(String name) { return features.getBoolean("saketh.patch." + name, false); }

    public static void bindSettings(Activity activity) {
        initialize(activity);
        int id = activity.getResources().getIdentifier("saketh_patch_controls", "id", activity.getPackageName());
        View row = activity.findViewById(id);
        if (row != null) row.setOnClickListener(view -> activity.startActivity(new Intent(activity, PatchControlsActivity.class)));
    }
}
