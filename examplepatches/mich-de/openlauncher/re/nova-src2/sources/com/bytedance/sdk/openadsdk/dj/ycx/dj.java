package com.bytedance.sdk.openadsdk.dj.ycx;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;

/* loaded from: classes2.dex */
public class dj implements com.bytedance.sdk.component.lt.ycx.ycx.lud {
    public static final dj ycx = new dj();

    /* renamed from: zb, reason: collision with root package name */
    private volatile SQLiteDatabase f26715zb;

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.lud
    public String dj() {
        return "logstats";
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.lud
    public String lt() {
        return null;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.lud
    public String lud() {
        return "logstatsbatch";
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.lud
    public String sya() {
        return null;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.lud
    public SQLiteDatabase ycx(Context context) {
        if (this.f26715zb == null) {
            synchronized (this) {
                try {
                    if (this.f26715zb == null) {
                        this.f26715zb = com.bytedance.sdk.openadsdk.core.lt.ycx(context).ycx().ycx();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return this.f26715zb;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.lud
    public String zb() {
        return "adevent";
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.lud
    public String ycx() {
        return "loghighpriority";
    }
}
