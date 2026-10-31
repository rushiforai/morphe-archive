package com.moloco.sdk.internal.ortb;

import com.moloco.sdk.internal.ortb.a;
import com.moloco.sdk.internal.ortb.model.C2937g;
import com.moloco.sdk.internal.scheduling.DispatcherProvider;
import com.moloco.sdk.internal.x;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.MissingFieldException;
import kotlinx.serialization.json.Json;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;

/* loaded from: classes4.dex */
public final class c implements b {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Json f36616a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final DispatcherProvider f36617b;

    @DebugMetadata(c = "com.moloco.sdk.internal.ortb.BidResponseParserImpl$invoke$2", f = "BidResponseParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super x<C2937g, com.moloco.sdk.internal.ortb.a>>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f36618a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f36620c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(String str, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f36620c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super x<C2937g, com.moloco.sdk.internal.ortb.a>> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return c.this.new a(this.f36620c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f36618a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            try {
                Json json = c.this.f36616a;
                String str = this.f36620c;
                json.getSerializersModule();
                return new x.b(e.a((C2937g) json.decodeFromString(C2937g.INSTANCE.serializer(), str)));
            } catch (CancellationException e3) {
                throw e3;
            } catch (MissingFieldException e11) {
                return new x.a(new a.b(e11.getMissingFields()));
            } catch (Exception e12) {
                return new x.a(new a.C0154a(e12));
            }
        }
    }

    public c(@NotNull Json json) {
        Intrinsics.g(json, "json");
        this.f36616a = json;
        this.f36617b = com.moloco.sdk.internal.scheduling.b.a();
    }

    @Override // com.moloco.sdk.internal.ortb.b
    @Nullable
    public Object a(@NotNull String str, @NotNull Continuation<? super x<C2937g, com.moloco.sdk.internal.ortb.a>> continuation) {
        return m0.y(this.f36617b.getIo(), new a(str, null), continuation);
    }
}
