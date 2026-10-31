package com.moloco.sdk.internal.services.bidtoken;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes.dex */
public final class m implements l {

    /* renamed from: e, reason: collision with root package name */
    public static final int f37724e = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final y f37725a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final q f37726b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f37727c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final c80.a f37728d;

    @DebugMetadata(c = "com.moloco.sdk.internal.services.bidtoken.BidTokenServiceImpl", f = "BidTokenService.kt", l = {Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 53, 60}, m = "bidToken")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f37729a;

        /* renamed from: b, reason: collision with root package name */
        public Object f37730b;

        /* renamed from: c, reason: collision with root package name */
        public Object f37731c;

        /* renamed from: d, reason: collision with root package name */
        public Object f37732d;

        /* renamed from: e, reason: collision with root package name */
        public Object f37733e;

        /* renamed from: f, reason: collision with root package name */
        public /* synthetic */ Object f37734f;

        /* renamed from: h, reason: collision with root package name */
        public int f37736h;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f37734f = obj;
            this.f37736h |= Integer.MIN_VALUE;
            return m.this.a(null, this);
        }
    }

    public m(@NotNull y serverBidTokenService, @NotNull q clientBidTokenService) {
        Intrinsics.g(serverBidTokenService, "serverBidTokenService");
        Intrinsics.g(clientBidTokenService, "clientBidTokenService");
        this.f37725a = serverBidTokenService;
        this.f37726b = clientBidTokenService;
        this.f37727c = "BidTokenServiceImpl";
        this.f37728d = new c80.d();
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00ce A[Catch: all -> 0x006c, TRY_LEAVE, TryCatch #1 {all -> 0x006c, blocks: (B:21:0x0068, B:34:0x00c2, B:36:0x00ce), top: B:61:0x0068 }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00fe A[Catch: all -> 0x004d, TryCatch #2 {all -> 0x004d, blocks: (B:14:0x0044, B:40:0x00ef, B:43:0x00f6, B:45:0x00fe, B:51:0x012b, B:46:0x0110), top: B:63:0x0044 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0110 A[Catch: all -> 0x004d, TRY_LEAVE, TryCatch #2 {all -> 0x004d, blocks: (B:14:0x0044, B:40:0x00ef, B:43:0x00f6, B:45:0x00fe, B:51:0x012b, B:46:0x0110), top: B:63:0x0044 }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Override // com.moloco.sdk.internal.services.bidtoken.l
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(@NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super String> continuation) throws Throwable {
        a aVar;
        MetricsRecorder metricsRecorder2;
        Object obj;
        m mVar;
        Object obj2;
        TimerEvent timerEvent;
        Object obj3;
        MetricsRecorder metricsRecorder3;
        String strD;
        String str;
        Object objA;
        MetricsRecorder metricsRecorder4;
        m mVar2;
        String str2;
        String str3;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f37736h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f37736h = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object obj4 = aVar.f37734f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f37736h;
        String str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        try {
            if (i11 == 0) {
                ResultKt.b(obj4);
                c80.a aVar2 = this.f37728d;
                aVar.f37729a = this;
                metricsRecorder2 = metricsRecorder;
                aVar.f37730b = metricsRecorder2;
                aVar.f37731c = aVar2;
                aVar.f37736h = 1;
                c80.d dVar = (c80.d) aVar2;
                if (dVar.e(aVar) != coroutineSingletons) {
                    obj = dVar;
                    mVar = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    str2 = (String) aVar.f37733e;
                    timerEvent = (TimerEvent) aVar.f37732d;
                    obj2 = (c80.a) aVar.f37731c;
                    metricsRecorder4 = (MetricsRecorder) aVar.f37730b;
                    mVar2 = (m) aVar.f37729a;
                    try {
                        ResultKt.b(obj4);
                        objA = ((Result) obj4).f71688a;
                        int i12 = Result.f71687b;
                        if (objA instanceof Result.Failure) {
                            objA = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        str3 = (String) objA;
                        if (str3.length() != 0) {
                            MolocoLogger.error$default(MolocoLogger.INSTANCE, mVar2.f37727c, "CBT has error", null, false, 12, null);
                            str = "client";
                        } else {
                            str4 = str2 + AbstractJsonLexerKt.COLON + str3;
                            str = null;
                        }
                        mVar = mVar2;
                        metricsRecorder3 = metricsRecorder4;
                        mVar.a(timerEvent, metricsRecorder3, str);
                        ((c80.d) obj2).g(null);
                        return str4;
                    } catch (Throwable th2) {
                        th = th2;
                        obj3 = obj2;
                        ((c80.d) obj3).g(null);
                        throw th;
                    }
                }
                timerEvent = (TimerEvent) aVar.f37732d;
                obj3 = (c80.a) aVar.f37731c;
                metricsRecorder3 = (MetricsRecorder) aVar.f37730b;
                mVar = (m) aVar.f37729a;
                try {
                    ResultKt.b(obj4);
                    k kVar = (k) obj4;
                    strD = kVar.d();
                    if (strD.length() > 0) {
                        str = "server";
                        obj2 = obj3;
                        mVar.a(timerEvent, metricsRecorder3, str);
                        ((c80.d) obj2).g(null);
                        return str4;
                    }
                    String strF = kVar.f();
                    f fVarE = kVar.e();
                    q qVar = mVar.f37726b;
                    aVar.f37729a = mVar;
                    aVar.f37730b = metricsRecorder3;
                    aVar.f37731c = obj3;
                    aVar.f37732d = timerEvent;
                    aVar.f37733e = strD;
                    aVar.f37736h = 3;
                    objA = qVar.a(metricsRecorder3, strF, fVarE, aVar);
                    if (objA != coroutineSingletons) {
                        obj2 = obj3;
                        metricsRecorder4 = metricsRecorder3;
                        mVar2 = mVar;
                        str2 = strD;
                        int i122 = Result.f71687b;
                        if (objA instanceof Result.Failure) {
                        }
                        str3 = (String) objA;
                        if (str3.length() != 0) {
                        }
                        mVar = mVar2;
                        metricsRecorder3 = metricsRecorder4;
                        mVar.a(timerEvent, metricsRecorder3, str);
                        ((c80.d) obj2).g(null);
                        return str4;
                    }
                    return coroutineSingletons;
                } catch (Throwable th3) {
                    th = th3;
                    ((c80.d) obj3).g(null);
                    throw th;
                }
            }
            Object obj5 = (c80.a) aVar.f37731c;
            MetricsRecorder metricsRecorder5 = (MetricsRecorder) aVar.f37730b;
            mVar = (m) aVar.f37729a;
            ResultKt.b(obj4);
            obj = obj5;
            metricsRecorder2 = metricsRecorder5;
            TimerEvent timerEventStartTimerEvent = metricsRecorder2.startTimerEvent(com.moloco.sdk.internal.client_metrics_data.e.f36316l.c());
            y yVar = mVar.f37725a;
            aVar.f37729a = mVar;
            aVar.f37730b = metricsRecorder2;
            aVar.f37731c = obj;
            aVar.f37732d = timerEventStartTimerEvent;
            aVar.f37736h = 2;
            Object objA2 = yVar.a(metricsRecorder2, aVar);
            if (objA2 != coroutineSingletons) {
                MetricsRecorder metricsRecorder6 = metricsRecorder2;
                timerEvent = timerEventStartTimerEvent;
                obj4 = objA2;
                obj3 = obj;
                metricsRecorder3 = metricsRecorder6;
                k kVar2 = (k) obj4;
                strD = kVar2.d();
                if (strD.length() > 0) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            th = th4;
            obj2 = obj;
            obj3 = obj2;
            ((c80.d) obj3).g(null);
            throw th;
        }
    }

    public final void a(TimerEvent timerEvent, MetricsRecorder metricsRecorder, String str) {
        if (str != null) {
            CountEvent countEvent = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36280r.c());
            com.moloco.sdk.internal.client_metrics_data.d dVar = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
            CountEvent countEventWithTag = countEvent.withTag(dVar.c(), "failure");
            com.moloco.sdk.internal.client_metrics_data.d dVar2 = com.moloco.sdk.internal.client_metrics_data.d.f36294b;
            metricsRecorder.recordCountEvent(countEventWithTag.withTag(dVar2.c(), str));
            metricsRecorder.recordTimerEvent(timerEvent.withTag(dVar.c(), "failure").withTag(dVar2.c(), str));
            return;
        }
        CountEvent countEvent2 = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36280r.c());
        com.moloco.sdk.internal.client_metrics_data.d dVar3 = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
        metricsRecorder.recordCountEvent(countEvent2.withTag(dVar3.c(), "success"));
        metricsRecorder.recordTimerEvent(timerEvent.withTag(dVar3.c(), "success"));
    }
}
