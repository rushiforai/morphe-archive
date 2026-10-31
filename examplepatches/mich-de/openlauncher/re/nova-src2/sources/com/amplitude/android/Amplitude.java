package com.amplitude.android;

import android.app.Application;
import android.content.Context;
import com.amplitude.android.diagnostics.AndroidDiagnosticsContextProvider;
import com.amplitude.android.migration.MigrationManager;
import com.amplitude.android.plugins.AnalyticsConnectorIdentityPlugin;
import com.amplitude.android.plugins.AnalyticsConnectorPlugin;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.amplitude.android.plugins.AndroidLifecyclePlugin;
import com.amplitude.android.plugins.AndroidNetworkConnectivityCheckerPlugin;
import com.amplitude.android.storage.AndroidStorageContextV3;
import com.amplitude.android.utilities.ActivityLifecycleObserver;
import com.amplitude.core.State;
import com.amplitude.core.diagnostics.DiagnosticsContextProvider;
import com.amplitude.core.platform.plugins.AmplitudeDestination;
import com.amplitude.core.platform.plugins.ContextPlugin;
import com.amplitude.core.platform.plugins.GetAmpliExtrasPlugin;
import com.amplitude.id.IdentityConfiguration;
import com.amplitude.id.IdentityStorageProvider;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.c0;
import t70.j0;
import t70.k0;
import t70.k1;
import t70.m0;
import t70.p0;

@Metadata(d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0016\u0018\u0000 ;2\u00020\u0001:\u0001;BA\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\n\u001a\u00020\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\b¢\u0006\u0004\b\f\u0010\rB\u0011\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\f\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u0015\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012H\u0014¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0014¢\u0006\u0004\b\u001a\u0010\u001bJ\u0018\u0010\u001d\u001a\u00020\u000f2\u0006\u0010\u001c\u001a\u00020\u0019H\u0094@¢\u0006\u0004\b\u001d\u0010\u001eJ\u0011\u0010 \u001a\u0004\u0018\u00010\u001fH\u0014¢\u0006\u0004\b \u0010!J\u000f\u0010#\u001a\u00020\"H\u0014¢\u0006\u0004\b#\u0010$J\u000f\u0010%\u001a\u00020\u0000H\u0016¢\u0006\u0004\b%\u0010&J\u0017\u0010)\u001a\u00020\u000f2\u0006\u0010(\u001a\u00020'H\u0007¢\u0006\u0004\b)\u0010*J\u0017\u0010+\u001a\u00020\u000f2\u0006\u0010(\u001a\u00020'H\u0007¢\u0006\u0004\b+\u0010*R\u001b\u00101\u001a\u00020,8@X\u0080\u0084\u0002¢\u0006\f\n\u0004\b-\u0010.\u001a\u0004\b/\u00100R\u0016\u00103\u001a\u0002028\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b3\u00104R\u0016\u00106\u001a\u0002058\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b6\u00107R\u0011\u0010:\u001a\u00020'8F¢\u0006\u0006\u001a\u0004\b8\u00109¨\u0006<"}, d2 = {"Lcom/amplitude/android/Amplitude;", "Lcom/amplitude/core/Amplitude;", "Lcom/amplitude/android/Configuration;", "configuration", "Lcom/amplitude/core/State;", "state", "Lt70/j0;", "amplitudeScope", "Lt70/c0;", "amplitudeDispatcher", "networkIODispatcher", "storageIODispatcher", "<init>", "(Lcom/amplitude/android/Configuration;Lcom/amplitude/core/State;Lt70/j0;Lt70/c0;Lt70/c0;Lt70/c0;)V", "(Lcom/amplitude/android/Configuration;)V", b.f42142b, "registerShutdownHook", "()V", "Lt70/p0;", b.f42142b, "build", "()Lt70/p0;", "Lcom/amplitude/android/Timeline;", "createTimeline", "()Lcom/amplitude/android/Timeline;", "Lcom/amplitude/id/IdentityConfiguration;", "createIdentityConfiguration", "()Lcom/amplitude/id/IdentityConfiguration;", "identityConfiguration", "buildInternal", "(Lcom/amplitude/id/IdentityConfiguration;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;", "diagnosticsContextProvider", "()Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;", "Ljava/io/File;", "diagnosticsStorageDirectory", "()Ljava/io/File;", "reset", "()Lcom/amplitude/android/Amplitude;", b.f42142b, "timestamp", "onEnterForeground", "(J)V", "onExitForeground", "Lcom/amplitude/android/AutocaptureManager;", "autocaptureManager$delegate", "Lkotlin/Lazy;", "getAutocaptureManager$android_release", "()Lcom/amplitude/android/AutocaptureManager;", "autocaptureManager", "Lcom/amplitude/android/utilities/ActivityLifecycleObserver;", "activityLifecycleCallbacks", "Lcom/amplitude/android/utilities/ActivityLifecycleObserver;", "Lcom/amplitude/android/plugins/AndroidContextPlugin;", "androidContextPlugin", "Lcom/amplitude/android/plugins/AndroidContextPlugin;", "getSessionId", "()J", "sessionId", k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class Amplitude extends com.amplitude.core.Amplitude {

    @NotNull
    public static final String END_SESSION_EVENT = "session_end";

    @NotNull
    public static final String START_SESSION_EVENT = "session_start";
    private ActivityLifecycleObserver activityLifecycleCallbacks;
    private AndroidContextPlugin androidContextPlugin;

    /* renamed from: autocaptureManager$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy autocaptureManager;

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.android.Amplitude", f = "Amplitude.kt", l = {108}, m = "buildInternal$suspendImpl")
    /* renamed from: com.amplitude.android.Amplitude$buildInternal$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        Object L$1;
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
            return Amplitude.buildInternal$suspendImpl(Amplitude.this, (IdentityConfiguration) null, (Continuation<? super Unit>) this);
        }
    }

    public Amplitude(Configuration configuration, State state, j0 j0Var, c0 c0Var, c0 c0Var2, c0 c0Var3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        j0 j0VarA = (i5 & 4) != 0 ? k0.a(m0.d()) : j0Var;
        if ((i5 & 8) != 0) {
            ExecutorService executorServiceNewCachedThreadPool = Executors.newCachedThreadPool();
            Intrinsics.f(executorServiceNewCachedThreadPool, "newCachedThreadPool(...)");
            c0Var = new k1(executorServiceNewCachedThreadPool);
        }
        c0 c0Var4 = c0Var;
        if ((i5 & 16) != 0) {
            ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
            Intrinsics.f(executorServiceNewSingleThreadExecutor, "newSingleThreadExecutor(...)");
            c0Var2 = new k1(executorServiceNewSingleThreadExecutor);
        }
        c0 c0Var5 = c0Var2;
        if ((i5 & 32) != 0) {
            ExecutorService executorServiceNewSingleThreadExecutor2 = Executors.newSingleThreadExecutor();
            Intrinsics.f(executorServiceNewSingleThreadExecutor2, "newSingleThreadExecutor(...)");
            c0Var3 = new k1(executorServiceNewSingleThreadExecutor2);
        }
        this(configuration, state, j0VarA, c0Var4, c0Var5, c0Var3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object buildInternal$suspendImpl(Amplitude amplitude, IdentityConfiguration identityConfiguration, Continuation<? super Unit> continuation) {
        AnonymousClass1 anonymousClass1;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = amplitude.new AnonymousClass1(continuation);
            }
        }
        Object obj = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            MigrationManager migrationManager = new MigrationManager(amplitude);
            anonymousClass1.L$0 = amplitude;
            anonymousClass1.L$1 = identityConfiguration;
            anonymousClass1.label = 1;
            if (migrationManager.migrateOldStorage(anonymousClass1) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            identityConfiguration = (IdentityConfiguration) anonymousClass1.L$1;
            amplitude = (Amplitude) anonymousClass1.L$0;
            ResultKt.b(obj);
        }
        amplitude.createIdentityContainer(identityConfiguration);
        if (!Intrinsics.b(amplitude.getConfiguration().getOffline(), AndroidNetworkConnectivityCheckerPlugin.INSTANCE.getDisabled())) {
            amplitude.add(new AndroidNetworkConnectivityCheckerPlugin());
        }
        AndroidContextPlugin androidContextPlugin = amplitude.androidContextPlugin;
        if (androidContextPlugin == null) {
            Intrinsics.m("androidContextPlugin");
            throw null;
        }
        amplitude.add(androidContextPlugin);
        amplitude.add(new GetAmpliExtrasPlugin());
        ActivityLifecycleObserver activityLifecycleObserver = amplitude.activityLifecycleCallbacks;
        if (activityLifecycleObserver == null) {
            Intrinsics.m("activityLifecycleCallbacks");
            throw null;
        }
        amplitude.add(new AndroidLifecyclePlugin(activityLifecycleObserver));
        amplitude.add(new AnalyticsConnectorIdentityPlugin());
        amplitude.add(new AnalyticsConnectorPlugin());
        amplitude.add(new AmplitudeDestination());
        com.amplitude.core.platform.Timeline timeline = amplitude.getTimeline();
        Intrinsics.e(timeline, "null cannot be cast to non-null type com.amplitude.android.Timeline");
        ((Timeline) timeline).start$android_release();
        return Unit.f71706a;
    }

    private final void registerShutdownHook() {
        try {
            Runtime.getRuntime().addShutdownHook(new Thread() { // from class: com.amplitude.android.Amplitude.registerShutdownHook.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    com.amplitude.core.platform.Timeline timeline = Amplitude.this.getTimeline();
                    Intrinsics.e(timeline, "null cannot be cast to non-null type com.amplitude.android.Timeline");
                    ((Timeline) timeline).stop$android_release();
                }
            });
        } catch (IllegalStateException unused) {
        }
    }

    @Override // com.amplitude.core.Amplitude
    @NotNull
    public p0 build() {
        this.activityLifecycleCallbacks = new ActivityLifecycleObserver();
        this.androidContextPlugin = new AndroidContextPlugin();
        return super.build();
    }

    @Override // com.amplitude.core.Amplitude
    @Nullable
    public Object buildInternal(@NotNull IdentityConfiguration identityConfiguration, @NotNull Continuation<? super Unit> continuation) {
        return buildInternal$suspendImpl(this, identityConfiguration, continuation);
    }

    @Override // com.amplitude.core.Amplitude
    @NotNull
    public IdentityConfiguration createIdentityConfiguration() {
        com.amplitude.core.Configuration configuration = getConfiguration();
        Intrinsics.e(configuration, "null cannot be cast to non-null type com.amplitude.android.Configuration");
        Configuration configuration2 = (Configuration) configuration;
        String instanceName = configuration2.getInstanceName();
        String apiKey = configuration2.getApiKey();
        IdentityStorageProvider identityStorageProvider = configuration2.getIdentityStorageProvider();
        AndroidStorageContextV3 androidStorageContextV3 = AndroidStorageContextV3.INSTANCE;
        return new IdentityConfiguration(instanceName, apiKey, null, identityStorageProvider, androidStorageContextV3.getIdentityStorageDirectory(configuration2), androidStorageContextV3.getIdentityStorageFileName(), configuration2.getLoggerProvider().getLogger(this), 4, null);
    }

    @Override // com.amplitude.core.Amplitude
    @Nullable
    public DiagnosticsContextProvider diagnosticsContextProvider() {
        com.amplitude.core.Configuration configuration = getConfiguration();
        Intrinsics.e(configuration, "null cannot be cast to non-null type com.amplitude.android.Configuration");
        return new AndroidDiagnosticsContextProvider(((Configuration) configuration).getContext());
    }

    @Override // com.amplitude.core.Amplitude
    @NotNull
    public File diagnosticsStorageDirectory() {
        com.amplitude.core.Configuration configuration = getConfiguration();
        Intrinsics.e(configuration, "null cannot be cast to non-null type com.amplitude.android.Configuration");
        return ((Configuration) configuration).getStorageDirectory$android_release();
    }

    @NotNull
    public final AutocaptureManager getAutocaptureManager$android_release() {
        return (AutocaptureManager) this.autocaptureManager.getValue();
    }

    public final long getSessionId() {
        com.amplitude.core.platform.Timeline timeline = getTimeline();
        Intrinsics.e(timeline, "null cannot be cast to non-null type com.amplitude.android.Timeline");
        return ((Timeline) timeline).getSessionId();
    }

    @GuardedAmplitudeFeature
    public final void onEnterForeground(long timestamp) {
        com.amplitude.core.platform.Timeline timeline = getTimeline();
        Intrinsics.e(timeline, "null cannot be cast to non-null type com.amplitude.android.Timeline");
        ((Timeline) timeline).onEnterForeground$android_release(timestamp);
    }

    @GuardedAmplitudeFeature
    public final void onExitForeground(long timestamp) {
        com.amplitude.core.platform.Timeline timeline = getTimeline();
        Intrinsics.e(timeline, "null cannot be cast to non-null type com.amplitude.android.Timeline");
        ((Timeline) timeline).onExitForeground$android_release(timestamp);
    }

    @Override // com.amplitude.core.Amplitude
    @NotNull
    public Timeline createTimeline() {
        Timeline timeline = new Timeline(getConfiguration().getSessionId());
        timeline.setAmplitude(this);
        return timeline;
    }

    @Override // com.amplitude.core.Amplitude
    @NotNull
    public Amplitude reset() {
        setUserId(null);
        if (!getIsBuilt().isCompleted()) {
            setDeviceId(ContextPlugin.INSTANCE.generateRandomDeviceId());
            return this;
        }
        AndroidContextPlugin androidContextPlugin = this.androidContextPlugin;
        if (androidContextPlugin == null) {
            Intrinsics.m("androidContextPlugin");
            throw null;
        }
        com.amplitude.core.Configuration configuration = getConfiguration();
        Intrinsics.e(configuration, "null cannot be cast to non-null type com.amplitude.android.Configuration");
        androidContextPlugin.initializeDeviceId((Configuration) configuration, true);
        return this;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Amplitude(@NotNull final Configuration configuration, @NotNull State state, @NotNull j0 amplitudeScope, @NotNull c0 amplitudeDispatcher, @NotNull c0 networkIODispatcher, @NotNull c0 storageIODispatcher) {
        super(configuration, state, amplitudeScope, amplitudeDispatcher, networkIODispatcher, storageIODispatcher);
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(state, "state");
        Intrinsics.g(amplitudeScope, "amplitudeScope");
        Intrinsics.g(amplitudeDispatcher, "amplitudeDispatcher");
        Intrinsics.g(networkIODispatcher, "networkIODispatcher");
        Intrinsics.g(storageIODispatcher, "storageIODispatcher");
        this.autocaptureManager = LazyKt.a(new Function0<AutocaptureManager>() { // from class: com.amplitude.android.Amplitude$autocaptureManager$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final AutocaptureManager invoke() {
                Configuration configuration2 = configuration;
                return new AutocaptureManager(configuration2.getAutocapture(), configuration2.getInteractionsOptions(), configuration2.getEnableAutocaptureRemoteConfig() ? this.getRemoteConfigClient() : null, this.getLogger(), this.getDiagnosticsClient());
            }
        });
        registerShutdownHook();
        Context context = configuration.getContext();
        Intrinsics.e(context, "null cannot be cast to non-null type android.app.Application");
        Application application = (Application) context;
        ActivityLifecycleObserver activityLifecycleObserver = this.activityLifecycleCallbacks;
        if (activityLifecycleObserver != null) {
            application.registerActivityLifecycleCallbacks(activityLifecycleObserver);
        } else {
            Intrinsics.m("activityLifecycleCallbacks");
            throw null;
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public Amplitude(@NotNull Configuration configuration) {
        this(configuration, new State(), null, null, null, null, 60, null);
        Intrinsics.g(configuration, "configuration");
    }
}
