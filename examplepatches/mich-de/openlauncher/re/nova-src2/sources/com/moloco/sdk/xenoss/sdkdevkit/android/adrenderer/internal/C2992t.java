package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import android.content.Context;
import android.net.Uri;
import com.moloco.sdk.internal.MolocoLogger;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.t, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2992t {
    public static final boolean b(Context context, String str) {
        try {
            w.h hVar = new w.h();
            hVar.f93401a.putExtra("android.support.customtabs.extra.ENABLE_URLBAR_HIDING", true);
            w.i iVarA = hVar.a();
            iVarA.f93407a.addFlags(268435456);
            iVarA.a(context, Uri.parse(str));
            return true;
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, "Xenoss", "tryStartCustomTabs exception", e3, false, 8, null);
            return false;
        }
    }
}
