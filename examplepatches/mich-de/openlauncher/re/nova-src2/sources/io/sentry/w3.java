package io.sentry;

import java.io.File;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.net.ssl.SSLSocketFactory;
import org.jetbrains.annotations.ApiStatus;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.TestOnly;

/* loaded from: classes4.dex */
public class w3 {
    static final g3 DEFAULT_DIAGNOSTIC_LEVEL = g3.DEBUG;
    private static final String DEFAULT_ENVIRONMENT = "production";

    @ApiStatus.Internal
    @NotNull
    public static final String DEFAULT_PROPAGATION_TARGETS = ".*";
    private boolean attachServerName;
    private boolean attachStacktrace;
    private boolean attachThreads;

    @NotNull
    private io.sentry.backpressure.a backpressureMonitor;

    @Nullable
    private l3 beforeBreadcrumb;

    @Nullable
    private m3 beforeEmitMetricCallback;

    @Nullable
    private n3 beforeEnvelopeCallback;

    @Nullable
    private o3 beforeSend;

    @Nullable
    private p3 beforeSendReplay;

    @Nullable
    private q3 beforeSendTransaction;

    @NotNull
    private final Set<String> bundleIds;

    @Nullable
    private String cacheDirPath;

    @NotNull
    io.sentry.clientreport.f clientReportRecorder;

    @NotNull
    private e0 connectionStatusProvider;
    private int connectionTimeoutMillis;

    @NotNull
    private final List<String> contextTags;

    @ApiStatus.Experimental
    @Nullable
    private r3 cron;

    @ApiStatus.Internal
    @NotNull
    private final io.sentry.util.c dateProvider;
    private boolean debug;

    @NotNull
    private io.sentry.internal.debugmeta.a debugMetaLoader;

    @NotNull
    private final List<String> defaultTracePropagationTargets;

    @NotNull
    private g3 diagnosticLevel;

    @Nullable
    private String dist;

    @Nullable
    private String distinctId;

    @Nullable
    private String dsn;

    @Nullable
    private String dsnHash;
    private boolean enableAppStartProfiling;
    private boolean enableAutoSessionTracking;
    private boolean enableBackpressureHandling;
    private boolean enableDeduplication;
    private boolean enableDefaultTagsForMetrics;
    private boolean enableExternalConfiguration;
    private boolean enableMetrics;
    private boolean enablePrettySerializationOutput;
    private boolean enableScopePersistence;

    @ApiStatus.Experimental
    private boolean enableScreenTracking;
    private boolean enableShutdownHook;
    private boolean enableSpanLocalMetricAggregation;
    private boolean enableSpotlight;
    private boolean enableTimeToFullDisplayTracing;

    @Nullable
    private Boolean enableTracing;
    private boolean enableUncaughtExceptionHandler;
    private boolean enableUserInteractionBreadcrumbs;
    private boolean enableUserInteractionTracing;
    private boolean enabled;

    @NotNull
    private io.sentry.cache.c envelopeDiskCache;

    @NotNull
    private final io.sentry.util.c envelopeReader;

    @Nullable
    private String environment;

    @NotNull
    private final List<t> eventProcessors;

    @NotNull
    private o0 executorService;

    @NotNull
    private final u experimental;
    private long flushTimeoutMillis;

    @NotNull
    private w fullyDisplayedReporter;

    @NotNull
    private final List<io.sentry.internal.gestures.a> gestureTargetLocators;

    @Nullable
    private Long idleTimeout;

    @ApiStatus.Experimental
    @Nullable
    private List<String> ignoredCheckIns;

    @NotNull
    private final Set<Class<? extends Throwable>> ignoredExceptionsForType;

    @NotNull
    private final List<String> inAppExcludes;

    @NotNull
    private final List<String> inAppIncludes;

    @NotNull
    private u0 instrumenter;

    @NotNull
    private final List<v0> integrations;

    @NotNull
    private ILogger logger;

    @NotNull
    private io.sentry.util.thread.a mainThreadChecker;
    private long maxAttachmentSize;
    private int maxBreadcrumbs;
    private int maxCacheItems;
    private int maxDepth;
    private int maxQueueSize;

    @NotNull
    private u3 maxRequestBodySize;
    private int maxSpans;
    private long maxTraceFileSize;

    @NotNull
    private io.sentry.internal.modules.a modulesLoader;

    @NotNull
    private final List<n0> observers;

    @NotNull
    private final List<i0> optionsObservers;

    @NotNull
    private final io.sentry.util.c parsedDsn;

    @NotNull
    private final List<j0> performanceCollectors;
    private boolean printUncaughtStackTrace;

    @Nullable
    private Double profilesSampleRate;

    @Nullable
    private s3 profilesSampler;
    private int profilingTracesHz;

    @Nullable
    private String proguardUuid;

    @Nullable
    private t3 proxy;
    private int readTimeoutMillis;

    @Nullable
    private String release;

    @NotNull
    private e2 replayController;

    @Nullable
    private Double sampleRate;

    @Nullable
    private io.sentry.protocol.s sdkVersion;
    private boolean sendClientReports;
    private boolean sendDefaultPii;
    private boolean sendModules;

    @Nullable
    private String sentryClientName;

    @NotNull
    private final io.sentry.util.c serializer;

    @Nullable
    private String serverName;
    private long sessionFlushTimeoutMillis;
    private long sessionTrackingIntervalMillis;
    private long shutdownTimeoutMillis;

    @Nullable
    private String spotlightConnectionUrl;

    @Nullable
    private SSLSocketFactory sslSocketFactory;

    @NotNull
    private final Map<String, String> tags;
    private boolean traceOptionsRequests;

    @Nullable
    private List<String> tracePropagationTargets;
    private boolean traceSampling;

    @Nullable
    private Double tracesSampleRate;

    @Nullable
    private v3 tracesSampler;

    @NotNull
    private t4 transactionPerformanceCollector;

    @NotNull
    private s0 transactionProfiler;

    @NotNull
    private t0 transportFactory;

    @NotNull
    private io.sentry.transport.g transportGate;

    @NotNull
    private final List<Object> viewHierarchyExporters;

    /* JADX WARN: Multi-variable type inference failed */
    public w3(boolean z11) {
        CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
        this.eventProcessors = copyOnWriteArrayList;
        this.ignoredExceptionsForType = new CopyOnWriteArraySet();
        CopyOnWriteArrayList copyOnWriteArrayList2 = new CopyOnWriteArrayList();
        this.integrations = copyOnWriteArrayList2;
        this.bundleIds = new CopyOnWriteArraySet();
        final int i5 = 0;
        this.parsedDsn = new io.sentry.util.c(new io.sentry.util.b(this) { // from class: io.sentry.k3

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ w3 f67373b;

            {
                this.f67373b = this;
            }

            @Override // io.sentry.util.b
            public final Object a() {
                switch (i5) {
                    case 0:
                        return w3.a(this.f67373b);
                    case 1:
                        return new j1(this.f67373b);
                    default:
                        return w3.b(this.f67373b);
                }
            }
        });
        this.shutdownTimeoutMillis = 2000L;
        this.flushTimeoutMillis = 15000L;
        this.sessionFlushTimeoutMillis = 15000L;
        this.logger = s1.f67764a;
        this.diagnosticLevel = DEFAULT_DIAGNOSTIC_LEVEL;
        final int i11 = 1;
        this.serializer = new io.sentry.util.c(new io.sentry.util.b(this) { // from class: io.sentry.k3

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ w3 f67373b;

            {
                this.f67373b = this;
            }

            @Override // io.sentry.util.b
            public final Object a() {
                switch (i11) {
                    case 0:
                        return w3.a(this.f67373b);
                    case 1:
                        return new j1(this.f67373b);
                    default:
                        return w3.b(this.f67373b);
                }
            }
        });
        final int i12 = 2;
        this.envelopeReader = new io.sentry.util.c(new io.sentry.util.b(this) { // from class: io.sentry.k3

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ w3 f67373b;

            {
                this.f67373b = this;
            }

            @Override // io.sentry.util.b
            public final Object a() {
                switch (i12) {
                    case 0:
                        return w3.a(this.f67373b);
                    case 1:
                        return new j1(this.f67373b);
                    default:
                        return w3.b(this.f67373b);
                }
            }
        });
        this.maxDepth = 100;
        this.maxCacheItems = 30;
        this.maxQueueSize = 30;
        this.maxBreadcrumbs = 100;
        this.inAppExcludes = new CopyOnWriteArrayList();
        this.inAppIncludes = new CopyOnWriteArrayList();
        this.transportFactory = x1.f67907a;
        this.transportGate = io.sentry.transport.d.f67798b;
        this.attachStacktrace = true;
        this.enableAutoSessionTracking = true;
        this.sessionTrackingIntervalMillis = 30000L;
        this.attachServerName = true;
        this.enableUncaughtExceptionHandler = true;
        this.printUncaughtStackTrace = false;
        this.executorService = t1.f67772c;
        this.connectionTimeoutMillis = 5000;
        this.readTimeoutMillis = 5000;
        this.envelopeDiskCache = io.sentry.transport.h.f67804a;
        this.sendDefaultPii = false;
        this.observers = new CopyOnWriteArrayList();
        this.optionsObservers = new CopyOnWriteArrayList();
        this.tags = new ConcurrentHashMap();
        this.maxAttachmentSize = 20971520L;
        this.enableDeduplication = true;
        this.maxSpans = 1000;
        this.enableShutdownHook = true;
        this.maxRequestBodySize = u3.NONE;
        this.traceSampling = true;
        this.maxTraceFileSize = 5242880L;
        this.transactionProfiler = t1.f67774e;
        this.tracePropagationTargets = null;
        this.defaultTracePropagationTargets = Collections.singletonList(DEFAULT_PROPAGATION_TARGETS);
        this.idleTimeout = 3000L;
        this.contextTags = new CopyOnWriteArrayList();
        this.sendClientReports = true;
        this.clientReportRecorder = new io.sentry.internal.debugmeta.c(this);
        this.modulesLoader = io.sentry.internal.modules.e.f67341a;
        this.debugMetaLoader = io.sentry.internal.debugmeta.b.f67326a;
        this.enableUserInteractionTracing = false;
        this.enableUserInteractionBreadcrumbs = true;
        this.instrumenter = u0.SENTRY;
        this.gestureTargetLocators = new ArrayList();
        this.viewHierarchyExporters = new ArrayList();
        this.mainThreadChecker = io.sentry.util.thread.c.f67837a;
        this.traceOptionsRequests = true;
        this.dateProvider = new io.sentry.util.c(new ge.d(15));
        this.performanceCollectors = new ArrayList();
        this.transactionPerformanceCollector = t1.f67773d;
        this.enableTimeToFullDisplayTracing = false;
        this.fullyDisplayedReporter = w.f67892b;
        this.connectionStatusProvider = new p1();
        this.enabled = true;
        this.enablePrettySerializationOutput = true;
        this.sendModules = true;
        this.enableSpotlight = false;
        this.enableScopePersistence = true;
        this.ignoredCheckIns = null;
        this.backpressureMonitor = io.sentry.backpressure.b.f67126a;
        this.enableBackpressureHandling = true;
        this.enableAppStartProfiling = false;
        this.enableMetrics = false;
        this.enableDefaultTagsForMetrics = true;
        this.enableSpanLocalMetricAggregation = true;
        this.profilingTracesHz = 101;
        this.cron = null;
        this.replayController = t1.f67771b;
        this.enableScreenTracking = true;
        u uVar = new u();
        tm.o oVar = new tm.o(26, (boolean) (null == true ? 1 : 0));
        CopyOnWriteArraySet copyOnWriteArraySet = new CopyOnWriteArraySet();
        oVar.f89495d = copyOnWriteArraySet;
        CopyOnWriteArraySet copyOnWriteArraySet2 = new CopyOnWriteArraySet();
        oVar.f89496e = copyOnWriteArraySet2;
        z3 z3Var = z3.LOW;
        if (!z11) {
            copyOnWriteArraySet.add("android.widget.TextView");
            copyOnWriteArraySet2.remove("android.widget.TextView");
            copyOnWriteArraySet.add("android.widget.ImageView");
            copyOnWriteArraySet2.remove("android.widget.ImageView");
            copyOnWriteArraySet.add("android.webkit.WebView");
            copyOnWriteArraySet.add("android.widget.VideoView");
            copyOnWriteArraySet.add("androidx.media3.ui.PlayerView");
            copyOnWriteArraySet.add("com.google.android.exoplayer2.ui.PlayerView");
            copyOnWriteArraySet.add("com.google.android.exoplayer2.ui.StyledPlayerView");
        }
        uVar.f67822a = oVar;
        this.experimental = uVar;
        if (z11) {
            return;
        }
        this.executorService = new gu.j(22, (byte) 0);
        copyOnWriteArrayList2.add(new UncaughtExceptionHandlerIntegration());
        copyOnWriteArrayList2.add(new ShutdownHookIntegration());
        copyOnWriteArrayList.add(new k1(this));
        copyOnWriteArrayList.add(new j(this));
        if (!io.sentry.util.e.f67828a) {
            copyOnWriteArrayList.add(new a4());
        }
        setSentryClientName("branch.sentry.java/7.18.0-bnc.1");
        io.sentry.protocol.s sVar = new io.sentry.protocol.s("branch.sentry.java", "7.18.0-bnc.1");
        sVar.f67609b = "7.18.0-bnc.1";
        setSdkVersion(sVar);
        e3 e3VarM = e3.m();
        e3VarM.getClass();
        ((CopyOnWriteArraySet) e3VarM.f67209c).add(new io.sentry.protocol.v("maven:io.sentry:sentry", "7.18.0-bnc.1"));
    }

    public static /* synthetic */ q a(w3 w3Var) {
        return new q(w3Var.dsn);
    }

    public static /* synthetic */ r b(w3 w3Var) {
        return new r((p0) w3Var.serializer.a());
    }

    @ApiStatus.Internal
    @NotNull
    public static w3 empty() {
        return new w3(true);
    }

    public void addBundleId(@Nullable String str) {
        if (str != null) {
            String strTrim = str.trim();
            if (strTrim.isEmpty()) {
                return;
            }
            this.bundleIds.add(strTrim);
        }
    }

    public void addContextTag(@NotNull String str) {
        this.contextTags.add(str);
    }

    public void addEventProcessor(@NotNull t tVar) {
        this.eventProcessors.add(tVar);
    }

    public void addIgnoredExceptionForType(@NotNull Class<? extends Throwable> cls) {
        this.ignoredExceptionsForType.add(cls);
    }

    public void addInAppExclude(@NotNull String str) {
        this.inAppExcludes.add(str);
    }

    public void addInAppInclude(@NotNull String str) {
        this.inAppIncludes.add(str);
    }

    public void addIntegration(@NotNull v0 v0Var) {
        this.integrations.add(v0Var);
    }

    public void addOptionsObserver(@NotNull i0 i0Var) {
        this.optionsObservers.add(i0Var);
    }

    @ApiStatus.Internal
    public void addPerformanceCollector(@NotNull j0 j0Var) {
        this.performanceCollectors.add(j0Var);
    }

    public void addScopeObserver(@NotNull n0 n0Var) {
        this.observers.add(n0Var);
    }

    @Deprecated
    public void addTracingOrigin(@NotNull String str) {
        if (this.tracePropagationTargets == null) {
            this.tracePropagationTargets = new CopyOnWriteArrayList();
        }
        if (str.isEmpty()) {
            return;
        }
        this.tracePropagationTargets.add(str);
    }

    public boolean containsIgnoredExceptionForType(@NotNull Throwable th2) {
        return this.ignoredExceptionsForType.contains(th2.getClass());
    }

    @ApiStatus.Internal
    @NotNull
    public io.sentry.backpressure.a getBackpressureMonitor() {
        return this.backpressureMonitor;
    }

    @Nullable
    public l3 getBeforeBreadcrumb() {
        return null;
    }

    @ApiStatus.Experimental
    @Nullable
    public m3 getBeforeEmitMetricCallback() {
        return null;
    }

    @ApiStatus.Internal
    @Nullable
    public n3 getBeforeEnvelopeCallback() {
        return null;
    }

    @Nullable
    public o3 getBeforeSend() {
        return this.beforeSend;
    }

    @Nullable
    public p3 getBeforeSendReplay() {
        return null;
    }

    @Nullable
    public q3 getBeforeSendTransaction() {
        return null;
    }

    @NotNull
    public Set<String> getBundleIds() {
        return this.bundleIds;
    }

    @Nullable
    public String getCacheDirPath() {
        String str = this.cacheDirPath;
        if (str == null || str.isEmpty()) {
            return null;
        }
        return this.dsnHash != null ? new File(this.cacheDirPath, this.dsnHash).getAbsolutePath() : this.cacheDirPath;
    }

    @Nullable
    public String getCacheDirPathWithoutDsn() {
        String str = this.cacheDirPath;
        if (str == null || str.isEmpty()) {
            return null;
        }
        return this.cacheDirPath;
    }

    @ApiStatus.Internal
    @NotNull
    public io.sentry.clientreport.f getClientReportRecorder() {
        return this.clientReportRecorder;
    }

    @NotNull
    public e0 getConnectionStatusProvider() {
        return this.connectionStatusProvider;
    }

    public int getConnectionTimeoutMillis() {
        return this.connectionTimeoutMillis;
    }

    @NotNull
    public List<String> getContextTags() {
        return this.contextTags;
    }

    @Nullable
    public r3 getCron() {
        return this.cron;
    }

    @ApiStatus.Internal
    @NotNull
    public v2 getDateProvider() {
        return (v2) this.dateProvider.a();
    }

    @ApiStatus.Internal
    @NotNull
    public io.sentry.internal.debugmeta.a getDebugMetaLoader() {
        return this.debugMetaLoader;
    }

    @NotNull
    public g3 getDiagnosticLevel() {
        return this.diagnosticLevel;
    }

    @Nullable
    public String getDist() {
        return this.dist;
    }

    @ApiStatus.Internal
    @Nullable
    public String getDistinctId() {
        return this.distinctId;
    }

    @Nullable
    public String getDsn() {
        return this.dsn;
    }

    @Deprecated
    @Nullable
    public Boolean getEnableTracing() {
        return this.enableTracing;
    }

    @NotNull
    public io.sentry.cache.c getEnvelopeDiskCache() {
        return this.envelopeDiskCache;
    }

    @NotNull
    public f0 getEnvelopeReader() {
        return (f0) this.envelopeReader.a();
    }

    @Nullable
    public String getEnvironment() {
        String str = this.environment;
        return str != null ? str : DEFAULT_ENVIRONMENT;
    }

    @NotNull
    public List<t> getEventProcessors() {
        return this.eventProcessors;
    }

    @ApiStatus.Internal
    @NotNull
    public o0 getExecutorService() {
        return this.executorService;
    }

    @NotNull
    public u getExperimental() {
        return this.experimental;
    }

    public long getFlushTimeoutMillis() {
        return this.flushTimeoutMillis;
    }

    @ApiStatus.Internal
    @NotNull
    public w getFullyDisplayedReporter() {
        return this.fullyDisplayedReporter;
    }

    public List<io.sentry.internal.gestures.a> getGestureTargetLocators() {
        return this.gestureTargetLocators;
    }

    @Nullable
    public Long getIdleTimeout() {
        return this.idleTimeout;
    }

    @ApiStatus.Experimental
    @Nullable
    public List<String> getIgnoredCheckIns() {
        return this.ignoredCheckIns;
    }

    @NotNull
    public Set<Class<? extends Throwable>> getIgnoredExceptionsForType() {
        return this.ignoredExceptionsForType;
    }

    @NotNull
    public List<String> getInAppExcludes() {
        return this.inAppExcludes;
    }

    @NotNull
    public List<String> getInAppIncludes() {
        return this.inAppIncludes;
    }

    @NotNull
    public u0 getInstrumenter() {
        return this.instrumenter;
    }

    @NotNull
    public List<v0> getIntegrations() {
        return this.integrations;
    }

    @NotNull
    public ILogger getLogger() {
        return this.logger;
    }

    @NotNull
    public io.sentry.util.thread.a getMainThreadChecker() {
        return this.mainThreadChecker;
    }

    public long getMaxAttachmentSize() {
        return this.maxAttachmentSize;
    }

    public int getMaxBreadcrumbs() {
        return this.maxBreadcrumbs;
    }

    public int getMaxCacheItems() {
        return this.maxCacheItems;
    }

    public int getMaxDepth() {
        return this.maxDepth;
    }

    public int getMaxQueueSize() {
        return this.maxQueueSize;
    }

    @NotNull
    public u3 getMaxRequestBodySize() {
        return this.maxRequestBodySize;
    }

    @ApiStatus.Experimental
    public int getMaxSpans() {
        return this.maxSpans;
    }

    public long getMaxTraceFileSize() {
        return this.maxTraceFileSize;
    }

    @ApiStatus.Internal
    @NotNull
    public io.sentry.internal.modules.a getModulesLoader() {
        return this.modulesLoader;
    }

    @NotNull
    public List<i0> getOptionsObservers() {
        return this.optionsObservers;
    }

    @Nullable
    public String getOutboxPath() {
        String cacheDirPath = getCacheDirPath();
        if (cacheDirPath == null) {
            return null;
        }
        return new File(cacheDirPath, "outbox").getAbsolutePath();
    }

    @ApiStatus.Internal
    @NotNull
    public List<j0> getPerformanceCollectors() {
        return this.performanceCollectors;
    }

    @Nullable
    public Double getProfilesSampleRate() {
        return this.profilesSampleRate;
    }

    @Nullable
    public s3 getProfilesSampler() {
        return null;
    }

    @Nullable
    public String getProfilingTracesDirPath() {
        String cacheDirPath = getCacheDirPath();
        if (cacheDirPath == null) {
            return null;
        }
        return new File(cacheDirPath, "profiling_traces").getAbsolutePath();
    }

    @ApiStatus.Internal
    public int getProfilingTracesHz() {
        return this.profilingTracesHz;
    }

    @Nullable
    public String getProguardUuid() {
        return this.proguardUuid;
    }

    @Nullable
    public t3 getProxy() {
        return this.proxy;
    }

    public int getReadTimeoutMillis() {
        return this.readTimeoutMillis;
    }

    @Nullable
    public String getRelease() {
        return this.release;
    }

    @NotNull
    public e2 getReplayController() {
        return this.replayController;
    }

    @Nullable
    public Double getSampleRate() {
        return this.sampleRate;
    }

    @NotNull
    public List<n0> getScopeObservers() {
        return this.observers;
    }

    @Nullable
    public io.sentry.protocol.s getSdkVersion() {
        return this.sdkVersion;
    }

    @Nullable
    public String getSentryClientName() {
        return this.sentryClientName;
    }

    @NotNull
    public p0 getSerializer() {
        return (p0) this.serializer.a();
    }

    @Nullable
    public String getServerName() {
        return this.serverName;
    }

    @ApiStatus.Internal
    public long getSessionFlushTimeoutMillis() {
        return this.sessionFlushTimeoutMillis;
    }

    public long getSessionTrackingIntervalMillis() {
        return this.sessionTrackingIntervalMillis;
    }

    @ApiStatus.ScheduledForRemoval
    @Deprecated
    public long getShutdownTimeout() {
        return this.shutdownTimeoutMillis;
    }

    public long getShutdownTimeoutMillis() {
        return this.shutdownTimeoutMillis;
    }

    @ApiStatus.Experimental
    @Nullable
    public String getSpotlightConnectionUrl() {
        return this.spotlightConnectionUrl;
    }

    @Nullable
    public SSLSocketFactory getSslSocketFactory() {
        return this.sslSocketFactory;
    }

    @NotNull
    public Map<String, String> getTags() {
        return this.tags;
    }

    @NotNull
    public List<String> getTracePropagationTargets() {
        List<String> list = this.tracePropagationTargets;
        return list == null ? this.defaultTracePropagationTargets : list;
    }

    @Nullable
    public Double getTracesSampleRate() {
        return this.tracesSampleRate;
    }

    @Nullable
    public v3 getTracesSampler() {
        return null;
    }

    @Deprecated
    @NotNull
    public List<String> getTracingOrigins() {
        return getTracePropagationTargets();
    }

    @ApiStatus.Internal
    @NotNull
    public t4 getTransactionPerformanceCollector() {
        return this.transactionPerformanceCollector;
    }

    @NotNull
    public s0 getTransactionProfiler() {
        return this.transactionProfiler;
    }

    @NotNull
    public t0 getTransportFactory() {
        return this.transportFactory;
    }

    @NotNull
    public io.sentry.transport.g getTransportGate() {
        return this.transportGate;
    }

    @NotNull
    public final List<Object> getViewHierarchyExporters() {
        return this.viewHierarchyExporters;
    }

    public boolean isAttachServerName() {
        return this.attachServerName;
    }

    public boolean isAttachStacktrace() {
        return this.attachStacktrace;
    }

    public boolean isAttachThreads() {
        return this.attachThreads;
    }

    public boolean isDebug() {
        return this.debug;
    }

    public boolean isEnableAppStartProfiling() {
        return isProfilingEnabled() && this.enableAppStartProfiling;
    }

    public boolean isEnableAutoSessionTracking() {
        return this.enableAutoSessionTracking;
    }

    @ApiStatus.Experimental
    public boolean isEnableBackpressureHandling() {
        return this.enableBackpressureHandling;
    }

    public boolean isEnableDeduplication() {
        return this.enableDeduplication;
    }

    @ApiStatus.Experimental
    public boolean isEnableDefaultTagsForMetrics() {
        return isEnableMetrics() && this.enableDefaultTagsForMetrics;
    }

    public boolean isEnableExternalConfiguration() {
        return this.enableExternalConfiguration;
    }

    @ApiStatus.Experimental
    public boolean isEnableMetrics() {
        return this.enableMetrics;
    }

    public boolean isEnablePrettySerializationOutput() {
        return this.enablePrettySerializationOutput;
    }

    public boolean isEnableScopePersistence() {
        return this.enableScopePersistence;
    }

    @ApiStatus.Experimental
    public boolean isEnableScreenTracking() {
        return this.enableScreenTracking;
    }

    public boolean isEnableShutdownHook() {
        return this.enableShutdownHook;
    }

    @ApiStatus.Experimental
    public boolean isEnableSpanLocalMetricAggregation() {
        return isEnableMetrics() && this.enableSpanLocalMetricAggregation;
    }

    @ApiStatus.Experimental
    public boolean isEnableSpotlight() {
        return this.enableSpotlight;
    }

    public boolean isEnableTimeToFullDisplayTracing() {
        return this.enableTimeToFullDisplayTracing;
    }

    public boolean isEnableUncaughtExceptionHandler() {
        return this.enableUncaughtExceptionHandler;
    }

    public boolean isEnableUserInteractionBreadcrumbs() {
        return this.enableUserInteractionBreadcrumbs;
    }

    public boolean isEnableUserInteractionTracing() {
        return this.enableUserInteractionTracing;
    }

    public boolean isEnabled() {
        return this.enabled;
    }

    public boolean isPrintUncaughtStackTrace() {
        return this.printUncaughtStackTrace;
    }

    public boolean isProfilingEnabled() {
        if (getProfilesSampleRate() != null && getProfilesSampleRate().doubleValue() > 0.0d) {
            return true;
        }
        getProfilesSampler();
        return false;
    }

    public boolean isSendClientReports() {
        return this.sendClientReports;
    }

    public boolean isSendDefaultPii() {
        return this.sendDefaultPii;
    }

    public boolean isSendModules() {
        return this.sendModules;
    }

    public boolean isTraceOptionsRequests() {
        return this.traceOptionsRequests;
    }

    @ApiStatus.Experimental
    public boolean isTraceSampling() {
        return this.traceSampling;
    }

    public boolean isTracingEnabled() {
        Boolean bool = this.enableTracing;
        if (bool != null) {
            return bool.booleanValue();
        }
        if (getTracesSampleRate() != null) {
            return true;
        }
        getTracesSampler();
        return false;
    }

    public void loadLazyFields() throws IllegalArgumentException {
        getSerializer();
        retrieveParsedDsn();
        getEnvelopeReader();
        getDateProvider();
    }

    public void merge(@NotNull v vVar) {
        String str = vVar.f67838a;
        if (str != null) {
            setDsn(str);
        }
        String str2 = vVar.f67839b;
        if (str2 != null) {
            setEnvironment(str2);
        }
        String str3 = vVar.f67840c;
        if (str3 != null) {
            setRelease(str3);
        }
        String str4 = vVar.f67841d;
        if (str4 != null) {
            setDist(str4);
        }
        String str5 = vVar.f67842e;
        if (str5 != null) {
            setServerName(str5);
        }
        t3 t3Var = vVar.f67850m;
        if (t3Var != null) {
            setProxy(t3Var);
        }
        Boolean bool = vVar.f67843f;
        if (bool != null) {
            setEnableUncaughtExceptionHandler(bool.booleanValue());
        }
        Boolean bool2 = vVar.f67856u;
        if (bool2 != null) {
            setPrintUncaughtStackTrace(bool2.booleanValue());
        }
        Boolean bool3 = vVar.f67846i;
        if (bool3 != null) {
            setEnableTracing(bool3);
        }
        Double d5 = vVar.f67847j;
        if (d5 != null) {
            setTracesSampleRate(d5);
        }
        Double d11 = vVar.f67848k;
        if (d11 != null) {
            setProfilesSampleRate(d11);
        }
        Boolean bool4 = vVar.f67844g;
        if (bool4 != null) {
            setDebug(bool4.booleanValue());
        }
        Boolean bool5 = vVar.f67845h;
        if (bool5 != null) {
            setEnableDeduplication(bool5.booleanValue());
        }
        Boolean bool6 = vVar.f67857v;
        if (bool6 != null) {
            setSendClientReports(bool6.booleanValue());
        }
        for (Map.Entry entry : new HashMap(vVar.f67849l).entrySet()) {
            this.tags.put((String) entry.getKey(), (String) entry.getValue());
        }
        Iterator it = new ArrayList(vVar.o).iterator();
        while (it.hasNext()) {
            addInAppInclude((String) it.next());
        }
        Iterator it2 = new ArrayList(vVar.n).iterator();
        while (it2.hasNext()) {
            addInAppExclude((String) it2.next());
        }
        Iterator it3 = new HashSet(vVar.f67855t).iterator();
        while (it3.hasNext()) {
            addIgnoredExceptionForType((Class) it3.next());
        }
        if (vVar.f67851p != null) {
            setTracePropagationTargets(new ArrayList(vVar.f67851p));
        }
        Iterator it4 = new ArrayList(vVar.f67852q).iterator();
        while (it4.hasNext()) {
            addContextTag((String) it4.next());
        }
        String str6 = vVar.f67853r;
        if (str6 != null) {
            setProguardUuid(str6);
        }
        Long l9 = vVar.f67854s;
        if (l9 != null) {
            setIdleTimeout(l9);
        }
        Iterator it5 = vVar.f67858w.iterator();
        while (it5.hasNext()) {
            addBundleId((String) it5.next());
        }
        Boolean bool7 = vVar.f67859x;
        if (bool7 != null) {
            setEnabled(bool7.booleanValue());
        }
        Boolean bool8 = vVar.f67860y;
        if (bool8 != null) {
            setEnablePrettySerializationOutput(bool8.booleanValue());
        }
        Boolean bool9 = vVar.A;
        if (bool9 != null) {
            setSendModules(bool9.booleanValue());
        }
        if (vVar.f67861z != null) {
            setIgnoredCheckIns(new ArrayList(vVar.f67861z));
        }
        Boolean bool10 = vVar.B;
        if (bool10 != null) {
            setEnableBackpressureHandling(bool10.booleanValue());
        }
        if (vVar.C != null) {
            if (getCron() == null) {
                setCron(vVar.C);
                return;
            }
            if (vVar.C.f67695a != null) {
                getCron().f67695a = vVar.C.f67695a;
            }
            if (vVar.C.f67696b != null) {
                getCron().f67696b = vVar.C.f67696b;
            }
            if (vVar.C.f67697c != null) {
                getCron().f67697c = vVar.C.f67697c;
            }
            if (vVar.C.f67698d != null) {
                getCron().f67698d = vVar.C.f67698d;
            }
            if (vVar.C.f67699e != null) {
                getCron().f67699e = vVar.C.f67699e;
            }
        }
    }

    @ApiStatus.Internal
    @NotNull
    public q retrieveParsedDsn() throws IllegalArgumentException {
        return (q) this.parsedDsn.a();
    }

    public void setAttachServerName(boolean z11) {
        this.attachServerName = z11;
    }

    public void setAttachStacktrace(boolean z11) {
        this.attachStacktrace = z11;
    }

    public void setAttachThreads(boolean z11) {
        this.attachThreads = z11;
    }

    @ApiStatus.Internal
    public void setBackpressureMonitor(@NotNull io.sentry.backpressure.a aVar) {
        this.backpressureMonitor = aVar;
    }

    public void setBeforeBreadcrumb(@Nullable l3 l3Var) {
    }

    @ApiStatus.Experimental
    public void setBeforeEmitMetricCallback(@Nullable m3 m3Var) {
    }

    @ApiStatus.Internal
    public void setBeforeEnvelopeCallback(@Nullable n3 n3Var) {
    }

    public void setBeforeSend(@Nullable o3 o3Var) {
        this.beforeSend = o3Var;
    }

    public void setBeforeSendReplay(@Nullable p3 p3Var) {
    }

    public void setBeforeSendTransaction(@Nullable q3 q3Var) {
    }

    public void setCacheDirPath(@Nullable String str) {
        this.cacheDirPath = str;
    }

    public void setConnectionStatusProvider(@NotNull e0 e0Var) {
        this.connectionStatusProvider = e0Var;
    }

    public void setConnectionTimeoutMillis(int i5) {
        this.connectionTimeoutMillis = i5;
    }

    @ApiStatus.Experimental
    public void setCron(@Nullable r3 r3Var) {
        this.cron = r3Var;
    }

    @ApiStatus.Internal
    public void setDateProvider(@NotNull v2 v2Var) {
        io.sentry.util.c cVar = this.dateProvider;
        synchronized (cVar) {
            cVar.f67826a = v2Var;
        }
    }

    public void setDebug(boolean z11) {
        this.debug = z11;
    }

    @ApiStatus.Internal
    public void setDebugMetaLoader(@Nullable io.sentry.internal.debugmeta.a aVar) {
        if (aVar == null) {
            aVar = io.sentry.internal.debugmeta.b.f67326a;
        }
        this.debugMetaLoader = aVar;
    }

    public void setDiagnosticLevel(@Nullable g3 g3Var) {
        if (g3Var == null) {
            g3Var = DEFAULT_DIAGNOSTIC_LEVEL;
        }
        this.diagnosticLevel = g3Var;
    }

    public void setDist(@Nullable String str) {
        this.dist = str;
    }

    @ApiStatus.Internal
    public void setDistinctId(@Nullable String str) {
        this.distinctId = str;
    }

    public void setDsn(@Nullable String str) {
        String string;
        this.dsn = str;
        io.sentry.util.c cVar = this.parsedDsn;
        synchronized (cVar) {
            string = null;
            cVar.f67826a = null;
        }
        String str2 = this.dsn;
        ILogger iLogger = this.logger;
        Charset charset = io.sentry.util.h.f67833a;
        if (str2 != null && !str2.isEmpty()) {
            try {
                string = new StringBuilder(new BigInteger(1, MessageDigest.getInstance("SHA-256").digest(str2.getBytes(io.sentry.util.h.f67833a))).toString(16)).toString();
            } catch (NoSuchAlgorithmException e3) {
                iLogger.e(g3.INFO, "SHA-256 isn't available to calculate the hash.", e3);
            } catch (Throwable th2) {
                iLogger.g(g3.INFO, "string: %s could not calculate its hash", th2, str2);
            }
        }
        this.dsnHash = string;
    }

    public void setEnableAppStartProfiling(boolean z11) {
        this.enableAppStartProfiling = z11;
    }

    public void setEnableAutoSessionTracking(boolean z11) {
        this.enableAutoSessionTracking = z11;
    }

    @ApiStatus.Experimental
    public void setEnableBackpressureHandling(boolean z11) {
        this.enableBackpressureHandling = z11;
    }

    public void setEnableDeduplication(boolean z11) {
        this.enableDeduplication = z11;
    }

    @ApiStatus.Experimental
    public void setEnableDefaultTagsForMetrics(boolean z11) {
        this.enableDefaultTagsForMetrics = z11;
    }

    public void setEnableExternalConfiguration(boolean z11) {
        this.enableExternalConfiguration = z11;
    }

    @ApiStatus.Experimental
    public void setEnableMetrics(boolean z11) {
        this.enableMetrics = z11;
    }

    public void setEnablePrettySerializationOutput(boolean z11) {
        this.enablePrettySerializationOutput = z11;
    }

    public void setEnableScopePersistence(boolean z11) {
        this.enableScopePersistence = z11;
    }

    @ApiStatus.Experimental
    public void setEnableScreenTracking(boolean z11) {
        this.enableScreenTracking = z11;
    }

    public void setEnableShutdownHook(boolean z11) {
        this.enableShutdownHook = z11;
    }

    @ApiStatus.Experimental
    public void setEnableSpanLocalMetricAggregation(boolean z11) {
        this.enableSpanLocalMetricAggregation = z11;
    }

    @ApiStatus.Experimental
    public void setEnableSpotlight(boolean z11) {
        this.enableSpotlight = z11;
    }

    public void setEnableTimeToFullDisplayTracing(boolean z11) {
        this.enableTimeToFullDisplayTracing = z11;
    }

    @Deprecated
    public void setEnableTracing(@Nullable Boolean bool) {
        this.enableTracing = bool;
    }

    public void setEnableUncaughtExceptionHandler(boolean z11) {
        this.enableUncaughtExceptionHandler = z11;
    }

    public void setEnableUserInteractionBreadcrumbs(boolean z11) {
        this.enableUserInteractionBreadcrumbs = z11;
    }

    public void setEnableUserInteractionTracing(boolean z11) {
        this.enableUserInteractionTracing = z11;
    }

    public void setEnabled(boolean z11) {
        this.enabled = z11;
    }

    public void setEnvelopeDiskCache(@Nullable io.sentry.cache.c cVar) {
        if (cVar == null) {
            cVar = io.sentry.transport.h.f67804a;
        }
        this.envelopeDiskCache = cVar;
    }

    public void setEnvelopeReader(@Nullable f0 f0Var) {
        io.sentry.util.c cVar = this.envelopeReader;
        if (f0Var == null) {
            f0Var = q1.f67665a;
        }
        synchronized (cVar) {
            cVar.f67826a = f0Var;
        }
    }

    public void setEnvironment(@Nullable String str) {
        this.environment = str;
    }

    @TestOnly
    @ApiStatus.Internal
    public void setExecutorService(@NotNull o0 o0Var) {
        if (o0Var != null) {
            this.executorService = o0Var;
        }
    }

    public void setFlushTimeoutMillis(long j11) {
        this.flushTimeoutMillis = j11;
    }

    @TestOnly
    @ApiStatus.Internal
    public void setFullyDisplayedReporter(@NotNull w wVar) {
        this.fullyDisplayedReporter = wVar;
    }

    public void setGestureTargetLocators(@NotNull List<io.sentry.internal.gestures.a> list) {
        this.gestureTargetLocators.clear();
        this.gestureTargetLocators.addAll(list);
    }

    public void setIdleTimeout(@Nullable Long l9) {
        this.idleTimeout = l9;
    }

    @ApiStatus.Experimental
    public void setIgnoredCheckIns(@Nullable List<String> list) {
        if (list == null) {
            this.ignoredCheckIns = null;
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : list) {
            if (!str.isEmpty()) {
                arrayList.add(str);
            }
        }
        this.ignoredCheckIns = arrayList;
    }

    public void setInstrumenter(@NotNull u0 u0Var) {
        this.instrumenter = u0Var;
    }

    public void setLogger(@Nullable ILogger iLogger) {
        this.logger = iLogger == null ? s1.f67764a : new c10.a(18, this, iLogger);
    }

    public void setMainThreadChecker(@NotNull io.sentry.util.thread.a aVar) {
        this.mainThreadChecker = aVar;
    }

    public void setMaxAttachmentSize(long j11) {
        this.maxAttachmentSize = j11;
    }

    public void setMaxBreadcrumbs(int i5) {
        this.maxBreadcrumbs = i5;
    }

    public void setMaxCacheItems(int i5) {
        this.maxCacheItems = i5;
    }

    public void setMaxDepth(int i5) {
        this.maxDepth = i5;
    }

    public void setMaxQueueSize(int i5) {
        if (i5 > 0) {
            this.maxQueueSize = i5;
        }
    }

    public void setMaxRequestBodySize(@NotNull u3 u3Var) {
        this.maxRequestBodySize = u3Var;
    }

    @ApiStatus.Experimental
    public void setMaxSpans(int i5) {
        this.maxSpans = i5;
    }

    public void setMaxTraceFileSize(long j11) {
        this.maxTraceFileSize = j11;
    }

    @ApiStatus.Internal
    public void setModulesLoader(@Nullable io.sentry.internal.modules.a aVar) {
        if (aVar == null) {
            aVar = io.sentry.internal.modules.e.f67341a;
        }
        this.modulesLoader = aVar;
    }

    public void setPrintUncaughtStackTrace(boolean z11) {
        this.printUncaughtStackTrace = z11;
    }

    public void setProfilesSampleRate(@Nullable Double d5) {
        if (ic.b.N(d5, true)) {
            this.profilesSampleRate = d5;
            return;
        }
        throw new IllegalArgumentException("The value " + d5 + " is not valid. Use null to disable or values between 0.0 and 1.0.");
    }

    public void setProfilesSampler(@Nullable s3 s3Var) {
    }

    @Deprecated
    public void setProfilingEnabled(boolean z11) {
        if (getProfilesSampleRate() == null) {
            setProfilesSampleRate(z11 ? Double.valueOf(1.0d) : null);
        }
    }

    @ApiStatus.Internal
    public void setProfilingTracesHz(int i5) {
        this.profilingTracesHz = i5;
    }

    public void setProguardUuid(@Nullable String str) {
        this.proguardUuid = str;
    }

    public void setProxy(@Nullable t3 t3Var) {
        this.proxy = t3Var;
    }

    public void setReadTimeoutMillis(int i5) {
        this.readTimeoutMillis = i5;
    }

    public void setRelease(@Nullable String str) {
        this.release = str;
    }

    public void setReplayController(@Nullable e2 e2Var) {
        if (e2Var == null) {
            e2Var = t1.f67771b;
        }
        this.replayController = e2Var;
    }

    public void setSampleRate(Double d5) {
        if (ic.b.N(d5, true)) {
            this.sampleRate = d5;
            return;
        }
        throw new IllegalArgumentException("The value " + d5 + " is not valid. Use null to disable or values >= 0.0 and <= 1.0.");
    }

    @ApiStatus.Internal
    public void setSdkVersion(@Nullable io.sentry.protocol.s sVar) {
        this.sdkVersion = sVar;
    }

    public void setSendClientReports(boolean z11) {
        this.sendClientReports = z11;
        if (z11) {
            this.clientReportRecorder = new io.sentry.internal.debugmeta.c(this);
        } else {
            this.clientReportRecorder = new br.a(10);
        }
    }

    public void setSendDefaultPii(boolean z11) {
        this.sendDefaultPii = z11;
    }

    public void setSendModules(boolean z11) {
        this.sendModules = z11;
    }

    public void setSentryClientName(@Nullable String str) {
        this.sentryClientName = str;
    }

    public void setSerializer(@Nullable p0 p0Var) {
        io.sentry.util.c cVar = this.serializer;
        if (p0Var == null) {
            p0Var = u1.f67823a;
        }
        synchronized (cVar) {
            cVar.f67826a = p0Var;
        }
    }

    public void setServerName(@Nullable String str) {
        this.serverName = str;
    }

    @ApiStatus.Internal
    public void setSessionFlushTimeoutMillis(long j11) {
        this.sessionFlushTimeoutMillis = j11;
    }

    public void setSessionTrackingIntervalMillis(long j11) {
        this.sessionTrackingIntervalMillis = j11;
    }

    @ApiStatus.ScheduledForRemoval
    @Deprecated
    public void setShutdownTimeout(long j11) {
        this.shutdownTimeoutMillis = j11;
    }

    public void setShutdownTimeoutMillis(long j11) {
        this.shutdownTimeoutMillis = j11;
    }

    @ApiStatus.Experimental
    public void setSpotlightConnectionUrl(@Nullable String str) {
        this.spotlightConnectionUrl = str;
    }

    public void setSslSocketFactory(@Nullable SSLSocketFactory sSLSocketFactory) {
        this.sslSocketFactory = sSLSocketFactory;
    }

    public void setTag(@NotNull String str, @NotNull String str2) {
        this.tags.put(str, str2);
    }

    public void setTraceOptionsRequests(boolean z11) {
        this.traceOptionsRequests = z11;
    }

    @ApiStatus.Internal
    public void setTracePropagationTargets(@Nullable List<String> list) {
        if (list == null) {
            this.tracePropagationTargets = null;
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : list) {
            if (!str.isEmpty()) {
                arrayList.add(str);
            }
        }
        this.tracePropagationTargets = arrayList;
    }

    @Deprecated
    public void setTraceSampling(boolean z11) {
        this.traceSampling = z11;
    }

    public void setTracesSampleRate(@Nullable Double d5) {
        if (ic.b.N(d5, true)) {
            this.tracesSampleRate = d5;
            return;
        }
        throw new IllegalArgumentException("The value " + d5 + " is not valid. Use null to disable or values between 0.0 and 1.0.");
    }

    public void setTracesSampler(@Nullable v3 v3Var) {
    }

    @ApiStatus.Internal
    @Deprecated
    public void setTracingOrigins(@Nullable List<String> list) {
        setTracePropagationTargets(list);
    }

    @ApiStatus.Internal
    public void setTransactionPerformanceCollector(@NotNull t4 t4Var) {
        this.transactionPerformanceCollector = t4Var;
    }

    public void setTransactionProfiler(@Nullable s0 s0Var) {
        if (this.transactionProfiler != t1.f67774e || s0Var == null) {
            return;
        }
        this.transactionProfiler = s0Var;
    }

    public void setTransportFactory(@Nullable t0 t0Var) {
        if (t0Var == null) {
            t0Var = x1.f67907a;
        }
        this.transportFactory = t0Var;
    }

    public void setTransportGate(@Nullable io.sentry.transport.g gVar) {
        if (gVar == null) {
            gVar = io.sentry.transport.d.f67798b;
        }
        this.transportGate = gVar;
    }

    public void setViewHierarchyExporters(@NotNull List<Object> list) {
        this.viewHierarchyExporters.clear();
        this.viewHierarchyExporters.addAll(list);
    }
}
