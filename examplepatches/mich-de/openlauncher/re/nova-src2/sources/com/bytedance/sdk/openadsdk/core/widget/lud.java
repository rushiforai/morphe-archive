package com.bytedance.sdk.openadsdk.core.widget;

import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.SystemClock;
import android.text.TextUtils;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes2.dex */
public final class lud {
    private static final Map<String, WeakReference<com.bytedance.sdk.openadsdk.core.jc.thx>> ycx = new ConcurrentHashMap();

    /* renamed from: zb, reason: collision with root package name */
    private static final AtomicLong f26320zb = new AtomicLong(0);

    public static String ycx() {
        return SystemClock.elapsedRealtimeNanos() + "_" + f26320zb.incrementAndGet();
    }

    public static void zb(Activity activity) {
        Intent intent;
        if (activity == null || (intent = activity.getIntent()) == null || !intent.getBooleanExtra("_express_biz_from_express", false)) {
            return;
        }
        String stringExtra = intent.getStringExtra("_express_biz_session_id");
        String stringExtra2 = intent.getStringExtra("_express_biz_type");
        if (TextUtils.isEmpty(stringExtra) || TextUtils.isEmpty(stringExtra2)) {
            return;
        }
        WeakReference<com.bytedance.sdk.openadsdk.core.jc.thx> weakReferenceRemove = ycx.remove(stringExtra);
        com.bytedance.sdk.openadsdk.core.jc.thx thxVar = weakReferenceRemove != null ? weakReferenceRemove.get() : null;
        if (thxVar != null) {
            thxVar.zb(stringExtra2);
        }
    }

    public static void ycx(String str, com.bytedance.sdk.openadsdk.core.jc.thx thxVar) {
        if (TextUtils.isEmpty(str) || thxVar == null) {
            return;
        }
        ycx.put(str, new WeakReference<>(thxVar));
    }

    public static void ycx(Intent intent, String str, String str2) {
        if (intent == null || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        intent.putExtra("_express_biz_from_express", true);
        intent.putExtra("_express_biz_session_id", str);
        intent.putExtra("_express_biz_type", str2);
    }

    public static void ycx(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent == null || !intent.getBooleanExtra("_express_biz_from_express", false)) {
            return;
        }
        String stringExtra = intent.getStringExtra("_express_biz_session_id");
        String stringExtra2 = intent.getStringExtra("_express_biz_type");
        if (TextUtils.isEmpty(stringExtra) || TextUtils.isEmpty(stringExtra2)) {
            return;
        }
        Map<String, WeakReference<com.bytedance.sdk.openadsdk.core.jc.thx>> map = ycx;
        WeakReference<com.bytedance.sdk.openadsdk.core.jc.thx> weakReference = map.get(stringExtra);
        com.bytedance.sdk.openadsdk.core.jc.thx thxVar = weakReference != null ? weakReference.get() : null;
        if (thxVar == null) {
            map.remove(stringExtra);
        } else {
            thxVar.ycx(stringExtra2);
        }
    }

    public static void ycx(Dialog dialog, final com.bytedance.sdk.openadsdk.core.jc.thx thxVar, final String str) {
        if (dialog == null || thxVar == null || TextUtils.isEmpty(str)) {
            return;
        }
        final AtomicBoolean atomicBoolean = new AtomicBoolean(false);
        dialog.setOnShowListener(new DialogInterface.OnShowListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.lud.1
            @Override // android.content.DialogInterface.OnShowListener
            public void onShow(DialogInterface dialogInterface) {
                if (atomicBoolean.compareAndSet(false, true)) {
                    thxVar.ycx(str);
                }
            }
        });
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.lud.2
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialogInterface) {
                if (atomicBoolean.compareAndSet(true, false)) {
                    thxVar.zb(str);
                }
            }
        });
    }
}
