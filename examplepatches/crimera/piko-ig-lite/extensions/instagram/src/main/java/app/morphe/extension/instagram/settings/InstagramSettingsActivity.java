/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.settings;

import android.os.Bundle;

import app.morphe.extension.crimera.settings.PikoSettingsActivity;

/**
 * The activity the patch declares in the manifest. Layout, navigation and search live in the shared
 * {@link PikoSettingsActivity}; Instagram supplies its configuration through
 * {@link InstagramSettingsHost}.
 */
public final class InstagramSettingsActivity extends PikoSettingsActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        InstagramSettingsHost.installTheme();
        super.onCreate(savedInstanceState);
    }
}
