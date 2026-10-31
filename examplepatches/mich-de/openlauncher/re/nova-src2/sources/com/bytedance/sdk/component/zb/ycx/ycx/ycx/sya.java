package com.bytedance.sdk.component.zb.ycx.ycx.ycx;

import com.bytedance.sdk.component.zb.ycx.fby;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.xkz;
import java.io.IOException;
import java.util.List;

/* loaded from: classes2.dex */
public class sya implements fby.ycx {
    int sya = 0;
    List<com.bytedance.sdk.component.zb.ycx.fby> ycx;

    /* renamed from: zb, reason: collision with root package name */
    ok f24216zb;

    public sya(List<com.bytedance.sdk.component.zb.ycx.fby> list, ok okVar) {
        this.ycx = list;
        this.f24216zb = okVar;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.fby.ycx
    public ok ycx() {
        return this.f24216zb;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.fby.ycx
    public xkz ycx(ok okVar) throws IOException {
        this.f24216zb = okVar;
        int i5 = this.sya + 1;
        this.sya = i5;
        if (i5 >= this.ycx.size()) {
            return null;
        }
        return this.ycx.get(this.sya).ycx(this);
    }
}
