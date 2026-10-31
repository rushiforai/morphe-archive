package com.moloco.sdk.internal.bidtoken;

import android.util.Base64;
import com.moloco.sdk.internal.m;
import com.moloco.sdk.internal.x;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;
import r70.j;
import r70.k;
import t70.j0;
import t70.m0;

/* loaded from: classes.dex */
public final class c implements b {

    /* renamed from: a, reason: collision with root package name */
    public static final int f36232a = 0;

    @DebugMetadata(c = "com.moloco.sdk.internal.bidtoken.VersionPrefixedJWTokenParser$invoke$2", f = "VersionPrefixedJWTokenParser.kt", l = {}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super x<com.moloco.sdk.internal.bidtoken.a, m>>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f36233a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f36234b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(String str, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f36234b = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super x<com.moloco.sdk.internal.bidtoken.a, m>> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new a(this.f36234b, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f36233a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            try {
                byte[] bArrDecode = Base64.decode((String) k.i1((String) k.h1(this.f36234b, new char[]{AbstractJsonLexerKt.COLON}, 6).get(1), new String[]{"."}, 6).get(1), 0);
                Intrinsics.f(bArrDecode, "decode(...)");
                return new x.b(new com.moloco.sdk.internal.bidtoken.a(new JSONObject(j.x0(bArrDecode)).getLong("exp")));
            } catch (Exception e3) {
                return new x.a(new m(e3.toString(), -1));
            }
        }
    }

    @Override // com.moloco.sdk.internal.bidtoken.b
    @Nullable
    public Object a(@NotNull String str, @NotNull Continuation<? super x<com.moloco.sdk.internal.bidtoken.a, m>> continuation) {
        return m0.y(d.f36235a, new a(str, null), continuation);
    }
}
