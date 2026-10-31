package io.branch.search.internal;

import android.content.Context;
import android.content.IntentFilter;
import android.os.Build;
import android.os.UserHandle;
import android.os.UserManager;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.internal.Y2;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.la, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3250la {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f64964a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.j0 f64965b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final InterfaceC3183ha f64966c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final UserManager f64967d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final S8 f64968e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final R8 f64969f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final ArrayList f64970g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final ArrayList f64971h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final v70.m f64972i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f64973j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final Na f64974k;

    /* renamed from: l, reason: collision with root package name */
    public volatile boolean f64975l;

    /* renamed from: io.branch.search.internal.la$a */
    public static final class a {
        public static final void a(a aVar, Context context) {
            aVar.getClass();
            Y2.a aVar2 = Y2.Companion;
            Y2.b bVar = Y2.b.PackageSyncManager;
            aVar2.getClass();
            Y2.a.a(context, bVar).edit().putBoolean("sync_complete", true).apply();
        }
    }

    /* renamed from: io.branch.search.internal.la$b */
    public interface b {
        @Nullable
        Object a(long j11, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object a(@NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object a(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3460y0> list, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object a(@NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object b(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object b(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation);
    }

    /* renamed from: io.branch.search.internal.la$c */
    public static final class c implements b, d {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final b f64976a;

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onInitialSyncCompleted$2", f = "PackageSyncManager.kt", l = {Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$a */
        public static final class a extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64977a;

            public a(Continuation<? super a> continuation) {
                super(1, continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new a(continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return c.this.new a((Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64977a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    this.f64977a = 1;
                    if (bVar.a(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onPackageAdded$4", f = "PackageSyncManager.kt", l = {195}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$b */
        public static final class b extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64979a;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f64981c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ UserHandle f64982d;

            /* renamed from: e, reason: collision with root package name */
            public final /* synthetic */ List<C3443x0> f64983e;

            /* renamed from: f, reason: collision with root package name */
            public final /* synthetic */ List<C3460y0> f64984f;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public b(String str, UserHandle userHandle, List<C3443x0> list, List<C3460y0> list2, Continuation<? super b> continuation) {
                super(1, continuation);
                this.f64981c = str;
                this.f64982d = userHandle;
                this.f64983e = list;
                this.f64984f = list2;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new b(this.f64981c, this.f64982d, this.f64983e, this.f64984f, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((b) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64979a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    String str = this.f64981c;
                    UserHandle userHandle = this.f64982d;
                    List<C3443x0> list = this.f64983e;
                    List<C3460y0> list2 = this.f64984f;
                    this.f64979a = 1;
                    if (bVar.a(str, userHandle, list, list2, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onPackageChanged$4", f = "PackageSyncManager.kt", l = {Sdk.SDKError.Reason.AD_IS_LOADING_VALUE}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$c, reason: collision with other inner class name */
        public static final class C0341c extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64985a;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f64987c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ UserHandle f64988d;

            /* renamed from: e, reason: collision with root package name */
            public final /* synthetic */ List<C3443x0> f64989e;

            /* renamed from: f, reason: collision with root package name */
            public final /* synthetic */ List<C3460y0> f64990f;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0341c(String str, UserHandle userHandle, List<C3443x0> list, List<C3460y0> list2, Continuation<? super C0341c> continuation) {
                super(1, continuation);
                this.f64987c = str;
                this.f64988d = userHandle;
                this.f64989e = list;
                this.f64990f = list2;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new C0341c(this.f64987c, this.f64988d, this.f64989e, this.f64990f, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((C0341c) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64985a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    String str = this.f64987c;
                    UserHandle userHandle = this.f64988d;
                    List<C3443x0> list = this.f64989e;
                    List<C3460y0> list2 = this.f64990f;
                    this.f64985a = 1;
                    if (bVar.b(str, userHandle, list, list2, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onPackageRemoved$2", f = "PackageSyncManager.kt", l = {Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$d */
        public static final class d extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64991a;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f64993c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ UserHandle f64994d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public d(String str, UserHandle userHandle, Continuation<? super d> continuation) {
                super(1, continuation);
                this.f64993c = str;
                this.f64994d = userHandle;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new d(this.f64993c, this.f64994d, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((d) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64991a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    String str = this.f64993c;
                    UserHandle userHandle = this.f64994d;
                    this.f64991a = 1;
                    if (bVar.a(str, userHandle, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onProfileAdded$4", f = "PackageSyncManager.kt", l = {183}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$e */
        public static final class e extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64995a;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ UserHandle f64997c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ List<C3443x0> f64998d;

            /* renamed from: e, reason: collision with root package name */
            public final /* synthetic */ List<C3460y0> f64999e;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public e(UserHandle userHandle, List<C3443x0> list, List<C3460y0> list2, Continuation<? super e> continuation) {
                super(1, continuation);
                this.f64997c = userHandle;
                this.f64998d = list;
                this.f64999e = list2;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new e(this.f64997c, this.f64998d, this.f64999e, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((e) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64995a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    UserHandle userHandle = this.f64997c;
                    List<C3443x0> list = this.f64998d;
                    List<C3460y0> list2 = this.f64999e;
                    this.f64995a = 1;
                    if (bVar.a(userHandle, list, list2, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onProfileAvailable$2", f = "PackageSyncManager.kt", l = {Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$f */
        public static final class f extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65000a;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ UserHandle f65002c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public f(UserHandle userHandle, Continuation<? super f> continuation) {
                super(1, continuation);
                this.f65002c = userHandle;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new f(this.f65002c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return c.this.new f(this.f65002c, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65000a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    UserHandle userHandle = this.f65002c;
                    this.f65000a = 1;
                    if (bVar.a(userHandle, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onProfileRemoved$2", f = "PackageSyncManager.kt", l = {187}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$g */
        public static final class g extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65003a;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ long f65005c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public g(long j11, Continuation<? super g> continuation) {
                super(1, continuation);
                this.f65005c = j11;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new g(this.f65005c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return c.this.new g(this.f65005c, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65003a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    long j11 = this.f65005c;
                    this.f65003a = 1;
                    if (bVar.a(j11, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onProfileUnavailable$2", f = "PackageSyncManager.kt", l = {Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$h */
        public static final class h extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65006a;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ UserHandle f65008c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public h(UserHandle userHandle, Continuation<? super h> continuation) {
                super(1, continuation);
                this.f65008c = userHandle;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new h(this.f65008c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return c.this.new h(this.f65008c, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65006a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    UserHandle userHandle = this.f65008c;
                    this.f65006a = 1;
                    if (bVar.b(userHandle, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper$onShortcutsChanged$2", f = "PackageSyncManager.kt", l = {211}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$c$i */
        public static final class i extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65009a;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f65011c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ UserHandle f65012d;

            /* renamed from: e, reason: collision with root package name */
            public final /* synthetic */ List<C3460y0> f65013e;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public i(String str, UserHandle userHandle, List<C3460y0> list, Continuation<? super i> continuation) {
                super(1, continuation);
                this.f65011c = str;
                this.f65012d = userHandle;
                this.f65013e = list;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return c.this.new i(this.f65011c, this.f65012d, this.f65013e, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((i) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65009a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = c.this.f64976a;
                    String str = this.f65011c;
                    UserHandle userHandle = this.f65012d;
                    List<C3460y0> list = this.f65013e;
                    this.f65009a = 1;
                    if (bVar.a(str, userHandle, list, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$SyncAdapterCrashWrapper", f = "PackageSyncManager.kt", l = {172}, m = "wrap")
        /* renamed from: io.branch.search.internal.la$c$j */
        public static final class j extends ContinuationImpl {

            /* renamed from: a, reason: collision with root package name */
            public /* synthetic */ Object f65014a;

            /* renamed from: c, reason: collision with root package name */
            public int f65016c;

            public j(Continuation<? super j> continuation) {
                super(continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                this.f65014a = obj;
                this.f65016c |= Integer.MIN_VALUE;
                return c.this.a((Function1<? super Continuation<? super Unit>, ? extends Object>) null, this);
            }
        }

        public c(@NotNull b syncAdapter) {
            Intrinsics.g(syncAdapter, "syncAdapter");
            this.f64976a = syncAdapter;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object a(@NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new a(null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object b(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new C0341c(str, userHandle, list, list2, null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new b(str, userHandle, list, list2, null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object b(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new h(userHandle, null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new d(str, userHandle, null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object a(@NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new e(userHandle, list, list2, null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object a(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new f(userHandle, null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object a(long j11, @NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new g(j11, null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        @Override // io.branch.search.internal.C3250la.b
        @Nullable
        public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3460y0> list, @NotNull Continuation<? super Unit> continuation) {
            Object objA = a(new i(str, userHandle, list, null), continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }

        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object a(@NotNull Function1<? super Continuation<? super Unit>, ? extends Object> function1, @NotNull Continuation<? super Unit> continuation) {
            j jVar;
            if (continuation instanceof j) {
                jVar = (j) continuation;
                int i5 = jVar.f65016c;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    jVar.f65016c = i5 - Integer.MIN_VALUE;
                } else {
                    jVar = new j(continuation);
                }
            }
            Object obj = jVar.f65014a;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = jVar.f65016c;
            try {
                if (i11 == 0) {
                    ResultKt.b(obj);
                    jVar.f65016c = 1;
                    if (function1.invoke(jVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
            } catch (Throwable th2) {
                String tag = "SyncAdapter crash " + th2.getLocalizedMessage();
                C3309p1 c3309p1 = C3309p1.f65465a;
                Intrinsics.g(tag, "tag");
                C3309p1.a(a50.b.f403d, tag, (String) null, th2);
            }
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.la$d */
    public interface d extends b {
    }

    @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileChanged$$inlined$asyncAndAwaitAll$1", f = "PackageSyncManager.kt", l = {TTAdConstant.VIDEO_URL_CODE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.la$e */
    public static final class e extends SuspendLambda implements Function2<t70.j0, Continuation<? super List<? extends Unit>>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65017a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65018b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Collection f65019c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ Function2 f65020d;

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileChanged$$inlined$asyncAndAwaitAll$1$1", f = "PackageSyncManager.kt", l = {609}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$e$a */
        public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65021a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ Object f65022b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Function2 f65023c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(Object obj, Continuation continuation, Function2 function2) {
                super(2, continuation);
                this.f65022b = obj;
                this.f65023c = function2;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return new a(this.f65022b, continuation, this.f65023c);
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return new a(this.f65022b, (Continuation) obj2, this.f65023c).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65021a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = (b) this.f65022b;
                    Function2 function2 = this.f65023c;
                    this.f65021a = 1;
                    if (function2.invoke(bVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(Collection collection, Continuation continuation, Function2 function2) {
            super(2, continuation);
            this.f65019c = collection;
            this.f65020d = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            e eVar = new e(this.f65019c, continuation, this.f65020d);
            eVar.f65018b = obj;
            return eVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((e) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65017a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f65018b;
            Collection collection = this.f65019c;
            ArrayList arrayList = new ArrayList(b70.c.u0(collection, 10));
            Iterator it = collection.iterator();
            while (it.hasNext()) {
                arrayList.add(t70.m0.e(j0Var, null, new a(it.next(), null, this.f65020d), 3));
            }
            this.f65017a = 1;
            Object objF = t70.m0.f(arrayList, this);
            return objF == coroutineSingletons ? coroutineSingletons : objF;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileChanged$$inlined$asyncAndAwaitAll$2", f = "PackageSyncManager.kt", l = {TTAdConstant.VIDEO_URL_CODE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.la$f */
    public static final class f extends SuspendLambda implements Function2<t70.j0, Continuation<? super List<? extends Unit>>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65024a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65025b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Collection f65026c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ Function2 f65027d;

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileChanged$$inlined$asyncAndAwaitAll$2$1", f = "PackageSyncManager.kt", l = {609}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$f$a */
        public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65028a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ Object f65029b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Function2 f65030c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(Object obj, Continuation continuation, Function2 function2) {
                super(2, continuation);
                this.f65029b = obj;
                this.f65030c = function2;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return new a(this.f65029b, continuation, this.f65030c);
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return new a(this.f65029b, (Continuation) obj2, this.f65030c).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65028a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    d dVar = (d) this.f65029b;
                    Function2 function2 = this.f65030c;
                    this.f65028a = 1;
                    if (function2.invoke(dVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public f(Collection collection, Continuation continuation, Function2 function2) {
            super(2, continuation);
            this.f65026c = collection;
            this.f65027d = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            f fVar = new f(this.f65026c, continuation, this.f65027d);
            fVar.f65025b = obj;
            return fVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((f) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65024a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f65025b;
            Collection collection = this.f65026c;
            ArrayList arrayList = new ArrayList(b70.c.u0(collection, 10));
            Iterator it = collection.iterator();
            while (it.hasNext()) {
                arrayList.add(t70.m0.e(j0Var, null, new a(it.next(), null, this.f65027d), 3));
            }
            this.f65024a = 1;
            Object objF = t70.m0.f(arrayList, this);
            return objF == coroutineSingletons ? coroutineSingletons : objF;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {438, 439, 441, 615, 616}, m = "onProfileChanged")
    /* renamed from: io.branch.search.internal.la$g */
    public static final class g extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3250la f65031a;

        /* renamed from: b, reason: collision with root package name */
        public Object f65032b;

        /* renamed from: c, reason: collision with root package name */
        public List f65033c;

        /* renamed from: d, reason: collision with root package name */
        public Collection f65034d;

        /* renamed from: e, reason: collision with root package name */
        public Iterator f65035e;

        /* renamed from: f, reason: collision with root package name */
        public /* synthetic */ Object f65036f;

        /* renamed from: h, reason: collision with root package name */
        public int f65038h;

        public g(Continuation<? super g> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65036f = obj;
            this.f65038h |= Integer.MIN_VALUE;
            return C3250la.this.a((UserHandle) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileChanged$fn$1", f = "PackageSyncManager.kt", l = {444}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.la$h */
    public static final class h extends SuspendLambda implements Function2<b, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65039a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65040b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ UserHandle f65041c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ List<C3443x0> f65042d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ List<C3460y0> f65043e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public h(UserHandle userHandle, List<C3443x0> list, List<C3460y0> list2, Continuation<? super h> continuation) {
            super(2, continuation);
            this.f65041c = userHandle;
            this.f65042d = list;
            this.f65043e = list2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            h hVar = new h(this.f65041c, this.f65042d, this.f65043e, continuation);
            hVar.f65040b = obj;
            return hVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((h) create((b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65039a;
            if (i5 == 0) {
                ResultKt.b(obj);
                b bVar = (b) this.f65040b;
                UserHandle userHandle = this.f65041c;
                List<C3443x0> list = this.f65042d;
                List<C3460y0> list2 = this.f65043e;
                this.f65039a = 1;
                if (bVar.a(userHandle, list, list2, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileRemoved$$inlined$asyncAndAwaitAll$1", f = "PackageSyncManager.kt", l = {TTAdConstant.VIDEO_URL_CODE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.la$i */
    public static final class i extends SuspendLambda implements Function2<t70.j0, Continuation<? super List<? extends Unit>>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65044a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65045b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Collection f65046c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ long f65047d;

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileRemoved$$inlined$asyncAndAwaitAll$1$1", f = "PackageSyncManager.kt", l = {609}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$i$a */
        public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65048a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ Object f65049b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ long f65050c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(Object obj, Continuation continuation, long j11) {
                super(2, continuation);
                this.f65049b = obj;
                this.f65050c = j11;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return new a(this.f65049b, continuation, this.f65050c);
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return new a(this.f65049b, (Continuation) obj2, this.f65050c).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65048a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = (b) this.f65049b;
                    long j11 = this.f65050c;
                    this.f65048a = 1;
                    if (bVar.a(j11, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public i(Collection collection, Continuation continuation, long j11) {
            super(2, continuation);
            this.f65046c = collection;
            this.f65047d = j11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            i iVar = new i(this.f65046c, continuation, this.f65047d);
            iVar.f65045b = obj;
            return iVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((i) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65044a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f65045b;
            Collection collection = this.f65046c;
            ArrayList arrayList = new ArrayList(b70.c.u0(collection, 10));
            Iterator it = collection.iterator();
            while (it.hasNext()) {
                arrayList.add(t70.m0.e(j0Var, null, new a(it.next(), null, this.f65047d), 3));
            }
            this.f65044a = 1;
            Object objF = t70.m0.f(arrayList, this);
            return objF == coroutineSingletons ? coroutineSingletons : objF;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileRemoved$$inlined$asyncAndAwaitAll$2", f = "PackageSyncManager.kt", l = {TTAdConstant.VIDEO_URL_CODE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.la$j */
    public static final class j extends SuspendLambda implements Function2<t70.j0, Continuation<? super List<? extends Unit>>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65051a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65052b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Collection f65053c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ long f65054d;

        @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onProfileRemoved$$inlined$asyncAndAwaitAll$2$1", f = "PackageSyncManager.kt", l = {609}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.la$j$a */
        public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65055a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ Object f65056b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ long f65057c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(Object obj, Continuation continuation, long j11) {
                super(2, continuation);
                this.f65056b = obj;
                this.f65057c = j11;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return new a(this.f65056b, continuation, this.f65057c);
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return new a(this.f65056b, (Continuation) obj2, this.f65057c).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65055a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    d dVar = (d) this.f65056b;
                    long j11 = this.f65057c;
                    this.f65055a = 1;
                    if (dVar.a(j11, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public j(Collection collection, Continuation continuation, long j11) {
            super(2, continuation);
            this.f65053c = collection;
            this.f65054d = j11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            j jVar = new j(this.f65053c, continuation, this.f65054d);
            jVar.f65052b = obj;
            return jVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((j) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65051a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f65052b;
            Collection collection = this.f65053c;
            ArrayList arrayList = new ArrayList(b70.c.u0(collection, 10));
            Iterator it = collection.iterator();
            while (it.hasNext()) {
                arrayList.add(t70.m0.e(j0Var, null, new a(it.next(), null, this.f65054d), 3));
            }
            this.f65051a = 1;
            Object objF = t70.m0.f(arrayList, this);
            return objF == coroutineSingletons ? coroutineSingletons : objF;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {609, 458, 610}, m = "onProfileRemoved")
    /* renamed from: io.branch.search.internal.la$k */
    public static final class k extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3250la f65058a;

        /* renamed from: b, reason: collision with root package name */
        public long f65059b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f65060c;

        /* renamed from: e, reason: collision with root package name */
        public int f65062e;

        public k(Continuation<? super k> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65060c = obj;
            this.f65062e |= Integer.MIN_VALUE;
            return C3250la.this.a(0L, this);
        }
    }

    public C3250la(@NotNull Context context, @NotNull t70.j0 scope, @NotNull P7 loader, @NotNull ArrayList _syncAdapters, @NotNull ArrayList _syncCompletedAdapters, @NotNull UserManager userManager, @NotNull S8 localUserManager, @NotNull R8 localShortcutPermissionManager) {
        Intrinsics.g(context, "context");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(loader, "loader");
        Intrinsics.g(_syncAdapters, "_syncAdapters");
        Intrinsics.g(_syncCompletedAdapters, "_syncCompletedAdapters");
        Intrinsics.g(userManager, "userManager");
        Intrinsics.g(localUserManager, "localUserManager");
        Intrinsics.g(localShortcutPermissionManager, "localShortcutPermissionManager");
        this.f64964a = context;
        this.f64965b = scope;
        this.f64966c = loader;
        this.f64967d = userManager;
        this.f64968e = localUserManager;
        this.f64969f = localShortcutPermissionManager;
        ArrayList arrayList = new ArrayList(b70.c.u0(_syncAdapters, 10));
        Iterator it = _syncAdapters.iterator();
        while (it.hasNext()) {
            arrayList.add(new c((b) it.next()));
        }
        this.f64970g = arrayList;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(_syncCompletedAdapters, 10));
        Iterator it2 = _syncCompletedAdapters.iterator();
        while (it2.hasNext()) {
            arrayList2.add(new c((d) it2.next()));
        }
        this.f64971h = arrayList2;
        this.f64972i = v70.o.b(LayoutNode.NotPlacedPlaceOrder, 6, null);
        C3267ma c3267ma = new C3267ma(this);
        this.f64973j = new LinkedHashMap();
        Na na2 = new Na(this);
        this.f64974k = na2;
        new ReentrantLock().newCondition();
        this.f64975l = true;
        t70.j0 j0Var = this.f64965b;
        a80.e eVar = t70.y0.f88884a;
        a80.d dVar = a80.d.f488c;
        t70.m0.t(j0Var, dVar, null, new C3216ja(this, null), 2);
        this.f64966c.a(c3267ma);
        if (Build.VERSION.SDK_INT >= 33) {
            Context context2 = this.f64964a;
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.LOCALE_CHANGED");
            Unit unit = Unit.f71706a;
            context2.registerReceiver(na2, intentFilter, 4);
        } else {
            Context context3 = this.f64964a;
            IntentFilter intentFilter2 = new IntentFilter();
            intentFilter2.addAction("android.intent.action.LOCALE_CHANGED");
            Unit unit2 = Unit.f71706a;
            context3.registerReceiver(na2, intentFilter2);
        }
        a(this.f64965b, dVar, new C3233ka(this, null));
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x004c, code lost:
    
        if (r6 == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:22:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(C3250la c3250la, Continuation continuation) {
        C3402ua c3402ua;
        C3250la c3250la2;
        Iterator it;
        c3250la.getClass();
        if (continuation instanceof C3402ua) {
            c3402ua = (C3402ua) continuation;
            int i5 = c3402ua.f66020e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3402ua.f66020e = i5 - Integer.MIN_VALUE;
            } else {
                c3402ua = new C3402ua(c3250la, continuation);
            }
        }
        Object objA = c3402ua.f66018c;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c3402ua.f66020e;
        if (i11 == 0) {
            ResultKt.b(objA);
            InterfaceC3183ha interfaceC3183ha = c3250la.f64966c;
            c3402ua.f66016a = c3250la;
            c3402ua.f66020e = 1;
            objA = interfaceC3183ha.a();
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                it = c3402ua.f66017b;
                c3250la2 = c3402ua.f66016a;
                ResultKt.b(objA);
                while (it.hasNext()) {
                    UserHandle userHandle = (UserHandle) it.next();
                    c3402ua.f66016a = c3250la2;
                    c3402ua.f66017b = it;
                    c3402ua.f66020e = 2;
                    if (c3250la2.a(userHandle, c3402ua) == obj) {
                        return obj;
                    }
                }
                return Unit.f71706a;
            }
            c3250la = c3402ua.f66016a;
            ResultKt.b(objA);
        }
        c3250la2 = c3250la;
        it = ((Iterable) objA).iterator();
        while (it.hasNext()) {
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00da, code lost:
    
        if (t70.k0.d(r2, r4) != r5) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(C3250la c3250la, String str, UserHandle userHandle, Continuation continuation) {
        Ba ba2;
        String str2;
        UserHandle userHandle2;
        List list;
        C3250la c3250la2;
        C3487za c3487za;
        Function2 function2;
        C3250la c3250la3 = c3250la;
        String str3 = str;
        UserHandle userHandle3 = userHandle;
        c3250la3.getClass();
        if (continuation instanceof Ba) {
            ba2 = (Ba) continuation;
            int i5 = ba2.f62148g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ba2.f62148g = i5 - Integer.MIN_VALUE;
            } else {
                ba2 = new Ba(c3250la3, continuation);
            }
        }
        Object objA = ba2.f62146e;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = ba2.f62148g;
        if (i11 == 0) {
            ResultKt.b(objA);
            InterfaceC3183ha interfaceC3183ha = c3250la3.f64966c;
            ba2.f62142a = c3250la3;
            ba2.f62143b = str3;
            ba2.f62144c = userHandle3;
            ba2.f62148g = 1;
            objA = interfaceC3183ha.a(str3, userHandle3);
            if (objA != obj) {
            }
            return obj;
        }
        if (i11 == 1) {
            UserHandle userHandle4 = (UserHandle) ba2.f62144c;
            str3 = (String) ba2.f62143b;
            C3250la c3250la4 = ba2.f62142a;
            ResultKt.b(objA);
            userHandle3 = userHandle4;
            c3250la3 = c3250la4;
        } else {
            if (i11 == 2) {
                List list2 = ba2.f62145d;
                UserHandle userHandle5 = (UserHandle) ba2.f62144c;
                String str4 = (String) ba2.f62143b;
                C3250la c3250la5 = ba2.f62142a;
                ResultKt.b(objA);
                list = list2;
                userHandle2 = userHandle5;
                str2 = str4;
                c3250la2 = c3250la5;
                Ca ca2 = new Ca(str2, userHandle2, list, (List) objA, null);
                c3487za = new C3487za(c3250la2.f64970g, null, ca2);
                ba2.f62142a = c3250la2;
                ba2.f62143b = ca2;
                ba2.f62144c = null;
                ba2.f62145d = null;
                ba2.f62148g = 3;
                if (t70.k0.d(c3487za, ba2) != obj) {
                    function2 = ca2;
                    Aa aa2 = new Aa(c3250la2.f64971h, null, function2);
                    ba2.f62142a = null;
                    ba2.f62143b = null;
                    ba2.f62148g = 4;
                }
                return obj;
            }
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
                return Unit.f71706a;
            }
            function2 = (Function2) ba2.f62143b;
            c3250la2 = ba2.f62142a;
            ResultKt.b(objA);
            Aa aa22 = new Aa(c3250la2.f64971h, null, function2);
            ba2.f62142a = null;
            ba2.f62143b = null;
            ba2.f62148g = 4;
        }
        List list3 = (List) objA;
        InterfaceC3183ha interfaceC3183ha2 = c3250la3.f64966c;
        ba2.f62142a = c3250la3;
        ba2.f62143b = str3;
        ba2.f62144c = userHandle3;
        ba2.f62145d = list3;
        ba2.f62148g = 2;
        Object objB = interfaceC3183ha2.b(str3, userHandle3);
        if (objB != obj) {
            str2 = str3;
            userHandle2 = userHandle3;
            list = list3;
            objA = objB;
            c3250la2 = c3250la3;
            Ca ca22 = new Ca(str2, userHandle2, list, (List) objA, null);
            c3487za = new C3487za(c3250la2.f64970g, null, ca22);
            ba2.f62142a = c3250la2;
            ba2.f62143b = ca22;
            ba2.f62144c = null;
            ba2.f62145d = null;
            ba2.f62148g = 3;
            if (t70.k0.d(c3487za, ba2) != obj) {
            }
        }
        return obj;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x006f, code lost:
    
        if (t70.k0.d(r9, r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(C3250la c3250la, String str, UserHandle userHandle, Continuation continuation) {
        Fa fa2;
        c3250la.getClass();
        if (continuation instanceof Fa) {
            fa2 = (Fa) continuation;
            int i5 = fa2.f62470f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fa2.f62470f = i5 - Integer.MIN_VALUE;
            } else {
                fa2 = new Fa(c3250la, continuation);
            }
        }
        Object obj = fa2.f62468d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fa2.f62470f;
        if (i11 == 0) {
            ResultKt.b(obj);
            Da da2 = new Da(c3250la.f64970g, null, str, userHandle);
            fa2.f62465a = c3250la;
            fa2.f62466b = str;
            fa2.f62467c = userHandle;
            fa2.f62470f = 1;
            if (t70.k0.d(da2, fa2) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        userHandle = (UserHandle) fa2.f62467c;
        str = fa2.f62466b;
        c3250la = fa2.f62465a;
        ResultKt.b(obj);
        Ea ea2 = new Ea(c3250la.f64971h, null, str, userHandle);
        fa2.f62465a = null;
        fa2.f62466b = null;
        fa2.f62467c = null;
        fa2.f62470f = 2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00da, code lost:
    
        if (t70.k0.d(r2, r4) != r5) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(C3250la c3250la, String str, UserHandle userHandle, Continuation continuation) {
        C3453xa c3453xa;
        String str2;
        UserHandle userHandle2;
        List list;
        C3250la c3250la2;
        C3419va c3419va;
        Function2 function2;
        C3250la c3250la3 = c3250la;
        String str3 = str;
        UserHandle userHandle3 = userHandle;
        c3250la3.getClass();
        if (continuation instanceof C3453xa) {
            c3453xa = (C3453xa) continuation;
            int i5 = c3453xa.f66276g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3453xa.f66276g = i5 - Integer.MIN_VALUE;
            } else {
                c3453xa = new C3453xa(c3250la3, continuation);
            }
        }
        Object objA = c3453xa.f66274e;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c3453xa.f66276g;
        if (i11 == 0) {
            ResultKt.b(objA);
            InterfaceC3183ha interfaceC3183ha = c3250la3.f64966c;
            c3453xa.f66270a = c3250la3;
            c3453xa.f66271b = str3;
            c3453xa.f66272c = userHandle3;
            c3453xa.f66276g = 1;
            objA = interfaceC3183ha.a(str3, userHandle3);
            if (objA != obj) {
            }
            return obj;
        }
        if (i11 == 1) {
            UserHandle userHandle4 = (UserHandle) c3453xa.f66272c;
            str3 = (String) c3453xa.f66271b;
            C3250la c3250la4 = c3453xa.f66270a;
            ResultKt.b(objA);
            userHandle3 = userHandle4;
            c3250la3 = c3250la4;
        } else {
            if (i11 == 2) {
                List list2 = c3453xa.f66273d;
                UserHandle userHandle5 = (UserHandle) c3453xa.f66272c;
                String str4 = (String) c3453xa.f66271b;
                C3250la c3250la5 = c3453xa.f66270a;
                ResultKt.b(objA);
                list = list2;
                userHandle2 = userHandle5;
                str2 = str4;
                c3250la2 = c3250la5;
                C3470ya c3470ya = new C3470ya(str2, userHandle2, list, (List) objA, null);
                c3419va = new C3419va(c3250la2.f64970g, null, c3470ya);
                c3453xa.f66270a = c3250la2;
                c3453xa.f66271b = c3470ya;
                c3453xa.f66272c = null;
                c3453xa.f66273d = null;
                c3453xa.f66276g = 3;
                if (t70.k0.d(c3419va, c3453xa) != obj) {
                    function2 = c3470ya;
                    C3436wa c3436wa = new C3436wa(c3250la2.f64971h, null, function2);
                    c3453xa.f66270a = null;
                    c3453xa.f66271b = null;
                    c3453xa.f66276g = 4;
                }
                return obj;
            }
            if (i11 != 3) {
                if (i11 == 4) {
                    ResultKt.b(objA);
                    return Unit.f71706a;
                }
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            function2 = (Function2) c3453xa.f66271b;
            c3250la2 = c3453xa.f66270a;
            ResultKt.b(objA);
            C3436wa c3436wa2 = new C3436wa(c3250la2.f64971h, null, function2);
            c3453xa.f66270a = null;
            c3453xa.f66271b = null;
            c3453xa.f66276g = 4;
        }
        List list3 = (List) objA;
        InterfaceC3183ha interfaceC3183ha2 = c3250la3.f64966c;
        c3453xa.f66270a = c3250la3;
        c3453xa.f66271b = str3;
        c3453xa.f66272c = userHandle3;
        c3453xa.f66273d = list3;
        c3453xa.f66276g = 2;
        Object objB = interfaceC3183ha2.b(str3, userHandle3);
        if (objB != obj) {
            str2 = str3;
            userHandle2 = userHandle3;
            list = list3;
            objA = objB;
            c3250la2 = c3250la3;
            C3470ya c3470ya2 = new C3470ya(str2, userHandle2, list, (List) objA, null);
            c3419va = new C3419va(c3250la2.f64970g, null, c3470ya2);
            c3453xa.f66270a = c3250la2;
            c3453xa.f66271b = c3470ya2;
            c3453xa.f66272c = null;
            c3453xa.f66273d = null;
            c3453xa.f66276g = 3;
            if (t70.k0.d(c3419va, c3453xa) != obj) {
            }
        }
        return obj;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0069, code lost:
    
        if (t70.k0.d(r8, r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(C3250la c3250la, UserHandle userHandle, Continuation continuation) {
        La la2;
        c3250la.getClass();
        if (continuation instanceof La) {
            la2 = (La) continuation;
            int i5 = la2.f62846e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                la2.f62846e = i5 - Integer.MIN_VALUE;
            } else {
                la2 = new La(c3250la, continuation);
            }
        }
        Object obj = la2.f62844c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = la2.f62846e;
        if (i11 == 0) {
            ResultKt.b(obj);
            Ja ja2 = new Ja(c3250la.f64970g, null, userHandle);
            la2.f62842a = c3250la;
            la2.f62843b = userHandle;
            la2.f62846e = 1;
            if (t70.k0.d(ja2, la2) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        userHandle = (UserHandle) la2.f62843b;
        c3250la = la2.f62842a;
        ResultKt.b(obj);
        Ka ka2 = new Ka(c3250la.f64971h, null, userHandle);
        la2.f62842a = null;
        la2.f62843b = null;
        la2.f62846e = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(C3250la c3250la, Continuation continuation) throws Throwable {
        Oa oa2;
        C3250la c3250la2;
        List list;
        List list2;
        Iterator it;
        Iterator it2;
        C3250la c3250la3;
        c3250la.getClass();
        if (continuation instanceof Oa) {
            oa2 = (Oa) continuation;
            int i5 = oa2.f63023f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oa2.f63023f = i5 - Integer.MIN_VALUE;
            } else {
                oa2 = new Oa(c3250la, continuation);
            }
        }
        Object objA = oa2.f63021d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oa2.f63023f;
        if (i11 == 0) {
            ResultKt.b(objA);
            InterfaceC3183ha interfaceC3183ha = c3250la.f64966c;
            oa2.f63018a = c3250la;
            oa2.f63023f = 1;
            objA = interfaceC3183ha.a();
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                list = (List) oa2.f63020c;
                list2 = (List) oa2.f63019b;
                c3250la2 = oa2.f63018a;
                ResultKt.b(objA);
                ArrayList arrayList = new ArrayList();
                for (Object obj : (List) objA) {
                    if (!list.contains(new Long(((Number) obj).longValue()))) {
                        arrayList.add(obj);
                    }
                }
                it = arrayList.iterator();
                while (it.hasNext()) {
                }
                it2 = list2.iterator();
                c3250la3 = c3250la2;
                while (it2.hasNext()) {
                }
                return Unit.f71706a;
            }
            if (i11 == 3) {
                it = (Iterator) oa2.f63020c;
                list2 = (List) oa2.f63019b;
                c3250la2 = oa2.f63018a;
                ResultKt.b(objA);
                while (it.hasNext()) {
                    long jLongValue = ((Number) it.next()).longValue();
                    oa2.f63018a = c3250la2;
                    oa2.f63019b = list2;
                    oa2.f63020c = it;
                    oa2.f63023f = 3;
                    if (c3250la2.a(jLongValue, oa2) == coroutineSingletons) {
                        break;
                    }
                }
                it2 = list2.iterator();
                c3250la3 = c3250la2;
                while (it2.hasNext()) {
                }
                return Unit.f71706a;
            }
            if (i11 == 4) {
                it2 = (Iterator) oa2.f63019b;
                c3250la3 = oa2.f63018a;
                ResultKt.b(objA);
                while (it2.hasNext()) {
                    UserHandle userHandle = (UserHandle) it2.next();
                    oa2.f63018a = c3250la3;
                    oa2.f63019b = it2;
                    oa2.f63020c = null;
                    oa2.f63023f = 4;
                    Object objA2 = c3250la3.a(userHandle, oa2);
                    if (objA2 != CoroutineSingletons.f71806a) {
                        objA2 = Unit.f71706a;
                    }
                    if (objA2 == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                return Unit.f71706a;
            }
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        c3250la = oa2.f63018a;
        ResultKt.b(objA);
        List list3 = (List) objA;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(list3, 10));
        Iterator it3 = list3.iterator();
        while (it3.hasNext()) {
            arrayList2.add(new Long(c3250la.f64967d.getSerialNumberForUser((UserHandle) it3.next())));
        }
        S8 s82 = c3250la.f64968e;
        oa2.f63018a = c3250la;
        oa2.f63019b = list3;
        oa2.f63020c = arrayList2;
        oa2.f63023f = 2;
        s82.getClass();
        a80.e eVar = t70.y0.f88884a;
        Object objY = t70.m0.y(a80.d.f488c, new T8(s82, null), oa2);
        if (objY != coroutineSingletons) {
            c3250la2 = c3250la;
            list = arrayList2;
            list2 = list3;
            objA = objY;
            ArrayList arrayList3 = new ArrayList();
            while (r14.hasNext()) {
            }
            it = arrayList3.iterator();
            while (it.hasNext()) {
            }
            it2 = list2.iterator();
            c3250la3 = c3250la2;
            while (it2.hasNext()) {
            }
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0069, code lost:
    
        if (t70.k0.d(r8, r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(C3250la c3250la, UserHandle userHandle, Continuation continuation) {
        Ia ia2;
        c3250la.getClass();
        if (continuation instanceof Ia) {
            ia2 = (Ia) continuation;
            int i5 = ia2.f62678e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ia2.f62678e = i5 - Integer.MIN_VALUE;
            } else {
                ia2 = new Ia(c3250la, continuation);
            }
        }
        Object obj = ia2.f62676c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ia2.f62678e;
        if (i11 == 0) {
            ResultKt.b(obj);
            Ga ga2 = new Ga(c3250la.f64970g, null, userHandle);
            ia2.f62674a = c3250la;
            ia2.f62675b = userHandle;
            ia2.f62678e = 1;
            if (t70.k0.d(ga2, ia2) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        userHandle = (UserHandle) ia2.f62675b;
        c3250la = ia2.f62674a;
        ResultKt.b(obj);
        Ha ha2 = new Ha(c3250la.f64971h, null, userHandle);
        ia2.f62674a = null;
        ia2.f62675b = null;
        ia2.f62678e = 2;
    }

    public final void a() {
        this.f64966c.b();
        this.f64964a.unregisterReceiver(this.f64974k);
        this.f64973j.clear();
        this.f64972i.r(null);
    }

    public final void a(t70.j0 j0Var, t70.c0 c0Var, C3233ka c3233ka) {
        this.f64972i.j(t70.m0.s(j0Var, c0Var, t70.l0.f88814b, c3233ka));
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00a3, code lost:
    
        if (r14 == r1) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0118, code lost:
    
        if (t70.k0.d(r2, r0) != r1) goto L43;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v13, types: [java.util.Collection] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x00d8 -> B:36:0x00dd). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(UserHandle userHandle, Continuation<? super Unit> continuation) {
        g gVar;
        C3250la c3250la;
        List list;
        ArrayList arrayList;
        UserHandle userHandle2;
        Iterator it;
        Function2 hVar;
        if (continuation instanceof g) {
            gVar = (g) continuation;
            int i5 = gVar.f65038h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f65038h = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(continuation);
            }
        }
        Object objA = gVar.f65036f;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = gVar.f65038h;
        if (i11 == 0) {
            ResultKt.b(objA);
            S8 s82 = this.f64968e;
            long serialNumberForUser = this.f64967d.getSerialNumberForUser(userHandle);
            gVar.f65031a = this;
            gVar.f65032b = userHandle;
            gVar.f65038h = 1;
            s82.getClass();
            a80.e eVar = t70.y0.f88884a;
            if (t70.m0.y(a80.d.f488c, new W8(s82, serialNumberForUser, null), gVar) != obj) {
                c3250la = this;
            }
            return obj;
        }
        if (i11 == 1) {
            userHandle = (UserHandle) gVar.f65032b;
            c3250la = gVar.f65031a;
            ResultKt.b(objA);
        } else {
            if (i11 == 2) {
                userHandle = (UserHandle) gVar.f65032b;
                c3250la = gVar.f65031a;
                ResultKt.b(objA);
                list = (List) objA;
                arrayList = new ArrayList();
                userHandle2 = userHandle;
                it = list.iterator();
                if (it.hasNext()) {
                }
                return obj;
            }
            if (i11 == 3) {
                it = gVar.f65035e;
                ?? r22 = gVar.f65034d;
                List list2 = gVar.f65033c;
                UserHandle userHandle3 = (UserHandle) gVar.f65032b;
                C3250la c3250la2 = gVar.f65031a;
                ResultKt.b(objA);
                ArrayList arrayList2 = r22;
                c3250la = c3250la2;
                UserHandle userHandle4 = userHandle3;
                b70.d.z0((List) objA, arrayList2);
                list = list2;
                arrayList = arrayList2;
                userHandle2 = userHandle4;
                if (it.hasNext()) {
                    C3443x0 c3443x0 = (C3443x0) it.next();
                    InterfaceC3183ha interfaceC3183ha = c3250la.f64966c;
                    String str = c3443x0.f66253c;
                    gVar.f65031a = c3250la;
                    gVar.f65032b = userHandle2;
                    gVar.f65033c = list;
                    gVar.f65034d = arrayList;
                    gVar.f65035e = it;
                    gVar.f65038h = 3;
                    Object objB = interfaceC3183ha.b(str, userHandle2);
                    if (objB != obj) {
                        ArrayList arrayList3 = arrayList;
                        list2 = list;
                        objA = objB;
                        userHandle4 = userHandle2;
                        arrayList2 = arrayList3;
                        b70.d.z0((List) objA, arrayList2);
                        list = list2;
                        arrayList = arrayList2;
                        userHandle2 = userHandle4;
                        if (it.hasNext()) {
                            hVar = new h(userHandle2, list, arrayList, null);
                            e eVar2 = new e(c3250la.f64970g, null, hVar);
                            gVar.f65031a = c3250la;
                            gVar.f65032b = hVar;
                            gVar.f65033c = null;
                            gVar.f65034d = null;
                            gVar.f65035e = null;
                            gVar.f65038h = 4;
                            if (t70.k0.d(eVar2, gVar) != obj) {
                                f fVar = new f(c3250la.f64971h, null, hVar);
                                gVar.f65031a = null;
                                gVar.f65032b = null;
                                gVar.f65038h = 5;
                            }
                        }
                    }
                }
                return obj;
            }
            if (i11 != 4) {
                if (i11 == 5) {
                    ResultKt.b(objA);
                    return Unit.f71706a;
                }
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            hVar = (Function2) gVar.f65032b;
            c3250la = gVar.f65031a;
            ResultKt.b(objA);
            f fVar2 = new f(c3250la.f64971h, null, hVar);
            gVar.f65031a = null;
            gVar.f65032b = null;
            gVar.f65038h = 5;
        }
        InterfaceC3183ha interfaceC3183ha2 = c3250la.f64966c;
        gVar.f65031a = c3250la;
        gVar.f65032b = userHandle;
        gVar.f65038h = 2;
        objA = interfaceC3183ha2.a(null, userHandle);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0088, code lost:
    
        if (t70.k0.d(r2, r0) != r1) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, Continuation<? super Unit> continuation) {
        k kVar;
        C3250la c3250la;
        if (continuation instanceof k) {
            kVar = (k) continuation;
            int i5 = kVar.f65062e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f65062e = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(continuation);
            }
        }
        Object obj = kVar.f65060c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f65062e;
        if (i11 == 0) {
            ResultKt.b(obj);
            i iVar = new i(this.f64970g, null, j11);
            kVar.f65058a = this;
            kVar.f65059b = j11;
            kVar.f65062e = 1;
            if (t70.k0.d(iVar, kVar) != coroutineSingletons) {
                c3250la = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            j11 = kVar.f65059b;
            c3250la = kVar.f65058a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 == 3) {
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = kVar.f65059b;
            c3250la = kVar.f65058a;
            ResultKt.b(obj);
            j jVar = new j(c3250la.f64971h, null, j11);
            kVar.f65058a = null;
            kVar.f65062e = 3;
        }
        S8 s82 = c3250la.f64968e;
        kVar.f65058a = c3250la;
        kVar.f65059b = j11;
        kVar.f65062e = 2;
        s82.getClass();
        a80.e eVar = t70.y0.f88884a;
        if (t70.m0.y(a80.d.f488c, new U8(s82, j11, null), kVar) != coroutineSingletons) {
            j jVar2 = new j(c3250la.f64971h, null, j11);
            kVar.f65058a = null;
            kVar.f65062e = 3;
        }
        return coroutineSingletons;
    }
}
