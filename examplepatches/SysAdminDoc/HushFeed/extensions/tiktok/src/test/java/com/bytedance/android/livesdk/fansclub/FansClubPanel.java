package com.bytedance.android.livesdk.fansclub;

import android.app.Dialog;

import com.bytedance.android.live.design.resource.theme.LiveThemeAwareDialogFragment;

/** Test stand-in for a fan club sheet: a themed LIVE dialog whose class name sits in the fan club package. */
public class FansClubPanel extends LiveThemeAwareDialogFragment {
    public Dialog dialog;

    public Dialog getDialog() {
        return dialog;
    }
}
