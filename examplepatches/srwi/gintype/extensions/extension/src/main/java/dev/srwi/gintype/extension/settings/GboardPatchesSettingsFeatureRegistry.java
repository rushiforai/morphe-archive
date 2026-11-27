package dev.srwi.gintype.extension.settings;

import android.content.Context;
import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.srwi.gintype.extension.customholdpopups.GboardCustomHoldPopupsSettingsFeature;
import dev.srwi.gintype.extension.thicctopbar.GboardThiccTopBarSettingsFeature;
import dev.srwi.gintype.extension.multiglide.GboardMultiGlideSettingsFeature;
import dev.srwi.gintype.extension.typingeffects.GboardTypingEffectsSettingsFeature;

public final class GboardPatchesSettingsFeatureRegistry {
    private static final String TAG = "GboardPatches";

    private GboardPatchesSettingsFeatureRegistry() {
    }

    public static List<GboardPatchesSettingsContract.Feature> features(Context context) {
        List<GboardPatchesSettingsContract.Feature> features =
                new ArrayList<GboardPatchesSettingsContract.Feature>();
        for (GboardPatchesSettingsContract.Feature feature : allFeatures(context)) {
            addIfAvailable(context, features, feature);
        }
        return Collections.unmodifiableList(features);
    }

    /** Every home-page feature in display order, before availability filtering. */
    public static List<GboardPatchesSettingsContract.Feature> allFeatures(Context context) {
        return Collections.unmodifiableList(Arrays.asList(
                new GboardMultiGlideSettingsFeature(context),
                new GboardThiccTopBarSettingsFeature(context),
                new GboardTypingEffectsSettingsFeature(context),
                new GboardCustomHoldPopupsSettingsFeature(context)));
    }

    private static void addIfAvailable(Context context,
            List<GboardPatchesSettingsContract.Feature> features,
            GboardPatchesSettingsContract.Feature feature) {
        try {
            if (feature.isAvailable(context)) {
                features.add(feature);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to evaluate feature availability: " + feature.getClass().getName(),
                    throwable);
        }
    }
}
