package com.bytedance.adsdk.zb.ycx.zb;

import android.graphics.Path;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class fby {
    private final List<com.bytedance.adsdk.zb.sya.zb.fby> sya;
    private final List<ycx<com.bytedance.adsdk.zb.sya.zb.xkz, Path>> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final List<ycx<Integer, Integer>> f23248zb;

    public fby(List<com.bytedance.adsdk.zb.sya.zb.fby> list) {
        this.sya = list;
        this.ycx = new ArrayList(list.size());
        this.f23248zb = new ArrayList(list.size());
        for (int i5 = 0; i5 < list.size(); i5++) {
            this.ycx.add(list.get(i5).zb().ycx());
            this.f23248zb.add(list.get(i5).sya().ycx());
        }
    }

    public List<ycx<Integer, Integer>> sya() {
        return this.f23248zb;
    }

    public List<com.bytedance.adsdk.zb.sya.zb.fby> ycx() {
        return this.sya;
    }

    public List<ycx<com.bytedance.adsdk.zb.sya.zb.xkz, Path>> zb() {
        return this.ycx;
    }
}
