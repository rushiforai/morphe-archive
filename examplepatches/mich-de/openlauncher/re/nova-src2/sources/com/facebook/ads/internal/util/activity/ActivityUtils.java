package com.facebook.ads.internal.util.activity;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import com.facebook.ads.internal.util.common.ANActivityLifecycleCallbacksListener;
import com.facebook.ads.redexgen.X.AbstractC2126lf;
import com.facebook.ads.redexgen.X.AbstractC2336p7;
import com.facebook.ads.redexgen.X.C0957Hh;
import com.facebook.ads.redexgen.X.C0958Hi;
import com.facebook.ads.redexgen.X.C2127lg;
import com.facebook.ads.redexgen.X.C2203mv;
import com.facebook.ads.redexgen.X.C2341pE;
import com.facebook.ads.redexgen.X.ExecutorC2419qV;
import com.facebook.ads.redexgen.X.InterfaceC2339pA;
import com.facebook.ads.redexgen.X.RunnableC2338p9;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class ActivityUtils implements Application.ActivityLifecycleCallbacks {
    public static Context A01;
    public static C0957Hh A02;
    public static byte[] A03;
    public static String[] A04 = {"ouMPsLdF8VOzsynXqmRiTnVq9sCULlEK", "RDluICFSUJyOT3sC2lXOFgStPQc7gg7Y", "UmtUlnThENixw5hdz8sG1KFdsGmJDk97", "fTn296Ch3TXxkAVBDyGQxp9TrJ", "IUqXVRs0X8uhoFuXuWrDHC", "AqSoSQ8lTXl56yd6tw1FPxb5AEpw6", "5ylHfIThOZnGyEtaFkstDkkPbeVs18fd", "i0x"};
    public static final C2341pE A05;
    public static final List<InterfaceC2339pA> A06;
    public static final List<Runnable> A07;
    public static final Map<Activity, Integer> A08;
    public final Class<? extends Activity> A00;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A04;
            if (strArr[4].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A04;
            strArr2[4] = "4AKSMNDzmxTAf23dNNcZP8";
            strArr2[7] = "cH1";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 12);
            i13++;
        }
    }

    public static void A02() {
        A03 = new byte[]{54, 58, 91, 121, 110, 115, 108, 115, 110, 99, 32, 58, 92, 80, 2, 21, 22, 74, 80, 115, 81, 70, 91, 68, 91, 70, 75, 18, 86, 91, 65, 81, 64, 87, 66, 83, 92, 81, 91, 87, 65, 28, 55, 6, 6, 53, 25, 24, 2, 19, 14, 2, 86, 31, 5, 86, 24, 25, 2, 86, 55, 6, 6, 26, 31, 21, 23, 2, 31, 25, 24, 88, 40, 4, 5, 8, 30, 25, 25, 14, 5, 31, 75, 6, 4, 15, 2, 13, 2, 8, 10, 31, 2, 4, 5, 75, 14, 19, 8, 14, 27, 31, 2, 4, 5, 75, 31, 3, 25, 4, 28, 5, 15, 30, 25, 2, 5, 12, 75, 25, 14, 12, 2, 24, 31, 14, 25, 42, 8, 31, 2, 29, 2, 31, 18, 40, 10, 7, 7, 9, 10, 8, 0, 24, 39, 2, 24, 31, 14, 5, 14, 25, 10, 41, 33, 101, 36, 38, 49, 44, 51, 44, 49, 60, 101, 54, 49, 36, 49, 32, AbstractJsonLexerKt.TC_INVALID, 101, 115, 66, 86, 80, 70, 71, 3, 66, 64, 87, 74, 85, 74, 87, 90, 3, 74, 80, 3, 77, 76, 87, 3, 81, 70, 80, 86, 78, 70, 71, 13, 74, 125, 107, 34, 56, 31, 29, 10, 33, 11, 10, 23, 18, 4, 21, 12, 81, 80, AbstractJsonLexerKt.TC_INVALID, 93, 74, 87, 72, 87, 74, 71, 125, 76, 91, 95, 74, 91, 90};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 10
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static synchronized void A04(C0957Hh c0957Hh, Class<? extends Activity> cls) {
        A02 = c0957Hh;
        A01 = c0957Hh.getApplicationContext();
        if (A01 instanceof Application) {
            ANActivityLifecycleCallbacksListener aNActivityLifecycleCallbacksListener = ANActivityLifecycleCallbacksListener.getANActivityLifecycleCallbacksListener();
            if (aNActivityLifecycleCallbacksListener != null) {
                Map<Activity, Integer> activityStateMap = aNActivityLifecycleCallbacksListener.getActivityStateMap();
                synchronized (activityStateMap) {
                    try {
                        A08.putAll(activityStateMap);
                    } catch (ConcurrentModificationException unused) {
                        c0957Hh.A08().ABz(A01(Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 8, 114), AbstractC2126lf.A02, new C2127lg(A01(72, 80, 103)));
                    }
                }
                ANActivityLifecycleCallbacksListener.unregisterActivityCallbacks(c0957Hh);
            }
            ((Application) A01).registerActivityLifecycleCallbacks(new ActivityUtils(cls));
        } else {
            c0957Hh.A08().ABz(A01(Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE, 3, 105), AbstractC2126lf.A0d, new C2127lg(A01(42, 30, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)));
        }
    }

    static {
        A02();
        A08 = Collections.synchronizedMap(new WeakHashMap());
        A06 = Collections.synchronizedList(new ArrayList());
        A07 = new ArrayList();
        A05 = C2341pE.A00();
    }

    public ActivityUtils(Class<? extends Activity> adsActivityClass) {
        this.A00 = adsActivityClass;
    }

    public static synchronized Activity A00() {
        Activity key = null;
        Iterator<Map.Entry<Activity, Integer>> it = A08.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Map.Entry<Activity, Integer> next = it.next();
            if (next.getValue().intValue() == 3) {
                key = next.getKey();
                break;
            }
        }
        Activity activityA00 = null;
        boolean z11 = key == null || Build.VERSION.SDK_INT < 28;
        if (z11) {
            activityA00 = AbstractC2336p7.A00();
        }
        if (A02 != null && z11 && key != activityA00) {
            C2127lg c2127lg = new C2127lg(A01(19, 23, 62), A01(Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 5, 20) + key + A01(12, 7, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE) + activityA00);
            c2127lg.A05(1);
            A02.A08().ABz(A01(Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 8, 114), AbstractC2126lf.A03, c2127lg);
        }
        return key != null ? key : activityA00;
    }

    public static void A03(C0958Hi c0958Hi) {
        if (!C2203mv.A1p(c0958Hi) || Build.VERSION.SDK_INT >= 29) {
            return;
        }
        RunnableC2338p9 runnableC2338p9 = new RunnableC2338p9(c0958Hi);
        synchronized (A07) {
            A07.add(runnableC2338p9);
        }
        ExecutorC2419qV.A01.A01().postDelayed(runnableC2338p9, 2000L);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        A08.put(activity, 1);
        Iterator<InterfaceC2339pA> it = A06.iterator();
        if (it.hasNext()) {
            it.next();
            throw new NullPointerException(A01(Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 17, 50));
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        A08.put(activity, 6);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        ArrayList arrayList;
        Integer num = A08.get(activity);
        if (num == null || num.intValue() != 3) {
            C2127lg c2127lg = new C2127lg(A01(172, 31, 47), A01(152, 20, 73) + num + A01(0, 12, 22) + activity);
            c2127lg.A05(0);
            A02.A08().ABz(A01(Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 8, 114), AbstractC2126lf.A03, c2127lg);
        }
        A08.put(activity, 4);
        if (activity.getClass() != this.A00) {
            synchronized (A07) {
                arrayList = new ArrayList(A07);
                A07.clear();
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                ExecutorC2419qV.A01.A01().removeCallbacks((Runnable) it.next());
            }
        }
        A05.A01();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        A08.put(activity, 3);
        A05.A02();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        A08.put(activity, 2);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        A08.put(activity, 5);
    }
}
