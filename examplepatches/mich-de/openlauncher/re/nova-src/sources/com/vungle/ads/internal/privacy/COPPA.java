package com.vungle.ads.internal.privacy;

import androidx.annotation.Keep;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.Nullable;

@Keep
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0087\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004J\r\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0007R\u0012\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0005j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000b"}, d2 = {"Lcom/vungle/ads/internal/privacy/COPPA;", b.f42142b, "value", b.f42142b, "(Ljava/lang/String;ILjava/lang/Boolean;)V", "Ljava/lang/Boolean;", "getValue", "()Ljava/lang/Boolean;", "COPPA_ENABLED", "COPPA_DISABLED", "COPPA_NOTSET", "vungle-ads_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes.dex */
public enum COPPA {
    COPPA_ENABLED(Boolean.TRUE),
    COPPA_DISABLED(Boolean.FALSE),
    COPPA_NOTSET(null);


    @Nullable
    private final Boolean value;

    COPPA(Boolean bool) {
        this.value = bool;
    }

    @Nullable
    public final Boolean getValue() {
        return this.value;
    }
}
