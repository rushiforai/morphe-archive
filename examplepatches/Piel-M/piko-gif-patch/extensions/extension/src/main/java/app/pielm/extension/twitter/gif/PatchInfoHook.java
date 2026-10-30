package app.pielm.extension.twitter.gif;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.Log;

/**
 * Injects the Piko GIF Patch add-on into Piko's "Patch information" screen:
 *
 * 1. Under "Informations sur la version", directly underneath "Patchs de Piko":
 *    - Title: "Add-ons"
 *    - Summary: "Piko GIF Patch vX.X.X • Inclus"
 *
 * 2. Dedicated section between "Informations sur la version" and "Patchs":
 *    - Section Category: "Add-ons"
 *      - Item: "Piko GIF Patch" -> "vX.X.X • Inclus • Téléchargement natif des GIF"
 *      - Item: "Intégrations GIF" -> list of hooked features
 *
 * 3. In the "Patchs" category:
 *    - Item: "Téléchargement natif des GIF" -> "Inclus"
 */
@SuppressWarnings({"deprecation", "unused"})
public final class PatchInfoHook {
    private static final String TAG = "PikoGifPatch";
    private static final String REPO_URL = "https://github.com/Piel-M/piko-gif-patch";
    /** Same blue Piko uses for "Included" entries. */
    private static final String INCLUDED_COLOR = "#008FC4";
    private static final String KEY_PREFIX = "piko_gif_patch_";

    private PatchInfoHook() {
    }

    /**
     * Injected in {@code SettingsAboutFragment.onCreate()} right before {@code setPreferenceScreen(screen)}.
     */
    public static void onPatchInfoScreenCreated(Object fragment, PreferenceScreen screen) {
        if (screen == null) return;
        try {
            if (screen.findPreference(KEY_PREFIX + "version_under_patches") != null) return;
            Context context = screen.getContext();

            // 1. Insert directly under "Patchs de Piko" inside Category 0 (Version info)
            if (screen.getPreferenceCount() > 0) {
                Preference p0 = screen.getPreference(0);
                if (p0 instanceof PreferenceGroup) {
                    PreferenceGroup verPref = (PreferenceGroup) p0;
                    insertUnderPikoPatches(context, verPref);
                }
            }

            // 2. Insert dedicated "Add-ons" category between Category 0 and Category 1
            insertAddonsCategory(context, screen);

            // 3. Add to "Patchs" category list as well
            addToPatchesCategory(context, screen);

        } catch (Throwable t) {
            Log.e(TAG, "Unable to add GIF add-on to patch information screen", t);
        }
    }

    /**
     * Finds "Patchs de Piko" in the version group and places "Add-ons" immediately below it by order.
     */
    private static void insertUnderPikoPatches(Context context, PreferenceGroup verPref) {
        int pikoIdx = -1;
        int count = verPref.getPreferenceCount();
        for (int i = 0; i < count; i++) {
            Preference p = verPref.getPreference(i);
            String key = p.getKey();
            CharSequence title = p.getTitle();
            if ((key != null && (key.contains("piko_patches") || key.contains("piko_title_piko_patches"))) ||
                (title != null && title.toString().toLowerCase().contains("piko"))) {
                pikoIdx = i;
                break;
            }
        }

        // Set explicit sequential orders on verPref items so the new item is placed exactly under pikoIdx
        if (pikoIdx >= 0) {
            for (int i = 0; i < count; i++) {
                int order = (i <= pikoIdx) ? (i * 10) : ((i + 1) * 10);
                verPref.getPreference(i).setOrder(order);
            }
        }

        Preference addonPref = new Preference(context);
        addonPref.setKey(KEY_PREFIX + "version_under_patches");
        addonPref.setPersistent(false);
        addonPref.setTitle(Strings.addonsCategory());
        addonPref.setSummary(coloredIncluded("Piko GIF Patch v" + GifPatchHooks.getPatchVersion() + " • " + Strings.included()));
        if (pikoIdx >= 0) {
            addonPref.setOrder(pikoIdx * 10 + 5);
        }
        addonPref.setOnPreferenceClickListener(p -> {
            openRepo(context);
            return true;
        });
        verPref.addPreference(addonPref);
    }

    /**
     * Adds an "Add-ons" category section between the version category and the patches list.
     */
    private static void insertAddonsCategory(Context context, PreferenceScreen screen) {
        int count = screen.getPreferenceCount();

        // Assign explicit orders to screen categories so addonsCat sits in the middle
        if (count > 0) {
            screen.getPreference(0).setOrder(10);
        }
        for (int i = 1; i < count; i++) {
            screen.getPreference(i).setOrder((i + 2) * 10);
        }

        PreferenceCategory addonsCat = newCategory(context);
        addonsCat.setKey(KEY_PREFIX + "category");
        addonsCat.setPersistent(false);
        addonsCat.setTitle(Strings.addonsCategory());
        addonsCat.setOrder(20);
        screen.addPreference(addonsCat);

        // Add items AFTER addonsCat is attached to screen (avoids getNextId() NPE on null PreferenceManager)
        Preference addonItem = new Preference(context);
        addonItem.setKey(KEY_PREFIX + "addon_item");
        addonItem.setPersistent(false);
        addonItem.setTitle("Piko GIF Patch");
        addonItem.setSummary(coloredIncluded(
                "v" + GifPatchHooks.getPatchVersion() + " • " + Strings.included() + " (" + Strings.addonTitle() + ")"));
        addonItem.setOnPreferenceClickListener(p -> {
            openRepo(context);
            return true;
        });
        addonsCat.addPreference(addonItem);

        String integrations = GifPatchHooks.getEnabledIntegrations();
        if (!TextUtils.isEmpty(integrations)) {
            Preference integItem = new Preference(context);
            integItem.setKey(KEY_PREFIX + "integrations");
            integItem.setPersistent(false);
            integItem.setTitle(Strings.integrationTitle());
            integItem.setSummary(integrations);
            integItem.setSelectable(false);
            addonsCat.addPreference(integItem);
        }
    }

    /**
     * Also marks the feature as "Inclus" in the "Patchs" category.
     */
    private static void addToPatchesCategory(Context context, PreferenceScreen screen) {
        int count = screen.getPreferenceCount();
        if (count >= 2) {
            Preference lastCat = screen.getPreference(count - 1);
            if (lastCat instanceof PreferenceGroup) {
                PreferenceGroup patPref = (PreferenceGroup) lastCat;
                if (patPref.findPreference(KEY_PREFIX + "feature") == null) {
                    Preference featurePref = new Preference(context);
                    featurePref.setKey(KEY_PREFIX + "feature");
                    featurePref.setPersistent(false);
                    featurePref.setTitle(Strings.addonTitle());
                    featurePref.setSummary(coloredIncluded(Strings.included()));
                    featurePref.setOnPreferenceClickListener(p -> {
                        openRepo(context);
                        return true;
                    });
                    patPref.addPreference(featurePref);
                }
            }
        }
    }

    private static void openRepo(Context context) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(REPO_URL))
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to open repository page", t);
        }
    }

    private static PreferenceCategory newCategory(Context context) {
        try {
            Class<?> legacy = Class.forName("com.twitter.ui.widget.LegacyTwitterPreferenceCategory");
            Object instance = legacy.getConstructor(Context.class).newInstance(context);
            if (instance instanceof PreferenceCategory) {
                PreferenceCategory cat = (PreferenceCategory) instance;
                cat.setPersistent(false);
                return cat;
            }
        } catch (Throwable ignored) {
        }
        PreferenceCategory cat = new PreferenceCategory(context);
        cat.setPersistent(false);
        return cat;
    }

    private static CharSequence coloredIncluded(String text) {
        Spannable span = new SpannableString(text);
        String inc = Strings.included();
        int idx = text.indexOf(inc);
        if (idx >= 0) {
            span.setSpan(new ForegroundColorSpan(Color.parseColor(INCLUDED_COLOR)), idx, idx + inc.length(), 0);
        }
        return span;
    }
}
