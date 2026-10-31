package com.amplitude.core.diagnostics;

import a2.c;
import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import b.c9;
import b70.g;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.common.Logger;
import com.amplitude.core.Constants;
import com.amplitude.core.ServerZone;
import com.amplitude.core.remoteconfig.RemoteConfigClient;
import com.amplitude.core.utilities.Sample;
import com.amplitude.core.utilities.http.HttpClient;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import h6.c1;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.c0;
import t70.j0;
import t70.m0;
import t70.r1;
import v70.i;
import v70.m;
import v70.o;

@Metadata(d1 = {"\u0000¦\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0010$\n\u0002\b\b\n\u0002\u0010\u0000\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0000\u0018\u0000 m2\u00020\u0001:\u0003nmoB\u008f\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u000f\u001a\u00020\r\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\b\b\u0002\u0010\u0017\u001a\u00020\u0016\u0012\b\b\u0002\u0010\u0019\u001a\u00020\u0018\u0012\b\b\u0002\u0010\u001b\u001a\u00020\u001a\u0012\b\b\u0002\u0010\u001c\u001a\u00020\u001a¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010 \u001a\u00020\u001fH\u0016¢\u0006\u0004\b \u0010!J\u001f\u0010$\u001a\u00020\u001f2\u0006\u0010\"\u001a\u00020\u00022\u0006\u0010#\u001a\u00020\u0002H\u0016¢\u0006\u0004\b$\u0010%J#\u0010(\u001a\u00020\u001f2\u0012\u0010'\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020&H\u0016¢\u0006\u0004\b(\u0010)J\u001f\u0010+\u001a\u00020\u001f2\u0006\u0010\"\u001a\u00020\u00022\u0006\u0010*\u001a\u00020\u001aH\u0016¢\u0006\u0004\b+\u0010,J\u001f\u0010-\u001a\u00020\u001f2\u0006\u0010\"\u001a\u00020\u00022\u0006\u0010#\u001a\u00020\u0018H\u0016¢\u0006\u0004\b-\u0010.J-\u00101\u001a\u00020\u001f2\u0006\u0010\"\u001a\u00020\u00022\u0014\u00100\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020/\u0018\u00010&H\u0016¢\u0006\u0004\b1\u00102J\u000f\u00103\u001a\u00020\u001fH\u0016¢\u0006\u0004\b3\u0010!J\u000f\u00104\u001a\u00020\u001fH\u0002¢\u0006\u0004\b4\u0010!J\u000f\u00105\u001a\u00020\u001fH\u0002¢\u0006\u0004\b5\u0010!J\u000f\u00106\u001a\u00020\u001fH\u0002¢\u0006\u0004\b6\u0010!J\u000f\u00107\u001a\u00020\u001fH\u0002¢\u0006\u0004\b7\u0010!J\u0017\u0010:\u001a\u00020\u001f2\u0006\u00109\u001a\u000208H\u0002¢\u0006\u0004\b:\u0010;J\u000f\u0010<\u001a\u00020\u001fH\u0002¢\u0006\u0004\b<\u0010!J\u0019\u0010>\u001a\u0004\u0018\u00010\u001a2\u0006\u0010=\u001a\u00020\u001aH\u0002¢\u0006\u0004\b>\u0010?J\u000f\u0010@\u001a\u00020\u001fH\u0002¢\u0006\u0004\b@\u0010!J\u000f\u0010A\u001a\u00020\u001fH\u0002¢\u0006\u0004\bA\u0010!J\u000f\u0010B\u001a\u00020\u001fH\u0002¢\u0006\u0004\bB\u0010!J\u000f\u0010C\u001a\u00020\u001fH\u0002¢\u0006\u0004\bC\u0010!J \u0010F\u001a\u00020\u001f2\u0006\u0010E\u001a\u00020D2\u0006\u0010\u0019\u001a\u00020\u0018H\u0082@¢\u0006\u0004\bF\u0010GJ\u000f\u0010H\u001a\u00020\u0002H\u0002¢\u0006\u0004\bH\u0010IR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010JR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010KR\u0014\u0010\u0006\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010JR\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010LR\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010MR\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010NR\u0014\u0010\u000e\u001a\u00020\r8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010OR\u0014\u0010\u000f\u001a\u00020\r8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010OR\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010PR\u0014\u0010\u0013\u001a\u00020\u00128\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010QR\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010RR\u0016\u0010\u0017\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0017\u0010SR\u0014\u0010\u001b\u001a\u00020\u001a8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001b\u0010TR\u0014\u0010\u001c\u001a\u00020\u001a8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010TR\u0014\u0010V\u001a\u00020U8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bV\u0010WR\u0014\u0010X\u001a\u00020\u00188\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bX\u0010YR\u0014\u0010Z\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bZ\u0010JR\u0016\u0010\u0019\u001a\u00020\u00188\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0019\u0010YR\u0016\u0010[\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b[\u0010SR\u0016\u0010\\\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\\\u0010SR\u0016\u0010]\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b]\u0010SR\u0018\u0010^\u001a\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b^\u0010_R\u0018\u0010`\u001a\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b`\u0010_R\u001a\u0010b\u001a\b\u0012\u0004\u0012\u0002080a8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bb\u0010cR\u0014\u0010e\u001a\u00020d8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\be\u0010fR\u0016\u0010h\u001a\u0004\u0018\u00010g8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bh\u0010iR\u0014\u0010k\u001a\u00020j8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bk\u0010l¨\u0006p"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl;", "Lcom/amplitude/core/diagnostics/DiagnosticsClient;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "apiKey", "Lcom/amplitude/core/ServerZone;", "serverZone", "instanceName", "Ljava/io/File;", "storageDirectory", "Lcom/amplitude/common/Logger;", "logger", "Lt70/j0;", "coroutineScope", "Lt70/c0;", "networkIODispatcher", "storageIODispatcher", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient;", "remoteConfigClient", "Lcom/amplitude/core/utilities/http/HttpClient;", "httpClient", "Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;", "contextProvider", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "enabled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sampleRate", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "flushIntervalMillis", "storageIntervalMillis", "<init>", "(Ljava/lang/String;Lcom/amplitude/core/ServerZone;Ljava/lang/String;Ljava/io/File;Lcom/amplitude/common/Logger;Lt70/j0;Lt70/c0;Lt70/c0;Lcom/amplitude/core/remoteconfig/RemoteConfigClient;Lcom/amplitude/core/utilities/http/HttpClient;Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;ZDJJ)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, n.f39150d, "()V", PendingUpgradeStore.KEY_NAME, "value", "setTag", "(Ljava/lang/String;Ljava/lang/String;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tags", "setTags", "(Ljava/util/Map;)V", "size", "increment", "(Ljava/lang/String;J)V", "recordHistogram", "(Ljava/lang/String;D)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "properties", "recordEvent", "(Ljava/lang/String;Ljava/util/Map;)V", "flush", "registerShutdownHook", "initializeTasksIfNeeded", "flushPreviousSessions", "setupBasicDiagnosticsTags", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", "update", "handleUpdate", "(Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;)V", "handleTimeout", "now", "nextTimeoutDelayMs", "(J)Ljava/lang/Long;", "ensureStorageDeadlineIfAllowed", "ensureFlushDeadlineIfAllowed", "storeActiveBuffer", "flushActiveBuffer", "Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;", "snapshot", "uploadSnapshot", "(Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;DLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getDiagnosticsUrl", "()Ljava/lang/String;", "Ljava/lang/String;", "Lcom/amplitude/core/ServerZone;", "Ljava/io/File;", "Lcom/amplitude/common/Logger;", "Lt70/j0;", "Lt70/c0;", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient;", "Lcom/amplitude/core/utilities/http/HttpClient;", "Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;", "Z", "J", "Lcom/amplitude/core/diagnostics/DiagnosticsStorage;", PlaceTypes.STORAGE, "Lcom/amplitude/core/diagnostics/DiagnosticsStorage;", "startTimestamp", "D", "startTimestampSeed", "shouldTrack", "didSetBasicTags", "didFlushPreviousSession", "storageAtMs", "Ljava/lang/Long;", "flushAtMs", "Lv70/m;", "channel", "Lv70/m;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Buffer;", "activeBuffer", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Buffer;", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient$RemoteConfigCallback;", "remoteConfigCallback", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient$RemoteConfigCallback;", "Lt70/r1;", "actorJob", "Lt70/r1;", k.O, "Buffer", "Update", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class DiagnosticsClientImpl implements DiagnosticsClient {
    private static final long DEFAULT_FLUSH_INTERVAL_MILLIS = 300000;
    private static final double DEFAULT_SAMPLE_RATE = 0.0d;
    private static final long DEFAULT_STORAGE_INTERVAL_MILLIS = 1000;

    @NotNull
    private static final String EU_DIAGNOSTICS_URL = "https://diagnostics.prod.eu-central-1.amplitude.com/v1/capture";
    private static final int MAX_EVENT_COUNT_PER_FLUSH = 10;

    @NotNull
    private static final String US_DIAGNOSTICS_URL = "https://diagnostics.prod.us-west-2.amplitude.com/v1/capture";

    @NotNull
    private final Buffer activeBuffer;

    @NotNull
    private final r1 actorJob;

    @NotNull
    private final String apiKey;

    @NotNull
    private final m channel;

    @Nullable
    private final DiagnosticsContextProvider contextProvider;

    @NotNull
    private final j0 coroutineScope;
    private boolean didFlushPreviousSession;
    private boolean didSetBasicTags;
    private boolean enabled;

    @Nullable
    private Long flushAtMs;
    private final long flushIntervalMillis;

    @NotNull
    private final HttpClient httpClient;

    @NotNull
    private final String instanceName;

    @NotNull
    private final Logger logger;

    @NotNull
    private final c0 networkIODispatcher;

    @Nullable
    private final RemoteConfigClient.RemoteConfigCallback remoteConfigCallback;

    @Nullable
    private final RemoteConfigClient remoteConfigClient;
    private double sampleRate;

    @NotNull
    private final ServerZone serverZone;
    private boolean shouldTrack;
    private final double startTimestamp;

    @NotNull
    private final String startTimestampSeed;

    @NotNull
    private final DiagnosticsStorage storage;

    @Nullable
    private Long storageAtMs;

    @NotNull
    private final File storageDirectory;

    @NotNull
    private final c0 storageIODispatcher;
    private final long storageIntervalMillis;

    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0002\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0006\u0010!\u001a\u00020\"J\u0006\u0010#\u001a\u00020\"J\u0006\u0010$\u001a\u00020\u000fJ\u0006\u0010%\u001a\u00020\u000fR\u0017\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u001d\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u000b0\t¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u001a\u0010\u000e\u001a\u00020\u000fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0007R\u001d\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u00170\t¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\rR\u001a\u0010\u0019\u001a\u00020\u000fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001a\u0010\u0011\"\u0004\b\u001b\u0010\u0013R\u001d\u0010\u001c\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\n0\t¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\rR\u001a\u0010\u001e\u001a\u00020\u000fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001f\u0010\u0011\"\u0004\b \u0010\u0013¨\u0006&"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Buffer;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "addedEvents", "Lkotlin/collections/ArrayDeque;", "Lcom/amplitude/core/diagnostics/DiagnosticsEvent;", "getAddedEvents", "()Lkotlin/collections/ArrayDeque;", "counters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getCounters", "()Ljava/util/Map;", "countersChanged", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getCountersChanged", "()Z", "setCountersChanged", "(Z)V", DatabaseConstants.EVENT_TABLE_NAME, "getEvents", "histograms", "Lcom/amplitude/core/diagnostics/HistogramStats;", "getHistograms", "histogramsChanged", "getHistogramsChanged", "setHistogramsChanged", "tags", "getTags", "tagsChanged", "getTagsChanged", "setTagsChanged", "createFlushSnapshot", "Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;", "createStorageSnapshot", "needsFlush", "needsStorage", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Buffer {
        private boolean countersChanged;
        private boolean histogramsChanged;
        private boolean tagsChanged;

        @NotNull
        private final Map<String, String> tags = new LinkedHashMap();

        @NotNull
        private final Map<String, Long> counters = new LinkedHashMap();

        @NotNull
        private final Map<String, HistogramStats> histograms = new LinkedHashMap();

        @NotNull
        private final ArrayDeque<DiagnosticsEvent> events = new ArrayDeque<>();

        @NotNull
        private final ArrayDeque<DiagnosticsEvent> addedEvents = new ArrayDeque<>();

        @NotNull
        public final DiagnosticsSnapshot createFlushSnapshot() {
            LinkedHashMap linkedHashMap;
            Map mapS0 = !this.tags.isEmpty() ? MapsKt.s0(this.tags) : null;
            Map mapS02 = !this.counters.isEmpty() ? MapsKt.s0(this.counters) : null;
            if (this.histograms.isEmpty()) {
                linkedHashMap = null;
            } else {
                Map<String, HistogramStats> map = this.histograms;
                linkedHashMap = new LinkedHashMap(b70.k.d0(map.size()));
                Iterator<T> it = map.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next();
                    linkedHashMap.put(entry.getKey(), ((HistogramStats) entry.getValue()).toSnapshot());
                }
            }
            DiagnosticsSnapshot diagnosticsSnapshot = new DiagnosticsSnapshot(mapS0, mapS02, linkedHashMap, this.events.isEmpty() ? null : g.I1(this.events));
            this.counters.clear();
            this.histograms.clear();
            this.events.clear();
            this.addedEvents.clear();
            this.countersChanged = false;
            this.histogramsChanged = false;
            this.tagsChanged = false;
            return diagnosticsSnapshot;
        }

        @NotNull
        public final DiagnosticsSnapshot createStorageSnapshot() {
            LinkedHashMap linkedHashMap;
            Map mapS0 = this.tagsChanged ? MapsKt.s0(this.tags) : null;
            Map mapS02 = this.countersChanged ? MapsKt.s0(this.counters) : null;
            if (this.histogramsChanged) {
                Map<String, HistogramStats> map = this.histograms;
                linkedHashMap = new LinkedHashMap(b70.k.d0(map.size()));
                Iterator<T> it = map.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next();
                    linkedHashMap.put(entry.getKey(), ((HistogramStats) entry.getValue()).toSnapshot());
                }
            } else {
                linkedHashMap = null;
            }
            DiagnosticsSnapshot diagnosticsSnapshot = new DiagnosticsSnapshot(mapS0, mapS02, linkedHashMap, this.addedEvents.isEmpty() ? null : g.I1(this.addedEvents));
            this.addedEvents.clear();
            this.tagsChanged = false;
            this.countersChanged = false;
            this.histogramsChanged = false;
            return diagnosticsSnapshot;
        }

        @NotNull
        public final ArrayDeque<DiagnosticsEvent> getAddedEvents() {
            return this.addedEvents;
        }

        @NotNull
        public final Map<String, Long> getCounters() {
            return this.counters;
        }

        public final boolean getCountersChanged() {
            return this.countersChanged;
        }

        @NotNull
        public final ArrayDeque<DiagnosticsEvent> getEvents() {
            return this.events;
        }

        @NotNull
        public final Map<String, HistogramStats> getHistograms() {
            return this.histograms;
        }

        public final boolean getHistogramsChanged() {
            return this.histogramsChanged;
        }

        @NotNull
        public final Map<String, String> getTags() {
            return this.tags;
        }

        public final boolean getTagsChanged() {
            return this.tagsChanged;
        }

        public final boolean needsFlush() {
            return (this.counters.isEmpty() && this.histograms.isEmpty() && this.events.isEmpty()) ? false : true;
        }

        public final boolean needsStorage() {
            return this.tagsChanged || this.countersChanged || this.histogramsChanged || !this.addedEvents.isEmpty();
        }

        public final void setCountersChanged(boolean z11) {
            this.countersChanged = z11;
        }

        public final void setHistogramsChanged(boolean z11) {
            this.histogramsChanged = z11;
        }

        public final void setTagsChanged(boolean z11) {
            this.tagsChanged = z11;
        }
    }

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b2\u0018\u00002\u00020\u0001:\b\u0003\u0004\u0005\u0006\u0007\b\t\nB\u0007\b\u0004¢\u0006\u0002\u0010\u0002\u0082\u0001\b\u000b\f\r\u000e\u000f\u0010\u0011\u0012¨\u0006\u0013"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "AppendEvent", "Flush", "Increment", "InitializeTasks", "RecordHistogram", "SetTag", "SetTags", "UpdateConfig", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$AppendEvent;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$Flush;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$Increment;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$InitializeTasks;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$RecordHistogram;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$SetTag;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$SetTags;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$UpdateConfig;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static abstract class Update {

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$AppendEvent;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", DatabaseConstants.EVENT_FIELD, "Lcom/amplitude/core/diagnostics/DiagnosticsEvent;", "(Lcom/amplitude/core/diagnostics/DiagnosticsEvent;)V", "getEvent", "()Lcom/amplitude/core/diagnostics/DiagnosticsEvent;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class AppendEvent extends Update {

            @NotNull
            private final DiagnosticsEvent event;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public AppendEvent(@NotNull DiagnosticsEvent event) {
                super(null);
                Intrinsics.g(event, "event");
                this.event = event;
            }

            public static /* synthetic */ AppendEvent copy$default(AppendEvent appendEvent, DiagnosticsEvent diagnosticsEvent, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    diagnosticsEvent = appendEvent.event;
                }
                return appendEvent.copy(diagnosticsEvent);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final DiagnosticsEvent getEvent() {
                return this.event;
            }

            @NotNull
            public final AppendEvent copy(@NotNull DiagnosticsEvent event) {
                Intrinsics.g(event, "event");
                return new AppendEvent(event);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof AppendEvent) && Intrinsics.b(this.event, ((AppendEvent) other).event);
            }

            @NotNull
            public final DiagnosticsEvent getEvent() {
                return this.event;
            }

            public int hashCode() {
                return this.event.hashCode();
            }

            @NotNull
            public String toString() {
                return "AppendEvent(event=" + this.event + ')';
            }
        }

        @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÆ\n\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0013\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÖ\u0003J\t\u0010\u0007\u001a\u00020\bHÖ\u0001J\t\u0010\t\u001a\u00020\nHÖ\u0001¨\u0006\u000b"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$Flush;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class Flush extends Update {

            @NotNull
            public static final Flush INSTANCE = new Flush();

            private Flush() {
                super(null);
            }

            public boolean equals(@Nullable Object other) {
                return this == other || (other instanceof Flush);
            }

            public int hashCode() {
                return -507268337;
            }

            @NotNull
            public String toString() {
                return "Flush";
            }
        }

        @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0015"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$Increment;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", DatabaseConstants.KEY_FIELD, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;J)V", "getKey", "()Ljava/lang/String;", "getValue", "()J", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class Increment extends Update {

            @NotNull
            private final String key;
            private final long value;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Increment(@NotNull String key, long j11) {
                super(null);
                Intrinsics.g(key, "key");
                this.key = key;
                this.value = j11;
            }

            public static /* synthetic */ Increment copy$default(Increment increment, String str, long j11, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = increment.key;
                }
                if ((i5 & 2) != 0) {
                    j11 = increment.value;
                }
                return increment.copy(str, j11);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getKey() {
                return this.key;
            }

            /* renamed from: component2, reason: from getter */
            public final long getValue() {
                return this.value;
            }

            @NotNull
            public final Increment copy(@NotNull String key, long value) {
                Intrinsics.g(key, "key");
                return new Increment(key, value);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof Increment)) {
                    return false;
                }
                Increment increment = (Increment) other;
                return Intrinsics.b(this.key, increment.key) && this.value == increment.value;
            }

            @NotNull
            public final String getKey() {
                return this.key;
            }

            public final long getValue() {
                return this.value;
            }

            public int hashCode() {
                return Long.hashCode(this.value) + (this.key.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("Increment(key=");
                sb2.append(this.key);
                sb2.append(", value=");
                return c.n(sb2, this.value, ')');
            }
        }

        @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÆ\n\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0013\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÖ\u0003J\t\u0010\u0007\u001a\u00020\bHÖ\u0001J\t\u0010\t\u001a\u00020\nHÖ\u0001¨\u0006\u000b"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$InitializeTasks;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class InitializeTasks extends Update {

            @NotNull
            public static final InitializeTasks INSTANCE = new InitializeTasks();

            private InitializeTasks() {
                super(null);
            }

            public boolean equals(@Nullable Object other) {
                return this == other || (other instanceof InitializeTasks);
            }

            public int hashCode() {
                return 1259577385;
            }

            @NotNull
            public String toString() {
                return "InitializeTasks";
            }
        }

        @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0006\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0015"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$RecordHistogram;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", DatabaseConstants.KEY_FIELD, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;D)V", "getKey", "()Ljava/lang/String;", "getValue", "()D", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class RecordHistogram extends Update {

            @NotNull
            private final String key;
            private final double value;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public RecordHistogram(@NotNull String key, double d5) {
                super(null);
                Intrinsics.g(key, "key");
                this.key = key;
                this.value = d5;
            }

            public static /* synthetic */ RecordHistogram copy$default(RecordHistogram recordHistogram, String str, double d5, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = recordHistogram.key;
                }
                if ((i5 & 2) != 0) {
                    d5 = recordHistogram.value;
                }
                return recordHistogram.copy(str, d5);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getKey() {
                return this.key;
            }

            /* renamed from: component2, reason: from getter */
            public final double getValue() {
                return this.value;
            }

            @NotNull
            public final RecordHistogram copy(@NotNull String key, double value) {
                Intrinsics.g(key, "key");
                return new RecordHistogram(key, value);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof RecordHistogram)) {
                    return false;
                }
                RecordHistogram recordHistogram = (RecordHistogram) other;
                return Intrinsics.b(this.key, recordHistogram.key) && Double.compare(this.value, recordHistogram.value) == 0;
            }

            @NotNull
            public final String getKey() {
                return this.key;
            }

            public final double getValue() {
                return this.value;
            }

            public int hashCode() {
                return Double.hashCode(this.value) + (this.key.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                return "RecordHistogram(key=" + this.key + ", value=" + this.value + ')';
            }
        }

        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0002\u0010\u0005J\t\u0010\t\u001a\u00020\u0003HÆ\u0003J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\u000b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0007¨\u0006\u0013"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$SetTag;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", DatabaseConstants.KEY_FIELD, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "(Ljava/lang/String;Ljava/lang/String;)V", "getKey", "()Ljava/lang/String;", "getValue", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class SetTag extends Update {

            @NotNull
            private final String key;

            @NotNull
            private final String value;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public SetTag(@NotNull String key, @NotNull String value) {
                super(null);
                Intrinsics.g(key, "key");
                Intrinsics.g(value, "value");
                this.key = key;
                this.value = value;
            }

            public static /* synthetic */ SetTag copy$default(SetTag setTag, String str, String str2, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = setTag.key;
                }
                if ((i5 & 2) != 0) {
                    str2 = setTag.value;
                }
                return setTag.copy(str, str2);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getKey() {
                return this.key;
            }

            @NotNull
            /* renamed from: component2, reason: from getter */
            public final String getValue() {
                return this.value;
            }

            @NotNull
            public final SetTag copy(@NotNull String key, @NotNull String value) {
                Intrinsics.g(key, "key");
                Intrinsics.g(value, "value");
                return new SetTag(key, value);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof SetTag)) {
                    return false;
                }
                SetTag setTag = (SetTag) other;
                return Intrinsics.b(this.key, setTag.key) && Intrinsics.b(this.value, setTag.value);
            }

            @NotNull
            public final String getKey() {
                return this.key;
            }

            @NotNull
            public final String getValue() {
                return this.value;
            }

            public int hashCode() {
                return this.value.hashCode() + (this.key.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("SetTag(key=");
                sb2.append(this.key);
                sb2.append(", value=");
                return c1.t(sb2, this.value, ')');
            }
        }

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0012\u0010\u0002\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J\u0015\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u001f\u0010\t\u001a\u00020\u00002\u0014\b\u0002\u0010\u0002\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0004HÖ\u0001R\u001d\u0010\u0002\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$SetTags;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", "tags", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/util/Map;)V", "getTags", "()Ljava/util/Map;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class SetTags extends Update {

            @NotNull
            private final Map<String, String> tags;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public SetTags(@NotNull Map<String, String> tags) {
                super(null);
                Intrinsics.g(tags, "tags");
                this.tags = tags;
            }

            /* JADX WARN: Multi-variable type inference failed */
            public static /* synthetic */ SetTags copy$default(SetTags setTags, Map map, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    map = setTags.tags;
                }
                return setTags.copy(map);
            }

            @NotNull
            public final Map<String, String> component1() {
                return this.tags;
            }

            @NotNull
            public final SetTags copy(@NotNull Map<String, String> tags) {
                Intrinsics.g(tags, "tags");
                return new SetTags(tags);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof SetTags) && Intrinsics.b(this.tags, ((SetTags) other).tags);
            }

            @NotNull
            public final Map<String, String> getTags() {
                return this.tags;
            }

            public int hashCode() {
                return this.tags.hashCode();
            }

            @NotNull
            public String toString() {
                return c9.l(new StringBuilder("SetTags(tags="), this.tags, ')');
            }
        }

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0006\n\u0002\b\r\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006J\u0010\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\bJ\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ&\u0010\u000f\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00032\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\t\u001a\u0004\b\u0007\u0010\bR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0018"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$UpdateConfig;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update;", "enabled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sampleRate", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Boolean;Ljava/lang/Double;)V", "getEnabled", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getSampleRate", "()Ljava/lang/Double;", "Ljava/lang/Double;", "component1", "component2", "copy", "(Ljava/lang/Boolean;Ljava/lang/Double;)Lcom/amplitude/core/diagnostics/DiagnosticsClientImpl$Update$UpdateConfig;", "equals", InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class UpdateConfig extends Update {

            @Nullable
            private final Boolean enabled;

            @Nullable
            private final Double sampleRate;

            public UpdateConfig(@Nullable Boolean bool, @Nullable Double d5) {
                super(null);
                this.enabled = bool;
                this.sampleRate = d5;
            }

            public static /* synthetic */ UpdateConfig copy$default(UpdateConfig updateConfig, Boolean bool, Double d5, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    bool = updateConfig.enabled;
                }
                if ((i5 & 2) != 0) {
                    d5 = updateConfig.sampleRate;
                }
                return updateConfig.copy(bool, d5);
            }

            @Nullable
            /* renamed from: component1, reason: from getter */
            public final Boolean getEnabled() {
                return this.enabled;
            }

            @Nullable
            /* renamed from: component2, reason: from getter */
            public final Double getSampleRate() {
                return this.sampleRate;
            }

            @NotNull
            public final UpdateConfig copy(@Nullable Boolean enabled, @Nullable Double sampleRate) {
                return new UpdateConfig(enabled, sampleRate);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof UpdateConfig)) {
                    return false;
                }
                UpdateConfig updateConfig = (UpdateConfig) other;
                return Intrinsics.b(this.enabled, updateConfig.enabled) && Intrinsics.b(this.sampleRate, updateConfig.sampleRate);
            }

            @Nullable
            public final Boolean getEnabled() {
                return this.enabled;
            }

            @Nullable
            public final Double getSampleRate() {
                return this.sampleRate;
            }

            public int hashCode() {
                Boolean bool = this.enabled;
                int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
                Double d5 = this.sampleRate;
                return iHashCode + (d5 != null ? d5.hashCode() : 0);
            }

            @NotNull
            public String toString() {
                return "UpdateConfig(enabled=" + this.enabled + ", sampleRate=" + this.sampleRate + ')';
            }
        }

        public /* synthetic */ Update(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Update() {
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.diagnostics.DiagnosticsClientImpl$flushActiveBuffer$1", f = "DiagnosticsClientImpl.kt", l = {449}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.diagnostics.DiagnosticsClientImpl$flushActiveBuffer$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ double $sampleRate;
        final /* synthetic */ DiagnosticsSnapshot $snapshot;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass1(DiagnosticsSnapshot diagnosticsSnapshot, double d5, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.$snapshot = diagnosticsSnapshot;
            this.$sampleRate = d5;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return DiagnosticsClientImpl.this.new AnonymousClass1(this.$snapshot, this.$sampleRate, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                DiagnosticsClientImpl diagnosticsClientImpl = DiagnosticsClientImpl.this;
                DiagnosticsSnapshot diagnosticsSnapshot = this.$snapshot;
                double d5 = this.$sampleRate;
                this.label = 1;
                if (diagnosticsClientImpl.uploadSnapshot(diagnosticsSnapshot, d5, this) == coroutineSingletons) {
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
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.diagnostics.DiagnosticsClientImpl$flushPreviousSessions$1", f = "DiagnosticsClientImpl.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.diagnostics.DiagnosticsClientImpl$flushPreviousSessions$1, reason: invalid class name and case insensitive filesystem */
    public static final class C03971 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ double $sampleRate;
        int label;

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
        @DebugMetadata(c = "com.amplitude.core.diagnostics.DiagnosticsClientImpl$flushPreviousSessions$1$1", f = "DiagnosticsClientImpl.kt", l = {292}, m = "invokeSuspend")
        /* renamed from: com.amplitude.core.diagnostics.DiagnosticsClientImpl$flushPreviousSessions$1$1, reason: invalid class name and collision with other inner class name */
        public static final class C00041 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
            final /* synthetic */ double $sampleRate;
            final /* synthetic */ DiagnosticsSnapshot $snapshot;
            int label;
            final /* synthetic */ DiagnosticsClientImpl this$0;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C00041(DiagnosticsClientImpl diagnosticsClientImpl, DiagnosticsSnapshot diagnosticsSnapshot, double d5, Continuation<? super C00041> continuation) {
                super(2, continuation);
                this.this$0 = diagnosticsClientImpl;
                this.$snapshot = diagnosticsSnapshot;
                this.$sampleRate = d5;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return new C00041(this.this$0, this.$snapshot, this.$sampleRate, continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.label;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    DiagnosticsClientImpl diagnosticsClientImpl = this.this$0;
                    DiagnosticsSnapshot diagnosticsSnapshot = this.$snapshot;
                    double d5 = this.$sampleRate;
                    this.label = 1;
                    if (diagnosticsClientImpl.uploadSnapshot(diagnosticsSnapshot, d5, this) == coroutineSingletons) {
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
            @Nullable
            public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
                return ((C00041) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C03971(double d5, Continuation<? super C03971> continuation) {
            super(2, continuation);
            this.$sampleRate = d5;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return DiagnosticsClientImpl.this.new C03971(this.$sampleRate, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            Iterator<DiagnosticsSnapshot> it = DiagnosticsClientImpl.this.storage.loadAndClearPreviousSessions().iterator();
            while (it.hasNext()) {
                m0.t(DiagnosticsClientImpl.this.coroutineScope, DiagnosticsClientImpl.this.networkIODispatcher, null, new C00041(DiagnosticsClientImpl.this, it.next(), this.$sampleRate, null), 2);
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C03971) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public DiagnosticsClientImpl(@NotNull String apiKey, @NotNull ServerZone serverZone, @NotNull String instanceName, @NotNull File storageDirectory, @NotNull Logger logger, @NotNull j0 coroutineScope, @NotNull c0 networkIODispatcher, @NotNull c0 storageIODispatcher, @Nullable RemoteConfigClient remoteConfigClient, @NotNull HttpClient httpClient, @Nullable DiagnosticsContextProvider diagnosticsContextProvider, boolean z11, double d5, long j11, long j12) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageDirectory, "storageDirectory");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(coroutineScope, "coroutineScope");
        Intrinsics.g(networkIODispatcher, "networkIODispatcher");
        Intrinsics.g(storageIODispatcher, "storageIODispatcher");
        Intrinsics.g(httpClient, "httpClient");
        this.apiKey = apiKey;
        this.serverZone = serverZone;
        this.instanceName = instanceName;
        this.storageDirectory = storageDirectory;
        this.logger = logger;
        this.coroutineScope = coroutineScope;
        this.networkIODispatcher = networkIODispatcher;
        this.storageIODispatcher = storageIODispatcher;
        this.remoteConfigClient = remoteConfigClient;
        this.httpClient = httpClient;
        this.contextProvider = diagnosticsContextProvider;
        this.enabled = z11;
        this.flushIntervalMillis = j11;
        this.storageIntervalMillis = j12;
        double dCurrentTimeMillis = System.currentTimeMillis() / 1000.0d;
        this.startTimestamp = dCurrentTimeMillis;
        String strValueOf = String.valueOf(dCurrentTimeMillis);
        this.startTimestampSeed = strValueOf;
        double dC0 = kotlin.ranges.a.c0(d5, DEFAULT_SAMPLE_RATE, 1.0d);
        this.sampleRate = dC0;
        this.shouldTrack = this.enabled && Sample.INSTANCE.isInSample(strValueOf, dC0);
        i iVarB = o.b(LayoutNode.NotPlacedPlaceOrder, 6, null);
        this.channel = iVarB;
        this.activeBuffer = new Buffer();
        com.amplitude.android.a aVar = remoteConfigClient != null ? new com.amplitude.android.a(this, 2) : null;
        this.remoteConfigCallback = aVar;
        this.actorJob = m0.t(coroutineScope, null, null, new DiagnosticsClientImpl$actorJob$1(this, null), 3);
        this.storage = new DiagnosticsStorage(storageDirectory, instanceName, strValueOf, logger, coroutineScope, storageIODispatcher);
        if (aVar != null && remoteConfigClient != null) {
            remoteConfigClient.subscribe(RemoteConfigClient.Key.DIAGNOSTICS, aVar);
        }
        iVarB.j(Update.InitializeTasks.INSTANCE);
        registerShutdownHook();
    }

    private final void ensureFlushDeadlineIfAllowed() {
        if (this.shouldTrack && this.flushAtMs == null) {
            this.flushAtMs = Long.valueOf(System.currentTimeMillis() + this.flushIntervalMillis);
        }
    }

    private final void ensureStorageDeadlineIfAllowed() {
        if (this.shouldTrack && this.storageAtMs == null) {
            this.storageAtMs = Long.valueOf(System.currentTimeMillis() + this.storageIntervalMillis);
        }
    }

    private final void flushActiveBuffer() {
        if (this.shouldTrack && this.activeBuffer.needsFlush()) {
            DiagnosticsSnapshot diagnosticsSnapshotCreateFlushSnapshot = this.activeBuffer.createFlushSnapshot();
            this.storage.deleteActiveFiles();
            m0.t(this.coroutineScope, this.networkIODispatcher, null, new AnonymousClass1(diagnosticsSnapshotCreateFlushSnapshot, this.sampleRate, null), 2);
        }
    }

    private final void flushPreviousSessions() {
        if (!this.enabled || this.didFlushPreviousSession) {
            return;
        }
        this.didFlushPreviousSession = true;
        m0.t(this.coroutineScope, this.storageIODispatcher, null, new C03971(this.sampleRate, null), 2);
    }

    private final String getDiagnosticsUrl() {
        return this.serverZone == ServerZone.EU ? EU_DIAGNOSTICS_URL : US_DIAGNOSTICS_URL;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void handleTimeout() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        Long l9 = this.flushAtMs;
        boolean z11 = false;
        boolean z12 = l9 != null && l9.longValue() <= jCurrentTimeMillis;
        Long l11 = this.storageAtMs;
        if (l11 != null) {
            z11 = l11.longValue() <= jCurrentTimeMillis;
        }
        if (z12) {
            this.flushAtMs = null;
            flushActiveBuffer();
        }
        if (z11) {
            this.storageAtMs = null;
            storeActiveBuffer();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void handleUpdate(Update update) {
        if (update instanceof Update.SetTag) {
            Update.SetTag setTag = (Update.SetTag) update;
            this.activeBuffer.getTags().put(setTag.getKey(), setTag.getValue());
            this.activeBuffer.setTagsChanged(true);
            ensureStorageDeadlineIfAllowed();
            ensureFlushDeadlineIfAllowed();
            return;
        }
        if (update instanceof Update.SetTags) {
            this.activeBuffer.getTags().putAll(((Update.SetTags) update).getTags());
            this.activeBuffer.setTagsChanged(true);
            ensureStorageDeadlineIfAllowed();
            ensureFlushDeadlineIfAllowed();
            return;
        }
        if (update instanceof Update.Increment) {
            Map<String, Long> counters = this.activeBuffer.getCounters();
            Update.Increment increment = (Update.Increment) update;
            String key = increment.getKey();
            Long l9 = this.activeBuffer.getCounters().get(increment.getKey());
            counters.put(key, Long.valueOf(increment.getValue() + (l9 != null ? l9.longValue() : 0L)));
            this.activeBuffer.setCountersChanged(true);
            ensureStorageDeadlineIfAllowed();
            ensureFlushDeadlineIfAllowed();
            return;
        }
        if (update instanceof Update.RecordHistogram) {
            Map<String, HistogramStats> histograms = this.activeBuffer.getHistograms();
            Update.RecordHistogram recordHistogram = (Update.RecordHistogram) update;
            String key2 = recordHistogram.getKey();
            HistogramStats histogramStats = histograms.get(key2);
            if (histogramStats == null) {
                histogramStats = new HistogramStats();
                histograms.put(key2, histogramStats);
            }
            histogramStats.record(recordHistogram.getValue());
            this.activeBuffer.setHistogramsChanged(true);
            ensureStorageDeadlineIfAllowed();
            ensureFlushDeadlineIfAllowed();
            return;
        }
        if (update instanceof Update.AppendEvent) {
            if (this.activeBuffer.getEvents().getF71724c() < 10) {
                Update.AppendEvent appendEvent = (Update.AppendEvent) update;
                this.activeBuffer.getEvents().addLast(appendEvent.getEvent());
                this.activeBuffer.getAddedEvents().addLast(appendEvent.getEvent());
                ensureStorageDeadlineIfAllowed();
                ensureFlushDeadlineIfAllowed();
                return;
            }
            return;
        }
        if (!(update instanceof Update.UpdateConfig)) {
            if (update instanceof Update.Flush) {
                flushActiveBuffer();
                return;
            } else {
                if (update instanceof Update.InitializeTasks) {
                    initializeTasksIfNeeded();
                    return;
                }
                return;
            }
        }
        boolean z11 = this.enabled;
        boolean z12 = this.shouldTrack;
        Update.UpdateConfig updateConfig = (Update.UpdateConfig) update;
        Boolean enabled = updateConfig.getEnabled();
        this.enabled = enabled != null ? enabled.booleanValue() : this.enabled;
        Double sampleRate = updateConfig.getSampleRate();
        double dC0 = sampleRate != null ? kotlin.ranges.a.c0(sampleRate.doubleValue(), DEFAULT_SAMPLE_RATE, 1.0d) : this.sampleRate;
        this.sampleRate = dC0;
        this.shouldTrack = this.enabled && Sample.INSTANCE.isInSample(this.startTimestampSeed, dC0);
        if (!z11 && this.enabled) {
            flushPreviousSessions();
        }
        if (!z12 && this.shouldTrack) {
            ensureStorageDeadlineIfAllowed();
            ensureFlushDeadlineIfAllowed();
        } else {
            if (!z12 || this.shouldTrack) {
                return;
            }
            this.storageAtMs = null;
            this.flushAtMs = null;
        }
    }

    private final void initializeTasksIfNeeded() {
        flushPreviousSessions();
        setupBasicDiagnosticsTags();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Long nextTimeoutDelayMs(long now) {
        Long l9 = this.storageAtMs;
        Long lValueOf = l9 != null ? Long.valueOf(Math.max(0L, l9.longValue() - now)) : null;
        Long l11 = this.flushAtMs;
        Long lValueOf2 = l11 != null ? Long.valueOf(Math.max(0L, l11.longValue() - now)) : null;
        if (lValueOf == null && lValueOf2 == null) {
            return null;
        }
        return lValueOf == null ? lValueOf2 : lValueOf2 == null ? lValueOf : Long.valueOf(Math.min(lValueOf.longValue(), lValueOf2.longValue()));
    }

    private final void registerShutdownHook() {
        try {
            final WeakReference weakReference = new WeakReference(this);
            Runtime.getRuntime().addShutdownHook(new Thread() { // from class: com.amplitude.core.diagnostics.DiagnosticsClientImpl.registerShutdownHook.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    DiagnosticsClientImpl diagnosticsClientImpl = weakReference.get();
                    if (diagnosticsClientImpl != null) {
                        diagnosticsClientImpl.close();
                    }
                }
            });
        } catch (Exception unused) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void remoteConfigCallback$lambda$0(DiagnosticsClientImpl this$0, Map config, RemoteConfigClient.Source source, long j11) {
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(config, "config");
        Intrinsics.g(source, "<anonymous parameter 1>");
        Object obj = config.get("enabled");
        Boolean bool = obj instanceof Boolean ? (Boolean) obj : null;
        Object obj2 = config.get("sampleRate");
        Number number = obj2 instanceof Number ? (Number) obj2 : null;
        Double dValueOf = number != null ? Double.valueOf(number.doubleValue()) : null;
        this$0.logger.debug("DiagnosticsClient: Did fetch remote config with sampleRate: " + dValueOf);
        this$0.channel.j(new Update.UpdateConfig(bool, dValueOf));
    }

    private final void setupBasicDiagnosticsTags() {
        DiagnosticsClientImpl diagnosticsClientImpl;
        String appVersion;
        String manufacturer;
        String model;
        String osName;
        String osVersion;
        String platform;
        if (this.didSetBasicTags) {
            return;
        }
        this.didSetBasicTags = true;
        if (this.shouldTrack) {
            diagnosticsClientImpl = this;
            DiagnosticsClient.increment$default(diagnosticsClientImpl, "sampled.in.and.enabled", 0L, 2, null);
        } else {
            diagnosticsClientImpl = this;
        }
        DiagnosticsContextProvider diagnosticsContextProvider = diagnosticsClientImpl.contextProvider;
        DiagnosticsContextInfo contextInfo = diagnosticsContextProvider != null ? diagnosticsContextProvider.getContextInfo() : null;
        MapBuilder mapBuilder = new MapBuilder();
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (contextInfo == null || (appVersion = contextInfo.getAppVersion()) == null) {
            appVersion = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        mapBuilder.put(TrackingOptions.AMP_TRACKING_OPTION_VERSION_NAME, appVersion);
        if (contextInfo == null || (manufacturer = contextInfo.getManufacturer()) == null) {
            manufacturer = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        mapBuilder.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MANUFACTURER, manufacturer);
        if (contextInfo == null || (model = contextInfo.getModel()) == null) {
            model = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        mapBuilder.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL, model);
        if (contextInfo == null || (osName = contextInfo.getOsName()) == null) {
            osName = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        mapBuilder.put(TrackingOptions.AMP_TRACKING_OPTION_OS_NAME, osName);
        if (contextInfo == null || (osVersion = contextInfo.getOsVersion()) == null) {
            osVersion = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        mapBuilder.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, osVersion);
        if (contextInfo != null && (platform = contextInfo.getPlatform()) != null) {
            str = platform;
        }
        mapBuilder.put(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, str);
        mapBuilder.put("sdk.amplitude-kotlin.version", Constants.SDK_VERSION);
        setTags(mapBuilder.b());
    }

    private final void storeActiveBuffer() {
        if (this.shouldTrack && this.activeBuffer.needsStorage()) {
            this.storage.saveSnapshot(this.activeBuffer.createStorageSnapshot());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object uploadSnapshot(DiagnosticsSnapshot diagnosticsSnapshot, double d5, Continuation<? super Unit> continuation) {
        String jsonString;
        HttpClient.Response responseRequest$core;
        try {
            jsonString = diagnosticsSnapshot.toPayload().toJsonString();
            responseRequest$core = this.httpClient.request$core(new HttpClient.Request(getDiagnosticsUrl(), HttpClient.Request.Method.POST, MapsKt.j0(new Pair("X-ApiKey", this.apiKey), new Pair("X-Client-Sample-Rate", String.valueOf(d5))), jsonString, false, 0, 0, 112, null));
        } catch (Exception e3) {
            this.logger.error("DiagnosticsClient: Failed to upload diagnostics: " + e3.getMessage());
        }
        if (responseRequest$core.isSuccessful()) {
            this.logger.debug("DiagnosticsClient: Uploaded diagnostics : " + jsonString);
            return Unit.f71706a;
        }
        String body = responseRequest$core.getBody();
        if (body == null || body.length() == 0) {
            this.logger.error("DiagnosticsClient: Failed to upload diagnostics: " + responseRequest$core.getStatusCode());
        } else {
            this.logger.error("DiagnosticsClient: Failed to upload diagnostics: " + responseRequest$core.getStatusCode() + ": " + body);
        }
        return Unit.f71706a;
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClient
    public void close() {
        this.channel.r(null);
        this.storage.close();
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClient
    public void flush() {
        this.channel.j(Update.Flush.INSTANCE);
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClient
    public void increment(@NotNull String name, long size) {
        Intrinsics.g(name, "name");
        this.channel.j(new Update.Increment(name, size));
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClient
    public void recordEvent(@NotNull String name, @Nullable Map<String, ? extends Object> properties) {
        Intrinsics.g(name, "name");
        this.channel.j(new Update.AppendEvent(new DiagnosticsEvent(name, System.currentTimeMillis() / 1000.0d, properties)));
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClient
    public void recordHistogram(@NotNull String name, double value) {
        Intrinsics.g(name, "name");
        this.channel.j(new Update.RecordHistogram(name, value));
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClient
    public void setTag(@NotNull String name, @NotNull String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        this.channel.j(new Update.SetTag(name, value));
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClient
    public void setTags(@NotNull Map<String, String> tags) {
        Intrinsics.g(tags, "tags");
        this.channel.j(new Update.SetTags(tags));
    }

    public /* synthetic */ DiagnosticsClientImpl(String str, ServerZone serverZone, String str2, File file, Logger logger, j0 j0Var, c0 c0Var, c0 c0Var2, RemoteConfigClient remoteConfigClient, HttpClient httpClient, DiagnosticsContextProvider diagnosticsContextProvider, boolean z11, double d5, long j11, long j12, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, serverZone, str2, file, logger, j0Var, c0Var, c0Var2, (i5 & 256) != 0 ? null : remoteConfigClient, httpClient, (i5 & 1024) != 0 ? null : diagnosticsContextProvider, (i5 & 2048) != 0 ? true : z11, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? 0.0d : d5, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? 300000L : j11, (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? 1000L : j12);
    }
}
