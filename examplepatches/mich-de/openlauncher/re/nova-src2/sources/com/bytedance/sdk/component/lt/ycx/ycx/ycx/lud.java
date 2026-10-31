package com.bytedance.sdk.component.lt.ycx.ycx.ycx;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;

/* loaded from: classes2.dex */
public class lud implements com.bytedance.sdk.component.lt.ycx.ycx.lud {
    public static final lud ycx = new lud();

    /* renamed from: zb, reason: collision with root package name */
    private volatile SQLiteDatabase f23896zb;

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
        if (this.f23896zb == null) {
            synchronized (this) {
                try {
                    if (this.f23896zb == null) {
                        this.f23896zb = new dj(context).getWritableDatabase();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return this.f23896zb;
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
