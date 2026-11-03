package com.bytedance.android.livesdk.profile;

import android.app.Dialog;

import com.bytedance.android.live.design.resource.theme.LiveThemeAwareDialogFragment;

/** Test stand-in for the host profile sheet: a themed LIVE dialog whose class name sits in the profile package. */
public class ProfilePanel extends LiveThemeAwareDialogFragment {
    public Dialog dialog;

    public Dialog getDialog() {
        return dialog;
    }
}
