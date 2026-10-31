package com.moloco.sdk.internal;

import android.net.Uri;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class g implements f {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i f36399a;

    public g(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i persistentHttpRequest) {
        Intrinsics.g(persistentHttpRequest, "persistentHttpRequest");
        this.f36399a = persistentHttpRequest;
    }

    @Override // com.moloco.sdk.internal.f
    public void a(@NotNull String burl) {
        Intrinsics.g(burl, "burl");
        try {
            Uri uri = Uri.parse(burl);
            com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i iVar = this.f36399a;
            String string = uri.toString();
            Intrinsics.f(string, "toString(...)");
            iVar.a(string);
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, "BUrlTrackerImpl", e3.toString(), null, false, 12, null);
        }
    }
}
