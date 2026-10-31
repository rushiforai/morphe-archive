package com.facebook.ads.internal.api;

import android.view.View;
import androidx.annotation.Keep;
import com.facebook.ads.NativeAdBase;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public interface NativeComponentTagApi {
    void tagView(View view, NativeAdBase.NativeComponentTag nativeComponentTag);
}
