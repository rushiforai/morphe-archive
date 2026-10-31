package com.amplitude;

import android.view.View;
import android.widget.EditText;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class x4 {
    public static final boolean a(View view) {
        Intrinsics.g(view, "view");
        if (!(view instanceof EditText)) {
            return false;
        }
        EditText editText = (EditText) view;
        return ((editText.getInputType() & 15) != 3 && (editText.getInputType() & 128) == 0 && (editText.getInputType() & 16) == 0 && (editText.getInputType() & Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE) == 0 && (editText.getInputType() & 144) == 0 && (editText.getInputType() & 32) == 0 && (editText.getInputType() & Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE) == 0) ? false : true;
    }
}
