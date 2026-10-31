package com.fyber.inneractive.sdk.player.exoplayer2.util;

import java.util.Comparator;

/* loaded from: classes3.dex */
public final class r implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        float f11 = ((s) obj).f30471c;
        float f12 = ((s) obj2).f30471c;
        if (f11 < f12) {
            return -1;
        }
        return f12 < f11 ? 1 : 0;
    }
}
