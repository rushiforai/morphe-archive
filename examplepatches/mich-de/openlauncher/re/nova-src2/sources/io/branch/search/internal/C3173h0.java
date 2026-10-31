package io.branch.search.internal;

import io.branch.search.internal.AbstractC3196i6;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.h0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3173h0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3282n8 f64625a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3366s8 f64626b;

    @DebugMetadata(c = "io.branch.search.internal.data.remote.service.AnalyticsService", f = "AnalyticsService.kt", l = {20}, m = "postAnalytics")
    /* renamed from: io.branch.search.internal.h0$a */
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64627a;

        /* renamed from: c, reason: collision with root package name */
        public int f64629c;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f64627a = obj;
            this.f64629c |= Integer.MIN_VALUE;
            return C3173h0.this.a(null, null, this);
        }
    }

    public C3173h0(@NotNull C3282n8 remoteConfiguration, @NotNull C3366s8 kNetworkInterface) {
        Intrinsics.g(remoteConfiguration, "remoteConfiguration");
        Intrinsics.g(kNetworkInterface, "kNetworkInterface");
        this.f64625a = remoteConfiguration;
        this.f64626b = kNetworkInterface;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull String str2, @NotNull Continuation<? super J2> continuation) throws Throwable {
        a aVar;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f64629c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f64629c = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object objY = aVar.f64627a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f64629c;
        if (i11 == 0) {
            ResultKt.b(objY);
            C3366s8 c3366s8 = this.f64626b;
            EnumC3075b4 enumC3075b4 = EnumC3075b4.f63994l;
            aVar.f64629c = 1;
            C3112d7 c3112d7A = c3366s8.a(enumC3075b4);
            a80.e eVar = t70.y0.f88884a;
            objY = t70.m0.y(a80.d.f488c, new C3163g7("https://vulcan2.branch.io/v1/ingest", str, str2, c3112d7A, null), aVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        AbstractC3196i6 abstractC3196i6 = (AbstractC3196i6) objY;
        if (abstractC3196i6 instanceof AbstractC3196i6.b) {
            return null;
        }
        if (abstractC3196i6 instanceof AbstractC3196i6.a) {
            return (J2) ((AbstractC3196i6.a) abstractC3196i6).f64738a;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Nullable
    public final Object a(@NotNull String str, @NotNull JSONObject jSONObject, @NotNull JSONObject jSONObject2, @NotNull Continuation<? super J2> continuation) {
        String string = C3199i9.a(jSONObject, jSONObject2).toString();
        Intrinsics.f(string, "sessionData + diagnosticData).toString()");
        Charset UTF_8 = StandardCharsets.UTF_8;
        Intrinsics.f(UTF_8, "UTF_8");
        Intrinsics.f(string.getBytes(UTF_8), "this as java.lang.String).getBytes(charset)");
        if (r7.length > this.f64625a.E) {
            String msg = b.c0.m("Analytics payload for session ", str, " had size of ", string);
            C3309p1 c3309p1 = C3309p1.f65465a;
            Intrinsics.g(msg, "msg");
            C3309p1.a(a50.b.f403d, "AnalyticsService.postAnalytics", msg, (Throwable) null);
        }
        return a(str, string, continuation);
    }
}
