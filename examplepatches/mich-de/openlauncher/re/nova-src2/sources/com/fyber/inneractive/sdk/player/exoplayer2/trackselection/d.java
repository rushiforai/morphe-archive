package com.fyber.inneractive.sdk.player.exoplayer2.trackselection;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class d extends g {

    /* renamed from: c, reason: collision with root package name */
    public final AtomicReference f30262c = new AtomicReference(new c());

    public static boolean a(int i5, boolean z11) {
        int i11 = i5 & 3;
        if (i11 != 3) {
            return z11 && i11 == 2;
        }
        return true;
    }
}
