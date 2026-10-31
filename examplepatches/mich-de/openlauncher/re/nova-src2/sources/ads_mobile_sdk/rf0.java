package ads_mobile_sdk;

import ads_mobile_sdk.df0;
import ads_mobile_sdk.if0;
import ads_mobile_sdk.mu0;
import ads_mobile_sdk.rf0;
import ads_mobile_sdk.zi3;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;
import b.c0;
import b.e6;
import b.k9;
import b.r9;
import b.t9;
import b0.x0;
import com.google.gson.Gson;
import java.io.Closeable;
import java.net.URL;
import java.util.ArrayList;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.text.Charsets;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes.dex */
public final class rf0 {

    /* renamed from: q, reason: collision with root package name */
    public static final Uri f9150q = Uri.parse("https://support.google.com/dfp_premium/answer/7160685#push");

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f9151a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f9152b;

    /* renamed from: c, reason: collision with root package name */
    public final kz2 f9153c;

    /* renamed from: d, reason: collision with root package name */
    public final ci3 f9154d;

    /* renamed from: e, reason: collision with root package name */
    public final g0 f9155e;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f9156f;

    /* renamed from: g, reason: collision with root package name */
    public final rw0 f9157g;

    /* renamed from: h, reason: collision with root package name */
    public final xj f9158h;

    /* renamed from: i, reason: collision with root package name */
    public final e6 f9159i;

    /* renamed from: j, reason: collision with root package name */
    public final w81 f9160j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicBoolean f9161k;

    /* renamed from: l, reason: collision with root package name */
    public String f9162l;

    /* renamed from: m, reason: collision with root package name */
    public String f9163m;
    public com.google.gson.r n;
    public mi3 o;

    /* renamed from: p, reason: collision with root package name */
    public String f9164p;

    public rf0(CoroutineContext uiContext, t70.j0 backgroundScope, kz2 rootTraceCreator, ci3 traceLogger, g0 activityTracker, jr0 flags, rw0 gmaUtil, xj appState, e6 httpClient, w81 inspectorManager, String afmaVersion) {
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(inspectorManager, "inspectorManager");
        Intrinsics.g(afmaVersion, "afmaVersion");
        this.f9151a = uiContext;
        this.f9152b = backgroundScope;
        this.f9153c = rootTraceCreator;
        this.f9154d = traceLogger;
        this.f9155e = activityTracker;
        this.f9156f = flags;
        this.f9157g = gmaUtil;
        this.f9158h = appState;
        this.f9159i = httpClient;
        this.f9160j = inspectorManager;
        this.f9161k = new AtomicBoolean(false);
        this.o = k9.i();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:105:0x01fc A[Catch: all -> 0x00f3, TRY_ENTER, TRY_LEAVE, TryCatch #12 {all -> 0x00f3, blocks: (B:53:0x00ed, B:69:0x014f, B:72:0x0168, B:74:0x016c, B:105:0x01fc), top: B:246:0x00ed }] */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0225 A[Catch: all -> 0x0231, TryCatch #8 {all -> 0x0231, blocks: (B:114:0x021e, B:116:0x0225, B:118:0x0229, B:120:0x022d, B:123:0x0234, B:125:0x0238, B:127:0x023c, B:129:0x0240, B:130:0x0241, B:131:0x0246, B:132:0x0247, B:133:0x024e, B:134:0x024f, B:135:0x0256, B:136:0x0257), top: B:240:0x021e }] */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0257 A[Catch: all -> 0x0231, TRY_LEAVE, TryCatch #8 {all -> 0x0231, blocks: (B:114:0x021e, B:116:0x0225, B:118:0x0229, B:120:0x022d, B:123:0x0234, B:125:0x0238, B:127:0x023c, B:129:0x0240, B:130:0x0241, B:131:0x0246, B:132:0x0247, B:133:0x024e, B:134:0x024f, B:135:0x0256, B:136:0x0257), top: B:240:0x021e }] */
    /* JADX WARN: Removed duplicated region for block: B:153:0x02b7  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x0312  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x033a  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x033b A[Catch: all -> 0x0347, TRY_LEAVE, TryCatch #3 {all -> 0x0347, blocks: (B:170:0x0325, B:173:0x032f, B:176:0x033b), top: B:231:0x0325 }] */
    /* JADX WARN: Removed duplicated region for block: B:179:0x0340  */
    /* JADX WARN: Removed duplicated region for block: B:189:0x0351 A[Catch: all -> 0x031c, TRY_ENTER, TRY_LEAVE, TryCatch #18 {all -> 0x031c, blocks: (B:151:0x02a0, B:154:0x02b9, B:156:0x02bd, B:189:0x0351), top: B:257:0x02a0 }] */
    /* JADX WARN: Removed duplicated region for block: B:203:0x037d A[Catch: all -> 0x0389, TryCatch #7 {all -> 0x0389, blocks: (B:201:0x0376, B:203:0x037d, B:205:0x0381, B:207:0x0385, B:210:0x038c, B:212:0x0390, B:214:0x0394, B:216:0x0398, B:217:0x0399, B:218:0x039e, B:219:0x039f, B:220:0x03a6, B:221:0x03a7, B:222:0x03ae, B:223:0x03af), top: B:239:0x0376 }] */
    /* JADX WARN: Removed duplicated region for block: B:223:0x03af A[Catch: all -> 0x0389, TRY_LEAVE, TryCatch #7 {all -> 0x0389, blocks: (B:201:0x0376, B:203:0x037d, B:205:0x0381, B:207:0x0385, B:210:0x038c, B:212:0x0390, B:214:0x0394, B:216:0x0398, B:217:0x0399, B:218:0x039e, B:219:0x039f, B:220:0x03a6, B:221:0x03a7, B:222:0x03ae, B:223:0x03af), top: B:239:0x0376 }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01bf  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001d  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01e4  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01e5 A[Catch: all -> 0x01f2, TRY_LEAVE, TryCatch #10 {all -> 0x01f2, blocks: (B:86:0x01d0, B:89:0x01d9, B:92:0x01e5), top: B:243:0x01d0 }] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01eb  */
    /* JADX WARN: Type inference failed for: r11v0 */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v13, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r11v14 */
    /* JADX WARN: Type inference failed for: r11v16 */
    /* JADX WARN: Type inference failed for: r11v17, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v2, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r11v20, types: [java.io.Closeable, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v22, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r11v23 */
    /* JADX WARN: Type inference failed for: r11v26 */
    /* JADX WARN: Type inference failed for: r11v27 */
    /* JADX WARN: Type inference failed for: r11v28 */
    /* JADX WARN: Type inference failed for: r11v29, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v3, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r11v32 */
    /* JADX WARN: Type inference failed for: r11v33 */
    /* JADX WARN: Type inference failed for: r11v34 */
    /* JADX WARN: Type inference failed for: r11v35 */
    /* JADX WARN: Type inference failed for: r11v36 */
    /* JADX WARN: Type inference failed for: r11v37 */
    /* JADX WARN: Type inference failed for: r11v5 */
    /* JADX WARN: Type inference failed for: r11v8 */
    /* JADX WARN: Type inference failed for: r5v18, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r5v19 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v20 */
    /* JADX WARN: Type inference failed for: r5v21, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v23 */
    /* JADX WARN: Type inference failed for: r5v24 */
    /* JADX WARN: Type inference failed for: r5v25, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v14, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r9v15 */
    /* JADX WARN: Type inference failed for: r9v16 */
    /* JADX WARN: Type inference failed for: r9v17 */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v22, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r9v24 */
    /* JADX WARN: Type inference failed for: r9v25 */
    /* JADX WARN: Type inference failed for: r9v26 */
    /* JADX WARN: Type inference failed for: r9v27 */
    /* JADX WARN: Type inference failed for: r9v3, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r9v4, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r9v5 */
    /* JADX WARN: Type inference failed for: r9v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(rf0 rf0Var, ContinuationImpl continuationImpl) {
        pf0 pf0Var;
        ?? r92;
        ?? r11;
        ?? r93;
        ?? r112;
        Activity activityB;
        boolean z11;
        ?? r52;
        Activity activityB2;
        boolean z12;
        em2 em2Var;
        em2 em2Var2;
        Closeable closeable;
        Activity activity;
        Closeable closeable2;
        rf0 rf0Var2;
        rf0 rf0Var3;
        e6 e6Var;
        Activity activity2;
        Closeable closeable3;
        th3 th3Var;
        URL url;
        th3 th3Var2;
        th3 th3Var3;
        Object objA;
        Closeable closeable4;
        Activity activity3;
        Closeable closeable5;
        rf0 rf0Var4;
        e6 e6Var2;
        Activity activity4;
        Closeable closeable6;
        th3 th3Var4;
        URL url2;
        th3 th3Var5;
        th3 th3Var6;
        Object objA2;
        rf0 rf0Var5;
        rf0 rf0Var6 = rf0Var;
        u uVar = u.a$7;
        rf0Var6.getClass();
        if (continuationImpl instanceof pf0) {
            pf0Var = (pf0) continuationImpl;
            int i5 = pf0Var.f8262i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pf0Var.f8262i = i5 - Integer.MIN_VALUE;
            } else {
                pf0Var = new pf0(rf0Var6, continuationImpl);
            }
        }
        pf0 pf0Var2 = pf0Var;
        Object obj = pf0Var2.f8260g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        try {
            try {
                switch (pf0Var2.f8262i) {
                    case 0:
                        ResultKt.b(obj);
                        kz2 kz2Var = rf0Var6.f9153c;
                        wv0 wv0Var = wv0.CUI_NAME_DEBUG_MENU_DEBUG_SIGNALS;
                        mi3 mi3Var = rf0Var6.o;
                        EmptyList emptyList = EmptyList.f71733a;
                        if (ji3.b().f4777a == null) {
                            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                            try {
                                activityB2 = rf0Var6.f9155e.b();
                                if (activityB2 == null) {
                                    zi3.a(6, "No Activity context available for starting debug signals.", null);
                                    rf0Var6.f9161k.set(false);
                                    Unit unit = Unit.f71706a;
                                    em2VarA.close();
                                    return unit;
                                }
                                z12 = rf0Var6.f9158h.f11739h.get();
                                w81 w81Var = rf0Var6.f9160j;
                                String str = rf0Var6.f9162l;
                                com.google.gson.r rVar = rf0Var6.n;
                                pf0Var2.f8254a = rf0Var6;
                                pf0Var2.f8255b = em2VarA;
                                pf0Var2.f8256c = em2VarA;
                                pf0Var2.f8257d = activityB2;
                                pf0Var2.f8259f = z12;
                                pf0Var2.f8262i = 1;
                                w81Var.getClass();
                                Object objA3 = w81.a(w81Var, str, rVar, pf0Var2);
                                if (objA3 != coroutineSingletons) {
                                    em2 em2Var3 = em2VarA;
                                    obj = objA3;
                                    em2Var = em2Var3;
                                    em2Var2 = em2Var3;
                                    rf0Var6.f9158h.f11739h.set(((Boolean) obj).booleanValue());
                                    if (rf0Var6.f9158h.f11739h.get()) {
                                        pf0Var2.f8254a = em2Var2;
                                        pf0Var2.f8255b = em2Var;
                                        pf0Var2.f8256c = null;
                                        pf0Var2.f8257d = null;
                                        pf0Var2.f8262i = 5;
                                        if (rf0Var6.c(pf0Var2) != coroutineSingletons) {
                                            closeable = em2Var;
                                            Unit unit2 = Unit.f71706a;
                                            CloseableKt.a(closeable, null);
                                            return Unit.f71706a;
                                        }
                                    } else if (z12 || rf0Var6.n == null) {
                                        activity = activityB2;
                                        closeable2 = em2Var;
                                        rf0Var2 = rf0Var6;
                                        r112 = em2Var2;
                                        try {
                                            pf0Var2.f8254a = r112;
                                            try {
                                                pf0Var2.f8255b = closeable2;
                                                pf0Var2.f8256c = null;
                                                pf0Var2.f8257d = null;
                                                pf0Var2.f8262i = 4;
                                                rf0Var2.getClass();
                                                objA = a(rf0Var2, "The device is successfully linked for troubleshooting.", activity, false, (ContinuationImpl) pf0Var2, 1);
                                                if (objA != coroutineSingletons) {
                                                    objA = Unit.f71706a;
                                                }
                                                if (objA != coroutineSingletons) {
                                                    Unit unit3 = Unit.f71706a;
                                                    CloseableKt.a(closeable2, null);
                                                    return unit3;
                                                }
                                            } catch (Throwable th2) {
                                                th = th2;
                                                r93 = closeable2;
                                                try {
                                                    r112.b(th);
                                                    if (!(th instanceof b.a4)) {
                                                    }
                                                } finally {
                                                }
                                            }
                                        } catch (Throwable th3) {
                                            th = th3;
                                            th3Var3 = r112;
                                            r93 = closeable2;
                                            r112 = th3Var3;
                                            r112.b(th);
                                            if (!(th instanceof b.a4)) {
                                            }
                                        }
                                    } else {
                                        e6 e6Var3 = rf0Var6.f9159i;
                                        jr0 jr0Var = rf0Var6.f9156f;
                                        jr0Var.getClass();
                                        String str2 = (String) jr0Var.a("gads:drx_debug:send_debug_data_url", "https://www.google.com/dfp/sendDebugData", uVar);
                                        pf0Var2.f8254a = rf0Var6;
                                        pf0Var2.f8255b = em2Var2;
                                        pf0Var2.f8256c = em2Var;
                                        pf0Var2.f8257d = activityB2;
                                        pf0Var2.f8258e = e6Var3;
                                        pf0Var2.f8262i = 2;
                                        String str3 = rf0Var6.f9162l;
                                        com.google.gson.r rVar2 = rf0Var6.n;
                                        w81 w81Var2 = rf0Var6.f9160j;
                                        w81Var2.getClass();
                                        Comparable comparableA = w81.a(w81Var2, str2, str3, rVar2, pf0Var2);
                                        if (comparableA != coroutineSingletons) {
                                            rf0Var3 = rf0Var6;
                                            e6Var = e6Var3;
                                            obj = comparableA;
                                            activity2 = activityB2;
                                            closeable3 = em2Var;
                                            th3Var = em2Var2;
                                            url = new URL(((Uri) obj).toString());
                                            pf0Var2.f8254a = rf0Var3;
                                            pf0Var2.f8255b = th3Var;
                                            pf0Var2.f8256c = closeable3;
                                            pf0Var2.f8257d = activity2;
                                            pf0Var2.f8258e = null;
                                            pf0Var2.f8262i = 3;
                                            if (e6.b(e6Var, url, null, pf0Var2, 30) != coroutineSingletons) {
                                                th3Var2 = th3Var;
                                                activity = activity2;
                                                closeable2 = closeable3;
                                                rf0Var2 = rf0Var3;
                                                r112 = th3Var2;
                                                pf0Var2.f8254a = r112;
                                                pf0Var2.f8255b = closeable2;
                                                pf0Var2.f8256c = null;
                                                pf0Var2.f8257d = null;
                                                pf0Var2.f8262i = 4;
                                                rf0Var2.getClass();
                                                objA = a(rf0Var2, "The device is successfully linked for troubleshooting.", activity, false, (ContinuationImpl) pf0Var2, 1);
                                                if (objA != coroutineSingletons) {
                                                }
                                                if (objA != coroutineSingletons) {
                                                }
                                            }
                                        }
                                    }
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                r93 = em2VarA;
                                r112 = r93;
                                r112.b(th);
                                if (!(th instanceof b.a4)) {
                                }
                            }
                        } else {
                            th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                            try {
                                activityB = rf0Var6.f9155e.b();
                                if (activityB == null) {
                                    zi3.a(6, "No Activity context available for starting debug signals.", null);
                                    rf0Var6.f9161k.set(false);
                                    Unit unit4 = Unit.f71706a;
                                    th3VarA.close();
                                    return unit4;
                                }
                                z11 = rf0Var6.f9158h.f11739h.get();
                                w81 w81Var3 = rf0Var6.f9160j;
                                String str4 = rf0Var6.f9162l;
                                com.google.gson.r rVar3 = rf0Var6.n;
                                pf0Var2.f8254a = rf0Var6;
                                pf0Var2.f8255b = th3VarA;
                                pf0Var2.f8256c = th3VarA;
                                pf0Var2.f8257d = activityB;
                                pf0Var2.f8259f = z11;
                                pf0Var2.f8262i = 6;
                                w81Var3.getClass();
                                Object objA4 = w81.a(w81Var3, str4, rVar3, pf0Var2);
                                if (objA4 != coroutineSingletons) {
                                    th3 th3Var7 = th3VarA;
                                    obj = objA4;
                                    r52 = th3Var7;
                                    r11 = th3Var7;
                                    try {
                                        rf0Var6.f9158h.f11739h.set(((Boolean) obj).booleanValue());
                                        if (rf0Var6.f9158h.f11739h.get()) {
                                            pf0Var2.f8254a = r11;
                                            pf0Var2.f8255b = r52;
                                            pf0Var2.f8256c = null;
                                            pf0Var2.f8257d = null;
                                            pf0Var2.f8262i = 10;
                                            if (rf0Var6.c(pf0Var2) != coroutineSingletons) {
                                                closeable4 = r52;
                                                Unit unit5 = Unit.f71706a;
                                                CloseableKt.a(closeable4, null);
                                                return Unit.f71706a;
                                            }
                                        } else if (z11 || rf0Var6.n == null) {
                                            activity3 = activityB;
                                            closeable5 = r52;
                                            rf0Var4 = rf0Var6;
                                            r11 = r11;
                                            try {
                                                r52 = "The device is successfully linked for troubleshooting.";
                                                pf0Var2.f8254a = r11;
                                                try {
                                                    pf0Var2.f8255b = closeable5;
                                                    pf0Var2.f8256c = null;
                                                    pf0Var2.f8257d = null;
                                                    pf0Var2.f8262i = 9;
                                                    rf0Var4.getClass();
                                                    objA2 = a(rf0Var4, "The device is successfully linked for troubleshooting.", activity3, false, (ContinuationImpl) pf0Var2, 1);
                                                    if (objA2 != coroutineSingletons) {
                                                        objA2 = Unit.f71706a;
                                                    }
                                                    if (objA2 != coroutineSingletons) {
                                                        Unit unit6 = Unit.f71706a;
                                                        CloseableKt.a(closeable5, null);
                                                        return unit6;
                                                    }
                                                } catch (Throwable th5) {
                                                    th = th5;
                                                    r92 = closeable5;
                                                    try {
                                                        r11.b(th);
                                                        if (th instanceof b.a4) {
                                                            throw th;
                                                        }
                                                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                                            r11.a(th);
                                                        }
                                                        if (th instanceof TimeoutCancellationException) {
                                                            throw new lw0(th);
                                                        }
                                                        if (th instanceof CancellationException) {
                                                            throw new du0(th);
                                                        }
                                                        if (th instanceof dv0) {
                                                            throw th;
                                                        }
                                                        throw new iu0(th);
                                                    } finally {
                                                    }
                                                }
                                            } catch (Throwable th6) {
                                                th = th6;
                                                th3Var6 = r11;
                                                r92 = closeable5;
                                                r11 = th3Var6;
                                                r11.b(th);
                                                if (th instanceof b.a4) {
                                                }
                                            }
                                        } else {
                                            e6 e6Var4 = rf0Var6.f9159i;
                                            jr0 jr0Var2 = rf0Var6.f9156f;
                                            jr0Var2.getClass();
                                            String str5 = (String) jr0Var2.a("gads:drx_debug:send_debug_data_url", "https://www.google.com/dfp/sendDebugData", uVar);
                                            pf0Var2.f8254a = rf0Var6;
                                            pf0Var2.f8255b = r11;
                                            pf0Var2.f8256c = r52;
                                            pf0Var2.f8257d = activityB;
                                            pf0Var2.f8258e = e6Var4;
                                            pf0Var2.f8262i = 7;
                                            String str6 = rf0Var6.f9162l;
                                            com.google.gson.r rVar4 = rf0Var6.n;
                                            w81 w81Var4 = rf0Var6.f9160j;
                                            w81Var4.getClass();
                                            Comparable comparableA2 = w81.a(w81Var4, str5, str6, rVar4, pf0Var2);
                                            if (comparableA2 != coroutineSingletons) {
                                                Closeable closeable7 = r52;
                                                r52 = rf0Var6;
                                                e6Var2 = e6Var4;
                                                obj = comparableA2;
                                                activity4 = activityB;
                                                closeable6 = closeable7;
                                                th3Var4 = r11;
                                                url2 = new URL(((Uri) obj).toString());
                                                pf0Var2.f8254a = r52;
                                                pf0Var2.f8255b = th3Var4;
                                                pf0Var2.f8256c = closeable6;
                                                pf0Var2.f8257d = activity4;
                                                pf0Var2.f8258e = null;
                                                pf0Var2.f8262i = 8;
                                                if (e6.b(e6Var2, url2, null, pf0Var2, 30) != coroutineSingletons) {
                                                    th3Var5 = th3Var4;
                                                    activity3 = activity4;
                                                    closeable5 = closeable6;
                                                    rf0Var5 = r52;
                                                    rf0Var4 = rf0Var5;
                                                    r11 = th3Var5;
                                                    r52 = "The device is successfully linked for troubleshooting.";
                                                    pf0Var2.f8254a = r11;
                                                    pf0Var2.f8255b = closeable5;
                                                    pf0Var2.f8256c = null;
                                                    pf0Var2.f8257d = null;
                                                    pf0Var2.f8262i = 9;
                                                    rf0Var4.getClass();
                                                    objA2 = a(rf0Var4, "The device is successfully linked for troubleshooting.", activity3, false, (ContinuationImpl) pf0Var2, 1);
                                                    if (objA2 != coroutineSingletons) {
                                                    }
                                                    if (objA2 != coroutineSingletons) {
                                                    }
                                                }
                                            }
                                        }
                                    } catch (Throwable th7) {
                                        th = th7;
                                        r92 = r52;
                                        r11.b(th);
                                        if (th instanceof b.a4) {
                                        }
                                    }
                                }
                            } catch (Throwable th8) {
                                th = th8;
                                r92 = th3VarA;
                                r11 = r92;
                                r11.b(th);
                                if (th instanceof b.a4) {
                                }
                            }
                        }
                        return coroutineSingletons;
                    case 1:
                        boolean z13 = pf0Var2.f8259f;
                        activityB2 = pf0Var2.f8257d;
                        r93 = pf0Var2.f8256c;
                        r112 = (th3) pf0Var2.f8255b;
                        rf0 rf0Var7 = (rf0) pf0Var2.f8254a;
                        try {
                            ResultKt.b(obj);
                            z12 = z13;
                            rf0Var6 = rf0Var7;
                            em2Var = r93;
                            em2Var2 = r112;
                            rf0Var6.f9158h.f11739h.set(((Boolean) obj).booleanValue());
                            if (rf0Var6.f9158h.f11739h.get()) {
                            }
                            return coroutineSingletons;
                        } catch (Throwable th9) {
                            th = th9;
                            r112.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                        break;
                    case 2:
                        e6Var = pf0Var2.f8258e;
                        activity2 = pf0Var2.f8257d;
                        closeable3 = pf0Var2.f8256c;
                        th3Var = (th3) pf0Var2.f8255b;
                        rf0 rf0Var8 = (rf0) pf0Var2.f8254a;
                        try {
                            ResultKt.b(obj);
                            rf0Var3 = rf0Var8;
                            url = new URL(((Uri) obj).toString());
                            pf0Var2.f8254a = rf0Var3;
                            pf0Var2.f8255b = th3Var;
                            pf0Var2.f8256c = closeable3;
                            pf0Var2.f8257d = activity2;
                            pf0Var2.f8258e = null;
                            pf0Var2.f8262i = 3;
                            if (e6.b(e6Var, url, null, pf0Var2, 30) != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        } catch (Throwable th10) {
                            th = th10;
                            r93 = closeable3;
                            r112 = th3Var;
                            r112.b(th);
                            if (!(th instanceof b.a4)) {
                                throw th;
                            }
                            if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                r112.a(th);
                            }
                            if (th instanceof TimeoutCancellationException) {
                                throw new lw0(th);
                            }
                            if (th instanceof CancellationException) {
                                throw new du0(th);
                            }
                            if (th instanceof dv0) {
                                throw th;
                            }
                            throw new iu0(th);
                        }
                    case 3:
                        Activity activity5 = pf0Var2.f8257d;
                        closeable2 = pf0Var2.f8256c;
                        th3Var3 = (th3) pf0Var2.f8255b;
                        rf0Var3 = (rf0) pf0Var2.f8254a;
                        try {
                            ResultKt.b(obj);
                            activity = activity5;
                            th3Var2 = th3Var3;
                            rf0Var2 = rf0Var3;
                            r112 = th3Var2;
                            pf0Var2.f8254a = r112;
                            pf0Var2.f8255b = closeable2;
                            pf0Var2.f8256c = null;
                            pf0Var2.f8257d = null;
                            pf0Var2.f8262i = 4;
                            rf0Var2.getClass();
                            objA = a(rf0Var2, "The device is successfully linked for troubleshooting.", activity, false, (ContinuationImpl) pf0Var2, 1);
                            if (objA != coroutineSingletons) {
                            }
                            if (objA != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        } catch (Throwable th11) {
                            th = th11;
                            r93 = closeable2;
                            r112 = th3Var3;
                            r112.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                        break;
                    case 4:
                        closeable2 = pf0Var2.f8255b;
                        ResultKt.b(obj);
                        Unit unit32 = Unit.f71706a;
                        CloseableKt.a(closeable2, null);
                        return unit32;
                    case 5:
                        closeable = pf0Var2.f8255b;
                        ResultKt.b(obj);
                        Unit unit22 = Unit.f71706a;
                        CloseableKt.a(closeable, null);
                        return Unit.f71706a;
                    case 6:
                        boolean z14 = pf0Var2.f8259f;
                        activityB = pf0Var2.f8257d;
                        r92 = pf0Var2.f8256c;
                        r11 = (th3) pf0Var2.f8255b;
                        rf0 rf0Var9 = (rf0) pf0Var2.f8254a;
                        try {
                            ResultKt.b(obj);
                            r52 = r92;
                            z11 = z14;
                            rf0Var6 = rf0Var9;
                            r11 = r11;
                            rf0Var6.f9158h.f11739h.set(((Boolean) obj).booleanValue());
                            if (rf0Var6.f9158h.f11739h.get()) {
                            }
                            return coroutineSingletons;
                        } catch (Throwable th12) {
                            th = th12;
                            r11.b(th);
                            if (th instanceof b.a4) {
                            }
                        }
                        break;
                    case 7:
                        e6Var2 = pf0Var2.f8258e;
                        activity4 = pf0Var2.f8257d;
                        closeable6 = pf0Var2.f8256c;
                        th3Var4 = (th3) pf0Var2.f8255b;
                        rf0 rf0Var10 = (rf0) pf0Var2.f8254a;
                        try {
                            ResultKt.b(obj);
                            r52 = rf0Var10;
                            url2 = new URL(((Uri) obj).toString());
                            pf0Var2.f8254a = r52;
                            pf0Var2.f8255b = th3Var4;
                            pf0Var2.f8256c = closeable6;
                            pf0Var2.f8257d = activity4;
                            pf0Var2.f8258e = null;
                            pf0Var2.f8262i = 8;
                            if (e6.b(e6Var2, url2, null, pf0Var2, 30) != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        } catch (Throwable th13) {
                            th = th13;
                            r92 = closeable6;
                            r11 = th3Var4;
                            r11.b(th);
                            if (th instanceof b.a4) {
                            }
                        }
                        break;
                    case 8:
                        Activity activity6 = pf0Var2.f8257d;
                        closeable5 = pf0Var2.f8256c;
                        th3Var6 = (th3) pf0Var2.f8255b;
                        rf0 rf0Var11 = (rf0) pf0Var2.f8254a;
                        try {
                            ResultKt.b(obj);
                            activity3 = activity6;
                            th3Var5 = th3Var6;
                            rf0Var5 = rf0Var11;
                            rf0Var4 = rf0Var5;
                            r11 = th3Var5;
                            r52 = "The device is successfully linked for troubleshooting.";
                            pf0Var2.f8254a = r11;
                            pf0Var2.f8255b = closeable5;
                            pf0Var2.f8256c = null;
                            pf0Var2.f8257d = null;
                            pf0Var2.f8262i = 9;
                            rf0Var4.getClass();
                            objA2 = a(rf0Var4, "The device is successfully linked for troubleshooting.", activity3, false, (ContinuationImpl) pf0Var2, 1);
                            if (objA2 != coroutineSingletons) {
                            }
                            if (objA2 != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        } catch (Throwable th14) {
                            th = th14;
                            r92 = closeable5;
                            r11 = th3Var6;
                            r11.b(th);
                            if (th instanceof b.a4) {
                            }
                        }
                        break;
                    case 9:
                        closeable5 = pf0Var2.f8255b;
                        ResultKt.b(obj);
                        Unit unit62 = Unit.f71706a;
                        CloseableKt.a(closeable5, null);
                        return unit62;
                    case 10:
                        closeable4 = pf0Var2.f8255b;
                        ResultKt.b(obj);
                        Unit unit52 = Unit.f71706a;
                        CloseableKt.a(closeable4, null);
                        return Unit.f71706a;
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (Throwable th15) {
                th = th15;
                r93 = uVar;
                r112 = coroutineSingletons;
            }
        } catch (Throwable th16) {
            th = th16;
            r92 = uVar;
            r11 = coroutineSingletons;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:117:0x01d0, code lost:
    
        if (r1.a(r3, r12, r5) == r0) goto L118;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0107, code lost:
    
        if (r1.a(r3, r12, r5) == r0) goto L118;
     */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0197 A[Catch: all -> 0x01b5, TryCatch #5 {all -> 0x01b5, blocks: (B:104:0x0191, B:106:0x0197, B:109:0x01b0, B:114:0x01b8, B:116:0x01bc), top: B:163:0x0191 }] */
    /* JADX WARN: Removed duplicated region for block: B:114:0x01b8 A[Catch: all -> 0x01b5, TryCatch #5 {all -> 0x01b5, blocks: (B:104:0x0191, B:106:0x0197, B:109:0x01b0, B:114:0x01b8, B:116:0x01bc), top: B:163:0x0191 }] */
    /* JADX WARN: Removed duplicated region for block: B:130:0x01ee A[Catch: all -> 0x01fa, TryCatch #7 {all -> 0x01fa, blocks: (B:128:0x01e7, B:130:0x01ee, B:132:0x01f2, B:134:0x01f6, B:137:0x01fd, B:139:0x0201, B:141:0x0205, B:143:0x0209, B:144:0x020a, B:145:0x020f, B:146:0x0210, B:147:0x0217, B:148:0x0218, B:149:0x021f, B:150:0x0220), top: B:166:0x01e7 }] */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0220 A[Catch: all -> 0x01fa, TRY_LEAVE, TryCatch #7 {all -> 0x01fa, blocks: (B:128:0x01e7, B:130:0x01ee, B:132:0x01f2, B:134:0x01f6, B:137:0x01fd, B:139:0x0201, B:141:0x0205, B:143:0x0209, B:144:0x020a, B:145:0x020f, B:146:0x0210, B:147:0x0217, B:148:0x0218, B:149:0x021f, B:150:0x0220), top: B:166:0x01e7 }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00cc A[Catch: all -> 0x00eb, TryCatch #9 {all -> 0x00eb, blocks: (B:45:0x00c6, B:47:0x00cc, B:50:0x00e5, B:55:0x00ee, B:57:0x00f2), top: B:168:0x00c6 }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ee A[Catch: all -> 0x00eb, TryCatch #9 {all -> 0x00eb, blocks: (B:45:0x00c6, B:47:0x00cc, B:50:0x00e5, B:55:0x00ee, B:57:0x00f2), top: B:168:0x00c6 }] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0125 A[Catch: all -> 0x0131, TryCatch #0 {all -> 0x0131, blocks: (B:67:0x011e, B:69:0x0125, B:71:0x0129, B:73:0x012d, B:76:0x0134, B:78:0x0138, B:80:0x013c, B:82:0x0140, B:83:0x0141, B:84:0x0146, B:85:0x0147, B:86:0x014e, B:87:0x014f, B:88:0x0156, B:89:0x0157), top: B:155:0x011e }] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0157 A[Catch: all -> 0x0131, TRY_LEAVE, TryCatch #0 {all -> 0x0131, blocks: (B:67:0x011e, B:69:0x0125, B:71:0x0129, B:73:0x012d, B:76:0x0134, B:78:0x0138, B:80:0x013c, B:82:0x0140, B:83:0x0141, B:84:0x0146, B:85:0x0147, B:86:0x014e, B:87:0x014f, B:88:0x0156, B:89:0x0157), top: B:155:0x011e }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(rf0 rf0Var, ContinuationImpl continuationImpl) {
        qf0 qf0Var;
        th3 th3VarA;
        TimeoutCancellationException timeoutCancellationException;
        th3 th3Var;
        Activity activity;
        th3 th3Var2;
        rf0 rf0Var2;
        th3 th3Var3;
        th3 th3VarA2;
        TimeoutCancellationException timeoutCancellationException2;
        th3 th3Var4;
        Activity activity2;
        th3 th3Var5;
        rf0 rf0Var3;
        th3 th3Var6;
        b.a1 a1Var;
        th3 th3Var7;
        b.a1 a1Var2;
        th3 th3Var8;
        rf0Var.getClass();
        if (continuationImpl instanceof qf0) {
            qf0Var = (qf0) continuationImpl;
            int i5 = qf0Var.f8625g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qf0Var.f8625g = i5 - Integer.MIN_VALUE;
            } else {
                qf0Var = new qf0(rf0Var, continuationImpl);
            }
        }
        qf0 qf0Var2 = qf0Var;
        Object obj = qf0Var2.f8623e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (qf0Var2.f8625g) {
            case 0:
                ResultKt.b(obj);
                kz2 kz2Var = rf0Var.f9153c;
                wv0 wv0Var = wv0.CUI_NAME_DEBUG_MENU_CREATIVE_PREVIEW;
                mi3 mi3Var = rf0Var.o;
                EmptyList emptyList = EmptyList.f71733a;
                if (ji3.b().f4777a == null) {
                    th3VarA2 = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                    try {
                        Activity activityB = rf0Var.f9155e.b();
                        if (activityB == null) {
                            zi3.a(6, "No Activity context available for starting in app preview.", null);
                            rf0Var.f9161k.set(false);
                            Unit unit = Unit.f71706a;
                            th3VarA2.close();
                            return unit;
                        }
                        qf0Var2.f8619a = rf0Var;
                        qf0Var2.f8620b = th3VarA2;
                        qf0Var2.f8621c = th3VarA2;
                        qf0Var2.f8622d = activityB;
                        qf0Var2.f8625g = 1;
                        Object objA = rf0Var.a(qf0Var2);
                        if (objA != coroutineSingletons) {
                            activity2 = activityB;
                            th3Var5 = th3VarA2;
                            obj = objA;
                            rf0Var3 = rf0Var;
                            th3Var6 = th3Var5;
                            try {
                                a1Var = (b.a1) obj;
                                if (a1Var instanceof pu0) {
                                    if (a1Var instanceof xu0) {
                                        String str = (String) ((xu0) a1Var).f11834b;
                                        qf0Var2.f8619a = th3Var5;
                                        qf0Var2.f8620b = th3Var6;
                                        qf0Var2.f8621c = null;
                                        qf0Var2.f8622d = null;
                                        qf0Var2.f8625g = 3;
                                        break;
                                    }
                                    th3Var7 = th3Var5;
                                } else {
                                    qf0Var2.f8619a = th3Var5;
                                    qf0Var2.f8620b = th3Var6;
                                    qf0Var2.f8621c = null;
                                    qf0Var2.f8622d = null;
                                    qf0Var2.f8625g = 2;
                                    rf0Var3.getClass();
                                    Object objA2 = a(rf0Var3, (String) null, activity2, false, (ContinuationImpl) qf0Var2, 10);
                                    if (objA2 != coroutineSingletons) {
                                        objA2 = Unit.f71706a;
                                    }
                                    if (objA2 == coroutineSingletons) {
                                    }
                                    th3Var7 = th3Var5;
                                }
                                Unit unit2 = Unit.f71706a;
                                CloseableKt.a(th3Var6, null);
                                return Unit.f71706a;
                            } catch (Throwable th2) {
                                th3VarA2 = th3Var6;
                                timeoutCancellationException2 = th2;
                                th3Var4 = th3Var5;
                                try {
                                    th3Var4.b(timeoutCancellationException2);
                                    if (!(timeoutCancellationException2 instanceof b.a4)) {
                                    }
                                } finally {
                                }
                            }
                        }
                    } catch (Throwable th3) {
                        timeoutCancellationException2 = th3;
                        th3Var4 = th3VarA2;
                        th3Var4.b(timeoutCancellationException2);
                        if (!(timeoutCancellationException2 instanceof b.a4)) {
                        }
                    }
                } else {
                    th3VarA = ji3.a(wv0Var, emptyList, true);
                    try {
                        Activity activityB2 = rf0Var.f9155e.b();
                        if (activityB2 == null) {
                            zi3.a(6, "No Activity context available for starting in app preview.", null);
                            rf0Var.f9161k.set(false);
                            Unit unit3 = Unit.f71706a;
                            th3VarA.close();
                            return unit3;
                        }
                        qf0Var2.f8619a = rf0Var;
                        qf0Var2.f8620b = th3VarA;
                        qf0Var2.f8621c = th3VarA;
                        qf0Var2.f8622d = activityB2;
                        qf0Var2.f8625g = 4;
                        Object objA3 = rf0Var.a(qf0Var2);
                        if (objA3 != coroutineSingletons) {
                            activity = activityB2;
                            obj = objA3;
                            th3Var2 = th3VarA;
                            rf0Var2 = rf0Var;
                            th3Var3 = th3Var2;
                            try {
                                a1Var2 = (b.a1) obj;
                                if (a1Var2 instanceof pu0) {
                                    if (a1Var2 instanceof xu0) {
                                        String str2 = (String) ((xu0) a1Var2).f11834b;
                                        qf0Var2.f8619a = th3Var2;
                                        qf0Var2.f8620b = th3Var3;
                                        qf0Var2.f8621c = null;
                                        qf0Var2.f8622d = null;
                                        qf0Var2.f8625g = 6;
                                        break;
                                    }
                                    th3Var8 = th3Var2;
                                } else {
                                    qf0Var2.f8619a = th3Var2;
                                    qf0Var2.f8620b = th3Var3;
                                    qf0Var2.f8621c = null;
                                    qf0Var2.f8622d = null;
                                    qf0Var2.f8625g = 5;
                                    rf0Var2.getClass();
                                    Object objA4 = a(rf0Var2, (String) null, activity, false, (ContinuationImpl) qf0Var2, 10);
                                    if (objA4 != coroutineSingletons) {
                                        objA4 = Unit.f71706a;
                                    }
                                    if (objA4 == coroutineSingletons) {
                                    }
                                    th3Var8 = th3Var2;
                                }
                                Unit unit4 = Unit.f71706a;
                                CloseableKt.a(th3Var3, null);
                                return Unit.f71706a;
                            } catch (Throwable th4) {
                                th3VarA = th3Var3;
                                timeoutCancellationException = th4;
                                th3Var = th3Var2;
                                try {
                                    th3Var.b(timeoutCancellationException);
                                    if (!(timeoutCancellationException instanceof b.a4)) {
                                    }
                                } finally {
                                    try {
                                        throw th;
                                    } finally {
                                    }
                                }
                            }
                        }
                    } catch (Throwable th5) {
                        timeoutCancellationException = th5;
                        th3Var = th3VarA;
                        th3Var.b(timeoutCancellationException);
                        if (!(timeoutCancellationException instanceof b.a4)) {
                            throw timeoutCancellationException;
                        }
                        if (!(timeoutCancellationException instanceof TimeoutCancellationException) && !(timeoutCancellationException instanceof CancellationException)) {
                            th3Var.a(timeoutCancellationException);
                        }
                        if (timeoutCancellationException instanceof TimeoutCancellationException) {
                            throw new lw0(timeoutCancellationException);
                        }
                        if (timeoutCancellationException instanceof CancellationException) {
                            throw new du0(timeoutCancellationException);
                        }
                        if (timeoutCancellationException instanceof dv0) {
                            throw timeoutCancellationException;
                        }
                        throw new iu0(timeoutCancellationException);
                    }
                }
                return coroutineSingletons;
            case 1:
                Activity activity3 = qf0Var2.f8622d;
                th3VarA2 = qf0Var2.f8621c;
                th3Var4 = qf0Var2.f8620b;
                rf0 rf0Var4 = (rf0) qf0Var2.f8619a;
                try {
                    ResultKt.b(obj);
                    activity2 = activity3;
                    th3Var6 = th3VarA2;
                    rf0Var3 = rf0Var4;
                    th3Var5 = th3Var4;
                    a1Var = (b.a1) obj;
                    if (a1Var instanceof pu0) {
                    }
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(th3Var6, null);
                    return Unit.f71706a;
                } catch (Throwable th6) {
                    timeoutCancellationException2 = th6;
                    th3Var4.b(timeoutCancellationException2);
                    if (!(timeoutCancellationException2 instanceof b.a4)) {
                    }
                }
                break;
            case 2:
            case 3:
                th3Var6 = qf0Var2.f8620b;
                th3Var7 = (th3) qf0Var2.f8619a;
                try {
                    ResultKt.b(obj);
                    Unit unit222 = Unit.f71706a;
                    CloseableKt.a(th3Var6, null);
                    return Unit.f71706a;
                } catch (Throwable th7) {
                    th3Var4 = th3Var7;
                    th3VarA2 = th3Var6;
                    timeoutCancellationException2 = th7;
                    th3Var4.b(timeoutCancellationException2);
                    if (!(timeoutCancellationException2 instanceof b.a4)) {
                        throw timeoutCancellationException2;
                    }
                    if (!(timeoutCancellationException2 instanceof TimeoutCancellationException) && !(timeoutCancellationException2 instanceof CancellationException)) {
                        th3Var4.a(timeoutCancellationException2);
                    }
                    if (timeoutCancellationException2 instanceof TimeoutCancellationException) {
                        throw new lw0(timeoutCancellationException2);
                    }
                    if (timeoutCancellationException2 instanceof CancellationException) {
                        throw new du0(timeoutCancellationException2);
                    }
                    if (timeoutCancellationException2 instanceof dv0) {
                        throw timeoutCancellationException2;
                    }
                    throw new iu0(timeoutCancellationException2);
                }
            case 4:
                Activity activity4 = qf0Var2.f8622d;
                th3VarA = qf0Var2.f8621c;
                th3Var = qf0Var2.f8620b;
                rf0 rf0Var5 = (rf0) qf0Var2.f8619a;
                try {
                    ResultKt.b(obj);
                    th3Var2 = th3Var;
                    activity = activity4;
                    th3Var3 = th3VarA;
                    rf0Var2 = rf0Var5;
                    a1Var2 = (b.a1) obj;
                    if (a1Var2 instanceof pu0) {
                    }
                    Unit unit42 = Unit.f71706a;
                    CloseableKt.a(th3Var3, null);
                    return Unit.f71706a;
                } catch (Throwable th8) {
                    timeoutCancellationException = th8;
                    th3Var.b(timeoutCancellationException);
                    if (!(timeoutCancellationException instanceof b.a4)) {
                    }
                }
                break;
            case 5:
            case 6:
                th3Var3 = qf0Var2.f8620b;
                th3Var8 = (th3) qf0Var2.f8619a;
                try {
                    ResultKt.b(obj);
                    Unit unit422 = Unit.f71706a;
                    CloseableKt.a(th3Var3, null);
                    return Unit.f71706a;
                } catch (Throwable th9) {
                    th3Var = th3Var8;
                    th3VarA = th3Var3;
                    timeoutCancellationException = th9;
                    th3Var.b(timeoutCancellationException);
                    if (!(timeoutCancellationException instanceof b.a4)) {
                    }
                }
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    public static final void b$1(rf0 this$0) {
        Intrinsics.g(this$0, "this$0");
        t70.j0 j0Var = this$0.f9152b;
        df0 df0Var = new df0(this$0, null, 1);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(df0Var, null), 2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        xe0 xe0Var;
        rw0 rw0Var;
        rf0 rf0Var;
        rf0 rf0Var2;
        if (continuationImpl instanceof xe0) {
            xe0Var = (xe0) continuationImpl;
            int i5 = xe0Var.f11705f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xe0Var.f11705f = i5 - Integer.MIN_VALUE;
            } else {
                xe0Var = new xe0(this, continuationImpl);
            }
        }
        Object objA = xe0Var.f11703d;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = xe0Var.f11705f;
        if (i11 == 0) {
            ResultKt.b(objA);
            jr0 jr0Var = this.f9156f;
            jr0Var.getClass();
            String str = (String) jr0Var.a("gads:drx_debug:debug_device_linking_url", "https://www.google.com/dfp/linkDevice", u.a$7);
            xe0Var.f11700a = this;
            rw0Var = this.f9157g;
            xe0Var.f11701b = rw0Var;
            xe0Var.f11702c = this;
            xe0Var.f11705f = 1;
            String str2 = this.f9162l;
            w81 w81Var = this.f9160j;
            w81Var.getClass();
            objA = w81.a(w81Var, str, str2, null, xe0Var);
            if (objA == obj) {
                return obj;
            }
            rf0Var = this;
            rf0Var2 = rf0Var;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            rf0Var2 = xe0Var.f11702c;
            rw0Var = xe0Var.f11701b;
            rf0Var = xe0Var.f11700a;
            ResultKt.b(objA);
        }
        rf0Var2.getClass();
        Intent intent = new Intent("android.intent.action.VIEW", (Uri) objA);
        Bundle bundle = new Bundle();
        bundle.putBinder("android.support.customtabs.extra.SESSION", null);
        String str3 = rf0Var2.f9164p;
        if (str3 == null) {
            Intrinsics.m("packageName");
            throw null;
        }
        bundle.putString("com.android.browser.application_id", str3);
        intent.putExtras(bundle);
        rw0Var.a(intent);
        rf0Var.f9161k.set(false);
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:117:0x021d A[Catch: all -> 0x0229, TryCatch #6 {all -> 0x0229, blocks: (B:115:0x0216, B:117:0x021d, B:119:0x0221, B:121:0x0225, B:124:0x022c, B:126:0x0230, B:128:0x0234, B:130:0x0238, B:131:0x0239, B:132:0x023e, B:133:0x023f, B:134:0x0246, B:135:0x0247, B:136:0x024e, B:137:0x024f), top: B:153:0x0216 }] */
    /* JADX WARN: Removed duplicated region for block: B:137:0x024f A[Catch: all -> 0x0229, TRY_LEAVE, TryCatch #6 {all -> 0x0229, blocks: (B:115:0x0216, B:117:0x021d, B:119:0x0221, B:121:0x0225, B:124:0x022c, B:126:0x0230, B:128:0x0234, B:130:0x0238, B:131:0x0239, B:132:0x023e, B:133:0x023f, B:134:0x0246, B:135:0x0247, B:136:0x024e, B:137:0x024f), top: B:153:0x0216 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x012a A[Catch: all -> 0x0136, TryCatch #4 {all -> 0x0136, blocks: (B:56:0x0123, B:58:0x012a, B:60:0x012e, B:62:0x0132, B:65:0x0139, B:67:0x013d, B:69:0x0141, B:71:0x0145, B:72:0x0146, B:73:0x014b, B:74:0x014c, B:75:0x0153, B:76:0x0154, B:77:0x015b, B:78:0x015c), top: B:150:0x0123 }] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x015c A[Catch: all -> 0x0136, TRY_LEAVE, TryCatch #4 {all -> 0x0136, blocks: (B:56:0x0123, B:58:0x012a, B:60:0x012e, B:62:0x0132, B:65:0x0139, B:67:0x013d, B:69:0x0141, B:71:0x0145, B:72:0x0146, B:73:0x014b, B:74:0x014c, B:75:0x0153, B:76:0x0154, B:77:0x015b, B:78:0x015c), top: B:150:0x0123 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ContinuationImpl continuationImpl) {
        ye0 ye0Var;
        th3 th3VarA;
        th3 th3Var;
        rf0 rf0Var;
        CoroutineContext coroutineContext;
        af0 af0Var;
        th3 th3VarA2;
        th3 th3Var2;
        rf0 rf0Var2;
        CoroutineContext coroutineContext2;
        af0 af0Var2;
        if (continuationImpl instanceof ye0) {
            ye0Var = (ye0) continuationImpl;
            int i5 = ye0Var.f12013f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ye0Var.f12013f = i5 - Integer.MIN_VALUE;
            } else {
                ye0Var = new ye0(this, continuationImpl);
            }
        }
        Object obj = ye0Var.f12011d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ye0Var.f12013f;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            kz2 kz2Var = this.f9153c;
            wv0 wv0Var = wv0.CUI_NAME_DEBUG_MENU_AD_INFO;
            mi3 mi3Var = this.o;
            EmptyList emptyList = EmptyList.f71733a;
            if (ji3.b().f4777a == null) {
                th3VarA2 = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    Activity activityB = this.f9155e.b();
                    if (activityB == null) {
                        zi3.a(6, "No Activity context available for displaying the ad info dialog.", null);
                        this.f9161k.set(false);
                        Unit unit = Unit.f71706a;
                        th3VarA2.close();
                        return unit;
                    }
                    String str = this.f9163m;
                    if (str == null) {
                        str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    final String strA = a(str, false);
                    String str2 = this.f9163m;
                    if (str2 == null) {
                        str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    try {
                        AlertDialog.Builder negativeButton = new AlertDialog.Builder(activityB, 16974374).setMessage(a(str2, true)).setTitle("Ad Information").setOnDismissListener(new b.v9(this, 2)).setNegativeButton("Close", new t9(this, 3));
                        if (this.f9156f.E0()) {
                            final int i12 = 0;
                            negativeButton.setNeutralButton("Copy", new DialogInterface.OnClickListener(this) { // from class: b.y9

                                /* renamed from: b, reason: collision with root package name */
                                public final /* synthetic */ rf0 f16030b;

                                {
                                    this.f16030b = this;
                                }

                                @Override // android.content.DialogInterface.OnClickListener
                                public final void onClick(DialogInterface dialogInterface, int i13) {
                                    switch (i12) {
                                        case 0:
                                            rf0.a(this.f16030b, strA);
                                            break;
                                        default:
                                            rf0.b(this.f16030b, strA);
                                            break;
                                    }
                                }
                            });
                        }
                        final int i13 = 1;
                        negativeButton.setPositiveButton("Share", new DialogInterface.OnClickListener(this) { // from class: b.y9

                            /* renamed from: b, reason: collision with root package name */
                            public final /* synthetic */ rf0 f16030b;

                            {
                                this.f16030b = this;
                            }

                            @Override // android.content.DialogInterface.OnClickListener
                            public final void onClick(DialogInterface dialogInterface, int i132) {
                                switch (i13) {
                                    case 0:
                                        rf0.a(this.f16030b, strA);
                                        break;
                                    default:
                                        rf0.b(this.f16030b, strA);
                                        break;
                                }
                            }
                        });
                        coroutineContext2 = this.f9151a;
                        af0Var2 = new af0(negativeButton, continuation, 0);
                        ye0Var.f12008a = this;
                        ye0Var.f12009b = th3VarA2;
                        ye0Var.f12010c = th3VarA2;
                        ye0Var.f12013f = 1;
                    } catch (Throwable th2) {
                        th = th2;
                        rf0Var2 = this;
                        th3Var2 = th3VarA2;
                        th3 th3VarA3 = ji3.a();
                        th3VarA3.e().f1799m = false;
                        th3VarA3.a(th);
                        rf0Var2.f9161k.set(false);
                        rf0Var2.f9154d.a("Failed to show ad info dialog", th);
                        Unit unit2 = Unit.f71706a;
                        CloseableKt.a(th3Var2, null);
                        return Unit.f71706a;
                    }
                    if (m0.y(coroutineContext2, af0Var2, ye0Var) != coroutineSingletons) {
                        th3Var2 = th3VarA2;
                        Unit unit22 = Unit.f71706a;
                        CloseableKt.a(th3Var2, null);
                    }
                } catch (Throwable th3) {
                    th = th3;
                    th3Var2 = th3VarA2;
                    th3VarA2.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    Activity activityB2 = this.f9155e.b();
                    if (activityB2 == null) {
                        zi3.a(6, "No Activity context available for displaying the ad info dialog.", null);
                        this.f9161k.set(false);
                        Unit unit3 = Unit.f71706a;
                        th3VarA.close();
                        return unit3;
                    }
                    String str3 = this.f9163m;
                    if (str3 == null) {
                        str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    final String strA2 = a(str3, false);
                    String str4 = this.f9163m;
                    if (str4 == null) {
                        str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    try {
                        AlertDialog.Builder negativeButton2 = new AlertDialog.Builder(activityB2, 16974374).setMessage(a(str4, true)).setTitle("Ad Information").setOnDismissListener(new b.v9(this, 2)).setNegativeButton("Close", new t9(this, 3));
                        if (this.f9156f.E0()) {
                            final int i14 = 0;
                            negativeButton2.setNeutralButton("Copy", new DialogInterface.OnClickListener(this) { // from class: b.y9

                                /* renamed from: b, reason: collision with root package name */
                                public final /* synthetic */ rf0 f16030b;

                                {
                                    this.f16030b = this;
                                }

                                @Override // android.content.DialogInterface.OnClickListener
                                public final void onClick(DialogInterface dialogInterface, int i132) {
                                    switch (i14) {
                                        case 0:
                                            rf0.a(this.f16030b, strA2);
                                            break;
                                        default:
                                            rf0.b(this.f16030b, strA2);
                                            break;
                                    }
                                }
                            });
                        }
                        final int i15 = 1;
                        negativeButton2.setPositiveButton("Share", new DialogInterface.OnClickListener(this) { // from class: b.y9

                            /* renamed from: b, reason: collision with root package name */
                            public final /* synthetic */ rf0 f16030b;

                            {
                                this.f16030b = this;
                            }

                            @Override // android.content.DialogInterface.OnClickListener
                            public final void onClick(DialogInterface dialogInterface, int i132) {
                                switch (i15) {
                                    case 0:
                                        rf0.a(this.f16030b, strA2);
                                        break;
                                    default:
                                        rf0.b(this.f16030b, strA2);
                                        break;
                                }
                            }
                        });
                        coroutineContext = this.f9151a;
                        af0Var = new af0(negativeButton2, continuation, 0);
                        ye0Var.f12008a = this;
                        ye0Var.f12009b = th3VarA;
                        ye0Var.f12010c = th3VarA;
                        ye0Var.f12013f = 2;
                    } catch (Throwable th4) {
                        th = th4;
                        rf0Var = this;
                        th3Var = th3VarA;
                        th3 th3VarA4 = ji3.a();
                        th3VarA4.e().f1799m = false;
                        th3VarA4.a(th);
                        rf0Var.f9161k.set(false);
                        rf0Var.f9154d.a("Failed to show ad info dialog", th);
                        Unit unit4 = Unit.f71706a;
                        CloseableKt.a(th3Var, null);
                        return Unit.f71706a;
                    }
                    if (m0.y(coroutineContext, af0Var, ye0Var) != coroutineSingletons) {
                        th3Var = th3VarA;
                        Unit unit42 = Unit.f71706a;
                        CloseableKt.a(th3Var, null);
                    }
                } catch (Throwable th5) {
                    th = th5;
                    th3Var = th3VarA;
                    th3VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            th3Var2 = ye0Var.f12010c;
            th3VarA2 = ye0Var.f12009b;
            rf0Var2 = ye0Var.f12008a;
            try {
                ResultKt.b(obj);
            } catch (Throwable th6) {
                th = th6;
                try {
                    th3 th3VarA32 = ji3.a();
                    th3VarA32.e().f1799m = false;
                    th3VarA32.a(th);
                    rf0Var2.f9161k.set(false);
                    rf0Var2.f9154d.a("Failed to show ad info dialog", th);
                    Unit unit222 = Unit.f71706a;
                    CloseableKt.a(th3Var2, null);
                    return Unit.f71706a;
                } catch (Throwable th7) {
                    th = th7;
                    try {
                        th3VarA2.b(th);
                        if (!(th instanceof b.a4)) {
                            throw th;
                        }
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3VarA2.a(th);
                        }
                        if (th instanceof TimeoutCancellationException) {
                            throw new lw0(th);
                        }
                        if (th instanceof CancellationException) {
                            throw new du0(th);
                        }
                        if (th instanceof dv0) {
                            throw th;
                        }
                        throw new iu0(th);
                    } finally {
                    }
                }
            }
            Unit unit2222 = Unit.f71706a;
            CloseableKt.a(th3Var2, null);
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var = ye0Var.f12010c;
            th3VarA = ye0Var.f12009b;
            rf0Var = ye0Var.f12008a;
            try {
                ResultKt.b(obj);
            } catch (Throwable th8) {
                th = th8;
                try {
                    th3 th3VarA42 = ji3.a();
                    th3VarA42.e().f1799m = false;
                    th3VarA42.a(th);
                    rf0Var.f9161k.set(false);
                    rf0Var.f9154d.a("Failed to show ad info dialog", th);
                    Unit unit422 = Unit.f71706a;
                    CloseableKt.a(th3Var, null);
                    return Unit.f71706a;
                } catch (Throwable th9) {
                    th = th9;
                    try {
                        th3VarA.b(th);
                        if (!(th instanceof b.a4)) {
                            throw th;
                        }
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3VarA.a(th);
                        }
                        if (th instanceof TimeoutCancellationException) {
                            throw new lw0(th);
                        }
                        if (th instanceof CancellationException) {
                            throw new du0(th);
                        }
                        if (th instanceof dv0) {
                            throw th;
                        }
                        throw new iu0(th);
                    } finally {
                        try {
                            throw th;
                        } finally {
                        }
                    }
                }
            }
            Unit unit4222 = Unit.f71706a;
            CloseableKt.a(th3Var, null);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:118:0x02a8 A[Catch: all -> 0x02b4, TryCatch #12 {all -> 0x02b4, blocks: (B:116:0x02a1, B:118:0x02a8, B:120:0x02ac, B:122:0x02b0, B:125:0x02b7, B:127:0x02bb, B:129:0x02bf, B:131:0x02c3, B:132:0x02c4, B:133:0x02c9, B:134:0x02ca, B:135:0x02d1, B:136:0x02d2, B:137:0x02d9, B:138:0x02da), top: B:253:0x02a1 }] */
    /* JADX WARN: Removed duplicated region for block: B:138:0x02da A[Catch: all -> 0x02b4, TRY_LEAVE, TryCatch #12 {all -> 0x02b4, blocks: (B:116:0x02a1, B:118:0x02a8, B:120:0x02ac, B:122:0x02b0, B:125:0x02b7, B:127:0x02bb, B:129:0x02bf, B:131:0x02c3, B:132:0x02c4, B:133:0x02c9, B:134:0x02ca, B:135:0x02d1, B:136:0x02d2, B:137:0x02d9, B:138:0x02da), top: B:253:0x02a1 }] */
    /* JADX WARN: Removed duplicated region for block: B:155:0x0324 A[Catch: all -> 0x006b, TryCatch #6 {all -> 0x006b, blocks: (B:196:0x045d, B:18:0x0061, B:24:0x0075, B:164:0x0361, B:27:0x0087, B:159:0x0344, B:161:0x034c, B:169:0x036e, B:30:0x0099, B:153:0x031c, B:155:0x0324), top: B:245:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:161:0x034c A[Catch: all -> 0x006b, TryCatch #6 {all -> 0x006b, blocks: (B:196:0x045d, B:18:0x0061, B:24:0x0075, B:164:0x0361, B:27:0x0087, B:159:0x0344, B:161:0x034c, B:169:0x036e, B:30:0x0099, B:153:0x031c, B:155:0x0324), top: B:245:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:167:0x0368  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x036a  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x03b1  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x03cb  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x03d2  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x0438  */
    /* JADX WARN: Removed duplicated region for block: B:209:0x0477 A[Catch: all -> 0x0483, TryCatch #1 {all -> 0x0483, blocks: (B:207:0x0470, B:209:0x0477, B:211:0x047b, B:213:0x047f, B:216:0x0486, B:218:0x048a, B:220:0x048e, B:222:0x0492, B:223:0x0493, B:224:0x0498, B:225:0x0499, B:226:0x04a0, B:227:0x04a1, B:228:0x04a8, B:229:0x04a9), top: B:236:0x0470 }] */
    /* JADX WARN: Removed duplicated region for block: B:229:0x04a9 A[Catch: all -> 0x0483, TRY_LEAVE, TryCatch #1 {all -> 0x0483, blocks: (B:207:0x0470, B:209:0x0477, B:211:0x047b, B:213:0x047f, B:216:0x0486, B:218:0x048a, B:220:0x048e, B:222:0x0492, B:223:0x0493, B:224:0x0498, B:225:0x0499, B:226:0x04a0, B:227:0x04a1, B:228:0x04a8, B:229:0x04a9), top: B:236:0x0470 }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0159 A[Catch: all -> 0x00ce, TryCatch #10 {all -> 0x00ce, blocks: (B:107:0x028f, B:38:0x00c4, B:44:0x00d8, B:75:0x0195, B:47:0x00ea, B:70:0x0179, B:72:0x0181, B:80:0x01a1, B:50:0x00fc, B:64:0x0151, B:66:0x0159), top: B:245:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0181 A[Catch: all -> 0x00ce, TryCatch #10 {all -> 0x00ce, blocks: (B:107:0x028f, B:38:0x00c4, B:44:0x00d8, B:75:0x0195, B:47:0x00ea, B:70:0x0179, B:72:0x0181, B:80:0x01a1, B:50:0x00fc, B:64:0x0151, B:66:0x0159), top: B:245:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x019c A[PHI: r4 r9 r13 r14
      0x019c: PHI (r4v14 android.app.Activity) = (r4v10 android.app.Activity), (r4v15 android.app.Activity) binds: [B:79:0x019e, B:71:0x017f] A[DONT_GENERATE, DONT_INLINE]
      0x019c: PHI (r9v13 ads_mobile_sdk.rf0) = (r9v9 ads_mobile_sdk.rf0), (r9v16 ads_mobile_sdk.rf0) binds: [B:79:0x019e, B:71:0x017f] A[DONT_GENERATE, DONT_INLINE]
      0x019c: PHI (r13v8 java.io.Closeable) = (r13v6 java.io.Closeable), (r13v9 java.io.Closeable) binds: [B:79:0x019e, B:71:0x017f] A[DONT_GENERATE, DONT_INLINE]
      0x019c: PHI (r14v12 java.io.Closeable) = (r14v9 java.io.Closeable), (r14v13 java.io.Closeable) binds: [B:79:0x019e, B:71:0x017f] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x019e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01e3  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01fd  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0204  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x026a  */
    /* JADX WARN: Type inference failed for: r4v1, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v17, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v19 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v22, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v3, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v31, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v33 */
    /* JADX WARN: Type inference failed for: r4v36, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v6, types: [ads_mobile_sdk.th3, java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v8, types: [ads_mobile_sdk.em2, ads_mobile_sdk.th3, java.io.Closeable] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(ContinuationImpl continuationImpl) {
        bf0 bf0Var;
        Closeable closeable;
        ?? A;
        Closeable closeable2;
        ?? A2;
        Closeable closeable3;
        Activity activity;
        rf0 rf0Var;
        Closeable closeable4;
        Activity activity2;
        rf0 rf0Var2;
        rf0 rf0Var3;
        int size;
        Object objB;
        ArrayList arrayList;
        Activity activity3;
        final int i5;
        int i11;
        final int i12;
        int i13;
        Closeable closeable5;
        rf0 rf0Var4;
        final rf0 rf0Var5;
        CoroutineContext coroutineContext;
        cf0 cf0Var;
        Object obj;
        Activity activity4;
        Activity activity5;
        Object objB2;
        ArrayList arrayList2;
        final int i14;
        final int i15;
        int i16;
        int i17;
        rf0 rf0Var6;
        Closeable closeable6;
        final rf0 rf0Var7;
        CoroutineContext coroutineContext2;
        cf0 cf0Var2;
        Object obj2;
        if (continuationImpl instanceof bf0) {
            bf0Var = (bf0) continuationImpl;
            int i18 = bf0Var.f1403k;
            if ((i18 & Integer.MIN_VALUE) != 0) {
                bf0Var.f1403k = i18 - Integer.MIN_VALUE;
            } else {
                bf0Var = new bf0(this, continuationImpl);
            }
        }
        Object objA = bf0Var.f1401i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        try {
            try {
                switch (bf0Var.f1403k) {
                    case 0:
                        ResultKt.b(objA);
                        kz2 kz2Var = this.f9153c;
                        wv0 wv0Var = wv0.CUI_NAME_DEBUG_MENU_INSPECTOR_SETTINGS;
                        mi3 mi3Var = this.o;
                        EmptyList emptyList = EmptyList.f71733a;
                        if (ji3.b().f4777a == null) {
                            A = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                            try {
                                Activity activityB = this.f9155e.b();
                                if (activityB == null) {
                                    zi3.a(6, "No Activity context available for opening ad inspector settings.", null);
                                    this.f9161k.set(false);
                                    Unit unit = Unit.f71706a;
                                    A.close();
                                    return unit;
                                }
                                w81 w81Var = this.f9160j;
                                bf0Var.f1393a = this;
                                bf0Var.f1394b = A;
                                bf0Var.f1395c = A;
                                bf0Var.f1396d = activityB;
                                bf0Var.f1403k = 1;
                                w81Var.getClass();
                                Object objA2 = w81.a(w81Var, bf0Var);
                                if (objA2 != coroutineSingletons) {
                                    closeable = A;
                                    closeable4 = closeable;
                                    activity2 = activityB;
                                    objA = objA2;
                                    rf0Var2 = this;
                                    if (((Boolean) objA).booleanValue()) {
                                        w81 w81Var2 = rf0Var2.f9160j;
                                        String str = rf0Var2.f9162l;
                                        com.google.gson.r rVar = rf0Var2.n;
                                        bf0Var.f1393a = rf0Var2;
                                        bf0Var.f1394b = closeable4;
                                        bf0Var.f1395c = closeable;
                                        bf0Var.f1396d = activity2;
                                        Activity activity6 = activity2;
                                        bf0Var.f1403k = 2;
                                        w81Var2.getClass();
                                        objA = w81.a(w81Var2, str, rVar, bf0Var);
                                        if (objA != coroutineSingletons) {
                                            activity2 = activity6;
                                            if (((Boolean) objA).booleanValue()) {
                                                bf0Var.f1393a = closeable4;
                                                bf0Var.f1394b = closeable;
                                                bf0Var.f1395c = null;
                                                bf0Var.f1396d = null;
                                                bf0Var.f1403k = 3;
                                                if (rf0Var2.c(bf0Var) == coroutineSingletons) {
                                                }
                                                Unit unit2 = Unit.f71706a;
                                                CloseableKt.a(closeable, null);
                                                return unit2;
                                            }
                                            rf0Var3 = rf0Var2;
                                            ArrayList arrayList3 = new ArrayList();
                                            arrayList3.add("None");
                                            int size2 = arrayList3.size() - 1;
                                            arrayList3.add("Shake");
                                            size = arrayList3.size() - 1;
                                            arrayList3.add("Flick");
                                            int size3 = arrayList3.size() - 1;
                                            w81 w81Var3 = rf0Var3.f9160j;
                                            bf0Var.f1393a = rf0Var3;
                                            bf0Var.f1394b = closeable4;
                                            bf0Var.f1395c = closeable;
                                            bf0Var.f1396d = activity2;
                                            bf0Var.f1397e = arrayList3;
                                            bf0Var.f1398f = size2;
                                            bf0Var.f1399g = size;
                                            bf0Var.f1400h = size3;
                                            bf0Var.f1403k = 4;
                                            w81Var3.getClass();
                                            objB = w81.b(w81Var3, bf0Var);
                                            if (objB != coroutineSingletons) {
                                                arrayList = arrayList3;
                                                objA = objB;
                                                activity3 = activity2;
                                                i5 = size3;
                                                i11 = size2;
                                                i12 = size;
                                                A = closeable4;
                                                try {
                                                    i13 = r9.f15987a[c0.F(((ba1) objA).r$1())];
                                                    if (i13 != 1) {
                                                        i11 = i5;
                                                    } else if (i13 == 2) {
                                                        i11 = i12;
                                                    }
                                                    final AtomicInteger atomicInteger = new AtomicInteger(i11);
                                                    try {
                                                        AlertDialog.Builder builder = new AlertDialog.Builder(activity3, 16974374);
                                                        builder.setTitle("Setup gesture");
                                                        builder.setSingleChoiceItems((CharSequence[]) arrayList.toArray(new String[0]), i11, new b.z9(atomicInteger, 0));
                                                        builder.setOnCancelListener(new b.aa(rf0Var3, 0));
                                                        builder.setNegativeButton("Dismiss", new t9(rf0Var3, 1));
                                                        final int i19 = i11;
                                                        rf0Var5 = rf0Var3;
                                                    } catch (Throwable th2) {
                                                        th = th2;
                                                    }
                                                    try {
                                                        rf0Var3 = rf0Var5;
                                                        builder.setPositiveButton("Save", new DialogInterface.OnClickListener() { // from class: b.u9
                                                            @Override // android.content.DialogInterface.OnClickListener
                                                            public final void onClick(DialogInterface dialogInterface, int i21) {
                                                                rf0.a(this.f15999a, atomicInteger, i19, i5, i12);
                                                            }
                                                        });
                                                        coroutineContext = rf0Var3.f9151a;
                                                        cf0Var = new cf0(builder, null, 0);
                                                        bf0Var.f1393a = rf0Var3;
                                                        bf0Var.f1394b = A;
                                                        bf0Var.f1395c = closeable;
                                                        bf0Var.f1396d = null;
                                                        bf0Var.f1397e = null;
                                                        bf0Var.f1403k = 5;
                                                    } catch (Throwable th3) {
                                                        th = th3;
                                                        rf0Var3 = rf0Var5;
                                                        closeable5 = closeable;
                                                        rf0Var4 = rf0Var3;
                                                        try {
                                                            th3 th3VarA = ji3.a();
                                                            th3VarA.e().f1799m = false;
                                                            th3VarA.a(th);
                                                            rf0Var4.f9161k.set(false);
                                                            rf0Var4.f9154d.a("Failed to show inspector settings dialog", th);
                                                            obj = A;
                                                            Closeable closeable7 = closeable5;
                                                            Unit unit3 = Unit.f71706a;
                                                            CloseableKt.a(closeable7, null);
                                                            return Unit.f71706a;
                                                        } catch (Throwable th4) {
                                                            th = th4;
                                                            closeable = closeable5;
                                                            Object obj3 = A;
                                                            A = obj3;
                                                            try {
                                                                A.b(th);
                                                                if (th instanceof b.a4) {
                                                                    throw th;
                                                                }
                                                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                                                    A.a(th);
                                                                }
                                                                if (th instanceof TimeoutCancellationException) {
                                                                    throw new lw0(th);
                                                                }
                                                                if (th instanceof CancellationException) {
                                                                    throw new du0(th);
                                                                }
                                                                if (th instanceof dv0) {
                                                                    throw th;
                                                                }
                                                                throw new iu0(th);
                                                            } finally {
                                                            }
                                                        }
                                                    }
                                                    if (m0.y(coroutineContext, cf0Var, bf0Var) != coroutineSingletons) {
                                                        closeable5 = closeable;
                                                        obj = A;
                                                        Closeable closeable72 = closeable5;
                                                        Unit unit32 = Unit.f71706a;
                                                        CloseableKt.a(closeable72, null);
                                                        return Unit.f71706a;
                                                    }
                                                } catch (Throwable th5) {
                                                    th = th5;
                                                    A.b(th);
                                                    if (th instanceof b.a4) {
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        rf0Var3 = rf0Var2;
                                        ArrayList arrayList32 = new ArrayList();
                                        arrayList32.add("None");
                                        int size22 = arrayList32.size() - 1;
                                        arrayList32.add("Shake");
                                        size = arrayList32.size() - 1;
                                        arrayList32.add("Flick");
                                        int size32 = arrayList32.size() - 1;
                                        w81 w81Var32 = rf0Var3.f9160j;
                                        bf0Var.f1393a = rf0Var3;
                                        bf0Var.f1394b = closeable4;
                                        bf0Var.f1395c = closeable;
                                        bf0Var.f1396d = activity2;
                                        bf0Var.f1397e = arrayList32;
                                        bf0Var.f1398f = size22;
                                        bf0Var.f1399g = size;
                                        bf0Var.f1400h = size32;
                                        bf0Var.f1403k = 4;
                                        w81Var32.getClass();
                                        objB = w81.b(w81Var32, bf0Var);
                                        if (objB != coroutineSingletons) {
                                        }
                                    }
                                }
                            } catch (Throwable th6) {
                                th = th6;
                                closeable = A;
                                A.b(th);
                                if (th instanceof b.a4) {
                                }
                            }
                        } else {
                            A2 = ji3.a(wv0Var, emptyList, true);
                            try {
                                Activity activityB2 = this.f9155e.b();
                                if (activityB2 == null) {
                                    zi3.a(6, "No Activity context available for opening ad inspector settings.", null);
                                    this.f9161k.set(false);
                                    Unit unit4 = Unit.f71706a;
                                    A2.close();
                                    return unit4;
                                }
                                w81 w81Var4 = this.f9160j;
                                bf0Var.f1393a = this;
                                bf0Var.f1394b = A2;
                                bf0Var.f1395c = A2;
                                bf0Var.f1396d = activityB2;
                                bf0Var.f1403k = 6;
                                w81Var4.getClass();
                                Object objA3 = w81.a(w81Var4, bf0Var);
                                if (objA3 != coroutineSingletons) {
                                    closeable2 = A2;
                                    closeable3 = closeable2;
                                    activity = activityB2;
                                    objA = objA3;
                                    rf0Var = this;
                                    if (((Boolean) objA).booleanValue()) {
                                        w81 w81Var5 = rf0Var.f9160j;
                                        String str2 = rf0Var.f9162l;
                                        com.google.gson.r rVar2 = rf0Var.n;
                                        bf0Var.f1393a = rf0Var;
                                        bf0Var.f1394b = closeable3;
                                        bf0Var.f1395c = closeable2;
                                        bf0Var.f1396d = activity;
                                        Activity activity7 = activity;
                                        bf0Var.f1403k = 7;
                                        w81Var5.getClass();
                                        objA = w81.a(w81Var5, str2, rVar2, bf0Var);
                                        if (objA != coroutineSingletons) {
                                            activity5 = activity7;
                                            if (((Boolean) objA).booleanValue()) {
                                                bf0Var.f1393a = closeable3;
                                                bf0Var.f1394b = closeable2;
                                                bf0Var.f1395c = null;
                                                bf0Var.f1396d = null;
                                                bf0Var.f1403k = 8;
                                                if (rf0Var.c(bf0Var) == coroutineSingletons) {
                                                }
                                                Unit unit5 = Unit.f71706a;
                                                CloseableKt.a(closeable2, null);
                                                return unit5;
                                            }
                                            activity4 = activity5;
                                            ArrayList arrayList4 = new ArrayList();
                                            arrayList4.add("None");
                                            int size4 = arrayList4.size() - 1;
                                            arrayList4.add("Shake");
                                            int size5 = arrayList4.size() - 1;
                                            arrayList4.add("Flick");
                                            int size6 = arrayList4.size() - 1;
                                            w81 w81Var6 = rf0Var.f9160j;
                                            bf0Var.f1393a = rf0Var;
                                            bf0Var.f1394b = closeable3;
                                            bf0Var.f1395c = closeable2;
                                            bf0Var.f1396d = activity4;
                                            bf0Var.f1397e = arrayList4;
                                            bf0Var.f1398f = size4;
                                            bf0Var.f1399g = size5;
                                            bf0Var.f1400h = size6;
                                            bf0Var.f1403k = 9;
                                            w81Var6.getClass();
                                            objB2 = w81.b(w81Var6, bf0Var);
                                            if (objB2 != coroutineSingletons) {
                                                arrayList2 = arrayList4;
                                                i14 = size5;
                                                i15 = size6;
                                                objA = objB2;
                                                i16 = size4;
                                                A2 = closeable3;
                                                try {
                                                    i17 = r9.f15987a[c0.F(((ba1) objA).r$1())];
                                                    if (i17 != 1) {
                                                        i16 = i15;
                                                    } else if (i17 == 2) {
                                                        i16 = i14;
                                                    }
                                                    final AtomicInteger atomicInteger2 = new AtomicInteger(i16);
                                                    try {
                                                        AlertDialog.Builder builder2 = new AlertDialog.Builder(activity4, 16974374);
                                                        builder2.setTitle("Setup gesture");
                                                        builder2.setSingleChoiceItems((CharSequence[]) arrayList2.toArray(new String[0]), i16, new b.z9(atomicInteger2, 0));
                                                        builder2.setOnCancelListener(new b.aa(rf0Var, 0));
                                                        builder2.setNegativeButton("Dismiss", new t9(rf0Var, 1));
                                                        rf0Var7 = rf0Var;
                                                        final int i21 = i16;
                                                        try {
                                                            rf0Var = rf0Var7;
                                                            builder2.setPositiveButton("Save", new DialogInterface.OnClickListener() { // from class: b.u9
                                                                @Override // android.content.DialogInterface.OnClickListener
                                                                public final void onClick(DialogInterface dialogInterface, int i212) {
                                                                    rf0.a(this.f15999a, atomicInteger2, i21, i15, i14);
                                                                }
                                                            });
                                                            coroutineContext2 = rf0Var.f9151a;
                                                            cf0Var2 = new cf0(builder2, null, 0);
                                                            bf0Var.f1393a = rf0Var;
                                                            bf0Var.f1394b = A2;
                                                            bf0Var.f1395c = closeable2;
                                                            bf0Var.f1396d = null;
                                                            bf0Var.f1397e = null;
                                                            bf0Var.f1403k = 10;
                                                        } catch (Throwable th7) {
                                                            th = th7;
                                                            rf0Var = rf0Var7;
                                                            rf0Var6 = rf0Var;
                                                            closeable6 = closeable2;
                                                            try {
                                                                th3 th3VarA2 = ji3.a();
                                                                th3VarA2.e().f1799m = false;
                                                                th3VarA2.a(th);
                                                                rf0Var6.f9161k.set(false);
                                                                rf0Var6.f9154d.a("Failed to show inspector settings dialog", th);
                                                                obj2 = A2;
                                                                Closeable closeable8 = closeable6;
                                                                Unit unit6 = Unit.f71706a;
                                                                CloseableKt.a(closeable8, null);
                                                                return Unit.f71706a;
                                                            } catch (Throwable th8) {
                                                                th = th8;
                                                                closeable2 = closeable6;
                                                                Object obj4 = A2;
                                                                A2 = obj4;
                                                                try {
                                                                    A2.b(th);
                                                                    if (th instanceof b.a4) {
                                                                        throw th;
                                                                    }
                                                                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                                                        A2.a(th);
                                                                    }
                                                                    if (th instanceof TimeoutCancellationException) {
                                                                        throw new lw0(th);
                                                                    }
                                                                    if (th instanceof CancellationException) {
                                                                        throw new du0(th);
                                                                    }
                                                                    if (th instanceof dv0) {
                                                                        throw th;
                                                                    }
                                                                    throw new iu0(th);
                                                                } finally {
                                                                    try {
                                                                        throw th;
                                                                    } finally {
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    } catch (Throwable th9) {
                                                        th = th9;
                                                    }
                                                    if (m0.y(coroutineContext2, cf0Var2, bf0Var) != coroutineSingletons) {
                                                        closeable6 = closeable2;
                                                        obj2 = A2;
                                                        Closeable closeable82 = closeable6;
                                                        Unit unit62 = Unit.f71706a;
                                                        CloseableKt.a(closeable82, null);
                                                        return Unit.f71706a;
                                                    }
                                                } catch (Throwable th10) {
                                                    th = th10;
                                                    A2.b(th);
                                                    if (th instanceof b.a4) {
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        activity4 = activity;
                                        ArrayList arrayList42 = new ArrayList();
                                        arrayList42.add("None");
                                        int size42 = arrayList42.size() - 1;
                                        arrayList42.add("Shake");
                                        int size52 = arrayList42.size() - 1;
                                        arrayList42.add("Flick");
                                        int size62 = arrayList42.size() - 1;
                                        w81 w81Var62 = rf0Var.f9160j;
                                        bf0Var.f1393a = rf0Var;
                                        bf0Var.f1394b = closeable3;
                                        bf0Var.f1395c = closeable2;
                                        bf0Var.f1396d = activity4;
                                        bf0Var.f1397e = arrayList42;
                                        bf0Var.f1398f = size42;
                                        bf0Var.f1399g = size52;
                                        bf0Var.f1400h = size62;
                                        bf0Var.f1403k = 9;
                                        w81Var62.getClass();
                                        objB2 = w81.b(w81Var62, bf0Var);
                                        if (objB2 != coroutineSingletons) {
                                        }
                                    }
                                }
                            } catch (Throwable th11) {
                                th = th11;
                                closeable2 = A2;
                                A2.b(th);
                                if (th instanceof b.a4) {
                                }
                            }
                        }
                        return coroutineSingletons;
                    case 1:
                        activity2 = bf0Var.f1396d;
                        closeable = bf0Var.f1395c;
                        closeable4 = (th3) bf0Var.f1394b;
                        rf0Var2 = (rf0) bf0Var.f1393a;
                        ResultKt.b(objA);
                        if (((Boolean) objA).booleanValue()) {
                        }
                        break;
                    case 2:
                        activity2 = bf0Var.f1396d;
                        closeable = bf0Var.f1395c;
                        closeable4 = (th3) bf0Var.f1394b;
                        rf0Var2 = (rf0) bf0Var.f1393a;
                        ResultKt.b(objA);
                        if (((Boolean) objA).booleanValue()) {
                        }
                        return coroutineSingletons;
                    case 3:
                        closeable = bf0Var.f1394b;
                        ResultKt.b(objA);
                        Unit unit22 = Unit.f71706a;
                        CloseableKt.a(closeable, null);
                        return unit22;
                    case 4:
                        int i22 = bf0Var.f1400h;
                        size = bf0Var.f1399g;
                        i11 = bf0Var.f1398f;
                        arrayList = bf0Var.f1397e;
                        activity3 = bf0Var.f1396d;
                        closeable = bf0Var.f1395c;
                        closeable4 = (th3) bf0Var.f1394b;
                        rf0Var3 = (rf0) bf0Var.f1393a;
                        ResultKt.b(objA);
                        i5 = i22;
                        i12 = size;
                        A = closeable4;
                        i13 = r9.f15987a[c0.F(((ba1) objA).r$1())];
                        if (i13 != 1) {
                        }
                        final AtomicInteger atomicInteger3 = new AtomicInteger(i11);
                        AlertDialog.Builder builder3 = new AlertDialog.Builder(activity3, 16974374);
                        builder3.setTitle("Setup gesture");
                        builder3.setSingleChoiceItems((CharSequence[]) arrayList.toArray(new String[0]), i11, new b.z9(atomicInteger3, 0));
                        builder3.setOnCancelListener(new b.aa(rf0Var3, 0));
                        builder3.setNegativeButton("Dismiss", new t9(rf0Var3, 1));
                        final int i192 = i11;
                        rf0Var5 = rf0Var3;
                        rf0Var3 = rf0Var5;
                        builder3.setPositiveButton("Save", new DialogInterface.OnClickListener() { // from class: b.u9
                            @Override // android.content.DialogInterface.OnClickListener
                            public final void onClick(DialogInterface dialogInterface, int i212) {
                                rf0.a(this.f15999a, atomicInteger3, i192, i5, i12);
                            }
                        });
                        coroutineContext = rf0Var3.f9151a;
                        cf0Var = new cf0(builder3, null, 0);
                        bf0Var.f1393a = rf0Var3;
                        bf0Var.f1394b = A;
                        bf0Var.f1395c = closeable;
                        bf0Var.f1396d = null;
                        bf0Var.f1397e = null;
                        bf0Var.f1403k = 5;
                        if (m0.y(coroutineContext, cf0Var, bf0Var) != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    case 5:
                        closeable5 = bf0Var.f1395c;
                        A = (th3) bf0Var.f1394b;
                        rf0Var4 = (rf0) bf0Var.f1393a;
                        try {
                            ResultKt.b(objA);
                            obj = A;
                        } catch (Throwable th12) {
                            th = th12;
                            th3 th3VarA3 = ji3.a();
                            th3VarA3.e().f1799m = false;
                            th3VarA3.a(th);
                            rf0Var4.f9161k.set(false);
                            rf0Var4.f9154d.a("Failed to show inspector settings dialog", th);
                            obj = A;
                            Closeable closeable722 = closeable5;
                            Unit unit322 = Unit.f71706a;
                            CloseableKt.a(closeable722, null);
                            return Unit.f71706a;
                        }
                        Closeable closeable7222 = closeable5;
                        Unit unit3222 = Unit.f71706a;
                        CloseableKt.a(closeable7222, null);
                        return Unit.f71706a;
                    case 6:
                        activity = bf0Var.f1396d;
                        closeable2 = bf0Var.f1395c;
                        closeable3 = (th3) bf0Var.f1394b;
                        rf0Var = (rf0) bf0Var.f1393a;
                        ResultKt.b(objA);
                        if (((Boolean) objA).booleanValue()) {
                        }
                        break;
                    case 7:
                        activity5 = bf0Var.f1396d;
                        closeable2 = bf0Var.f1395c;
                        closeable3 = (th3) bf0Var.f1394b;
                        rf0Var = (rf0) bf0Var.f1393a;
                        ResultKt.b(objA);
                        if (((Boolean) objA).booleanValue()) {
                        }
                        break;
                    case 8:
                        closeable2 = bf0Var.f1394b;
                        ResultKt.b(objA);
                        Unit unit52 = Unit.f71706a;
                        CloseableKt.a(closeable2, null);
                        return unit52;
                    case 9:
                        int i23 = bf0Var.f1400h;
                        int i24 = bf0Var.f1399g;
                        i16 = bf0Var.f1398f;
                        arrayList2 = bf0Var.f1397e;
                        activity4 = bf0Var.f1396d;
                        closeable2 = bf0Var.f1395c;
                        closeable3 = (th3) bf0Var.f1394b;
                        rf0Var = (rf0) bf0Var.f1393a;
                        ResultKt.b(objA);
                        i15 = i23;
                        i14 = i24;
                        A2 = closeable3;
                        i17 = r9.f15987a[c0.F(((ba1) objA).r$1())];
                        if (i17 != 1) {
                        }
                        final AtomicInteger atomicInteger22 = new AtomicInteger(i16);
                        AlertDialog.Builder builder22 = new AlertDialog.Builder(activity4, 16974374);
                        builder22.setTitle("Setup gesture");
                        builder22.setSingleChoiceItems((CharSequence[]) arrayList2.toArray(new String[0]), i16, new b.z9(atomicInteger22, 0));
                        builder22.setOnCancelListener(new b.aa(rf0Var, 0));
                        builder22.setNegativeButton("Dismiss", new t9(rf0Var, 1));
                        rf0Var7 = rf0Var;
                        final int i212 = i16;
                        rf0Var = rf0Var7;
                        builder22.setPositiveButton("Save", new DialogInterface.OnClickListener() { // from class: b.u9
                            @Override // android.content.DialogInterface.OnClickListener
                            public final void onClick(DialogInterface dialogInterface, int i2122) {
                                rf0.a(this.f15999a, atomicInteger22, i212, i15, i14);
                            }
                        });
                        coroutineContext2 = rf0Var.f9151a;
                        cf0Var2 = new cf0(builder22, null, 0);
                        bf0Var.f1393a = rf0Var;
                        bf0Var.f1394b = A2;
                        bf0Var.f1395c = closeable2;
                        bf0Var.f1396d = null;
                        bf0Var.f1397e = null;
                        bf0Var.f1403k = 10;
                        if (m0.y(coroutineContext2, cf0Var2, bf0Var) != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    case 10:
                        closeable6 = bf0Var.f1395c;
                        A2 = (th3) bf0Var.f1394b;
                        rf0Var6 = (rf0) bf0Var.f1393a;
                        try {
                            ResultKt.b(objA);
                            obj2 = A2;
                        } catch (Throwable th13) {
                            th = th13;
                            th3 th3VarA22 = ji3.a();
                            th3VarA22.e().f1799m = false;
                            th3VarA22.a(th);
                            rf0Var6.f9161k.set(false);
                            rf0Var6.f9154d.a("Failed to show inspector settings dialog", th);
                            obj2 = A2;
                            Closeable closeable822 = closeable6;
                            Unit unit622 = Unit.f71706a;
                            CloseableKt.a(closeable822, null);
                            return Unit.f71706a;
                        }
                        Closeable closeable8222 = closeable6;
                        Unit unit6222 = Unit.f71706a;
                        CloseableKt.a(closeable8222, null);
                        return Unit.f71706a;
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (Throwable th14) {
                th = th14;
            }
        } catch (Throwable th15) {
            th = th15;
        }
    }

    public static final void b(rf0 this$0, String str) {
        Intrinsics.g(this$0, "this$0");
        boolean zE0 = this$0.f9156f.E0();
        Activity activityB = this$0.f9155e.b();
        if (activityB == null) {
            return;
        }
        if (zE0) {
            byte[] bytes = str.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            if (bytes.length > 100000) {
                Toast.makeText(activityB, "Text too large to share, please use Copy", 1).show();
                t70.j0 j0Var = this$0.f9152b;
                if0 if0Var = new if0(this$0, null, 3);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                m0.t(j0Var, context, null, new ar.a(if0Var, null), 2);
                return;
            }
        }
        this$0.f9157g.a(Intent.createChooser(new Intent("android.intent.action.SEND").setType("text/plain").putExtra("android.intent.extra.TEXT", str), "Share via"));
        if (zE0) {
            return;
        }
        this$0.f9161k.set(false);
    }

    public static final void b(rf0 this$0) {
        Intrinsics.g(this$0, "this$0");
        t70.j0 j0Var = this$0.f9152b;
        df0 df0Var = new df0(this$0, null, 0);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(df0Var, null), 2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:119:0x022d A[Catch: all -> 0x0207, TRY_LEAVE, TryCatch #6 {all -> 0x0207, blocks: (B:97:0x01f4, B:99:0x01fb, B:101:0x01ff, B:103:0x0203, B:106:0x020a, B:108:0x020e, B:110:0x0212, B:112:0x0216, B:113:0x0217, B:114:0x021c, B:115:0x021d, B:116:0x0224, B:117:0x0225, B:118:0x022c, B:119:0x022d), top: B:134:0x01f4 }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0130 A[Catch: all -> 0x0136, TryCatch #4 {all -> 0x0136, blocks: (B:45:0x012a, B:47:0x0130, B:52:0x013a), top: B:131:0x012a }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x013a A[Catch: all -> 0x0136, TRY_LEAVE, TryCatch #4 {all -> 0x0136, blocks: (B:45:0x012a, B:47:0x0130, B:52:0x013a), top: B:131:0x012a }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x01fb A[Catch: all -> 0x0207, TryCatch #6 {all -> 0x0207, blocks: (B:97:0x01f4, B:99:0x01fb, B:101:0x01ff, B:103:0x0203, B:106:0x020a, B:108:0x020e, B:110:0x0212, B:112:0x0216, B:113:0x0217, B:114:0x021c, B:115:0x021d, B:116:0x0224, B:117:0x0225, B:118:0x022c, B:119:0x022d), top: B:134:0x01f4 }] */
    /* JADX WARN: Type inference failed for: r10v2 */
    /* JADX WARN: Type inference failed for: r10v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r10v4 */
    /* JADX WARN: Type inference failed for: r14v0 */
    /* JADX WARN: Type inference failed for: r14v1, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r14v11 */
    /* JADX WARN: Type inference failed for: r14v13, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r14v2 */
    /* JADX WARN: Type inference failed for: r14v20 */
    /* JADX WARN: Type inference failed for: r14v5 */
    /* JADX WARN: Type inference failed for: r14v6 */
    /* JADX WARN: Type inference failed for: r14v7, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v0, types: [int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        se0 se0Var;
        ?? r14;
        Closeable closeableA;
        e6 e6Var;
        x11 x11Var;
        rf0 rf0Var;
        Closeable closeable;
        rf0 rf0Var2;
        th3 th3Var;
        th3 th3Var2;
        b.a1 a1Var;
        pu0 tu0Var;
        String strA;
        Closeable closeable2;
        int i5;
        th3 th3Var3;
        th3 th3Var4;
        th3 th3Var5;
        w81 w81Var;
        String str;
        String str2;
        if (continuationImpl instanceof se0) {
            se0Var = (se0) continuationImpl;
            int i11 = se0Var.f9546i;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                se0Var.f9546i = i11 - Integer.MIN_VALUE;
            } else {
                se0Var = new se0(this, continuationImpl);
            }
        }
        Object objA = se0Var.f9544g;
        Object obj = CoroutineSingletons.f71806a;
        ?? r42 = se0Var.f9546i;
        String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        try {
            if (r42 == 0) {
                ResultKt.b(objA);
                WeakHashMap weakHashMap = ji3.f5253a;
                closeableA = ji3.a(wv0.CUI_NAME_CREATIVE_PREVIEW_LINKING, EmptyList.f71733a, true);
                try {
                    e6Var = this.f9159i;
                    x11Var = new x11();
                    jr0 jr0Var = this.f9156f;
                    jr0Var.getClass();
                    String str4 = (String) jr0Var.a("gads:drx_debug:in_app_preview_status_url", "https://www.google.com/dfp/inAppPreview", u.a$7);
                    se0Var.f9538a = this;
                    se0Var.f9539b = closeableA;
                    se0Var.f9540c = closeableA;
                    se0Var.f9541d = x11Var;
                    se0Var.f9542e = e6Var;
                    se0Var.f9546i = 1;
                    String str5 = this.f9162l;
                    w81 w81Var2 = this.f9160j;
                    w81Var2.getClass();
                    objA = w81.a(w81Var2, str4, str5, null, se0Var);
                    if (objA != obj) {
                        rf0Var = this;
                        r14 = closeableA;
                    }
                    return obj;
                } catch (Throwable th2) {
                    th = th2;
                    r14 = closeableA;
                    r14.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            r14.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                }
            }
            if (r42 == 1) {
                e6Var = se0Var.f9542e;
                x11Var = (x11) se0Var.f9541d;
                closeableA = (Closeable) se0Var.f9540c;
                r14 = (th3) se0Var.f9539b;
                rf0Var = (rf0) se0Var.f9538a;
                try {
                    ResultKt.b(objA);
                    r14 = r14;
                } catch (Throwable th3) {
                    th = th3;
                    r14.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            } else if (r42 == 2) {
                closeable = (Closeable) se0Var.f9540c;
                th3Var2 = (th3) se0Var.f9539b;
                rf0Var2 = (rf0) se0Var.f9538a;
                try {
                    ResultKt.b(objA);
                    th3Var = th3Var2;
                    try {
                        a1Var = (b.a1) objA;
                        if (a1Var instanceof pu0) {
                            Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                            try {
                                ww2 ww2Var = ((a21) ((xu0) a1Var).f11834b).f812d;
                                if (ww2Var != null) {
                                    com.google.gson.r rVar = (com.google.gson.r) new Gson().fromJson(ww2.a(ww2Var), com.google.gson.r.class);
                                    rf0Var2.f9158h.f11738g.set(d62.a(rVar, "gct", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
                                    strA = d62.a(rVar, "status", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                    ?? r102 = (strA.equals("0") || strA.equals("2")) ? 1 : 0;
                                    w81 w81Var3 = rf0Var2.f9160j;
                                    se0Var.f9538a = rf0Var2;
                                    se0Var.f9539b = th3Var;
                                    se0Var.f9540c = closeable;
                                    se0Var.f9541d = strA;
                                    se0Var.f9543f = r102;
                                    se0Var.f9546i = 3;
                                    w81Var3.getClass();
                                    if (w81.a(w81Var3, (boolean) r102, se0Var) != obj) {
                                        closeable2 = closeable;
                                        i5 = r102;
                                        th3Var5 = th3Var;
                                        w81Var = rf0Var2.f9160j;
                                        if (i5 != 0) {
                                            str3 = str2;
                                        }
                                        se0Var.f9538a = th3Var5;
                                        se0Var.f9539b = closeable2;
                                        se0Var.f9540c = strA;
                                        se0Var.f9541d = null;
                                        se0Var.f9546i = 4;
                                        w81Var.getClass();
                                        if (w81.a(w81Var, str3, se0Var) != obj) {
                                        }
                                    }
                                    return obj;
                                }
                                tu0Var = new tu0("Null response body when fetching creative preview token", wd1.f11213a);
                            } catch (Throwable th4) {
                                th = th4;
                                th3Var3 = th3Var;
                                th3Var4 = th3Var3;
                                th3Var2 = th3Var4;
                                tu0Var = new qu0(th, null, null, 6);
                                zi3.a(tu0Var, false);
                                CloseableKt.a(closeable, null);
                                return tu0Var;
                            }
                        } else {
                            tu0Var = (pu0) a1Var;
                        }
                        th3Var2 = th3Var;
                        zi3.a(tu0Var, false);
                        CloseableKt.a(closeable, null);
                        return tu0Var;
                    } catch (Throwable th5) {
                        th = th5;
                        th3Var2 = th3Var;
                        closeableA = closeable;
                        r14 = th3Var2;
                        try {
                            r14.b(th);
                            if (th instanceof b.a4) {
                            }
                        } finally {
                        }
                    }
                } catch (Throwable th6) {
                    th = th6;
                    closeableA = closeable;
                    r14 = th3Var2;
                    r14.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            } else {
                if (r42 == 3) {
                    i5 = se0Var.f9543f;
                    String str6 = (String) se0Var.f9541d;
                    closeable2 = (Closeable) se0Var.f9540c;
                    th3 th3Var6 = (th3) se0Var.f9539b;
                    rf0Var2 = (rf0) se0Var.f9538a;
                    try {
                        ResultKt.b(objA);
                        strA = str6;
                        th3Var5 = th3Var6;
                    } catch (Throwable th7) {
                        th = th7;
                        closeable = closeable2;
                        th3Var4 = th3Var6;
                    }
                    try {
                        w81Var = rf0Var2.f9160j;
                        if (i5 != 0 && (str2 = rf0Var2.f9162l) != null) {
                            str3 = str2;
                        }
                        se0Var.f9538a = th3Var5;
                        se0Var.f9539b = closeable2;
                        se0Var.f9540c = strA;
                        se0Var.f9541d = null;
                        se0Var.f9546i = 4;
                        w81Var.getClass();
                        if (w81.a(w81Var, str3, se0Var) != obj) {
                            str = strA;
                            closeable = closeable2;
                            xu0 xu0Var = new xu0(str);
                            CloseableKt.a(closeable, null);
                            return xu0Var;
                        }
                        return obj;
                    } catch (Throwable th8) {
                        th = th8;
                        closeable = closeable2;
                        th3Var3 = th3Var5;
                        th3Var4 = th3Var3;
                        th3Var2 = th3Var4;
                        tu0Var = new qu0(th, null, null, 6);
                        zi3.a(tu0Var, false);
                        CloseableKt.a(closeable, null);
                        return tu0Var;
                    }
                }
                if (r42 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                str = (String) se0Var.f9540c;
                closeable = se0Var.f9539b;
                th3Var4 = (th3) se0Var.f9538a;
                try {
                    ResultKt.b(objA);
                    xu0 xu0Var2 = new xu0(str);
                    CloseableKt.a(closeable, null);
                    return xu0Var2;
                } catch (Throwable th9) {
                    th = th9;
                }
                th3Var2 = th3Var4;
                tu0Var = new qu0(th, null, null, 6);
                zi3.a(tu0Var, false);
                CloseableKt.a(closeable, null);
                return tu0Var;
            }
            String string = ((Uri) objA).toString();
            Intrinsics.f(string, "toString(...)");
            x11Var.b(string);
            y11 y11VarA = x11Var.a();
            jr0 jr0Var2 = rf0Var.f9156f;
            jr0Var2.getClass();
            Duration.Companion companion = Duration.f72038b;
            Duration duration = new Duration(((Duration) jr0Var2.a("gads:drx_debug:timeout_ms", new Duration(DurationKt.g(5, DurationUnit.f72046e)), u.a$1)).f72041a);
            se0Var.f9538a = rf0Var;
            se0Var.f9539b = r14;
            se0Var.f9540c = closeableA;
            se0Var.f9541d = null;
            se0Var.f9542e = null;
            se0Var.f9546i = 2;
            objA = e6.a(e6Var, y11VarA, duration, se0Var, 28);
            if (objA != obj) {
                closeable = closeableA;
                rf0Var2 = rf0Var;
                th3Var = r14;
                a1Var = (b.a1) objA;
                if (a1Var instanceof pu0) {
                }
                th3Var2 = th3Var;
                zi3.a(tu0Var, false);
                CloseableKt.a(closeable, null);
                return tu0Var;
            }
            return obj;
        } catch (Throwable th10) {
            th = th10;
            r14 = se0Var;
            closeableA = r42;
        }
    }

    public final String a(String str, boolean z11) {
        if (str.length() != 0) {
            Uri uriBuild = new Uri.Builder().encodedQuery(b.u4.i("\\+", str, "%20")).build();
            Intrinsics.d(uriBuild);
            String string = r70.k.u1(b70.g.f1(this.f9157g.d(uriBuild).entrySet(), "\n\n", null, null, 0, new x0(this, z11), 30)).toString();
            if (!r70.k.U0(string)) {
                return string;
            }
        }
        return "No debug information";
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x007f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0080  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Activity activity, String str, qf0 qf0Var) {
        rf0 rf0Var;
        Activity activity2;
        qf0 qf0Var2;
        Object objA;
        CoroutineSingletons coroutineSingletons;
        switch (str.hashCode()) {
            case 48:
                rf0Var = this;
                activity2 = activity;
                qf0Var2 = qf0Var;
                if (str.equals("0")) {
                    Object objA2 = a(this, "The device is successfully linked for creative preview.", activity2, false, (ContinuationImpl) qf0Var2, 1);
                    CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                    if (objA2 != coroutineSingletons2) {
                        objA2 = Unit.f71706a;
                    }
                    return objA2 == coroutineSingletons2 ? objA2 : Unit.f71706a;
                }
                String strSubstring = str.substring(0, Math.min(50, str.length()));
                Intrinsics.f(strSubstring, "substring(...)");
                zi3.a(6, "Invalid creative preview status: ".concat(strSubstring), null);
                objA = a(rf0Var, (String) null, activity2, false, (ContinuationImpl) qf0Var2, 10);
                coroutineSingletons = CoroutineSingletons.f71806a;
                if (objA != coroutineSingletons) {
                    objA = Unit.f71706a;
                }
                return objA == coroutineSingletons ? objA : Unit.f71706a;
            case 49:
                rf0Var = this;
                activity2 = activity;
                qf0Var2 = qf0Var;
                if (str.equals("1")) {
                    Object objC = c(qf0Var2);
                    return objC == CoroutineSingletons.f71806a ? objC : Unit.f71706a;
                }
                String strSubstring2 = str.substring(0, Math.min(50, str.length()));
                Intrinsics.f(strSubstring2, "substring(...)");
                zi3.a(6, "Invalid creative preview status: ".concat(strSubstring2), null);
                objA = a(rf0Var, (String) null, activity2, false, (ContinuationImpl) qf0Var2, 10);
                coroutineSingletons = CoroutineSingletons.f71806a;
                if (objA != coroutineSingletons) {
                }
                if (objA == coroutineSingletons) {
                }
                break;
            case 50:
                if (str.equals("2")) {
                    Object objA3 = a(this, "There was no creative pushed from DFP to the device.", activity, true, (ContinuationImpl) qf0Var, 1);
                    CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                    if (objA3 != coroutineSingletons3) {
                        objA3 = Unit.f71706a;
                    }
                    return objA3 == coroutineSingletons3 ? objA3 : Unit.f71706a;
                }
            default:
                rf0Var = this;
                activity2 = activity;
                qf0Var2 = qf0Var;
                String strSubstring22 = str.substring(0, Math.min(50, str.length()));
                Intrinsics.f(strSubstring22, "substring(...)");
                zi3.a(6, "Invalid creative preview status: ".concat(strSubstring22), null);
                objA = a(rf0Var, (String) null, activity2, false, (ContinuationImpl) qf0Var2, 10);
                coroutineSingletons = CoroutineSingletons.f71806a;
                if (objA != coroutineSingletons) {
                }
                if (objA == coroutineSingletons) {
                }
                break;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:111:0x019b A[Catch: all -> 0x01a7, TryCatch #4 {all -> 0x01a7, blocks: (B:109:0x0194, B:111:0x019b, B:113:0x019f, B:115:0x01a3, B:118:0x01aa, B:120:0x01ae, B:122:0x01b2, B:124:0x01b6, B:125:0x01b7, B:126:0x01bc, B:127:0x01bd, B:128:0x01c4, B:129:0x01c5, B:130:0x01cc, B:131:0x01cd), top: B:142:0x0194 }] */
    /* JADX WARN: Removed duplicated region for block: B:131:0x01cd A[Catch: all -> 0x01a7, TRY_LEAVE, TryCatch #4 {all -> 0x01a7, blocks: (B:109:0x0194, B:111:0x019b, B:113:0x019f, B:115:0x01a3, B:118:0x01aa, B:120:0x01ae, B:122:0x01b2, B:124:0x01b6, B:125:0x01b7, B:126:0x01bc, B:127:0x01bd, B:128:0x01c4, B:129:0x01c5, B:130:0x01cc, B:131:0x01cd), top: B:142:0x0194 }] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00f5 A[Catch: all -> 0x0101, TryCatch #0 {all -> 0x0101, blocks: (B:55:0x00ee, B:57:0x00f5, B:59:0x00f9, B:61:0x00fd, B:64:0x0104, B:66:0x0108, B:68:0x010c, B:70:0x0110, B:71:0x0111, B:72:0x0116, B:73:0x0117, B:74:0x011e, B:75:0x011f, B:76:0x0126, B:77:0x0127), top: B:136:0x00ee }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0127 A[Catch: all -> 0x0101, TRY_LEAVE, TryCatch #0 {all -> 0x0101, blocks: (B:55:0x00ee, B:57:0x00f5, B:59:0x00f9, B:61:0x00fd, B:64:0x0104, B:66:0x0108, B:68:0x010c, B:70:0x0110, B:71:0x0111, B:72:0x0116, B:73:0x0117, B:74:0x011e, B:75:0x011f, B:76:0x0126, B:77:0x0127), top: B:136:0x00ee }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r1v17, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v9, types: [ads_mobile_sdk.th3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(rf0 rf0Var, String str, String str2, com.google.gson.r rVar, mi3 mi3Var, ContinuationImpl continuationImpl) {
        ve0 ve0Var;
        th3 th3VarA;
        th3 th3Var;
        th3 th3Var2;
        em2 em2VarA;
        em2 em2Var;
        em2 em2Var2;
        em2 em2Var3;
        rf0 rf0Var2 = rf0Var;
        if (continuationImpl instanceof ve0) {
            ve0Var = (ve0) continuationImpl;
            int i5 = ve0Var.f10761f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ve0Var.f10761f = i5 - Integer.MIN_VALUE;
            } else {
                ve0Var = new ve0(rf0Var2, continuationImpl);
            }
        }
        Object obj = ve0Var.f10759d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ve0Var.f10761f;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (rf0Var2.f9161k.getAndSet(true)) {
                return Unit.f71706a;
            }
            rf0Var2.f9162l = str;
            rf0Var2.f9163m = str2;
            rf0Var2.n = rVar;
            rf0Var2.o = mi3Var;
            kz2 kz2Var = rf0Var2.f9153c;
            wv0 wv0Var = wv0.CUI_NAME_DEBUG_MENU;
            EmptyList emptyList = EmptyList.f71733a;
            if (ji3.b().f4777a == null) {
                em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    Activity activityB = rf0Var2.f9155e.b();
                    if (activityB == null) {
                        mu0.c("Can not display debug menu without an Activity context.", null);
                        zi3.a(6, "No Activity context available for displaying the debug menu.", null);
                        rf0Var2.f9161k.set(false);
                        Unit unit = Unit.f71706a;
                        em2VarA.close();
                        return unit;
                    }
                    String packageName = activityB.getPackageName();
                    Intrinsics.f(packageName, "getPackageName(...)");
                    rf0Var2.f9164p = packageName;
                    try {
                        ve0Var.f10756a = rf0Var2;
                        ve0Var.f10757b = em2VarA;
                        ve0Var.f10758c = em2VarA;
                        ve0Var.f10761f = 1;
                    } catch (Throwable th2) {
                        th = th2;
                        em2Var2 = em2VarA;
                        rf0Var2.f9161k.set(false);
                        th3 th3VarA2 = ji3.a();
                        th3VarA2.e().f1799m = false;
                        th3VarA2.a(th);
                        rf0Var2.f9154d.a("Failed to show debug menu dialog", th);
                        em2Var = em2VarA;
                        em2Var3 = em2Var2;
                        em2VarA = em2Var3;
                        Unit unit2 = Unit.f71706a;
                        CloseableKt.a(em2Var, null);
                        return Unit.f71706a;
                    }
                    if (rf0Var2.a(activityB, ve0Var) != coroutineSingletons) {
                        em2 em2Var4 = em2VarA;
                        em2Var3 = em2Var4;
                        em2Var = em2Var4;
                        em2VarA = em2Var3;
                        Unit unit22 = Unit.f71706a;
                        CloseableKt.a(em2Var, null);
                        return Unit.f71706a;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    em2Var = em2VarA;
                    em2VarA.b(th);
                    if (!(th instanceof b.a4)) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            em2VarA.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    Activity activityB2 = rf0Var2.f9155e.b();
                    if (activityB2 == null) {
                        mu0.c("Can not display debug menu without an Activity context.", null);
                        zi3.a(6, "No Activity context available for displaying the debug menu.", null);
                        rf0Var2.f9161k.set(false);
                        Unit unit3 = Unit.f71706a;
                        th3VarA.close();
                        return unit3;
                    }
                    String packageName2 = activityB2.getPackageName();
                    Intrinsics.f(packageName2, "getPackageName(...)");
                    rf0Var2.f9164p = packageName2;
                    try {
                        ve0Var.f10756a = rf0Var2;
                        ve0Var.f10757b = th3VarA;
                        ve0Var.f10758c = th3VarA;
                        ve0Var.f10761f = 2;
                    } catch (Throwable th4) {
                        th = th4;
                        th3Var2 = th3VarA;
                        rf0Var2.f9161k.set(false);
                        th3 th3VarA3 = ji3.a();
                        th3VarA3.e().f1799m = false;
                        th3VarA3.a(th);
                        rf0Var2.f9154d.a("Failed to show debug menu dialog", th);
                        th3Var = th3VarA;
                        th3VarA = th3Var2;
                        Unit unit4 = Unit.f71706a;
                        CloseableKt.a(th3Var, null);
                        return Unit.f71706a;
                    }
                    if (rf0Var2.a(activityB2, ve0Var) != coroutineSingletons) {
                        th3Var = th3VarA;
                        th3Var2 = th3Var;
                        th3VarA = th3Var2;
                        Unit unit42 = Unit.f71706a;
                        CloseableKt.a(th3Var, null);
                        return Unit.f71706a;
                    }
                } catch (Throwable th5) {
                    th = th5;
                    th3Var = th3VarA;
                    th3VarA.b(th);
                    if (!(th instanceof b.a4)) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3VarA.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ?? r12 = ve0Var.f10758c;
            ?? r42 = ve0Var.f10757b;
            rf0 rf0Var3 = ve0Var.f10756a;
            try {
                try {
                    ResultKt.b(obj);
                    em2Var = r12;
                    em2Var3 = r42;
                } catch (Throwable th6) {
                    th = th6;
                    em2VarA = r12;
                    rf0Var2 = rf0Var3;
                    em2Var2 = r42;
                    try {
                        rf0Var2.f9161k.set(false);
                        th3 th3VarA22 = ji3.a();
                        th3VarA22.e().f1799m = false;
                        th3VarA22.a(th);
                        rf0Var2.f9154d.a("Failed to show debug menu dialog", th);
                        em2Var = em2VarA;
                        em2Var3 = em2Var2;
                        em2VarA = em2Var3;
                        Unit unit222 = Unit.f71706a;
                        CloseableKt.a(em2Var, null);
                        return Unit.f71706a;
                    } catch (Throwable th7) {
                        th = th7;
                        em2Var = em2VarA;
                        em2VarA = em2Var2;
                        try {
                            em2VarA.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        } finally {
                        }
                    }
                }
                Unit unit2222 = Unit.f71706a;
                CloseableKt.a(em2Var, null);
                return Unit.f71706a;
            } catch (Throwable th8) {
                th = th8;
                em2VarA.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
            em2VarA = em2Var3;
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var = ve0Var.f10758c;
            th3Var2 = ve0Var.f10757b;
            rf0 rf0Var4 = ve0Var.f10756a;
            try {
                try {
                    ResultKt.b(obj);
                } catch (Throwable th9) {
                    th = th9;
                    th3VarA = th3Var;
                    rf0Var2 = rf0Var4;
                    try {
                        rf0Var2.f9161k.set(false);
                        th3 th3VarA32 = ji3.a();
                        th3VarA32.e().f1799m = false;
                        th3VarA32.a(th);
                        rf0Var2.f9154d.a("Failed to show debug menu dialog", th);
                        th3Var = th3VarA;
                        th3VarA = th3Var2;
                        Unit unit422 = Unit.f71706a;
                        CloseableKt.a(th3Var, null);
                        return Unit.f71706a;
                    } catch (Throwable th10) {
                        th = th10;
                        th3Var = th3VarA;
                        th3VarA = th3Var2;
                        try {
                            th3VarA.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        } finally {
                            try {
                                throw th;
                            } finally {
                            }
                        }
                    }
                }
                Unit unit4222 = Unit.f71706a;
                CloseableKt.a(th3Var, null);
                return Unit.f71706a;
            } catch (Throwable th11) {
                th = th11;
                th3VarA.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
            th3VarA = th3Var2;
        }
    }

    public static final void a(rf0 this$0, String str) {
        Intrinsics.g(this$0, "this$0");
        Activity activityB = this$0.f9155e.b();
        if (activityB != null) {
            ClipboardManager clipboardManager = (ClipboardManager) activityB.getSystemService(ClipboardManager.class);
            if (clipboardManager == null) {
                Toast.makeText(activityB, "Copy failed, unable to access clipboard", 0).show();
            } else {
                try {
                    clipboardManager.setPrimaryClip(ClipData.newPlainText("Ad Information", str));
                    Toast.makeText(activityB, "Copied to clipboard", 0).show();
                } catch (Throwable unused) {
                    Toast.makeText(activityB, "Copy failed, possibly due to size", 1).show();
                }
            }
        }
        t70.j0 j0Var = this$0.f9152b;
        df0 df0Var = new df0(this$0, null, 4);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(df0Var, null), 2);
    }

    public static final void a(rf0 this$0, AtomicInteger atomicInteger, int i5, int i11, int i12) {
        Intrinsics.g(this$0, "this$0");
        t70.j0 j0Var = this$0.f9152b;
        ff0 ff0Var = new ff0(atomicInteger, i5, i11, this$0, i12, null);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(ff0Var, null), 2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x0163, code lost:
    
        if (t70.m0.y(r4, r5, r2) == r3) goto L40;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Activity activity, ContinuationImpl continuationImpl) {
        gf0 gf0Var;
        final int size;
        String str;
        String str2;
        final int i5;
        ArrayList arrayList;
        final Ref.IntRef intRef;
        final Ref.IntRef intRef2;
        final int i11;
        Activity activity2;
        final rf0 rf0Var;
        if (continuationImpl instanceof gf0) {
            gf0Var = (gf0) continuationImpl;
            int i12 = gf0Var.f3839k;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                gf0Var.f3839k = i12 - Integer.MIN_VALUE;
            } else {
                gf0Var = new gf0(this, continuationImpl);
            }
        }
        Object obj = gf0Var.f3837i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = gf0Var.f3839k;
        Continuation continuation = null;
        if (i13 == 0) {
            ResultKt.b(obj);
            Activity activityB = activity == null ? this.f9155e.b() : activity;
            if (activityB == null) {
                zi3.a(6, "No Activity context available for displaying the debug menu.", null);
                this.f9161k.set(false);
                return Unit.f71706a;
            }
            ArrayList arrayList2 = new ArrayList();
            arrayList2.add("Ad information");
            size = arrayList2.size() - 1;
            xj xjVar = this.f9158h;
            Object obj2 = xjVar.f11738g.get();
            Intrinsics.f(obj2, "get(...)");
            if (r70.k.U0((CharSequence) obj2)) {
                str = "Creative preview";
            } else {
                str = "Creative preview (enabled)";
            }
            arrayList2.add(str);
            int size2 = arrayList2.size() - 1;
            if (xjVar.f11739h.get()) {
                str2 = "Troubleshooting (enabled)";
            } else {
                str2 = "Troubleshooting";
            }
            arrayList2.add(str2);
            int size3 = arrayList2.size() - 1;
            Ref.IntRef intRef3 = new Ref.IntRef();
            intRef3.f71861a = -1;
            Ref.IntRef intRef4 = new Ref.IntRef();
            intRef4.f71861a = -1;
            gf0Var.f3829a = this;
            gf0Var.f3830b = activityB;
            gf0Var.f3831c = arrayList2;
            gf0Var.f3832d = intRef3;
            gf0Var.f3833e = intRef4;
            gf0Var.f3834f = size;
            gf0Var.f3835g = size2;
            gf0Var.f3836h = size3;
            gf0Var.f3839k = 1;
            w81 w81Var = this.f9160j;
            w81Var.getClass();
            Object objC = w81.c(w81Var, gf0Var);
            if (objC != coroutineSingletons) {
                i5 = size3;
                arrayList = arrayList2;
                intRef = intRef3;
                intRef2 = intRef4;
                i11 = size2;
                activity2 = activityB;
                obj = objC;
                rf0Var = this;
            }
            return coroutineSingletons;
        }
        if (i13 != 1) {
            if (i13 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        int i14 = gf0Var.f3836h;
        int i15 = gf0Var.f3835g;
        size = gf0Var.f3834f;
        Ref.IntRef intRef5 = gf0Var.f3833e;
        Ref.IntRef intRef6 = gf0Var.f3832d;
        ArrayList arrayList3 = gf0Var.f3831c;
        Activity activity3 = gf0Var.f3830b;
        rf0 rf0Var2 = gf0Var.f3829a;
        ResultKt.b(obj);
        i5 = i14;
        arrayList = arrayList3;
        intRef = intRef6;
        intRef2 = intRef5;
        rf0Var = rf0Var2;
        i11 = i15;
        activity2 = activity3;
        if (!((Boolean) obj).booleanValue()) {
            arrayList.add("Open ad inspector");
            intRef.f71861a = arrayList.size() - 1;
            arrayList.add("Ad inspector settings");
            intRef2.f71861a = arrayList.size() - 1;
        }
        AlertDialog.Builder items = new AlertDialog.Builder(activity2, 16974374).setTitle("Select a debug mode").setNegativeButton("Close", new t9(rf0Var, 0)).setOnDismissListener(new b.v9(rf0Var, 1)).setItems((CharSequence[]) arrayList.toArray(new String[0]), new DialogInterface.OnClickListener() { // from class: b.w9
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i16) {
                rf0 this$0 = rf0Var;
                Intrinsics.g(this$0, "this$0");
                t70.j0 j0Var = this$0.f9152b;
                Ref.IntRef adInspectorSettingsIndex = intRef2;
                Intrinsics.g(adInspectorSettingsIndex, "$adInspectorSettingsIndex");
                Ref.IntRef openAdInspectorIndex = intRef;
                Intrinsics.g(openAdInspectorIndex, "$openAdInspectorIndex");
                int i17 = 0;
                Continuation continuation2 = null;
                if (i16 == size) {
                    zi3.a(j0Var, new if0(this$0, continuation2, i17));
                    return;
                }
                if (i16 == adInspectorSettingsIndex.f71861a) {
                    zi3.a(j0Var, new if0(this$0, continuation2, 1));
                    return;
                }
                int i18 = openAdInspectorIndex.f71861a;
                int i19 = 2;
                if (i16 == i18) {
                    zi3.a(j0Var, new if0(this$0, continuation2, i19));
                    return;
                }
                if (i16 == i11) {
                    zi3.a(j0Var, new df0(this$0, null, 2));
                    return;
                }
                if (i16 == i5) {
                    zi3.a(j0Var, new df0(this$0, null, 3));
                    return;
                }
                cz.b bVar = mu0.f7335a;
                mu0.c("Unsupported debug menu option: " + i16, null);
                this$0.f9161k.set(false);
            }
        });
        CoroutineContext coroutineContext = rf0Var.f9151a;
        af0 af0Var = new af0(items, continuation, 1);
        gf0Var.f3829a = null;
        gf0Var.f3830b = null;
        gf0Var.f3831c = null;
        gf0Var.f3832d = null;
        gf0Var.f3833e = null;
        gf0Var.f3839k = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, String str, Activity activity, boolean z12, ContinuationImpl continuationImpl) {
        nf0 nf0Var;
        rf0 rf0Var;
        String str2;
        if (continuationImpl instanceof nf0) {
            nf0Var = (nf0) continuationImpl;
            int i5 = nf0Var.f7552d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nf0Var.f7552d = i5 - Integer.MIN_VALUE;
            } else {
                nf0Var = new nf0(this, continuationImpl);
            }
        }
        Object obj = nf0Var.f7550b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nf0Var.f7552d;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (activity == null) {
                try {
                    activity = this.f9155e.b();
                } catch (Throwable th2) {
                    th = th2;
                    rf0Var = this;
                    th3 th3VarA = ji3.a();
                    th3VarA.e().f1799m = false;
                    th3VarA.a(th);
                    rf0Var.f9161k.set(false);
                    rf0Var.f9154d.a("Failed to show status dialog", th);
                    return Unit.f71706a;
                }
            }
            Continuation continuation = null;
            if (activity == null) {
                zi3.a(6, "No Activity context available for showing status dialog.", null);
                this.f9161k.set(false);
                return Unit.f71706a;
            }
            AlertDialog.Builder builder = new AlertDialog.Builder(activity, 16974374);
            if (z11) {
                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40331e;
            } else {
                str2 = "Info";
            }
            builder.setTitle(str2);
            builder.setMessage(str);
            builder.setOnDismissListener(new b.v9(this, 0));
            if (z12) {
                builder.setNegativeButton("Dismiss", (DialogInterface.OnClickListener) null);
                builder.setPositiveButton("Learn More", new t9(this, 2));
            } else {
                builder.setNeutralButton("Dismiss", (DialogInterface.OnClickListener) null);
            }
            CoroutineContext coroutineContext = this.f9151a;
            cf0 cf0Var = new cf0(builder, continuation, 1);
            nf0Var.f7549a = this;
            nf0Var.f7552d = 1;
            if (m0.y(coroutineContext, cf0Var, nf0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            rf0Var = nf0Var.f7549a;
            try {
                ResultKt.b(obj);
            } catch (Throwable th3) {
                th = th3;
                th3 th3VarA2 = ji3.a();
                th3VarA2.e().f1799m = false;
                th3VarA2.a(th);
                rf0Var.f9161k.set(false);
                rf0Var.f9154d.a("Failed to show status dialog", th);
                return Unit.f71706a;
            }
        }
        return Unit.f71706a;
    }

    public static /* synthetic */ Object a(rf0 rf0Var, String str, Activity activity, boolean z11, ContinuationImpl continuationImpl, int i5) {
        ContinuationImpl continuationImpl2;
        boolean z12;
        boolean z13 = (i5 & 1) == 0;
        if ((i5 & 2) != 0) {
            str = "In-app preview failed to load because of a system error. Please try again later.";
        }
        if ((i5 & 4) != 0) {
            activity = null;
        }
        if ((i5 & 8) != 0) {
            continuationImpl2 = continuationImpl;
            z12 = false;
        } else {
            continuationImpl2 = continuationImpl;
            z12 = z11;
        }
        return rf0Var.a(z13, str, activity, z12, continuationImpl2);
    }
}
