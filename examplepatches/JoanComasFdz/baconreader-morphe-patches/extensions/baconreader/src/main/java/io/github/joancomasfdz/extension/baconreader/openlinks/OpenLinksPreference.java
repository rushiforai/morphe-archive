// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.openlinks;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.preference.Preference;
import android.util.AttributeSet;

/**
 * <p>
 * Shows whether Reddit links open in BaconReader, and opens the system screen to change it.
 * The summary is updated when coming back from the system screen.
 */
@SuppressWarnings({"unused", "deprecation"})
public class OpenLinksPreference extends Preference {
    private Application.ActivityLifecycleCallbacks lifecycleCallbacks;

    public OpenLinksPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    public OpenLinksPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public OpenLinksPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public OpenLinksPreference(Context context) {
        super(context);
        init();
    }

    private void init() {
        updateSummary();
        setOnPreferenceClickListener(preference -> {
            OpenLinksPatch.openSettings(getContext());
            return true;
        });
    }

    private void updateSummary() {
        setSummary(OpenLinksPatch.summary(OpenLinksPatch.status(getContext())));
    }

    @Override
    protected void onAttachedToActivity() {
        super.onAttachedToActivity();
        if (lifecycleCallbacks != null) return;

        Application application = (Application) getContext().getApplicationContext();
        lifecycleCallbacks = new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                updateSummary();
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
                if (activity.isFinishing() && activity.getClass().getName().equals(
                        "com.google.android.gms.common.api.GoogleApiActivity")) {
                    application.unregisterActivityLifecycleCallbacks(this);
                    lifecycleCallbacks = null;
                }
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }
        };
        application.registerActivityLifecycleCallbacks(lifecycleCallbacks);
    }
}
