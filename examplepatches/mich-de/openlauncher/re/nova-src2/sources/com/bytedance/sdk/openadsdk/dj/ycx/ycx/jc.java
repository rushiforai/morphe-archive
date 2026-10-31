package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import fc.g;
import fc.h;
import java.util.HashSet;

/* loaded from: classes2.dex */
public abstract class jc<D> extends h {
    private static final HashSet<String> ycx;

    static {
        HashSet<String> hashSet = new HashSet<>();
        ycx = hashSet;
        hashSet.add("play_start");
        hashSet.add("feed_play");
        hashSet.add("feed_continue");
        hashSet.add("feed_pause");
        hashSet.add("feed_break");
        hashSet.add("feed_over");
    }

    public jc(String str, g gVar) {
        super(str, gVar);
    }

    @Override // fc.h
    public final int ul() {
        if ((this instanceof ry) || zb() == 1) {
            return 4;
        }
        boolean z11 = this instanceof jw;
        if (z11) {
            if (ycx.contains(((jw) this).fby())) {
                return 3;
            }
        }
        return z11 ? 2 : 1;
    }

    public jc(String str, D d5) {
        super(str, d5);
    }
}
