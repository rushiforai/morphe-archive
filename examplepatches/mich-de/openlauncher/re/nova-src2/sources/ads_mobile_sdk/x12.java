package ads_mobile_sdk;

import android.content.Context;
import android.graphics.Rect;
import android.media.AudioManager;
import android.os.PowerManager;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import b.o2;
import b.r5;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.optionals.OptionalsKt;

/* loaded from: classes.dex */
public final class x12 implements r5 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f11538a;

    /* renamed from: b, reason: collision with root package name */
    public final String f11539b;

    /* renamed from: c, reason: collision with root package name */
    public final String f11540c;

    /* renamed from: d, reason: collision with root package name */
    public final ri f11541d;

    /* renamed from: e, reason: collision with root package name */
    public final Optional f11542e;

    /* renamed from: f, reason: collision with root package name */
    public final o2 f11543f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f11544g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicBoolean f11545h;

    /* renamed from: i, reason: collision with root package name */
    public final w12 f11546i;

    public x12(Context context, String afmaVersion, String adId, ri appSettings, Optional optionalGmaWebView, o2 clock) {
        Intrinsics.g(context, "context");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(adId, "adId");
        Intrinsics.g(appSettings, "appSettings");
        Intrinsics.g(optionalGmaWebView, "optionalGmaWebView");
        Intrinsics.g(clock, "clock");
        this.f11538a = context;
        this.f11539b = afmaVersion;
        this.f11540c = adId;
        this.f11541d = appSettings;
        this.f11542e = optionalGmaWebView;
        this.f11543f = clock;
        this.f11544g = new AtomicBoolean(false);
        this.f11545h = new AtomicBoolean(false);
        w12 w12Var = new w12();
        w12Var.f10990a = false;
        w12Var.f10991d = 0L;
        w12Var.f10992f = null;
        this.f11546i = w12Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x00ce  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        com.google.gson.m mVar;
        float f11;
        com.google.gson.r rVar;
        tx0 tx0Var = (tx0) OptionalsKt.b(this.f11542e);
        if (tx0Var == null) {
            return Unit.f71706a;
        }
        w12 w12Var = this.f11546i;
        w12Var.getClass();
        Context context = this.f11538a;
        Intrinsics.g(context, "context");
        String afmaVersion = this.f11539b;
        Intrinsics.g(afmaVersion, "afmaVersion");
        String adId = this.f11540c;
        Intrinsics.g(adId, "adId");
        ri appSettings = this.f11541d;
        Intrinsics.g(appSettings, "appSettings");
        com.google.gson.m mVar2 = new com.google.gson.m();
        PowerManager powerManager = (PowerManager) context.getSystemService(PowerManager.class);
        qo3 qo3Var = w12Var.f10992f;
        if (qo3Var == null) {
            rVar = new com.google.gson.r();
            mVar = mVar2;
        } else {
            Rect rect = qo3Var.f8772k;
            Rect rect2 = qo3Var.f8770i;
            Rect rect3 = qo3Var.f8768g;
            Rect rect4 = qo3Var.f8765d;
            Rect rect5 = qo3Var.f8767f;
            com.google.gson.r rVar2 = new com.google.gson.r();
            rVar2.s("afmaVersion", afmaVersion);
            rVar2.p("activeViewJSON", new com.google.gson.r());
            mVar = mVar2;
            rVar2.q(Long.valueOf(w12Var.f10991d), "timestamp");
            rVar2.r("isNative", Boolean.TRUE);
            rVar2.s("adFormat", "native");
            Boolean bool = Boolean.FALSE;
            rVar2.r("isMraid", bool);
            rVar2.s("hashCode", adId);
            rVar2.r("isStopped", bool);
            rVar2.r("isPaused", bool);
            rVar2.r("isScreenOn", Boolean.valueOf(powerManager.isInteractive()));
            rVar2.r("appMuted", Boolean.valueOf(appSettings.f9193d));
            rVar2.q(Float.valueOf(appSettings.f9192c), "appVolume");
            AudioManager audioManager = (AudioManager) context.getSystemService(AudioManager.class);
            if (audioManager == null) {
                f11 = 0.0f;
                rVar2.q(Float.valueOf(f11), "deviceVolume");
                DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
                rVar2.q(Integer.valueOf(qo3Var.f8764c), "windowVisibility");
                rVar2.r("isAttachedToWindow", Boolean.valueOf(qo3Var.f8766e));
                com.google.gson.r rVar3 = new com.google.gson.r();
                rVar3.q(Integer.valueOf(rect5.top), "top");
                rVar3.q(Integer.valueOf(rect5.bottom), "bottom");
                rVar3.q(Integer.valueOf(rect5.left), "left");
                rVar3.q(Integer.valueOf(rect5.right), "right");
                Unit unit = Unit.f71706a;
                rVar2.p("viewBox", rVar3);
                com.google.gson.r rVar4 = new com.google.gson.r();
                rVar4.q(Integer.valueOf(rect4.top), "top");
                rVar4.q(Integer.valueOf(rect4.bottom), "bottom");
                rVar4.q(Integer.valueOf(rect4.left), "left");
                rVar4.q(Integer.valueOf(rect4.right), "right");
                rVar2.p("adBox", rVar4);
                com.google.gson.r rVar5 = new com.google.gson.r();
                rVar5.q(Integer.valueOf(rect3.top), "top");
                rVar5.q(Integer.valueOf(rect3.bottom), "bottom");
                rVar5.q(Integer.valueOf(rect3.left), "left");
                rVar5.q(Integer.valueOf(rect3.right), "right");
                rVar2.p("globalVisibleBox", rVar5);
                rVar2.r("globalVisibleBoxVisible", Boolean.valueOf(qo3Var.f8769h));
                com.google.gson.r rVar6 = new com.google.gson.r();
                rVar6.q(Integer.valueOf(rect2.top), "top");
                rVar6.q(Integer.valueOf(rect2.bottom), "bottom");
                rVar6.q(Integer.valueOf(rect2.left), "left");
                rVar6.q(Integer.valueOf(rect2.right), "right");
                rVar2.p("localVisibleBox", rVar6);
                rVar2.r("localVisibleBoxVisible", Boolean.valueOf(qo3Var.f8771j));
                com.google.gson.r rVar7 = new com.google.gson.r();
                rVar7.q(Integer.valueOf(rect.top), "top");
                rVar7.q(Integer.valueOf(rect.bottom), "bottom");
                rVar7.q(Integer.valueOf(rect.left), "left");
                rVar7.q(Integer.valueOf(rect.right), "right");
                rVar2.p("hitBox", rVar7);
                rVar2.q(Float.valueOf(displayMetrics.density), "screenDensity");
                rVar2.r("isVisible", Boolean.valueOf(w12Var.f10990a));
                rVar = rVar2;
            } else {
                int streamMaxVolume = audioManager.getStreamMaxVolume(3);
                int streamVolume = audioManager.getStreamVolume(3);
                if (streamMaxVolume != 0) {
                    f11 = streamVolume / streamMaxVolume;
                }
                rVar2.q(Float.valueOf(f11), "deviceVolume");
                DisplayMetrics displayMetrics2 = context.getResources().getDisplayMetrics();
                rVar2.q(Integer.valueOf(qo3Var.f8764c), "windowVisibility");
                rVar2.r("isAttachedToWindow", Boolean.valueOf(qo3Var.f8766e));
                com.google.gson.r rVar32 = new com.google.gson.r();
                rVar32.q(Integer.valueOf(rect5.top), "top");
                rVar32.q(Integer.valueOf(rect5.bottom), "bottom");
                rVar32.q(Integer.valueOf(rect5.left), "left");
                rVar32.q(Integer.valueOf(rect5.right), "right");
                Unit unit2 = Unit.f71706a;
                rVar2.p("viewBox", rVar32);
                com.google.gson.r rVar42 = new com.google.gson.r();
                rVar42.q(Integer.valueOf(rect4.top), "top");
                rVar42.q(Integer.valueOf(rect4.bottom), "bottom");
                rVar42.q(Integer.valueOf(rect4.left), "left");
                rVar42.q(Integer.valueOf(rect4.right), "right");
                rVar2.p("adBox", rVar42);
                com.google.gson.r rVar52 = new com.google.gson.r();
                rVar52.q(Integer.valueOf(rect3.top), "top");
                rVar52.q(Integer.valueOf(rect3.bottom), "bottom");
                rVar52.q(Integer.valueOf(rect3.left), "left");
                rVar52.q(Integer.valueOf(rect3.right), "right");
                rVar2.p("globalVisibleBox", rVar52);
                rVar2.r("globalVisibleBoxVisible", Boolean.valueOf(qo3Var.f8769h));
                com.google.gson.r rVar62 = new com.google.gson.r();
                rVar62.q(Integer.valueOf(rect2.top), "top");
                rVar62.q(Integer.valueOf(rect2.bottom), "bottom");
                rVar62.q(Integer.valueOf(rect2.left), "left");
                rVar62.q(Integer.valueOf(rect2.right), "right");
                rVar2.p("localVisibleBox", rVar62);
                rVar2.r("localVisibleBoxVisible", Boolean.valueOf(qo3Var.f8771j));
                com.google.gson.r rVar72 = new com.google.gson.r();
                rVar72.q(Integer.valueOf(rect.top), "top");
                rVar72.q(Integer.valueOf(rect.bottom), "bottom");
                rVar72.q(Integer.valueOf(rect.left), "left");
                rVar72.q(Integer.valueOf(rect.right), "right");
                rVar2.p("hitBox", rVar72);
                rVar2.q(Float.valueOf(displayMetrics2.density), "screenDensity");
                rVar2.r("isVisible", Boolean.valueOf(w12Var.f10990a));
                rVar = rVar2;
            }
        }
        mVar.p(rVar);
        com.google.gson.r rVar8 = new com.google.gson.r();
        rVar8.p("units", mVar);
        cz.b bVar = mu0.f7335a;
        mu0.b("Calling: AFMA_updateActiveView(" + rVar8 + ");", null);
        Object objB = tx0Var.b(rVar8, "AFMA_updateActiveView", continuation);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }

    @Override // b.r5
    public final Object b(qo3 qo3Var, Continuation continuation) {
        Object objA;
        boolean z11 = this.f11545h.get() ? false : qo3Var.f8763b;
        w12 w12Var = this.f11546i;
        w12Var.f10990a = z11;
        this.f11543f.getClass();
        w12Var.f10991d = SystemClock.elapsedRealtime();
        w12Var.f10992f = qo3Var;
        return (this.f11544g.get() && (objA = a(continuation)) == CoroutineSingletons.f71806a) ? objA : Unit.f71706a;
    }
}
