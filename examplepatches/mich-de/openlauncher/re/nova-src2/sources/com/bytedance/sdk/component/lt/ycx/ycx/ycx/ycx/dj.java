package com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx;

import android.content.Context;
import b.c0;

/* loaded from: classes2.dex */
public class dj extends ycx {
    public dj(Context context, com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        super(context, ycxVar);
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ycx
    public byte dj() {
        return (byte) 0;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.sya
    public long lt() {
        return com.bytedance.sdk.component.lt.ycx.ul.ycx.zb();
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ycx
    public byte sya() {
        return (byte) 1;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ycx, com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.sya
    public String zb() {
        com.bytedance.sdk.component.lt.ycx.ycx.lud ludVarSya = com.bytedance.sdk.component.lt.ycx.ul.lt().sya();
        if (ludVarSya != null) {
            return ludVarSya.ycx();
        }
        return null;
    }

    public static String sya(String str) {
        return c0.l("CREATE TABLE IF NOT EXISTS ", str, " (_id INTEGER PRIMARY KEY AUTOINCREMENT,id TEXT UNIQUE,value TEXT ,gen_time TEXT , retry INTEGER default 0 , encrypt INTEGER default 0)");
    }
}
