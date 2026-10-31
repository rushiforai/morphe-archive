package com.facebook.ads;

import android.os.Bundle;
import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes2.dex */
public interface AdSDKNotificationListener {
    public static final String ENCRYPTED_CPM_KEY = "encrypted_cpm";
    public static final String IMPRESSION_EVENT = "impression";

    @Retention(RetentionPolicy.SOURCE)
    public @interface SDKEventKey {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface SDKEventType {
    }

    void onAdEvent(String str, Bundle bundle);
}
