package com.bytedance.sdk.openadsdk.pmi.sya;

import android.content.Context;
import android.content.SharedPreferences;
import com.bytedance.sdk.component.utils.thx;

/* loaded from: classes2.dex */
public class ycx {
    private final SharedPreferences ycx;

    public ycx(Context context) {
        if (thx.ycx(context)) {
            this.ycx = context.getSharedPreferences("pag_monitor_record", 0);
            return;
        }
        this.ycx = context.getSharedPreferences("pag_monitor_record_" + thx.sya(context), 0);
    }

    public long ycx() {
        return this.ycx.getLong("last_upload_time", 0L);
    }

    public void ycx(long j11) {
        SharedPreferences.Editor editorEdit = this.ycx.edit();
        editorEdit.putLong("last_upload_time", j11);
        editorEdit.apply();
    }
}
