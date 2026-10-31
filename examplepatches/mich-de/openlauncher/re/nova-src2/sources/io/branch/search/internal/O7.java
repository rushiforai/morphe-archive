package io.branch.search.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.UserHandle;
import io.branch.search.internal.InterfaceC3183ha;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class O7 extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ P7 f63014a;

    @DebugMetadata(c = "io.branch.search.internal.sync.InProcessPackageSourceLoader$receiver$1$onReceive$1", f = "InProcessPackageSourceLoader.kt", l = {}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Intent f63015a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ P7 f63016b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Intent intent, P7 p72, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f63015a = intent;
            this.f63016b = p72;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new a(this.f63015a, this.f63016b, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new a(this.f63015a, this.f63016b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            String action = this.f63015a.getAction();
            if (action != null) {
                int iHashCode = action.hashCode();
                if (iHashCode != -1238404651) {
                    if (iHashCode != -864107122) {
                        if (iHashCode != -385593787) {
                            if (iHashCode == 1051477093 && action.equals("android.intent.action.MANAGED_PROFILE_REMOVED")) {
                                UserHandle userHandle = Build.VERSION.SDK_INT >= 33 ? (UserHandle) this.f63015a.getParcelableExtra("android.intent.extra.USER", UserHandle.class) : (UserHandle) this.f63015a.getParcelableExtra("android.intent.extra.USER");
                                if (userHandle == null) {
                                    return null;
                                }
                                InterfaceC3183ha.a aVar = this.f63016b.f63079h;
                                if (aVar != null) {
                                    aVar.b(userHandle);
                                    Unit unit = Unit.f71706a;
                                }
                                return Unit.f71706a;
                            }
                        } else if (action.equals("android.intent.action.MANAGED_PROFILE_ADDED")) {
                            UserHandle userHandle2 = Build.VERSION.SDK_INT >= 33 ? (UserHandle) this.f63015a.getParcelableExtra("android.intent.extra.USER", UserHandle.class) : (UserHandle) this.f63015a.getParcelableExtra("android.intent.extra.USER");
                            if (userHandle2 == null) {
                                return null;
                            }
                            InterfaceC3183ha.a aVar2 = this.f63016b.f63079h;
                            if (aVar2 != null) {
                                aVar2.a(userHandle2);
                                Unit unit2 = Unit.f71706a;
                            }
                            return Unit.f71706a;
                        }
                    } else if (action.equals("android.intent.action.MANAGED_PROFILE_AVAILABLE")) {
                        UserHandle userHandle3 = Build.VERSION.SDK_INT >= 33 ? (UserHandle) this.f63015a.getParcelableExtra("android.intent.extra.USER", UserHandle.class) : (UserHandle) this.f63015a.getParcelableExtra("android.intent.extra.USER");
                        if (userHandle3 == null) {
                            return null;
                        }
                        InterfaceC3183ha.a aVar3 = this.f63016b.f63079h;
                        if (aVar3 != null) {
                            aVar3.c(userHandle3);
                            Unit unit3 = Unit.f71706a;
                        }
                        return Unit.f71706a;
                    }
                } else if (action.equals("android.intent.action.MANAGED_PROFILE_UNAVAILABLE")) {
                    UserHandle userHandle4 = Build.VERSION.SDK_INT >= 33 ? (UserHandle) this.f63015a.getParcelableExtra("android.intent.extra.USER", UserHandle.class) : (UserHandle) this.f63015a.getParcelableExtra("android.intent.extra.USER");
                    if (userHandle4 == null) {
                        return null;
                    }
                    InterfaceC3183ha.a aVar4 = this.f63016b.f63079h;
                    if (aVar4 != null) {
                        aVar4.d(userHandle4);
                        Unit unit4 = Unit.f71706a;
                    }
                }
            }
            return Unit.f71706a;
        }
    }

    public O7(P7 p72) {
        this.f63014a = p72;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(@NotNull Context context, @NotNull Intent intent) throws Throwable {
        Intrinsics.g(context, "context");
        Intrinsics.g(intent, "intent");
        t70.m0.u(EmptyCoroutineContext.f71803a, new a(intent, this.f63014a, null));
    }
}
