package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Objects;

/* loaded from: classes2.dex */
public class sya {
    public static void ycx(zb zbVar, Intent intent, Bundle bundle) {
        ycx(intent, zbVar);
        ycx(bundle, zbVar);
    }

    public static void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar, Intent intent, Bundle bundle) {
        ycx(intent, zbVar);
        ycx(bundle, zbVar);
    }

    public static tn ycx(Intent intent, Bundle bundle, com.bytedance.sdk.openadsdk.component.reward.sya.lud ludVar) {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarZb = av.ycx().zb(av.ycx(intent));
        tn tnVarJc = ycxVarZb != null ? ycxVarZb.jc() : null;
        if (ludVar != null) {
            ludVar.ycx(bundle);
        }
        if (bundle != null) {
            try {
                tnVarJc = av.ycx().ycx(bundle.getInt("meta_index", -1));
                Objects.toString(tnVarJc);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvNcmBCNKVXvKpAR", "XOs5uAKobNWJS9twiQWhDFr6LLMMrlzJiUzOaokT", 70);
                com.bytedance.sdk.component.utils.htf.ycx("TTAD.RFDM", b.f42142b, th2);
            }
        }
        if (tnVarJc != null) {
            tnVarJc.ycx(tnVarJc.dqs(), 7);
        }
        return tnVarJc;
    }

    public static tn ycx(Intent intent, Bundle bundle, com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar) {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarZb = av.ycx().zb(av.ycx(intent));
        tn tnVarJc = ycxVarZb != null ? ycxVarZb.jc() : null;
        if (zbVar != null) {
            zbVar.ycx(bundle);
        }
        av.ycx().lud();
        if (bundle != null) {
            try {
                tnVarJc = av.ycx().ycx(bundle.getInt("meta_index", -1));
                Objects.toString(tnVarJc);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvNcmBCNKVXvKpAR", "XOs5uAKobNWJS9twiQWhDFr6LA==", 100);
                com.bytedance.sdk.component.utils.htf.ycx("TTAD.RFDM", b.f42142b, th2);
            }
        }
        if (tnVarJc != null) {
            tnVarJc.ycx(tnVarJc.dqs(), 7);
        }
        return tnVarJc;
    }

    public static void ycx(Intent intent, zb zbVar) {
        if (intent == null) {
            return;
        }
        zbVar.thx.sya(intent.getBooleanExtra("video_is_cached", false));
        zbVar.sz = intent.getStringExtra("multi_process_listener_key");
        zbVar.f25197uz = intent.getIntExtra("orientation_angle", 0) == 3;
    }

    public static void ycx(Intent intent, com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar) {
        if (intent == null) {
            return;
        }
        zbVar.zb(intent.getBooleanExtra("video_is_cached", false));
        zbVar.f24945zb = intent.getIntExtra("orientation_angle", 0) == 3;
    }

    public static void ycx(Bundle bundle, zb zbVar) {
        if (bundle == null) {
            return;
        }
        zbVar.sz = bundle.getString("multi_process_listener_key");
        zbVar.thx.sya(bundle.getBoolean("video_is_cached", false));
        zbVar.f25202yi = bundle.getBoolean("is_mute");
        if (bundle.getLong("video_current") > 0) {
            zbVar.thx.zb(bundle.getLong("video_current", 0L));
        }
        zbVar.ycx(bundle.getBoolean("has_show_skip_btn"));
    }

    public static void ycx(Bundle bundle, com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar) {
        if (bundle == null) {
            return;
        }
        zbVar.zb(bundle.getBoolean("video_is_cached", false));
    }

    public static void ycx(zb zbVar, Bundle bundle, int i5) {
        if (bundle == null) {
            return;
        }
        try {
            bundle.putInt("meta_index", i5);
            bundle.putString("multi_process_listener_key", zbVar.sz);
            bundle.putBoolean("video_is_cached", zbVar.thx.rmy());
            bundle.putLong("video_current", zbVar.thx.ry());
            bundle.putBoolean("is_mute", zbVar.f25202yi);
            bundle.putBoolean("has_show_skip_btn", zbVar.f25182lv);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvNcmBCNKVXvKpAR", "VOAelBW5QMmTXtZTjxSTPFr6KA==", 172);
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.RFDM", "onSaveInstanceState: ", th2);
        }
    }

    public static void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar, Bundle bundle, int i5) {
        if (bundle == null) {
            return;
        }
        try {
            bundle.putInt("meta_index", i5);
            if (zbVar != null) {
                bundle.putBoolean("video_is_cached", zbVar.syc());
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvNcmBCNKVXvKpAR", "VOAelBW5QMmTXtZTjxSTPFr6KLMMrlzJiUzOaokT", 188);
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.RFDM", "onSaveInstanceState: ", th2);
        }
    }

    public static void ycx(tn tnVar, Intent intent, Bundle bundle, int i5) {
        if (bundle == null || tnVar == null) {
            return;
        }
        try {
            bundle.putInt("meta_index", i5);
            if (intent != null) {
                bundle.putString("multi_process_listener_key", intent.getStringExtra("multi_process_listener_key"));
                bundle.putBoolean("video_is_cached", intent.getBooleanExtra("video_is_cached", false));
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvNcmBCNKVXvKpAR", "VOAelBW5QMmTXtZTjxSTPFr6KLMMrkbJhWfYT4kwpA==", Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE);
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.RFDM", "onSaveInstanceState: ", th2);
        }
    }

    public static void ycx(Intent intent, Activity activity, boolean z11, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, String str) {
        int rotation;
        if (activity == null) {
            intent.addFlags(268435456);
        } else {
            try {
                rotation = activity.getWindowManager().getDefaultDisplay().getRotation();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvNcmBCNKVXvKpAR", "XechmSK/fc6WQ8NEvwWhOk/HI4EGsn3jgV7W", Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE);
                com.bytedance.sdk.component.utils.htf.ycx("TTAD.RFDM", b.f42142b, e3);
            }
            intent.putExtra("orientation_angle", rotation);
            intent.putExtra("video_is_cached", z11);
            av.ycx().lud();
            intent.putExtra("meta_index", av.ycx().ycx(ycxVar));
            intent.putExtra("single_process_listener_key", str);
        }
        rotation = 0;
        intent.putExtra("orientation_angle", rotation);
        intent.putExtra("video_is_cached", z11);
        av.ycx().lud();
        intent.putExtra("meta_index", av.ycx().ycx(ycxVar));
        intent.putExtra("single_process_listener_key", str);
    }
}
