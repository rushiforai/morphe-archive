package com.bytedance.sdk.component.zb.ycx;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public final class lud extends ry {
    List<String> ycx;

    /* renamed from: zb, reason: collision with root package name */
    List<String> f24181zb;

    public lud(List<String> list, List<String> list2) {
        this.ycx = list;
        this.f24181zb = list2;
    }

    public static final class ycx {
        private final List<String> ycx = new ArrayList();

        /* renamed from: zb, reason: collision with root package name */
        private final List<String> f24182zb = new ArrayList();

        public ycx ycx(String str, String str2) {
            this.ycx.add(str);
            this.f24182zb.add(str2);
            return this;
        }

        public lud ycx() {
            return new lud(this.ycx, this.f24182zb);
        }
    }
}
