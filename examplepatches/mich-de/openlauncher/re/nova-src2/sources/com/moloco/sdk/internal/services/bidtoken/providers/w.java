package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.publisher.Moloco;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class w implements j<Boolean> {

    /* renamed from: d, reason: collision with root package name */
    public static final int f37850d = 8;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f37851b = "SDKInitStateSignalProvider";

    /* renamed from: c, reason: collision with root package name */
    public boolean f37852c = Moloco.isInitialized();

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37852c = Moloco.isInitialized();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        StringBuilder sb2;
        boolean z11 = this.f37852c;
        boolean zIsInitialized = Moloco.isInitialized();
        boolean z12 = z11 != zIsInitialized;
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        String str = this.f37851b;
        if (z12) {
            sb2 = new StringBuilder("[CBT] sdkInitialized updated from ");
            sb2.append(z11);
            sb2.append(" to ");
            sb2.append(zIsInitialized);
        } else {
            sb2 = new StringBuilder("[CBT] sdkInitialized didn't change (before: ");
            sb2.append(z11);
            sb2.append(", after: ");
            sb2.append(zIsInitialized);
            sb2.append(')');
        }
        MolocoLogger.debugBuildLog$default(molocoLogger, str, sb2.toString(), false, 4, null);
        return z12;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return this.f37851b;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    public Boolean d() {
        return Boolean.valueOf(this.f37852c);
    }
}
