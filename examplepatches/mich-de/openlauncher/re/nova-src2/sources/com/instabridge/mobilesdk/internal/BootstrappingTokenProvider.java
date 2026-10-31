package com.instabridge.mobilesdk.internal;

import com.instabridge.mobilesdk.api.TokenProvider;
import com.instabridge.mobilesdk.internal.auth.AnonymousAuthBootstrap;
import com.instabridge.mobilesdk.internal.auth.SignedInStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0002\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u0004\u0018\u00010\nH\u0096@¢\u0006\u0002\u0010\u000bR\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/BootstrappingTokenProvider;", "Lcom/instabridge/mobilesdk/api/TokenProvider;", "hostProvider", "signedInStore", "Lcom/instabridge/mobilesdk/internal/auth/SignedInStore;", "bootstrap", "Lcom/instabridge/mobilesdk/internal/auth/AnonymousAuthBootstrap;", "<init>", "(Lcom/instabridge/mobilesdk/api/TokenProvider;Lcom/instabridge/mobilesdk/internal/auth/SignedInStore;Lcom/instabridge/mobilesdk/internal/auth/AnonymousAuthBootstrap;)V", "getToken", b.f42142b, "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final class BootstrappingTokenProvider implements TokenProvider {

    @NotNull
    private final AnonymousAuthBootstrap bootstrap;

    @NotNull
    private final TokenProvider hostProvider;

    @NotNull
    private final SignedInStore signedInStore;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.BootstrappingTokenProvider", f = "ServiceGraph.kt", l = {189, 191}, m = "getToken")
    /* renamed from: com.instabridge.mobilesdk.internal.BootstrappingTokenProvider$getToken$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return BootstrappingTokenProvider.this.getToken(this);
        }
    }

    public BootstrappingTokenProvider(@NotNull TokenProvider hostProvider, @NotNull SignedInStore signedInStore, @NotNull AnonymousAuthBootstrap bootstrap) {
        Intrinsics.g(hostProvider, "hostProvider");
        Intrinsics.g(signedInStore, "signedInStore");
        Intrinsics.g(bootstrap, "bootstrap");
        this.hostProvider = hostProvider;
        this.signedInStore = signedInStore;
        this.bootstrap = bootstrap;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // com.instabridge.mobilesdk.api.TokenProvider
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object getToken(@NotNull Continuation<? super String> continuation) throws Throwable {
        AnonymousClass1 anonymousClass1;
        BootstrappingTokenProvider bootstrappingTokenProvider;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object token = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(token);
            TokenProvider tokenProvider = this.hostProvider;
            anonymousClass1.L$0 = this;
            anonymousClass1.label = 1;
            token = tokenProvider.getToken(anonymousClass1);
            if (token != coroutineSingletons) {
                bootstrappingTokenProvider = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(token);
            return token;
        }
        bootstrappingTokenProvider = (BootstrappingTokenProvider) anonymousClass1.L$0;
        ResultKt.b(token);
        Object orCreate = (String) token;
        if (orCreate == null && (orCreate = bootstrappingTokenProvider.signedInStore.token()) == null) {
            AnonymousAuthBootstrap anonymousAuthBootstrap = bootstrappingTokenProvider.bootstrap;
            anonymousClass1.L$0 = null;
            anonymousClass1.label = 2;
            orCreate = anonymousAuthBootstrap.getOrCreate(anonymousClass1);
            if (orCreate == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return orCreate;
    }
}
