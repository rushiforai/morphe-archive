package com.amplitude;

import android.content.Context;
import com.amplitude.android.sessionreplay.config.ConfigManager;
import com.amplitude.android.sessionreplay.config.RemoteConfig;
import com.amplitude.android.sessionreplay.config.RemoteConfigServer;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class W extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ConfigManager f20414a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f20415b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f20416c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function2 f20417d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public W(ConfigManager configManager, Context context, String str, Function2 function2, Continuation continuation) {
        super(2, continuation);
        this.f20414a = configManager;
        this.f20415b = context;
        this.f20416c = str;
        this.f20417d = function2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new W(this.f20414a, this.f20415b, this.f20416c, this.f20417d, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((W) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        RemoteConfig remoteConfigFetch;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        try {
            RemoteConfigServer remoteConfigServer = this.f20414a.remoteConfigServer;
            String str = this.f20414a.apiKey;
            String packageName = this.f20415b.getPackageName();
            Intrinsics.f(packageName, "getPackageName(...)");
            remoteConfigFetch = remoteConfigServer.fetch(str, packageName, this.f20416c, this.f20414a.storage);
        } catch (Exception e3) {
            this.f20414a.sessionReplayLogger.a(e3, new V(e3));
        }
        if (remoteConfigFetch == null) {
            this.f20414a.sessionReplayLogger.d(new T(this.f20414a));
            return Unit.f71706a;
        }
        this.f20414a.sessionReplayLogger.c(U.f20397a);
        this.f20414a.configSource = "remote";
        this.f20414a.updateConfigWithRemoteConfig$session_replay_release(remoteConfigFetch, this.f20417d);
        ConfigManager.logConfig$session_replay_release$default(this.f20414a, null, 1, null);
        return Unit.f71706a;
    }
}
