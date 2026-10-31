package com.moloco.sdk.publisher.privacy;

import com.moloco.sdk.publisher.privacy.MolocoPrivacy;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b`\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0003H&¨\u0006\u0005"}, d2 = {"Lcom/moloco/sdk/publisher/privacy/InternalMolocoPrivacySettings;", b.f42142b, "getUpdatedPrivacySettings", "Lcom/moloco/sdk/publisher/privacy/MolocoPrivacy$PrivacySettings;", "privacySettings", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public interface InternalMolocoPrivacySettings {
    @NotNull
    MolocoPrivacy.PrivacySettings getUpdatedPrivacySettings(@NotNull MolocoPrivacy.PrivacySettings privacySettings);
}
