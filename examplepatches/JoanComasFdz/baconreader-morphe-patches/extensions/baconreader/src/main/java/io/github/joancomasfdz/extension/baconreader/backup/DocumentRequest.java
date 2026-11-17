// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.backup;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

/**
 * Asks Android for a file to write or read, and hands it to {@link SettingsBackupPatch}. The settings of the patches
 * show in GoogleApiActivity, which replaces its settings fragment when Android recreates it: a fragment without a view
 * gets the result instead, and is kept.
 */
@SuppressWarnings("deprecation")
public final class DocumentRequest extends Fragment {
    private static final String TAG = "baconreader_patches_settings_backup";
    private static final int REQUEST_CODE = 0x5E77;
    private static final String ARGUMENT_INTENT = "intent";
    private static final String ARGUMENT_EXPORT = "export";

    static void start(Activity activity, Intent intent, boolean export) {
        DocumentRequest request = new DocumentRequest();
        Bundle arguments = new Bundle();
        arguments.putParcelable(ARGUMENT_INTENT, intent);
        arguments.putBoolean(ARGUMENT_EXPORT, export);
        request.setArguments(arguments);
        activity.getFragmentManager().beginTransaction().add(request, TAG).commitAllowingStateLoss();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) return;
        Bundle arguments = getArguments();
        Intent intent = arguments == null ? null : arguments.getParcelable(ARGUMENT_INTENT);
        if (intent == null) {
            done();
            return;
        }
        startActivityForResult(intent, REQUEST_CODE);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != REQUEST_CODE) return;
        Activity activity = getActivity();
        Uri uri = data == null ? null : data.getData();
        Bundle arguments = getArguments();
        boolean export = arguments != null && arguments.getBoolean(ARGUMENT_EXPORT);
        done();
        if (activity == null || resultCode != Activity.RESULT_OK || uri == null) return;
        if (export) SettingsBackupPatch.exportTo(activity, uri);
        else SettingsBackupPatch.importFrom(activity, uri);
    }

    private void done() {
        FragmentManager manager = getFragmentManager();
        if (manager != null) manager.beginTransaction().remove(this).commitAllowingStateLoss();
    }
}
