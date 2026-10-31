package com.moloco.sdk.internal.services.bidtoken;

import com.moloco.sdk.publisher.privacy.InternalMolocoPrivacySettings;
import com.moloco.sdk.publisher.privacy.MolocoPrivacy;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class t implements u {

    /* renamed from: b, reason: collision with root package name */
    public static final int f37885b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InternalMolocoPrivacySettings f37886a;

    public t(@NotNull InternalMolocoPrivacySettings internalMolocoPrivacySettings) {
        Intrinsics.g(internalMolocoPrivacySettings, "internalMolocoPrivacySettings");
        this.f37886a = internalMolocoPrivacySettings;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.u
    @NotNull
    public MolocoPrivacy.PrivacySettings getPrivacy() {
        return this.f37886a.getUpdatedPrivacySettings(MolocoPrivacy.INSTANCE.getPrivacySettings());
    }
}
