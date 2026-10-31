package com.fyber.inneractive.sdk.player.exoplayer2.util;

import android.os.Trace;

/* loaded from: classes3.dex */
public abstract class w {
    public static void a(String str) {
        if (z.f30489a >= 18) {
            Trace.beginSection(str);
        }
    }

    public static void a() {
        if (z.f30489a >= 18) {
            Trace.endSection();
        }
    }
}
