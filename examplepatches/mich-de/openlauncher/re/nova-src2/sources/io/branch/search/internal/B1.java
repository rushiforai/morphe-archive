package io.branch.search.internal;

import android.content.Context;
import android.os.UserHandle;
import android.text.TextUtils;
import io.branch.engage.sesame_lite.internal.IdHash;
import io.branch.search.internal.C4;
import io.branch.search.internal.I0;
import io.branch.search.internal.Rb;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class B1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f62088a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3160g4 f62089b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3139f0 f62090c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final L1 f62091d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3269mc f62092e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final I0.a f62093f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final C3356rf f62094g;

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProviderClickHandler$handle$1$1", f = "BncContentProviderPaths.kt", l = {463, 464}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f62095a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f62097c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ C4.j.b f62098d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(String str, C4.j.b bVar, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f62097c = str;
            this.f62098d = bVar;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return B1.this.new a(this.f62097c, this.f62098d, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((a) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        /* JADX WARN: Code restructure failed: missing block: B:24:0x0080, code lost:
        
            if (io.branch.search.internal.B1.a(r11, r1, r10) == r0) goto L25;
         */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(@NotNull Object obj) {
            a aVar;
            Object objB;
            Object obj2 = CoroutineSingletons.f71806a;
            int i5 = this.f62095a;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3269mc c3269mc = B1.this.f62092e;
                String str = this.f62097c;
                this.f62095a = 1;
                if (((Boolean) c3269mc.f65157d.getValue()).booleanValue()) {
                    IdHash idHashFromEncodedString = IdHash.INSTANCE.fromEncodedString(str);
                    if (idHashFromEncodedString != null) {
                        aVar = this;
                        objB = p3.i.B((u40.h) c3269mc.f65159f.getValue(), idHashFromEncodedString, null, null, aVar, 6);
                        if (objB != obj2) {
                            objB = Unit.f71706a;
                        }
                        if (objB != obj2) {
                        }
                        return obj2;
                    }
                    EnumC3131e9 logTag = EnumC3131e9.SesameLite;
                    C3320pc c3320pc = new C3320pc(str);
                    C3309p1 c3309p1 = C3309p1.f65465a;
                    Intrinsics.g(logTag, "logTag");
                    C3309p1.a(a50.b.f403d, "SesameLite", c3320pc, (Throwable) null);
                    objB = Unit.f71706a;
                } else {
                    objB = Unit.f71706a;
                }
                aVar = this;
                if (objB != obj2) {
                }
                return obj2;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            ResultKt.b(obj);
            aVar = this;
            B1 b12 = B1.this;
            C4.j.b bVar = aVar.f62098d;
            aVar.f62095a = 2;
        }
    }

    public B1(@NotNull Context context, @NotNull C3160g4 clickTracker, @NotNull C3139f0 analyticsRepository, @NotNull L1 analytics, @NotNull C3269mc ssml, @NotNull I0.a usageMonitor, @NotNull C3356rf userHandleRepository) {
        Intrinsics.g(context, "context");
        Intrinsics.g(clickTracker, "clickTracker");
        Intrinsics.g(analyticsRepository, "analyticsRepository");
        Intrinsics.g(analytics, "analytics");
        Intrinsics.g(ssml, "ssml");
        Intrinsics.g(usageMonitor, "usageMonitor");
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        this.f62088a = context;
        this.f62089b = clickTracker;
        this.f62090c = analyticsRepository;
        this.f62091d = analytics;
        this.f62092e = ssml;
        this.f62093f = usageMonitor;
        this.f62094g = userHandleRepository;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(B1 b12, C4.j.b bVar, Continuation continuation) {
        C1 c12;
        b12.getClass();
        if (continuation instanceof C1) {
            c12 = (C1) continuation;
            int i5 = c12.f62188c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c12.f62188c = i5 - Integer.MIN_VALUE;
            } else {
                c12 = new C1(b12, continuation);
            }
        }
        C1 c13 = c12;
        Object obj = c13.f62186a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c13.f62188c;
        if (i11 == 0) {
            ResultKt.b(obj);
            C4.j.c cVar = bVar.f62262b;
            if (cVar != null && (cVar instanceof C4.j.c.b)) {
                C3356rf c3356rf = b12.f62094g;
                C4.j.c.b bVar2 = (C4.j.c.b) cVar;
                UserHandle userHandle = bVar2.f62278h;
                c3356rf.getClass();
                Intrinsics.g(userHandle, "userHandle");
                Long userHandleId = c3356rf.f65680a.getUserHandleId(userHandle);
                if (userHandleId != null) {
                    long jLongValue = userHandleId.longValue();
                    I0.a aVar = b12.f62093f;
                    Context context = b12.f62088a;
                    aVar.getClass();
                    int iA = I0.a.a(context).a();
                    if (iA == 3 || iA == 4 || b12.f62094g.f65680a.getCurrentUserId() != jLongValue) {
                        C3269mc c3269mc = b12.f62092e;
                        String str = bVar2.f62275e;
                        c13.f62188c = 1;
                        Object objRecordAppOpen = ((u40.h) c3269mc.f65159f.getValue()).recordAppOpen(str, jLongValue, u40.f.f90584a, c13);
                        if (objRecordAppOpen != coroutineSingletons) {
                            objRecordAppOpen = Unit.f71706a;
                        }
                        if (objRecordAppOpen == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    public final void a(@NotNull String callerId, @NotNull C4.j.b clickInfo) throws Throwable {
        String str;
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(clickInfo, "clickInfo");
        List<String> list = clickInfo.f62261a;
        if (list != null) {
            ArrayList arrayList = new ArrayList();
            for (Object obj : list) {
                if (!r70.k.U0((String) obj)) {
                    arrayList.add(obj);
                }
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                String url = (String) it.next();
                C3160g4 c3160g4 = this.f62089b;
                c3160g4.getClass();
                Intrinsics.g(url, "url");
                try {
                    Rb.a aVarA = c3160g4.f64563b.a(url);
                    C3309p1.b("Schedule add click " + url + " as " + aVarA.f63276a);
                    c3160g4.a(aVarA);
                    Thread thread = c3160g4.f64567f;
                    if (thread != null) {
                        thread.interrupt();
                    }
                } catch (Throwable th2) {
                    t70.m0.t(c3160g4.f64562a, null, null, new C3143f4(c3160g4, callerId, url, null), 3);
                    C3309p1 c3309p1 = C3309p1.f65465a;
                    C3309p1.a(a50.b.f403d, "BranchSearchSDK", (String) null, th2);
                }
            }
        }
        C4.j.c cVar = clickInfo.f62262b;
        if (cVar instanceof C4.j.c.b) {
            C4.j.c.b bVar = (C4.j.c.b) cVar;
            C3101cd c3101cd = new C3101cd(bVar.f62276f, bVar.f62272b, bVar.f62271a, bVar.f62273c, bVar.f62274d, bVar.f62277g, bVar.f62279i);
            C3139f0 c3139f0 = this.f62090c;
            c3139f0.getClass();
            c3139f0.f64449a.getClass();
            t70.m0.t(c3139f0.f64452d, null, null, new C3088c0(c3139f0, c3101cd, null), 3);
            str = bVar.f62277g;
        } else {
            if (!(cVar instanceof C4.j.c.a)) {
                if (cVar != null) {
                    throw new NoWhenBranchMatchedException();
                }
                throw new IllegalArgumentException();
            }
            C4.j.c.a aVar = (C4.j.c.a) cVar;
            C3409v0 c3409v0 = new C3409v0(aVar.f62265a, aVar.f62267c, aVar.f62266b, aVar.f62268d, aVar.f62270f);
            C3139f0 c3139f02 = this.f62090c;
            c3139f02.getClass();
            c3139f02.f64449a.getClass();
            t70.m0.t(c3139f02.f64452d, null, null, new C3105d0(c3139f02, c3409v0, null), 3);
            str = aVar.f62269e;
        }
        if (str != null) {
            t70.m0.u(EmptyCoroutineContext.f71803a, new a(str, clickInfo, null));
        }
        C4.j.a aVar2 = clickInfo.f62263c;
        if (aVar2 != null) {
            L1 l12 = this.f62091d;
            JSONObject jSONObject = (JSONObject) aVar2.f62258f.getValue();
            String str2 = aVar2.f62254b;
            String clickType = aVar2.f62255c;
            JSONObject jSONObject2 = (JSONObject) aVar2.f62257e.getValue();
            l12.getClass();
            Intrinsics.g(clickType, "clickType");
            if (l12.f62817e.a() && jSONObject != null) {
                C3240l0 c3240l0 = l12.f62818f;
                c3240l0.getClass();
                String strB = c3240l0.f64939d.b(callerId);
                C3308p0.a("trackClick", jSONObject, "handler", clickType);
                if (jSONObject2 != null) {
                    try {
                        if (jSONObject2.optBoolean("isDynamic", false)) {
                            JSONObject jSONObject3 = new JSONObject();
                            Iterator<String> itKeys = jSONObject2.keys();
                            Intrinsics.f(itKeys, "obj.keys()");
                            while (itKeys.hasNext()) {
                                String next = itKeys.next();
                                Object objOpt = jSONObject2.opt(next);
                                if (objOpt != null) {
                                    jSONObject3.put(next, objOpt);
                                }
                            }
                            String strA = l12.f62816d.a();
                            if (jSONObject3.has("id")) {
                                jSONObject3.put("id", C3390tf.a(strA + AbstractJsonLexerKt.COLON + jSONObject3.getString("id")));
                            }
                            if (jSONObject3.has("uri")) {
                                jSONObject3.put("uri", C3390tf.a(strA + AbstractJsonLexerKt.COLON + jSONObject3.getString("uri")));
                            }
                            jSONObject2 = jSONObject3;
                        }
                        C3308p0.a("trackClick", jSONObject, "extras", jSONObject2);
                    } catch (JSONException e3) {
                        l12.f62817e.a(strB, e3, "BranchAnalytics.trackClick");
                    }
                }
                if (str2 == null || TextUtils.isEmpty(str2)) {
                    return;
                }
                l12.f62817e.a(strB, str2, jSONObject);
            }
        }
    }
}
