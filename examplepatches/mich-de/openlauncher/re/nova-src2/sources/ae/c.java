package ae;

import ads_mobile_sdk.a63;
import ads_mobile_sdk.ew1;
import ads_mobile_sdk.fm2;
import ads_mobile_sdk.mu0;
import ads_mobile_sdk.ot0;
import ads_mobile_sdk.qm1;
import ads_mobile_sdk.v6;
import ads_mobile_sdk.w53;
import ads_mobile_sdk.wo3;
import ads_mobile_sdk.y53;
import ads_mobile_sdk.yo3;
import android.app.job.JobParameters;
import android.content.ComponentName;
import android.content.Context;
import android.net.Uri;
import android.os.Process;
import android.util.Log;
import android.util.LongSparseArray;
import android.view.InputEvent;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import androidx.fragment.app.h0;
import androidx.fragment.app.strictmode.Violation;
import androidx.recyclerview.widget.u1;
import androidx.room.x;
import androidx.work.impl.workers.ConstraintTrackingWorker;
import b.d0;
import b.z7;
import c3.c1;
import cl.m1;
import com.android.launcher3.util.ComponentKey;
import com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.bridge.AiWebBridge;
import com.instabridge.ai.chat.ui.v2.AiChatViewV2;
import com.moloco.sdk.internal.unity_bridge.MolocoUnityShowCallback;
import com.moloco.sdk.internal.unity_bridge.internal.a;
import com.moloco.sdk.publisher.MolocoAdError;
import com.stripe.hcaptcha.HCaptchaException;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.preferences.SettingsActivityLegacy;
import com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragmentBase;
import com.tiktok.appevents.TTAppEventLogger;
import com.vungle.ads.BidTokenCallback;
import com.vungle.ads.internal.y2;
import fa.p0;
import fi.t;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Callable;
import kotlin.Lazy;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import o7.n;
import o9.z1;
import ya.p;
import ya.r;

/* loaded from: classes3.dex */
public final /* synthetic */ class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12740a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f12741b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f12742c;

    public /* synthetic */ c(int i5, Object obj, Object obj2) {
        this.f12740a = i5;
        this.f12741b = obj;
        this.f12742c = obj2;
    }

    /* JADX WARN: Type inference failed for: r1v21, types: [java.lang.Object, kotlin.Lazy] */
    @Override // java.lang.Runnable
    public final void run() throws SecurityException, IllegalArgumentException {
        boolean z11;
        int i5 = 2;
        switch (this.f12740a) {
            case 0:
                JobInfoSchedulerService jobInfoSchedulerService = (JobInfoSchedulerService) this.f12741b;
                JobParameters jobParameters = (JobParameters) this.f12742c;
                int i11 = JobInfoSchedulerService.f31433a;
                jobInfoSchedulerService.jobFinished(jobParameters, false);
                return;
            case 1:
                Runnable command = (Runnable) this.f12741b;
                x this$0 = (x) this.f12742c;
                Intrinsics.g(command, "$command");
                Intrinsics.g(this$0, "this$0");
                try {
                    command.run();
                    return;
                } finally {
                    this$0.a();
                }
            case 2:
                a63 a63Var = (a63) this.f12741b;
                InputEvent inputEvent = (InputEvent) this.f12742c;
                a63Var.getClass();
                try {
                    a63Var.b(inputEvent);
                    if (z11) {
                        return;
                    } else {
                        return;
                    }
                } finally {
                    if (inputEvent instanceof MotionEvent) {
                        ((MotionEvent) inputEvent).recycle();
                    }
                }
            case 3:
                ew1 this$02 = (ew1) this.f12741b;
                String str = (String) this.f12742c;
                Intrinsics.g(this$02, "this$0");
                synchronized (this$02) {
                    try {
                        if (this$02.f3070d.get()) {
                            return;
                        }
                        FrameLayout frameLayout = this$02.f3069c;
                        Context context = frameLayout.getContext();
                        if (context != null) {
                            FrameLayout frameLayout2 = new FrameLayout(context);
                            frameLayout2.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
                            d0.m(context, frameLayout2, str);
                            frameLayout.addView(frameLayout2);
                        }
                        Unit unit = Unit.f71706a;
                        return;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            case 4:
                Integer num = (Integer) this.f12741b;
                Runnable runnable = (Runnable) this.f12742c;
                mu0.a(new c1(num, i5));
                Process.setThreadPriority(num.intValue());
                runnable.run();
                return;
            case 5:
                ot0 ot0Var = (ot0) this.f12741b;
                ot0Var.f7997c.execute(new z7(ot0Var, (m1) this.f12742c, 1, 0L, 1));
                return;
            case 6:
                w53 w53Var = (w53) this.f12741b;
                fm2 fm2Var = (fm2) this.f12742c;
                yo3 yo3Var = w53Var.f11048a;
                yo3Var.getClass();
                v6 v6Var = yo3Var.f12232c;
                long jCurrentTimeMillis = System.currentTimeMillis();
                try {
                    yo3Var.a(yo3Var.a(fm2Var));
                    ((qm1) v6Var.f10600a).a(3000, System.currentTimeMillis() - jCurrentTimeMillis, null, null);
                    new t().t(Boolean.TRUE);
                    w53Var.f11055h.set("2.960507516." + fm2Var.f3431a.r());
                    return;
                } catch (wo3 e3) {
                    v6Var.a(e3.f11353a, System.currentTimeMillis() - jCurrentTimeMillis, e3);
                    throw new y53(2);
                } catch (Exception e11) {
                    v6Var.a(4010, System.currentTimeMillis() - jCurrentTimeMillis, e11);
                    throw new y53(2);
                }
            case 7:
                ConstraintTrackingWorker constraintTrackingWorker = (ConstraintTrackingWorker) this.f12741b;
                ListenableFuture listenableFuture = (ListenableFuture) this.f12742c;
                synchronized (constraintTrackingWorker.f15353g) {
                    try {
                        if (constraintTrackingWorker.f15354h) {
                            z7.j future = constraintTrackingWorker.f15355i;
                            Intrinsics.f(future, "future");
                            String str2 = b8.a.f17604a;
                            future.j(new n());
                        } else {
                            constraintTrackingWorker.f15355i.l(listenableFuture);
                        }
                        Unit unit2 = Unit.f71706a;
                    } catch (Throwable th3) {
                        throw th3;
                    }
                }
                return;
            case 8:
                ba.e eVar = (ba.e) this.f12741b;
                Object obj = this.f12742c;
                if (!eVar.f17748g) {
                    eVar.f17745d.accept(obj);
                }
                if (eVar.f17747f) {
                    return;
                }
                eVar.f17747f = true;
                eVar.f17746e.run();
                return;
            case 9:
                y2.a((BidTokenCallback) this.f12741b, (Lazy) this.f12742c);
                return;
            case 10:
                Callable callable = (Callable) this.f12741b;
                cm.f fVar = (cm.f) this.f12742c;
                try {
                    fVar.E(callable.call());
                    return;
                } catch (Exception e12) {
                    fVar.I(e12);
                    return;
                }
            case 11:
                ((UserMetadata) this.f12741b).lambda$updateRolloutsState$1((List) this.f12742c);
                return;
            case 12:
                AiWebBridge.sendToWeb$lambda$0((AiWebBridge) this.f12741b, (String) this.f12742c);
                return;
            case 13:
                AiChatViewV2.submitWithoutAnimation$lambda$10((AiChatViewV2) this.f12741b, (u1) this.f12742c);
                return;
            case 14:
                AiChatViewV2.executeSuggestionToolCall$lambda$27$lambda$26((AiChatViewV2) this.f12741b, (String) this.f12742c);
                return;
            case 15:
                com.moloco.sdk.internal.unity_bridge.internal.a.a((MolocoUnityShowCallback) this.f12741b, (String) this.f12742c);
                return;
            case 16:
                a.b.a((MolocoUnityShowCallback) this.f12741b, (MolocoAdError) this.f12742c);
                return;
            case 17:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.t.a((View) this.f12741b, (Function0) this.f12742c);
                return;
            case 18:
                ((TTAppEventLogger) this.f12741b).lambda$flushWithReason$6((TTAppEventLogger.FlushReason) this.f12742c);
                return;
            case 19:
                ((cx.d) this.f12741b).f48411b.b(new HCaptchaException((yw.c) this.f12742c));
                return;
            case 20:
                ((cx.d) this.f12741b).f48411b.onSuccess((String) this.f12742c);
                return;
            case 21:
                d10.c cVar = (d10.c) this.f12741b;
                p0 p0Var = (p0) this.f12742c;
                NovaLauncher novaLauncher = (NovaLauncher) cVar.f71306t;
                int[] iArr = {novaLauncher.O.f80106f};
                r rVar = new r();
                p pVar = rVar.f97209a;
                pVar.g(1);
                System.arraycopy(iArr, 0, pVar.f97193a, pVar.f97194b, 1);
                int i12 = pVar.f97194b + 1;
                pVar.f97194b = i12;
                Arrays.sort(pVar.f97193a, 0, i12);
                novaLauncher.f80007h0 = rVar;
                p0Var.f54463i = false;
                p0Var.f54462h.clear();
                p0Var.f54456b.d();
                return;
            case 22:
                vh.a.s((d2.d) this.f12741b, (LongSparseArray) this.f12742c);
                return;
            case 23:
                SettingsActivityLegacy settingsActivityLegacy = (SettingsActivityLegacy) this.f12741b;
                NovaSettingsFragmentBase novaSettingsFragmentBase = (NovaSettingsFragmentBase) this.f12742c;
                v9.d dVar = settingsActivityLegacy.f45976t;
                if (dVar != null) {
                    ((FrameLayout) dVar.f92300e).setVisibility(novaSettingsFragmentBase.getF46057c() ? 0 : 8);
                    return;
                } else {
                    Intrinsics.m("binding");
                    throw null;
                }
            case 24:
                SettingsActivityLegacy settingsActivityLegacy2 = (SettingsActivityLegacy) this.f12741b;
                h0 h0Var = (h0) this.f12742c;
                ComponentName componentName = SettingsActivityLegacy.A;
                settingsActivityLegacy2.e0(h0Var instanceof NovaSettingsFragmentBase ? (NovaSettingsFragmentBase) h0Var : null);
                return;
            case 25:
                String str3 = (String) this.f12741b;
                Violation violation = (Violation) this.f12742c;
                Intrinsics.g(violation, "$violation");
                Log.e("FragmentStrictMode", "Policy violation with PENALTY_DEATH in " + str3, violation);
                throw violation;
            case 26:
                com.vungle.ads.internal.load.c.a((com.vungle.ads.internal.load.i) this.f12741b, (com.vungle.ads.internal.model.b) this.f12742c);
                return;
            case 27:
                com.vungle.ads.internal.load.k.a((com.vungle.ads.internal.load.l) this.f12741b, (Throwable) this.f12742c);
                return;
            case 28:
                p0 p0Var2 = (p0) this.f12741b;
                ComponentKey componentKey = (ComponentKey) this.f12742c;
                p0Var2.getClass();
                p0Var2.f54455a.getContentResolver().delete(Uri.parse("content://com.teslacoilsw.launcher.settings/allapps/"), "componentName = ? AND profileId = ?", new String[]{componentKey.f21251a.flattenToShortString(), Long.toString(((ja.h) ja.h.f69294h.f95127b).d(componentKey.f21252b))});
                return;
            default:
                p0 p0Var3 = (p0) this.f12741b;
                z1 z1Var = (z1) this.f12742c;
                fa.p[] pVarArrF = p0Var3.f54456b.f();
                int length = pVarArrF.length;
                while (i < length) {
                    fa.p pVar2 = pVarArrF[i];
                    if (pVar2 != p0Var3.f54459e) {
                        z1Var.c(pVar2);
                    }
                    i++;
                }
                return;
        }
    }
}
