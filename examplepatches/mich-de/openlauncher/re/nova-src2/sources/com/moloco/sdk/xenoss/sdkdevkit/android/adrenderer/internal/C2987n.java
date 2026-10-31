package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.n, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2987n implements InterfaceC2986m {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i f39252a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.error.b f39253b;

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.DECLoaderImpl", f = "DECLoader.kt", l = {31}, m = "load")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.n$a */
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f39254a;

        /* renamed from: b, reason: collision with root package name */
        public Object f39255b;

        /* renamed from: c, reason: collision with root package name */
        public Object f39256c;

        /* renamed from: d, reason: collision with root package name */
        public Object f39257d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f39258e;

        /* renamed from: g, reason: collision with root package name */
        public int f39260g;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f39258e = obj;
            this.f39260g |= Integer.MIN_VALUE;
            return C2987n.this.a(null, null, this);
        }
    }

    public C2987n(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i mediaCacheRepository, @NotNull com.moloco.sdk.internal.error.b errorReportingService) {
        Intrinsics.g(mediaCacheRepository, "mediaCacheRepository");
        Intrinsics.g(errorReportingService, "errorReportingService");
        this.f39252a = mediaCacheRepository;
        this.f39253b = errorReportingService;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.InterfaceC2986m
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(@NotNull C2982i c2982i, @Nullable String str, @NotNull Continuation<? super C2982i> continuation) {
        a aVar;
        String strD;
        C2982i c2982i2;
        String str2;
        C2987n c2987n;
        C2982i c2982iA;
        String str3 = str;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f39260g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f39260g = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object obj = aVar.f39258e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f39260g;
        if (i11 == 0) {
            ResultKt.b(obj);
            C2983j c2983jN = c2982i.n();
            if (c2983jN == null || (strD = c2983jN.d()) == null) {
                this.f39253b.a(C2988o.f39262b, str3 != null ? new com.moloco.sdk.internal.error.a(str3) : new com.moloco.sdk.internal.error.a("UNKNOWN_MTID"));
                C2988o.b("can't precache DEC: appIconUri is null");
                return c2982i;
            }
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i iVar = this.f39252a;
            aVar.f39254a = this;
            aVar.f39255b = c2982i;
            aVar.f39256c = str3;
            aVar.f39257d = strD;
            aVar.f39260g = 1;
            Object objA = iVar.a(strD, aVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            c2982i2 = c2982i;
            str2 = strD;
            obj = objA;
            c2987n = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str2 = (String) aVar.f39257d;
            str3 = (String) aVar.f39256c;
            C2982i c2982i3 = (C2982i) aVar.f39255b;
            c2987n = (C2987n) aVar.f39254a;
            ResultKt.b(obj);
            c2982i2 = c2982i3;
        }
        i.a aVar2 = (i.a) obj;
        if (aVar2 instanceof i.a.b) {
            c2982iA = C2982i.a(c2982i2, null, null, null, null, null, null, null, new C2983j(c2982i2.n().f(), ((i.a.b) aVar2).a().getAbsolutePath(), c2982i2.n().e()), null, 383, null);
        } else {
            c2987n.f39253b.a(C2988o.f39261a, str3 != null ? new com.moloco.sdk.internal.error.a(str3) : new com.moloco.sdk.internal.error.a("UNKNOWN_MTID"));
            C2988o.b("dec loading error: " + aVar2 + ": `Not found` for " + str2);
            c2982iA = null;
        }
        return c2982iA == null ? c2982i2 : c2982iA;
    }
}
