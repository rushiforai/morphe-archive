package com.bytedance.sdk.openadsdk.core.ok.ycx;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Process;
import android.util.ArrayMap;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    private static volatile zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ArrayList<String> f25898zb = new ArrayList<>();
    private final AtomicBoolean sya = new AtomicBoolean(false);

    /* renamed from: dj, reason: collision with root package name */
    private long f25892dj = System.currentTimeMillis();
    private long lud = 0;

    /* renamed from: lt, reason: collision with root package name */
    private long f25896lt = 0;

    /* renamed from: ul, reason: collision with root package name */
    private String f25897ul = b.f42142b;
    private String fby = b.f42142b;

    /* renamed from: jw, reason: collision with root package name */
    private String f25895jw = b.f42142b;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f25894jc = false;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f25893ea = false;

    public static zb ycx(Application application) {
        if (ycx == null) {
            synchronized (zb.class) {
                try {
                    if (ycx == null) {
                        zb zbVar = new zb();
                        ycx = zbVar;
                        zbVar.f25894jc = ycx((Context) application);
                        ycx.f25893ea = ycx(application.getApplicationContext(), "android.permission.SYSTEM_ALERT_WINDOW") == 0;
                        ycx.ycx();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public void zb(Activity activity) {
        String localClassName = activity.getLocalClassName();
        if (this.f25898zb.contains(localClassName)) {
            this.f25898zb.remove(localClassName);
        }
        if (this.f25898zb.size() == 0) {
            this.f25892dj = System.currentTimeMillis();
            this.sya.set(true);
            this.fby = localClassName;
        }
    }

    private static int ycx(Context context, String str) {
        try {
            return context.checkPermission(str, Process.myPid(), Process.myUid());
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiWTaxoyYdG0lyeHK86", "euoenQyrSs+FSdx7gwOTLVg=", "WOYolgiPbMuGetJPgRizO1LhIw==", 68);
            return -1;
        }
    }

    private static boolean ycx(Context context) {
        ApplicationInfo applicationInfo;
        return (context == null || (applicationInfo = context.getApplicationInfo()) == null || (applicationInfo.flags & 1) <= 0) ? false : true;
    }

    public void ycx(Activity activity) {
        String localClassName = activity.getLocalClassName();
        if (this.f25898zb.size() == 0) {
            this.f25897ul = localClassName;
            this.lud = System.currentTimeMillis();
            this.f25896lt = System.currentTimeMillis() - this.f25892dj;
            this.sya.set(false);
        }
        if (!this.f25898zb.contains(localClassName)) {
            this.f25898zb.add(localClassName);
        }
        if (localClassName.contains("com.bytedance.sdk.openadsdk.activity.TTFullScreenExpressVideoActivity") || localClassName.contains("com.bytedance.sdk.openadsdk.activity.TTRewardExpressVideoActivity")) {
            return;
        }
        this.f25895jw = localClassName;
    }

    private void ycx() {
        int size;
        try {
            Class<?> cls = Class.forName("android.app.ActivityThread");
            Method declaredMethod = cls.getDeclaredMethod("currentActivityThread", null);
            boolean z11 = true;
            declaredMethod.setAccessible(true);
            Object objInvoke = declaredMethod.invoke(null, null);
            Field declaredField = cls.getDeclaredField("mActivities");
            declaredField.setAccessible(true);
            ArrayMap arrayMap = (ArrayMap) declaredField.get(objInvoke);
            if (arrayMap != null && (size = arrayMap.size()) > 0) {
                Class<?> cls2 = Class.forName("android.app.ActivityThread$ActivityClientRecord");
                Field declaredField2 = cls2.getDeclaredField("stopped");
                declaredField2.setAccessible(true);
                Field declaredField3 = cls2.getDeclaredField("activity");
                declaredField3.setAccessible(true);
                for (int i5 = 0; i5 < size; i5++) {
                    Object objValueAt = arrayMap.valueAt(i5);
                    if (!((Boolean) declaredField2.get(objValueAt)).booleanValue()) {
                        String localClassName = ((Activity) declaredField3.get(objValueAt)).getLocalClassName();
                        if (!this.f25898zb.contains(localClassName)) {
                            this.f25898zb.add(localClassName);
                        }
                    }
                }
                AtomicBoolean atomicBoolean = this.sya;
                if (this.f25898zb.size() > 0) {
                    z11 = false;
                }
                atomicBoolean.set(z11);
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiWTaxoyYdG0lyeHK86", "euoenQyrSs+FSdx7gwOTLVg=", "UuAkgSK/fc6WQ8NEpR+mJw==", 162);
        }
    }

    public String ycx(String str, long j11, int i5) {
        String string;
        long jCurrentTimeMillis = System.currentTimeMillis();
        long j12 = jCurrentTimeMillis - this.lud;
        long j13 = jCurrentTimeMillis - j11;
        int i11 = j13 < 500 ? 1 : 0;
        if (this.sya.get() && this.f25893ea) {
            i11 |= 2;
        }
        if (!this.sya.get() && this.f25896lt >= 5000 && j12 < 1000) {
            i11 = this.fby.equals(this.f25895jw) ? i11 | 4 : i11 | 8;
        }
        try {
            string = new JSONObject().put("rst", i11).put("adtag", str).put("bakdur", this.f25896lt).put("rit", i5).put("poptime", j12).put("unlocktime", j13).put("bakground", this.sya).put("alert", this.f25893ea).put("sys", this.f25894jc).put("actsize", this.f25898zb.size()).put("mutiproc", true ^ thx.ycx(pmi.ycx())).toString();
        } catch (JSONException e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiWTaxoyYdG0lyeHK86", "euoenQyrSs+FSdx7gwOTLVg=", "XOs5twK/YuaEed9SmzKoLVjlH5AQqWXT", Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE);
            string = b.f42142b;
        }
        this.f25897ul = b.f42142b;
        this.f25896lt = 0L;
        this.lud = 0L;
        this.f25892dj = System.currentTimeMillis();
        return string;
    }
}
