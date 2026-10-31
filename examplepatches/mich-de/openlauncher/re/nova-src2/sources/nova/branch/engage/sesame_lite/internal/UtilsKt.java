package nova.branch.engage.sesame_lite.internal;

import com.amplitude.android.migration.DatabaseConstants;
import java.io.IOException;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;
import x80.m0;

@Metadata(d1 = {"\u0000L\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\u001a)\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0001\u001a\u00020\u00002\u0012\b\u0002\u0010\u0004\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0002¢\u0006\u0004\b\u0006\u0010\u0007\u001a0\u0010\r\u001a\u00020\u0005\"\u0004\b\u0000\u0010\b*\b\u0012\u0004\u0012\u00028\u00000\t2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\nH\u0086\b¢\u0006\u0004\b\r\u0010\u000e\u001a\u0014\u0010\u0011\u001a\u00020\u0010*\u00020\u000fH\u0086@¢\u0006\u0004\b\u0011\u0010\u0012\u001a\u001b\u0010\u0015\u001a\u0004\u0018\u00010\u0003*\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0003¢\u0006\u0004\b\u0015\u0010\u0016\"\u0015\u0010\u001b\u001a\u00020\u0018*\u00020\u00178F¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u001a\"\u0015\u0010\u001d\u001a\u00020\u0018*\u00020\u00178F¢\u0006\u0006\u001a\u0004\b\u001c\u0010\u001a\"\u0015\u0010!\u001a\u00020\n*\u00020\u001e8F¢\u0006\u0006\u001a\u0004\b\u001f\u0010 \"\u0015\u0010#\u001a\u00020\n*\u00020\u001e8F¢\u0006\u0006\u001a\u0004\b\"\u0010 ¨\u0006$"}, d2 = {com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "condition", "Lkotlin/Function0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "msg", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "assertTrue", "(ZLkotlin/jvm/functions/Function0;)V", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "indexA", "indexB", "swap", "([Ljava/lang/Object;II)V", "Lx80/i;", "Lx80/m0;", "await", "(Lx80/i;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lorg/json/JSONObject;", DatabaseConstants.KEY_FIELD, "optStringNull", "(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;", "Lkotlin/UShort;", "Lkotlin/UByte;", "getHiByte-xj2QHRw", "(S)B", "hiByte", "getLoByte-xj2QHRw", "loByte", "Lkotlin/ULong;", "getHiInt-VKZWuLQ", "(J)I", "hiInt", "getLoInt-VKZWuLQ", "loInt", "sesame-lite_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class UtilsKt {
    public static final void assertTrue(boolean z11, @Nullable Function0<String> function0) {
    }

    public static /* synthetic */ void assertTrue$default(boolean z11, Function0 function0, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            function0 = null;
        }
        assertTrue(z11, function0);
    }

    @Nullable
    public static final Object await(@NotNull final x80.i iVar, @NotNull Continuation<? super m0> continuation) {
        final t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        iVar.b(new x80.j() { // from class: nova.branch.engage.sesame_lite.internal.UtilsKt$await$2$1
            @Override // x80.j
            public void onFailure(x80.i call, IOException e3) {
                Intrinsics.g(call, "call");
                Intrinsics.g(e3, "e");
                if (mVar.isCancelled()) {
                    return;
                }
                t70.l lVar = mVar;
                int i5 = Result.f71687b;
                lVar.resumeWith(ResultKt.a(e3));
            }

            @Override // x80.j
            public void onResponse(x80.i call, m0 response) {
                Intrinsics.g(call, "call");
                Intrinsics.g(response, "response");
                t70.l lVar = mVar;
                int i5 = Result.f71687b;
                lVar.resumeWith(response);
            }
        });
        mVar.v(new Function1<Throwable, Unit>() { // from class: nova.branch.engage.sesame_lite.internal.UtilsKt$await$2$2
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((Throwable) obj);
                return Unit.f71706a;
            }

            public final void invoke(Throwable th2) {
                try {
                    iVar.cancel();
                } catch (Throwable unused) {
                }
            }
        });
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    /* renamed from: getHiByte-xj2QHRw, reason: not valid java name */
    public static final byte m456getHiBytexj2QHRw(short s11) {
        UInt.Companion companion = UInt.f71696b;
        byte b11 = (byte) ((s11 & 65280) >>> 8);
        UByte.Companion companion2 = UByte.f71693b;
        return b11;
    }

    /* renamed from: getHiInt-VKZWuLQ, reason: not valid java name */
    public static final int m457getHiIntVKZWuLQ(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return (int) ((j11 & (-4294967296L)) >>> 32);
    }

    /* renamed from: getLoByte-xj2QHRw, reason: not valid java name */
    public static final byte m458getLoBytexj2QHRw(short s11) {
        UShort.Companion companion = UShort.f71703b;
        byte b11 = (byte) (s11 & 255);
        UByte.Companion companion2 = UByte.f71693b;
        return b11;
    }

    /* renamed from: getLoInt-VKZWuLQ, reason: not valid java name */
    public static final int m459getLoIntVKZWuLQ(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return (int) (j11 & 4294967295L);
    }

    @Nullable
    public static final String optStringNull(@NotNull JSONObject jSONObject, @NotNull String key) {
        Intrinsics.g(jSONObject, "<this>");
        Intrinsics.g(key, "key");
        if (!jSONObject.has(key) || jSONObject.isNull(key)) {
            return null;
        }
        return jSONObject.optString(key);
    }

    public static final <T> void swap(@NotNull T[] tArr, int i5, int i11) {
        Intrinsics.g(tArr, "<this>");
        T t6 = tArr[i5];
        tArr[i5] = tArr[i11];
        tArr[i11] = t6;
    }
}
