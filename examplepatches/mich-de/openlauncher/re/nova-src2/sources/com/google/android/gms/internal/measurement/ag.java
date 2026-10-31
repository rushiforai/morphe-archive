package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.android.launcher3.logging.InstanceId;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.common.util.concurrent.ListenableFuture;
import com.stripe.android.stripe3ds2.init.AppInfo;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import io.sentry.ILogger;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.net.InetAddress;
import java.net.URI;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Currency;
import java.util.EmptyStackException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicIntegerArray;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes3.dex */
public final /* synthetic */ class ag implements cl.c0, b5.q, qx.f, we.q {

    /* renamed from: a, reason: collision with root package name */
    public int f32385a;

    /* renamed from: b, reason: collision with root package name */
    public Object f32386b;

    public /* synthetic */ ag(Object obj, int i5) {
        this.f32386b = obj;
        this.f32385a = i5;
    }

    @Override // we.q
    public MediaCodecInfo a(int i5) {
        if (((MediaCodecInfo[]) this.f32386b) == null) {
            this.f32386b = new MediaCodecList(this.f32385a).getCodecInfos();
        }
        return ((MediaCodecInfo[]) this.f32386b)[i5];
    }

    @Override // we.q
    public boolean b(String str, String str2, MediaCodecInfo.CodecCapabilities codecCapabilities) {
        return codecCapabilities.isFeatureSupported(str);
    }

    @Override // we.q
    public boolean c(String str, MediaCodecInfo.CodecCapabilities codecCapabilities) {
        return codecCapabilities.isFeatureRequired(str);
    }

    @Override // cl.c0
    public /* synthetic */ ListenableFuture call() {
        return ((bn.i) this.f32386b).K(this.f32385a);
    }

    @Override // we.q
    public int d() {
        if (((MediaCodecInfo[]) this.f32386b) == null) {
            this.f32386b = new MediaCodecList(this.f32385a).getCodecInfos();
        }
        return ((MediaCodecInfo[]) this.f32386b).length;
    }

    @Override // we.q
    public boolean e() {
        return true;
    }

    public void f() {
        Drawable drawable = ((ImageView) this.f32386b).getDrawable();
        if (drawable != null) {
            r.a1.a(drawable);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object g(ContinuationImpl continuationImpl) throws Throwable {
        rv.a aVar;
        ag agVar;
        if (continuationImpl instanceof rv.a) {
            aVar = (rv.a) continuationImpl;
            int i5 = aVar.f86390w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f86390w = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new rv.a(this, continuationImpl);
            }
        }
        Object objY = aVar.f86388u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f86390w;
        if (i11 == 0) {
            ResultKt.b(objY);
            c00.d dVar = (c00.d) this.f32386b;
            aVar.f86387t = this;
            aVar.f86390w = 1;
            objY = t70.m0.y((CoroutineContext) dVar.f19045c, new iv.b(dVar, null, 22), aVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
            agVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            agVar = aVar.f86387t;
            ResultKt.b(objY);
        }
        AppInfo appInfo = (AppInfo) objY;
        return appInfo == null ? agVar.h() : appInfo;
    }

    public AppInfo h() {
        String strJ = b.c0.j("toString(...)");
        AppInfo appInfo = new AppInfo(strJ, this.f32385a);
        c00.d dVar = (c00.d) this.f32386b;
        dVar.getClass();
        dVar.q().edit().putInt("app_version", dVar.f19044b).putString("sdk_app_id", strJ).apply();
        return appInfo;
    }

    @Override // qx.f
    public void i(String str) {
        FrameLayout frameLayout = (FrameLayout) this.f32386b;
        int i5 = frameLayout.getLayoutParams().height;
        int i11 = this.f32385a;
        if (i5 != i11) {
            ViewGroup.LayoutParams layoutParams = frameLayout.getLayoutParams();
            layoutParams.height = i11;
            frameLayout.setLayoutParams(layoutParams);
        }
        frameLayout.setVisibility(0);
    }

    @Override // b5.q
    public boolean j(View view) {
        ((BottomSheetBehavior) this.f32386b).J(this.f32385a);
        return true;
    }

    public void k(AttributeSet attributeSet, int i5) {
        int resourceId;
        ImageView imageView = (ImageView) this.f32386b;
        Context context = imageView.getContext();
        int[] iArr = l.a.f72893f;
        x7.u uVarR = x7.u.r(context, attributeSet, iArr, i5);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        a5.a1.j(imageView, imageView.getContext(), iArr, attributeSet, (TypedArray) uVarR.f95209b, i5);
        try {
            Drawable drawable = imageView.getDrawable();
            if (drawable == null && (resourceId = typedArray.getResourceId(1, -1)) != -1 && (drawable = e10.z2.b0(imageView.getContext(), resourceId)) != null) {
                imageView.setImageDrawable(drawable);
            }
            if (drawable != null) {
                r.a1.a(drawable);
            }
            if (typedArray.hasValue(2)) {
                imageView.setImageTintList(uVarR.k(2));
            }
            if (typedArray.hasValue(3)) {
                imageView.setImageTintMode(r.a1.c(typedArray.getInt(3, -1), null));
            }
            uVarR.s();
        } catch (Throwable th2) {
            uVarR.s();
            throw th2;
        }
    }

    public HashMap l(Map map, ILogger iLogger) {
        HashMap map2 = new HashMap();
        for (Object obj : map.keySet()) {
            Object obj2 = map.get(obj);
            if (obj2 != null) {
                map2.put(obj.toString(), r(iLogger, obj2));
            } else {
                map2.put(obj.toString(), null);
            }
        }
        return map2;
    }

    public InstanceId m() {
        return new InstanceId(((SecureRandom) this.f32386b).nextInt(this.f32385a) + 1);
    }

    public double n() {
        int i5 = this.f32385a;
        if (i5 == -1) {
            throw new EmptyStackException();
        }
        double[] dArr = (double[]) this.f32386b;
        this.f32385a = i5 - 1;
        return dArr[i5];
    }

    public void o(double d5) {
        int i5 = this.f32385a + 1;
        double[] dArr = (double[]) this.f32386b;
        if (i5 == dArr.length) {
            double[] dArr2 = new double[((int) (dArr.length * 1.2d)) + 1];
            System.arraycopy(dArr, 0, dArr2, 0, dArr.length);
            this.f32386b = dArr2;
        }
        double[] dArr3 = (double[]) this.f32386b;
        int i11 = this.f32385a + 1;
        this.f32385a = i11;
        dArr3[i11] = d5;
    }

    public long p(ke.g gVar) {
        com.google.android.gms.internal.consent_sdk.a aVar = (com.google.android.gms.internal.consent_sdk.a) this.f32386b;
        int i5 = 0;
        gVar.d((byte[]) aVar.f31986d, 0, 1, false);
        int i11 = ((byte[]) aVar.f31986d)[0] & 255;
        if (i11 == 0) {
            return Long.MIN_VALUE;
        }
        int i12 = 128;
        int i13 = 0;
        while ((i11 & i12) == 0) {
            i12 >>= 1;
            i13++;
        }
        int i14 = i11 & (~i12);
        gVar.d((byte[]) aVar.f31986d, 1, i13, false);
        while (i5 < i13) {
            i5++;
            i14 = (((byte[]) aVar.f31986d)[i5] & 255) + (i14 << 8);
        }
        this.f32385a = i13 + 1 + this.f32385a;
        return i14;
    }

    public void q(dy.b bVar) {
        if (bVar.f49833g) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("FinitePool");
            bVar2.n("Element is already in pool: %s", bVar);
            return;
        }
        int i5 = this.f32385a;
        if (i5 < 128) {
            this.f32385a = i5 + 1;
            bVar.f49832f = (dy.b) this.f32386b;
            bVar.f49833g = true;
            this.f32386b = bVar;
        }
        bVar.f49827a = -1;
        bVar.f49828b = null;
        bVar.f49829c = null;
        bVar.f49830d = null;
        bVar.f49831e.set(false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v2, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r4v3, types: [java.util.HashMap] */
    /* JADX WARN: Type inference failed for: r4v4, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6, types: [java.util.ArrayList] */
    public Object r(ILogger iLogger, Object obj) {
        HashMap mapS;
        ?? string;
        HashSet hashSet = (HashSet) this.f32386b;
        if (obj == null) {
            return null;
        }
        if (obj instanceof Character) {
            return obj.toString();
        }
        if ((obj instanceof Number) || (obj instanceof Boolean) || (obj instanceof String)) {
            return obj;
        }
        if (obj instanceof Locale) {
            return obj.toString();
        }
        int i5 = 0;
        if (obj instanceof AtomicIntegerArray) {
            AtomicIntegerArray atomicIntegerArray = (AtomicIntegerArray) obj;
            Charset charset = io.sentry.util.a.f67825a;
            int length = atomicIntegerArray.length();
            ArrayList arrayList = new ArrayList(length);
            while (i5 < length) {
                arrayList.add(Integer.valueOf(atomicIntegerArray.get(i5)));
                i5++;
            }
            return arrayList;
        }
        if (obj instanceof AtomicBoolean) {
            return Boolean.valueOf(((AtomicBoolean) obj).get());
        }
        if (!(obj instanceof URI) && !(obj instanceof InetAddress) && !(obj instanceof UUID) && !(obj instanceof Currency)) {
            if (obj instanceof Calendar) {
                return io.sentry.util.a.a((Calendar) obj);
            }
            if (obj.getClass().isEnum()) {
                return obj.toString();
            }
            if (hashSet.contains(obj)) {
                iLogger.g(io.sentry.g3.INFO, "Cyclic reference detected. Calling toString() on object.", new Object[0]);
                return obj.toString();
            }
            hashSet.add(obj);
            try {
                if (hashSet.size() > this.f32385a) {
                    hashSet.remove(obj);
                    iLogger.g(io.sentry.g3.INFO, "Max depth exceeded. Calling toString() on object.", new Object[0]);
                    return obj.toString();
                }
                try {
                    if (obj.getClass().isArray()) {
                        Object[] objArr = (Object[]) obj;
                        string = new ArrayList();
                        int length2 = objArr.length;
                        while (i5 < length2) {
                            string.add(r(iLogger, objArr[i5]));
                            i5++;
                        }
                    } else if (obj instanceof Collection) {
                        string = new ArrayList();
                        Iterator it = ((Collection) obj).iterator();
                        while (it.hasNext()) {
                            string.add(r(iLogger, it.next()));
                        }
                    } else {
                        if (!(obj instanceof Map)) {
                            mapS = s(iLogger, obj);
                            if (mapS.isEmpty()) {
                                string = obj.toString();
                            }
                            hashSet.remove(obj);
                            return mapS;
                        }
                        string = l((Map) obj, iLogger);
                    }
                    mapS = string;
                    hashSet.remove(obj);
                    return mapS;
                } catch (Exception e3) {
                    iLogger.e(io.sentry.g3.INFO, "Not serializing object due to throwing sub-path.", e3);
                    hashSet.remove(obj);
                    return null;
                }
            } catch (Throwable th2) {
                hashSet.remove(obj);
                throw th2;
            }
        }
        return obj.toString();
    }

    public HashMap s(ILogger iLogger, Object obj) throws SecurityException {
        Field[] declaredFields = obj.getClass().getDeclaredFields();
        HashMap map = new HashMap();
        for (Field field : declaredFields) {
            if (!Modifier.isTransient(field.getModifiers()) && !Modifier.isStatic(field.getModifiers())) {
                String name = field.getName();
                try {
                    field.setAccessible(true);
                    map.put(name, r(iLogger, field.get(obj)));
                    field.setAccessible(false);
                } catch (Exception unused) {
                    iLogger.g(io.sentry.g3.INFO, b.c0.l("Cannot access field ", name, "."), new Object[0]);
                }
            }
        }
        return map;
    }

    public void t(int i5) {
        ImageView imageView = (ImageView) this.f32386b;
        if (i5 != 0) {
            Drawable drawableB0 = e10.z2.b0(imageView.getContext(), i5);
            if (drawableB0 != null) {
                r.a1.a(drawableB0);
            }
            imageView.setImageDrawable(drawableB0);
        } else {
            imageView.setImageDrawable(null);
        }
        f();
    }

    public void u(int i5) {
        String str;
        this.f32385a = i5;
        SharedPreferences.Editor editorEdit = ((SharedPreferences) this.f32386b).edit();
        if (i5 == 1) {
            str = "MARKET";
        } else if (i5 == 2) {
            str = "SELF";
        } else if (i5 == 3) {
            str = "BETA";
        } else {
            if (i5 != 4) {
                throw null;
            }
            str = "BETA_PRIVATE";
        }
        editorEdit.putString("update_method", str).apply();
    }

    public void v() {
        fa.p0 p0Var = (fa.p0) this.f32386b;
        if (p0Var.f54461g && p0Var.f54456b.i()) {
            p0Var.f54458d.a(new ab.k(this, p0Var.f54457c.f54471h, 5));
        }
    }

    @Override // qx.f
    public void y() {
    }

    public ag(int i5, boolean z11) {
        switch (i5) {
            case 8:
                this.f32386b = new com.google.android.gms.internal.consent_sdk.a(8);
                break;
            case 12:
                s60.b bVar = new s60.b();
                bVar.c(-8355712, "comment", "prolog", "cdata");
                String[] strArr = {"delimiter", "boolean", "keyword", "selector", "important", "atrule"};
                s60.a aVar = new s60.a(-3377102);
                for (int i11 = 0; i11 < 6; i11++) {
                    bVar.put(strArr[i11], aVar);
                }
                bVar.c(-5654586, "operator", "punctuation", "attr-name");
                bVar.c(-1523862, "tag", "doctype", "builtin");
                bVar.c(-9922629, "entity", "number", "symbol");
                bVar.c(-6785366, "property", "constant", "variable");
                s60.a aVar2 = new s60.a(-9795751);
                bVar.put("string", aVar2);
                bVar.put("char", aVar2);
                bVar.a(-4475848, "annotation");
                bVar.a(-5914015, "attr-value");
                bVar.a(-14124066, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                bVar.a(-14739, "function");
                bVar.a(-13221579, "regex");
                bVar.a(-14072778, "inserted");
                bVar.a(-12039606, "deleted");
                this.f32386b = bVar;
                this.f32385a = -13816531;
                break;
            case 14:
                this.f32385a = 0;
                this.f32386b = new StringBuilder();
                break;
            default:
                this.f32386b = new SecureRandom();
                this.f32385a = Math.min(Math.max(1, 1048576), 1048576);
                break;
        }
    }

    public ag(ImageView imageView) {
        this.f32385a = 0;
        this.f32386b = imageView;
    }

    public ag(SharedPreferences sharedPreferences) {
        sharedPreferences.getBoolean("check_for_updates", false);
        String string = sharedPreferences.getString("update_method", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        int iK = 1;
        if (!TextUtils.isEmpty(string)) {
            try {
                iK = x8.h.k(string);
            } catch (Exception unused) {
            }
        }
        this.f32385a = iK;
        this.f32386b = sharedPreferences;
    }

    public ag(int i5, ke... keVarArr) {
        this.f32385a = i5;
        this.f32386b = keVarArr;
    }

    public ag(fa.p0 p0Var) {
        this.f32386b = p0Var;
        this.f32385a = p0Var.f54457c.f54471h;
    }
}
