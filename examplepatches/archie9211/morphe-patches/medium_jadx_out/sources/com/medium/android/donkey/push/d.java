package com.medium.android.donkey.push;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import com.medium.android.donkey.push.TrampolineActivity;
import defpackage.eaf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class d {
    public static PendingIntent a(Context context, TrampolineActivity.Action action, long j) {
        context.getClass();
        Intent intent = new Intent(context, (Class<?>) TrampolineActivity.class);
        intent.putExtra("action", action);
        intent.setFlags(268468224);
        PendingIntent activity = PendingIntent.getActivity(context, new eaf((int) j, (int) (j >> 32)).b(), intent, 201326592);
        activity.getClass();
        return activity;
    }
}
