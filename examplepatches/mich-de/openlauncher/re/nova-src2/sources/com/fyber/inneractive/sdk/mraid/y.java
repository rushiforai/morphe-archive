package com.fyber.inneractive.sdk.mraid;

/* loaded from: classes3.dex */
public abstract class y {
    public abstract String a();

    public final String toString() {
        String strA = a();
        return strA != null ? strA.replaceAll("[^a-zA-Z0-9_,:\\s\\{\\}\\'\\\"]", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }
}
