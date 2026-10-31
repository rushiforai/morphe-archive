package nova.branch.engage.sesame_lite.internal;

import android.app.AppOpsManager;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Build;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.ListenersKt;
import org.jetbrains.annotations.NotNull;
import w70.u1;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a'\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007\u001a)\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000b0\u00052\u0006\u0010\t\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\n¢\u0006\u0004\b\r\u0010\u000e\u001a+\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00150\u00052\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b\u0016\u0010\u0017¨\u0006\u0018"}, d2 = {"Landroid/content/ContentResolver;", "Landroid/net/Uri;", "uri", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "notifyForDescendants", "Lw70/m;", "observe", "(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lw70/m;", "Landroid/app/AppOpsManager;", "appOpsManager", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ops", "getAppOpsChangeFlow", "(Landroid/app/AppOpsManager;Ljava/util/List;)Lw70/m;", "Landroid/content/Context;", "context", "Landroid/content/IntentFilter;", "intentFilter", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "flags", "Landroid/content/Intent;", "broadcastReceiverFlow", "(Landroid/content/Context;Landroid/content/IntentFilter;I)Lw70/m;", "sesame-lite_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ListenersKt {

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lv70/x;", "Landroid/content/Intent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lv70/x;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.ListenersKt$broadcastReceiverFlow$1", f = "Listeners.kt", l = {59}, m = "invokeSuspend")
    /* renamed from: nova.branch.engage.sesame_lite.internal.ListenersKt$broadcastReceiverFlow$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<v70.x, Continuation<? super Unit>, Object> {
        final /* synthetic */ Context $context;
        final /* synthetic */ int $flags;
        final /* synthetic */ IntentFilter $intentFilter;
        private /* synthetic */ Object L$0;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass1(Context context, IntentFilter intentFilter, int i5, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.$context = context;
            this.$intentFilter = intentFilter;
            this.$flags = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final Unit invokeSuspend$lambda$0(Context context, ListenersKt$broadcastReceiverFlow$1$receiver$1 listenersKt$broadcastReceiverFlow$1$receiver$1) {
            context.unregisterReceiver(listenersKt$broadcastReceiverFlow$1$receiver$1);
            return Unit.f71706a;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.$context, this.$intentFilter, this.$flags, continuation);
            anonymousClass1.L$0 = obj;
            return anonymousClass1;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                final v70.x xVar = (v70.x) this.L$0;
                BroadcastReceiver broadcastReceiver = new BroadcastReceiver() { // from class: nova.branch.engage.sesame_lite.internal.ListenersKt$broadcastReceiverFlow$1$receiver$1
                    @Override // android.content.BroadcastReceiver
                    public void onReceive(Context context, Intent intent) {
                        Intrinsics.g(context, "context");
                        Intrinsics.g(intent, "intent");
                        ((v70.w) xVar).j(intent);
                    }
                };
                if (Build.VERSION.SDK_INT >= 33) {
                    this.$context.registerReceiver(broadcastReceiver, this.$intentFilter, this.$flags);
                } else {
                    this.$context.registerReceiver(broadcastReceiver, this.$intentFilter);
                }
                k kVar = new k(0, this.$context, broadcastReceiver);
                this.label = 1;
                if (v70.v.a(xVar, kVar, this) == coroutineSingletons) {
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

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(v70.x xVar, Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(xVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lv70/x;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lv70/x;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.ListenersKt$getAppOpsChangeFlow$1", f = "Listeners.kt", l = {38}, m = "invokeSuspend")
    /* renamed from: nova.branch.engage.sesame_lite.internal.ListenersKt$getAppOpsChangeFlow$1, reason: invalid class name and case insensitive filesystem */
    public static final class C35171 extends SuspendLambda implements Function2<v70.x, Continuation<? super Unit>, Object> {
        final /* synthetic */ AppOpsManager $appOpsManager;
        final /* synthetic */ List<String> $ops;
        private /* synthetic */ Object L$0;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C35171(List<String> list, AppOpsManager appOpsManager, Continuation<? super C35171> continuation) {
            super(2, continuation);
            this.$ops = list;
            this.$appOpsManager = appOpsManager;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void invokeSuspend$lambda$0(v70.x xVar, String str, String str2) {
            Intrinsics.d(str);
            ((v70.w) xVar).j(str);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final Unit invokeSuspend$lambda$1(AppOpsManager appOpsManager, AppOpsManager.OnOpChangedListener onOpChangedListener) {
            appOpsManager.stopWatchingMode(onOpChangedListener);
            return Unit.f71706a;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C35171 c35171 = new C35171(this.$ops, this.$appOpsManager, continuation);
            c35171.L$0 = obj;
            return c35171;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                final v70.x xVar = (v70.x) this.L$0;
                AppOpsManager.OnOpChangedListener onOpChangedListener = new AppOpsManager.OnOpChangedListener() { // from class: nova.branch.engage.sesame_lite.internal.l
                    @Override // android.app.AppOpsManager.OnOpChangedListener
                    public final void onOpChanged(String str, String str2) {
                        ListenersKt.C35171.invokeSuspend$lambda$0(xVar, str, str2);
                    }
                };
                Iterator<String> it = this.$ops.iterator();
                while (it.hasNext()) {
                    this.$appOpsManager.startWatchingMode(it.next(), null, onOpChangedListener);
                }
                k kVar = new k(1, this.$appOpsManager, onOpChangedListener);
                this.label = 1;
                if (v70.v.a(xVar, kVar, this) == coroutineSingletons) {
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

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(v70.x xVar, Continuation<? super Unit> continuation) {
            return ((C35171) create(xVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lv70/x;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lv70/x;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.ListenersKt$observe$1", f = "Listeners.kt", l = {27}, m = "invokeSuspend")
    /* renamed from: nova.branch.engage.sesame_lite.internal.ListenersKt$observe$1, reason: invalid class name and case insensitive filesystem */
    /* loaded from: classes5.dex */
    public static final class C35181 extends SuspendLambda implements Function2<v70.x, Continuation<? super Unit>, Object> {
        final /* synthetic */ boolean $notifyForDescendants;
        final /* synthetic */ ContentResolver $this_observe;
        final /* synthetic */ Uri $uri;
        private /* synthetic */ Object L$0;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C35181(ContentResolver contentResolver, Uri uri, boolean z11, Continuation<? super C35181> continuation) {
            super(2, continuation);
            this.$this_observe = contentResolver;
            this.$uri = uri;
            this.$notifyForDescendants = z11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final Unit invokeSuspend$lambda$0(ContentResolver contentResolver, ListenersKt$observe$1$listener$1 listenersKt$observe$1$listener$1) {
            contentResolver.unregisterContentObserver(listenersKt$observe$1$listener$1);
            return Unit.f71706a;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C35181 c35181 = new C35181(this.$this_observe, this.$uri, this.$notifyForDescendants, continuation);
            c35181.L$0 = obj;
            return c35181;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r1v1, types: [android.database.ContentObserver, nova.branch.engage.sesame_lite.internal.ListenersKt$observe$1$listener$1] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                final v70.x xVar = (v70.x) this.L$0;
                final ?? r12 = new ContentObserver() { // from class: nova.branch.engage.sesame_lite.internal.ListenersKt$observe$1$listener$1
                    {
                        super(null);
                    }

                    @Override // android.database.ContentObserver
                    public void onChange(boolean selfChange) {
                        ((v70.w) xVar).j(Boolean.valueOf(selfChange));
                    }
                };
                this.$this_observe.registerContentObserver(this.$uri, this.$notifyForDescendants, r12);
                final ContentResolver contentResolver = this.$this_observe;
                Function0 function0 = new Function0() { // from class: nova.branch.engage.sesame_lite.internal.m
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return ListenersKt.C35181.invokeSuspend$lambda$0(contentResolver, r12);
                    }
                };
                this.label = 1;
                if (v70.v.a(xVar, function0, this) == coroutineSingletons) {
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

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(v70.x xVar, Continuation<? super Unit> continuation) {
            return ((C35181) create(xVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @NotNull
    public static final w70.m broadcastReceiverFlow(@NotNull Context context, @NotNull IntentFilter intentFilter, int i5) {
        Intrinsics.g(context, "context");
        Intrinsics.g(intentFilter, "intentFilter");
        return u1.f(new AnonymousClass1(context, intentFilter, i5, null));
    }

    @NotNull
    public static final w70.m getAppOpsChangeFlow(@NotNull AppOpsManager appOpsManager, @NotNull List<String> ops) {
        Intrinsics.g(appOpsManager, "appOpsManager");
        Intrinsics.g(ops, "ops");
        return u1.f(new C35171(ops, appOpsManager, null));
    }

    @NotNull
    public static final w70.m observe(@NotNull ContentResolver contentResolver, @NotNull Uri uri, boolean z11) {
        Intrinsics.g(contentResolver, "<this>");
        Intrinsics.g(uri, "uri");
        return u1.f(new C35181(contentResolver, uri, z11, null));
    }
}
