package com.moloco.sdk.internal.publisher;

import android.util.Base64;
import com.moloco.sdk.internal.MolocoLogger;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.zip.GZIPInputStream;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class o implements q {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f37432a = new a(null);

    /* renamed from: b, reason: collision with root package name */
    public static final int f37433b = 0;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final String f37434c = "Base64GzippedBidProcessor";

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.publisher.Base64GzippedBidProcessor$process$2", f = "BidProcessor.kt", l = {}, m = "invokeSuspend")
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super String>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37435a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37437c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(String str, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f37437c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super String> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return o.this.new b(this.f37437c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws IOException {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37435a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
            MolocoLogger.debug$default(molocoLogger, o.f37434c, "Starting bid response pre-process with base64 decode and gunzip", false, 4, null);
            String strA = o.this.a(this.f37437c);
            MolocoLogger.debug$default(molocoLogger, o.f37434c, b.c0.k("Processed bidresponse: ", strA), false, 4, null);
            return strA;
        }
    }

    @Override // com.moloco.sdk.internal.publisher.q
    @Nullable
    public Object a(@NotNull String str, @NotNull Continuation<? super String> continuation) {
        return m0.y(com.moloco.sdk.internal.scheduling.b.a().getDefault(), new b(str, null), continuation);
    }

    public final String a(String str) throws IOException {
        try {
            byte[] bArrDecode = Base64.decode(str, 0);
            Intrinsics.f(bArrDecode, "decode(...)");
            MolocoLogger.debug$default(MolocoLogger.INSTANCE, f37434c, "Base64 decoded bidresponse: " + bArrDecode, false, 4, null);
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArrDecode);
            GZIPInputStream gZIPInputStream = new GZIPInputStream(byteArrayInputStream, 2048);
            StringBuilder sb2 = new StringBuilder();
            byte[] bArr = new byte[2048];
            while (true) {
                try {
                    try {
                        int i5 = gZIPInputStream.read(bArr);
                        if (i5 != -1) {
                            sb2.append(new String(bArr, 0, i5, Charsets.f72000b));
                        } else {
                            byteArrayInputStream.close();
                            gZIPInputStream.close();
                            return sb2.toString();
                        }
                    } catch (Exception unused) {
                        MolocoLogger.warn$default(MolocoLogger.INSTANCE, f37434c, "Failed to unzip bidresponse, perhaps a non-gzipped response", null, false, 12, null);
                        byteArrayInputStream.close();
                        gZIPInputStream.close();
                        return null;
                    }
                } catch (Throwable th2) {
                    byteArrayInputStream.close();
                    gZIPInputStream.close();
                    throw th2;
                }
            }
        } catch (Exception unused2) {
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, f37434c, "Failed to base64 decode bidresponse, perhpas a non-base64 encoded response", null, false, 12, null);
            return null;
        }
    }
}
