package com.instabridge.mobilesdk.internal.auth;

import ads_mobile_sdk.pd;
import b.c0;
import c80.d;
import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.instabridge.mobilesdk.internal.Logger;
import eb0.p0;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\b\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\u0012\u0010\u000b\u001a\u0004\u0018\u00010\u0006H\u0082@¢\u0006\u0004\b\u000b\u0010\fJ\u0012\u0010\r\u001a\u0004\u0018\u00010\u0006H\u0086@¢\u0006\u0004\b\r\u0010\fJ\u001a\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u000e\u001a\u00020\u0006H\u0086@¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0014R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0015R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u0016R\u0014\u0010\b\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0016R\u0014\u0010\u0018\u001a\u00020\u00178\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010\u0019¨\u0006\u001a"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/AnonymousAuthBootstrap;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/mobilesdk/internal/auth/UsersApi;", "api", "Lcom/instabridge/mobilesdk/internal/auth/AnonymousTokenStore;", "store", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "appVersion", "<init>", "(Lcom/instabridge/mobilesdk/internal/auth/UsersApi;Lcom/instabridge/mobilesdk/internal/auth/AnonymousTokenStore;Ljava/lang/String;Ljava/lang/String;)V", "createAnonymousUser", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getOrCreate", "googleToken", "Lcom/instabridge/mobilesdk/internal/auth/LoginResponse;", "upgradeWithGoogle", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "cachedAnonymousToken", "()Ljava/lang/String;", "Lcom/instabridge/mobilesdk/internal/auth/UsersApi;", "Lcom/instabridge/mobilesdk/internal/auth/AnonymousTokenStore;", "Ljava/lang/String;", "Lc80/a;", "mutex", "Lc80/a;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AnonymousAuthBootstrap {
    public static final int $stable = 8;

    @NotNull
    private final UsersApi api;

    @NotNull
    private final String appVersion;

    @NotNull
    private final c80.a mutex;

    @NotNull
    private final String platform;

    @NotNull
    private final AnonymousTokenStore store;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.auth.AnonymousAuthBootstrap", f = "AnonymousAuthBootstrap.kt", l = {34}, m = "createAnonymousUser")
    /* renamed from: com.instabridge.mobilesdk.internal.auth.AnonymousAuthBootstrap$createAnonymousUser$1, reason: invalid class name */
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
            return AnonymousAuthBootstrap.this.createAnonymousUser(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.auth.AnonymousAuthBootstrap", f = "AnonymousAuthBootstrap.kt", l = {pd.H0, 27}, m = "getOrCreate")
    /* renamed from: com.instabridge.mobilesdk.internal.auth.AnonymousAuthBootstrap$getOrCreate$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28671 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C28671(Continuation<? super C28671> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AnonymousAuthBootstrap.this.getOrCreate(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.auth.AnonymousAuthBootstrap", f = "AnonymousAuthBootstrap.kt", l = {65, 70}, m = "upgradeWithGoogle")
    /* renamed from: com.instabridge.mobilesdk.internal.auth.AnonymousAuthBootstrap$upgradeWithGoogle$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28681 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C28681(Continuation<? super C28681> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AnonymousAuthBootstrap.this.upgradeWithGoogle(null, this);
        }
    }

    public AnonymousAuthBootstrap(@NotNull UsersApi api, @NotNull AnonymousTokenStore store, @NotNull String platform, @NotNull String appVersion) {
        Intrinsics.g(api, "api");
        Intrinsics.g(store, "store");
        Intrinsics.g(platform, "platform");
        Intrinsics.g(appVersion, "appVersion");
        this.api = api;
        this.store = store;
        this.platform = platform;
        this.appVersion = appVersion;
        this.mutex = new d();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object createAnonymousUser(Continuation<? super String> continuation) {
        AnonymousClass1 anonymousClass1;
        AnonymousAuthBootstrap anonymousAuthBootstrap;
        String token;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        AnonymousClass1 anonymousClass12 = anonymousClass1;
        Object objCreateUser = anonymousClass12.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass12.label;
        if (i11 == 0) {
            ResultKt.b(objCreateUser);
            UsersApi usersApi = this.api;
            String strDeviceId = this.store.deviceId();
            String string = Locale.getDefault().toString();
            Intrinsics.f(string, "toString(...)");
            String str = this.platform;
            String str2 = this.appVersion;
            anonymousClass12.L$0 = this;
            anonymousClass12.label = 1;
            objCreateUser = usersApi.createUser(InneractiveMediationDefs.SHOW_HOUSE_AD_YES, "1", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, strDeviceId, string, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, str, str2, anonymousClass12);
            if (objCreateUser == coroutineSingletons) {
                return coroutineSingletons;
            }
            anonymousAuthBootstrap = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            anonymousAuthBootstrap = (AnonymousAuthBootstrap) anonymousClass12.L$0;
            ResultKt.b(objCreateUser);
        }
        p0 p0Var = (p0) objCreateUser;
        if (!p0Var.f52631a.c()) {
            Logger.e$default(Logger.INSTANCE, c0.h(p0Var.f52631a.f95556d, "POST /users returned "), null, 2, null);
            return null;
        }
        CreateUserResponse createUserResponse = (CreateUserResponse) p0Var.f52632b;
        if (createUserResponse != null && (token = createUserResponse.getToken()) != null) {
            if (k.U0(token)) {
                token = null;
            }
            if (token != null) {
                anonymousAuthBootstrap.store.writeToken(token);
                return token;
            }
        }
        return null;
    }

    @Nullable
    public final String cachedAnonymousToken() {
        return this.store.readToken();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0094 A[Catch: all -> 0x009c, TryCatch #1 {all -> 0x009c, blocks: (B:39:0x008e, B:41:0x0094, B:44:0x009e, B:47:0x00a3, B:38:0x0088), top: B:57:0x0088 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v18, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r0v21 */
    /* JADX WARN: Type inference failed for: r0v22 */
    /* JADX WARN: Type inference failed for: r0v23 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r2v10, types: [c80.a] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object getOrCreate(@NotNull Continuation<? super String> continuation) throws Throwable {
        C28671 c28671;
        d dVar;
        AnonymousAuthBootstrap anonymousAuthBootstrap;
        d dVar2;
        Throwable th2;
        String token;
        ?? r02;
        Throwable th3;
        Object objCreateAnonymousUser;
        Object objA;
        Throwable thA;
        if (continuation instanceof C28671) {
            c28671 = (C28671) continuation;
            int i5 = c28671.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28671.label = i5 - Integer.MIN_VALUE;
            } else {
                c28671 = new C28671(continuation);
            }
        }
        Object obj = c28671.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28671.label;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                String token2 = this.store.readToken();
                if (token2 != null) {
                    return token2;
                }
                c80.a aVar = this.mutex;
                c28671.L$0 = this;
                c28671.L$1 = aVar;
                c28671.label = 1;
                dVar = (d) aVar;
                if (dVar.e(c28671) != coroutineSingletons) {
                    anonymousAuthBootstrap = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r02 = (c80.a) c28671.L$0;
                try {
                    ResultKt.b(obj);
                    r02 = r02;
                    objA = (String) obj;
                    int i12 = Result.f71687b;
                    r02 = r02;
                } catch (Throwable th4) {
                    th3 = th4;
                    try {
                        int i13 = Result.f71687b;
                        objA = ResultKt.a(th3);
                        r02 = r02;
                        thA = Result.a(objA);
                        if (thA != null) {
                        }
                        if (objA instanceof Result.Failure) {
                        }
                        token = (String) objA;
                        dVar = r02;
                        dVar.g(null);
                        return token;
                    } catch (Throwable th5) {
                        th2 = th5;
                        dVar2 = r02;
                        dVar2.g(null);
                        throw th2;
                    }
                }
                thA = Result.a(objA);
                if (thA != null) {
                    Logger.INSTANCE.e("anonymous user bootstrap failed", thA);
                }
                if (objA instanceof Result.Failure) {
                    objA = null;
                }
                token = (String) objA;
                dVar = r02;
                dVar.g(null);
                return token;
            }
            ?? r22 = (c80.a) c28671.L$1;
            anonymousAuthBootstrap = (AnonymousAuthBootstrap) c28671.L$0;
            ResultKt.b(obj);
            dVar = r22;
            token = anonymousAuthBootstrap.store.readToken();
            if (token == null) {
                try {
                    int i14 = Result.f71687b;
                    c28671.L$0 = dVar;
                    c28671.L$1 = null;
                    c28671.label = 2;
                    objCreateAnonymousUser = anonymousAuthBootstrap.createAnonymousUser(c28671);
                } catch (Throwable th6) {
                    r02 = dVar;
                    th3 = th6;
                    int i132 = Result.f71687b;
                    objA = ResultKt.a(th3);
                    r02 = r02;
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                    if (objA instanceof Result.Failure) {
                    }
                    token = (String) objA;
                    dVar = r02;
                    dVar.g(null);
                    return token;
                }
                if (objCreateAnonymousUser != coroutineSingletons) {
                    r02 = dVar;
                    obj = objCreateAnonymousUser;
                    objA = (String) obj;
                    int i122 = Result.f71687b;
                    r02 = r02;
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                    if (objA instanceof Result.Failure) {
                    }
                    token = (String) objA;
                    dVar = r02;
                }
                return coroutineSingletons;
            }
            dVar.g(null);
            return token;
        } catch (Throwable th7) {
            dVar2 = dVar;
            th2 = th7;
            dVar2.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x008b, code lost:
    
        if (r15 == r1) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object upgradeWithGoogle(@NotNull String str, @NotNull Continuation<? super LoginResponse> continuation) {
        C28681 c28681;
        Object objA;
        AnonymousAuthBootstrap anonymousAuthBootstrap;
        if (continuation instanceof C28681) {
            c28681 = (C28681) continuation;
            int i5 = c28681.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28681.label = i5 - Integer.MIN_VALUE;
            } else {
                c28681 = new C28681(continuation);
            }
        }
        C28681 c286812 = c28681;
        Object orCreate = c286812.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c286812.label;
        try {
        } catch (Throwable th2) {
            int i12 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (i11 == 0) {
            ResultKt.b(orCreate);
            c286812.L$0 = this;
            c286812.L$1 = str;
            c286812.label = 1;
            orCreate = getOrCreate(c286812);
            if (orCreate != coroutineSingletons) {
                anonymousAuthBootstrap = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(orCreate);
            p0 p0Var = (p0) orCreate;
            if (p0Var.f52631a.c()) {
                objA = (LoginResponse) p0Var.f52632b;
            } else {
                Logger.e$default(Logger.INSTANCE, "POST /users/login returned " + p0Var.f52631a.f95556d, null, 2, null);
                objA = null;
            }
            int i13 = Result.f71687b;
            Throwable thA = Result.a(objA);
            if (thA != null) {
                Logger.INSTANCE.e("POST /users/login failed", thA);
            }
            if (objA instanceof Result.Failure) {
                return null;
            }
            return objA;
        }
        str = (String) c286812.L$1;
        anonymousAuthBootstrap = (AnonymousAuthBootstrap) c286812.L$0;
        ResultKt.b(orCreate);
        String str2 = str;
        String str3 = (String) orCreate;
        if (str3 == null) {
            Logger.e$default(Logger.INSTANCE, "users/login skipped: no anonymous token to upgrade", null, 2, null);
            return null;
        }
        int i14 = Result.f71687b;
        AnonymousAuthBootstrap anonymousAuthBootstrap2 = anonymousAuthBootstrap;
        UsersApi usersApi = anonymousAuthBootstrap2.api;
        String string = Locale.getDefault().toString();
        Intrinsics.f(string, "toString(...)");
        String str4 = anonymousAuthBootstrap2.platform;
        String str5 = anonymousAuthBootstrap2.appVersion;
        c286812.L$0 = null;
        c286812.L$1 = null;
        c286812.label = 2;
        orCreate = usersApi.loginWithGoogle(str2, InneractiveMediationDefs.SHOW_HOUSE_AD_YES, "POST", string, str3, str4, str5, c286812);
    }
}
