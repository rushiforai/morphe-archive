package com.moloco.sdk.internal;

import android.net.Uri;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class z implements y {

    /* renamed from: b, reason: collision with root package name */
    public static final int f38265b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i f38266a;

    public z(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i persistentHttpRequest) {
        Intrinsics.g(persistentHttpRequest, "persistentHttpRequest");
        this.f38266a = persistentHttpRequest;
    }

    @Override // com.moloco.sdk.internal.y
    public boolean a(@NotNull String url, long j11, @Nullable t tVar) {
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c cVarF;
        Intrinsics.g(url, "url");
        if (tVar != null) {
            try {
                cVarF = tVar.f();
            } catch (Exception e3) {
                MolocoLogger.error$default(MolocoLogger.INSTANCE, "SdkEventUrlTrackerImpl", e3.toString(), null, false, 12, null);
                return false;
            }
        } else {
            cVarF = null;
        }
        Uri uriBuild = Uri.parse(a(url, j11, cVarF)).buildUpon().build();
        com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i iVar = this.f38266a;
        String string = uriBuild.toString();
        Intrinsics.f(string, "toString(...)");
        iVar.a(string);
        return true;
    }

    public final String a(String str, long j11, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c cVar) {
        String strA;
        if (cVar != null && (strA = com.moloco.sdk.internal.utils.b.a(str, cVar.a())) != null) {
            str = strA;
        }
        return com.moloco.sdk.internal.utils.b.a(str, j11);
    }
}
