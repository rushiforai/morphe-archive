package com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx;

import android.content.Context;
import b.c0;

/* loaded from: classes2.dex */
public class lt extends ul {
    public lt(Context context, com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        super(context, ycxVar);
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ul
    public byte sya() {
        return (byte) 3;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ul
    public byte ycx() {
        return (byte) 1;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ul, com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.sya
    public String zb() {
        return com.bytedance.sdk.component.lt.ycx.ul.lt().sya().lud();
    }

    public static String ycx(String str) {
        return c0.l("CREATE TABLE IF NOT EXISTS ", str, " (_id INTEGER PRIMARY KEY AUTOINCREMENT,id TEXT UNIQUE,value TEXT ,gen_time TEXT , retry INTEGER default 0 , encrypt INTEGER default 0)");
    }
}
