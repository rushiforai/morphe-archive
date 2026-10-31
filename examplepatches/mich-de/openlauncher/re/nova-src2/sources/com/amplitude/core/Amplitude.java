package com.amplitude.core;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.common.Logger;
import com.amplitude.core.diagnostics.DiagnosticsClient;
import com.amplitude.core.diagnostics.DiagnosticsClientImpl;
import com.amplitude.core.diagnostics.DiagnosticsContextProvider;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.EventOptions;
import com.amplitude.core.events.GroupIdentifyEvent;
import com.amplitude.core.events.Identify;
import com.amplitude.core.events.IdentifyEvent;
import com.amplitude.core.events.Revenue;
import com.amplitude.core.events.RevenueEvent;
import com.amplitude.core.platform.EventPlugin;
import com.amplitude.core.platform.ObservePlugin;
import com.amplitude.core.platform.Plugin;
import com.amplitude.core.platform.Signal;
import com.amplitude.core.platform.Timeline;
import com.amplitude.core.platform.plugins.AmplitudeDestination;
import com.amplitude.core.platform.plugins.ContextPlugin;
import com.amplitude.core.platform.plugins.GetAmpliExtrasPlugin;
import com.amplitude.core.remoteconfig.RemoteConfigClient;
import com.amplitude.core.remoteconfig.RemoteConfigClientImpl;
import com.amplitude.core.utilities.AnalyticsEventReceiver;
import com.amplitude.core.utilities.Diagnostics;
import com.amplitude.core.utilities.JSONKt;
import com.amplitude.core.utilities.http.HttpClient;
import com.amplitude.eventbridge.EventBridgeContainer;
import com.amplitude.eventbridge.EventChannel;
import com.amplitude.id.IdentityConfiguration;
import com.amplitude.id.IdentityContainer;
import com.amplitude.id.IdentityStorage;
import com.amplitude.id.IdentityStorageProvider;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.c0;
import t70.j0;
import t70.k0;
import t70.k1;
import t70.l0;
import t70.m0;
import t70.p0;
import t70.y1;
import t70.z;
import v70.a;
import w70.l1;
import w70.n1;
import w70.q1;
import w70.t1;
import w70.u1;

@Metadata(d1 = {"\u0000\u0084\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001b\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\b\u0016\u0018\u00002\u00020\u0001B?\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\n\u001a\u00020\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\b¢\u0006\u0004\b\f\u0010\rB\u0011\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\f\u0010\u000eJ\u0017\u0010\u0014\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\u000fH\u0000¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0014¢\u0006\u0004\b\u0019\u0010\u001aJ\u0017\u0010\u001c\u001a\u00020\u00112\u0006\u0010\u001b\u001a\u00020\u0018H\u0004¢\u0006\u0004\b\u001c\u0010\u001dJ\u0015\u0010 \u001a\b\u0012\u0004\u0012\u00020\u001f0\u001eH\u0014¢\u0006\u0004\b \u0010!J\u0018\u0010\"\u001a\u00020\u00112\u0006\u0010\u001b\u001a\u00020\u0018H\u0094@¢\u0006\u0004\b\"\u0010#J\u0011\u0010%\u001a\u0004\u0018\u00010$H\u0014¢\u0006\u0004\b%\u0010&J\u000f\u0010(\u001a\u00020'H\u0014¢\u0006\u0004\b(\u0010)J\u0017\u0010,\u001a\u00020\u00002\u0006\u0010+\u001a\u00020*H\u0007¢\u0006\u0004\b,\u0010-Jk\u00109\u001a\u00020\u00002\u0006\u0010+\u001a\u00020*2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.2F\b\u0002\u00108\u001a@\u0012\u0004\u0012\u00020*\u0012\u0013\u0012\u001101¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0013\u0012\u001105¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(6\u0012\u0004\u0012\u00020\u0011\u0018\u000100j\u0004\u0018\u0001`7H\u0007¢\u0006\u0004\b9\u0010:J=\u00109\u001a\u00020\u00002\u0006\u0010;\u001a\u0002052\u0018\b\u0002\u0010=\u001a\u0012\u0012\u0004\u0012\u000205\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010<2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.H\u0007¢\u0006\u0004\b9\u0010>J3\u0010@\u001a\u00020\u00002\u0016\u0010?\u001a\u0012\u0012\u0004\u0012\u000205\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010<2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.H\u0007¢\u0006\u0004\b@\u0010AJ#\u0010@\u001a\u00020\u00002\u0006\u0010@\u001a\u00020B2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.H\u0007¢\u0006\u0004\b@\u0010CJ\u0017\u0010E\u001a\u00020\u00002\b\u0010D\u001a\u0004\u0018\u000105¢\u0006\u0004\bE\u0010FJ\u000f\u0010G\u001a\u0004\u0018\u000105¢\u0006\u0004\bG\u0010HJ\u0015\u0010J\u001a\u00020\u00002\u0006\u0010I\u001a\u000205¢\u0006\u0004\bJ\u0010FJ\u000f\u0010K\u001a\u0004\u0018\u000105¢\u0006\u0004\bK\u0010HJ\u000f\u0010L\u001a\u00020\u0000H\u0016¢\u0006\u0004\bL\u0010MJC\u0010Q\u001a\u00020\u00002\u0006\u0010N\u001a\u0002052\u0006\u0010O\u001a\u0002052\u0016\u0010P\u001a\u0012\u0012\u0004\u0012\u000205\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010<2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.H\u0007¢\u0006\u0004\bQ\u0010RJ3\u0010Q\u001a\u00020\u00002\u0006\u0010N\u001a\u0002052\u0006\u0010O\u001a\u0002052\u0006\u0010@\u001a\u00020B2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.H\u0007¢\u0006\u0004\bQ\u0010SJ+\u0010T\u001a\u00020\u00002\u0006\u0010N\u001a\u0002052\u0006\u0010O\u001a\u0002052\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.H\u0007¢\u0006\u0004\bT\u0010UJ1\u0010T\u001a\u00020\u00002\u0006\u0010N\u001a\u0002052\f\u0010O\u001a\b\u0012\u0004\u0012\u0002050V2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.H\u0007¢\u0006\u0004\bT\u0010WJ\u0017\u0010Z\u001a\u00020\u00002\u0006\u0010Y\u001a\u00020XH\u0007¢\u0006\u0004\bZ\u0010[J#\u0010Y\u001a\u00020\u00002\u0006\u0010Y\u001a\u00020X2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.H\u0007¢\u0006\u0004\bY\u0010\\J\u0015\u0010Y\u001a\u00020\u00002\u0006\u0010+\u001a\u00020]¢\u0006\u0004\bY\u0010^J\u0015\u0010a\u001a\u00020\u00002\u0006\u0010`\u001a\u00020_¢\u0006\u0004\ba\u0010bJ\u0015\u0010c\u001a\u00020\u00002\u0006\u0010`\u001a\u00020_¢\u0006\u0004\bc\u0010bJ\r\u0010d\u001a\u00020\u0011¢\u0006\u0004\bd\u0010eJ\u0017\u0010f\u001a\u00020\u00112\u0006\u0010+\u001a\u00020*H\u0002¢\u0006\u0004\bf\u0010gJ'\u0010h\u001a\u00020B2\u0016\u0010?\u001a\u0012\u0012\u0004\u0012\u000205\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010<H\u0002¢\u0006\u0004\bh\u0010iR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010j\u001a\u0004\bk\u0010lR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010m\u001a\u0004\bn\u0010oR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010p\u001a\u0004\bq\u0010rR\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010s\u001a\u0004\bt\u0010uR\u0017\u0010\n\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\n\u0010s\u001a\u0004\bv\u0010uR\u0017\u0010\u000b\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\u000b\u0010s\u001a\u0004\bw\u0010uR\u0017\u0010x\u001a\u00020\u00158\u0006¢\u0006\f\n\u0004\bx\u0010y\u001a\u0004\bz\u0010\u0017R\u001c\u0010\u0080\u0001\u001a\u00020{8FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b|\u0010}\u001a\u0004\b~\u0010\u007fR)\u0010\u0082\u0001\u001a\u00020{2\u0007\u0010\u0081\u0001\u001a\u00020{8\u0006@BX\u0086.¢\u0006\u000f\n\u0006\b\u0082\u0001\u0010\u0083\u0001\u001a\u0005\b\u0084\u0001\u0010\u007fR,\u0010\u0086\u0001\u001a\u00030\u0085\u00012\b\u0010\u0081\u0001\u001a\u00030\u0085\u00018\u0006@BX\u0086.¢\u0006\u0010\n\u0006\b\u0086\u0001\u0010\u0087\u0001\u001a\u0006\b\u0088\u0001\u0010\u0089\u0001R \u0010\u008e\u0001\u001a\u00030\u008a\u00018FX\u0086\u0084\u0002¢\u0006\u000f\n\u0005\b\u008b\u0001\u0010}\u001a\u0006\b\u008c\u0001\u0010\u008d\u0001R,\u0010\u0090\u0001\u001a\u00030\u008f\u00012\b\u0010\u0081\u0001\u001a\u00030\u008f\u00018\u0006@BX\u0086.¢\u0006\u0010\n\u0006\b\u0090\u0001\u0010\u0091\u0001\u001a\u0006\b\u0092\u0001\u0010\u0093\u0001R!\u0010\u0094\u0001\u001a\b\u0012\u0004\u0012\u00020\u001f0\u001e8\u0006¢\u0006\u000f\n\u0006\b\u0094\u0001\u0010\u0095\u0001\u001a\u0005\b\u0094\u0001\u0010!R\u001d\u0010\u0097\u0001\u001a\u00030\u0096\u00018\u0006¢\u0006\u0010\n\u0006\b\u0097\u0001\u0010\u0098\u0001\u001a\u0006\b\u0099\u0001\u0010\u009a\u0001R \u0010\u009c\u0001\u001a\u00030\u009b\u00018\u0000X\u0080\u0004¢\u0006\u0010\n\u0006\b\u009c\u0001\u0010\u009d\u0001\u001a\u0006\b\u009e\u0001\u0010\u009f\u0001R'\u0010¥\u0001\u001a\u00030 \u00018FX\u0087\u0084\u0002¢\u0006\u0016\n\u0005\b¡\u0001\u0010}\u0012\u0005\b¤\u0001\u0010e\u001a\u0006\b¢\u0001\u0010£\u0001R \u0010ª\u0001\u001a\u00030¦\u00018FX\u0086\u0084\u0002¢\u0006\u000f\n\u0005\b§\u0001\u0010}\u001a\u0006\b¨\u0001\u0010©\u0001R\u001e\u0010¬\u0001\u001a\t\u0012\u0004\u0012\u00020\u000f0«\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b¬\u0001\u0010\u00ad\u0001R#\u0010¯\u0001\u001a\t\u0012\u0004\u0012\u00020\u000f0®\u00018\u0006¢\u0006\u0010\n\u0006\b¯\u0001\u0010°\u0001\u001a\u0006\b±\u0001\u0010²\u0001R*\u0010¸\u0001\u001a\u00020\u001f2\u0007\u0010³\u0001\u001a\u00020\u001f8V@VX\u0096\u000e¢\u0006\u0010\u001a\u0006\b´\u0001\u0010µ\u0001\"\u0006\b¶\u0001\u0010·\u0001¨\u0006¹\u0001"}, d2 = {"Lcom/amplitude/core/Amplitude;", b.f42142b, "Lcom/amplitude/core/Configuration;", "configuration", "Lcom/amplitude/core/State;", "store", "Lt70/j0;", "amplitudeScope", "Lt70/c0;", "amplitudeDispatcher", "networkIODispatcher", "storageIODispatcher", "<init>", "(Lcom/amplitude/core/Configuration;Lcom/amplitude/core/State;Lt70/j0;Lt70/c0;Lt70/c0;Lt70/c0;)V", "(Lcom/amplitude/core/Configuration;)V", "Lcom/amplitude/core/platform/Signal;", "signal", b.f42142b, "emitSignal$core", "(Lcom/amplitude/core/platform/Signal;)V", "emitSignal", "Lcom/amplitude/core/platform/Timeline;", "createTimeline", "()Lcom/amplitude/core/platform/Timeline;", "Lcom/amplitude/id/IdentityConfiguration;", "createIdentityConfiguration", "()Lcom/amplitude/id/IdentityConfiguration;", "identityConfiguration", "createIdentityContainer", "(Lcom/amplitude/id/IdentityConfiguration;)V", "Lt70/p0;", b.f42142b, "build", "()Lt70/p0;", "buildInternal", "(Lcom/amplitude/id/IdentityConfiguration;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;", "diagnosticsContextProvider", "()Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;", "Ljava/io/File;", "diagnosticsStorageDirectory", "()Ljava/io/File;", "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, "logEvent", "(Lcom/amplitude/core/events/BaseEvent;)Lcom/amplitude/core/Amplitude;", "Lcom/amplitude/core/events/EventOptions;", "options", "Lkotlin/Function3;", b.f42142b, "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "status", b.f42142b, PglCryptUtils.KEY_MESSAGE, "Lcom/amplitude/core/EventCallBack;", "callback", "track", "(Lcom/amplitude/core/events/BaseEvent;Lcom/amplitude/core/events/EventOptions;Lkotlin/jvm/functions/Function3;)Lcom/amplitude/core/Amplitude;", "eventType", b.f42142b, "eventProperties", "(Ljava/lang/String;Ljava/util/Map;Lcom/amplitude/core/events/EventOptions;)Lcom/amplitude/core/Amplitude;", "userProperties", "identify", "(Ljava/util/Map;Lcom/amplitude/core/events/EventOptions;)Lcom/amplitude/core/Amplitude;", "Lcom/amplitude/core/events/Identify;", "(Lcom/amplitude/core/events/Identify;Lcom/amplitude/core/events/EventOptions;)Lcom/amplitude/core/Amplitude;", "userId", "setUserId", "(Ljava/lang/String;)Lcom/amplitude/core/Amplitude;", "getUserId", "()Ljava/lang/String;", "deviceId", "setDeviceId", "getDeviceId", "reset", "()Lcom/amplitude/core/Amplitude;", "groupType", "groupName", "groupProperties", "groupIdentify", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/amplitude/core/events/EventOptions;)Lcom/amplitude/core/Amplitude;", "(Ljava/lang/String;Ljava/lang/String;Lcom/amplitude/core/events/Identify;Lcom/amplitude/core/events/EventOptions;)Lcom/amplitude/core/Amplitude;", "setGroup", "(Ljava/lang/String;Ljava/lang/String;Lcom/amplitude/core/events/EventOptions;)Lcom/amplitude/core/Amplitude;", b.f42142b, "(Ljava/lang/String;[Ljava/lang/String;Lcom/amplitude/core/events/EventOptions;)Lcom/amplitude/core/Amplitude;", "Lcom/amplitude/core/events/Revenue;", "revenue", "logRevenue", "(Lcom/amplitude/core/events/Revenue;)Lcom/amplitude/core/Amplitude;", "(Lcom/amplitude/core/events/Revenue;Lcom/amplitude/core/events/EventOptions;)Lcom/amplitude/core/Amplitude;", "Lcom/amplitude/core/events/RevenueEvent;", "(Lcom/amplitude/core/events/RevenueEvent;)Lcom/amplitude/core/Amplitude;", "Lcom/amplitude/core/platform/Plugin;", "plugin", "add", "(Lcom/amplitude/core/platform/Plugin;)Lcom/amplitude/core/Amplitude;", "remove", "flush", "()V", "process", "(Lcom/amplitude/core/events/BaseEvent;)V", "convertPropertiesToIdentify", "(Ljava/util/Map;)Lcom/amplitude/core/events/Identify;", "Lcom/amplitude/core/Configuration;", "getConfiguration", "()Lcom/amplitude/core/Configuration;", "Lcom/amplitude/core/State;", "getStore", "()Lcom/amplitude/core/State;", "Lt70/j0;", "getAmplitudeScope", "()Lt70/j0;", "Lt70/c0;", "getAmplitudeDispatcher", "()Lt70/c0;", "getNetworkIODispatcher", "getStorageIODispatcher", "timeline", "Lcom/amplitude/core/platform/Timeline;", "getTimeline", "Lcom/amplitude/core/Storage;", "storage$delegate", "Lkotlin/Lazy;", "getStorage", "()Lcom/amplitude/core/Storage;", PlaceTypes.STORAGE, "<set-?>", "identifyInterceptStorage", "Lcom/amplitude/core/Storage;", "getIdentifyInterceptStorage", "Lcom/amplitude/id/IdentityStorage;", "identityStorage", "Lcom/amplitude/id/IdentityStorage;", "getIdentityStorage", "()Lcom/amplitude/id/IdentityStorage;", "Lcom/amplitude/common/Logger;", "logger$delegate", "getLogger", "()Lcom/amplitude/common/Logger;", "logger", "Lcom/amplitude/id/IdentityContainer;", "idContainer", "Lcom/amplitude/id/IdentityContainer;", "getIdContainer", "()Lcom/amplitude/id/IdentityContainer;", "isBuilt", "Lt70/p0;", "Lcom/amplitude/core/utilities/Diagnostics;", "diagnostics", "Lcom/amplitude/core/utilities/Diagnostics;", "getDiagnostics", "()Lcom/amplitude/core/utilities/Diagnostics;", "Lcom/amplitude/core/IdentityCoordinator;", "identityCoordinator", "Lcom/amplitude/core/IdentityCoordinator;", "getIdentityCoordinator$core", "()Lcom/amplitude/core/IdentityCoordinator;", "Lcom/amplitude/core/diagnostics/DiagnosticsClient;", "diagnosticsClient$delegate", "getDiagnosticsClient", "()Lcom/amplitude/core/diagnostics/DiagnosticsClient;", "getDiagnosticsClient$annotations", "diagnosticsClient", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient;", "remoteConfigClient$delegate", "getRemoteConfigClient", "()Lcom/amplitude/core/remoteconfig/RemoteConfigClient;", "remoteConfigClient", "Lw70/l1;", "_signalFlow", "Lw70/l1;", "Lw70/q1;", "signalFlow", "Lw70/q1;", "getSignalFlow", "()Lw70/q1;", "value", "getOptOut", "()Z", "setOptOut", "(Z)V", "optOut", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class Amplitude {

    @NotNull
    private final l1 _signalFlow;

    @NotNull
    private final c0 amplitudeDispatcher;

    @NotNull
    private final j0 amplitudeScope;

    @NotNull
    private final Configuration configuration;

    @NotNull
    private final Diagnostics diagnostics;

    /* renamed from: diagnosticsClient$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy diagnosticsClient;
    private IdentityContainer idContainer;
    private Storage identifyInterceptStorage;

    @NotNull
    private final IdentityCoordinator identityCoordinator;
    private IdentityStorage identityStorage;

    @NotNull
    private final p0 isBuilt;

    /* renamed from: logger$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy logger;

    @NotNull
    private final c0 networkIODispatcher;

    /* renamed from: remoteConfigClient$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy remoteConfigClient;

    @NotNull
    private final q1 signalFlow;

    /* renamed from: storage$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy storage;

    @NotNull
    private final c0 storageIODispatcher;

    @NotNull
    private final State store;

    @NotNull
    private final Timeline timeline;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.Amplitude$flush$1", f = "Amplitude.kt", l = {545}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.Amplitude$flush$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return Amplitude.this.new AnonymousClass1(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                p0 isBuilt = Amplitude.this.getIsBuilt();
                this.label = 1;
                if (isBuilt.l(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            Amplitude.this.getTimeline().applyClosure(new Function1<Plugin, Unit>() { // from class: com.amplitude.core.Amplitude.flush.1.1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object obj2) {
                    invoke((Plugin) obj2);
                    return Unit.f71706a;
                }

                public final void invoke(@NotNull Plugin it) {
                    Intrinsics.g(it, "it");
                    EventPlugin eventPlugin = it instanceof EventPlugin ? (EventPlugin) it : null;
                    if (eventPlugin != null) {
                        eventPlugin.flush();
                    }
                }
            });
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public Amplitude(@NotNull Configuration configuration, @NotNull State store, @NotNull j0 amplitudeScope, @NotNull c0 amplitudeDispatcher, @NotNull c0 networkIODispatcher, @NotNull c0 storageIODispatcher) {
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(store, "store");
        Intrinsics.g(amplitudeScope, "amplitudeScope");
        Intrinsics.g(amplitudeDispatcher, "amplitudeDispatcher");
        Intrinsics.g(networkIODispatcher, "networkIODispatcher");
        Intrinsics.g(storageIODispatcher, "storageIODispatcher");
        this.configuration = configuration;
        this.store = store;
        this.amplitudeScope = amplitudeScope;
        this.amplitudeDispatcher = amplitudeDispatcher;
        this.networkIODispatcher = networkIODispatcher;
        this.storageIODispatcher = storageIODispatcher;
        this.storage = LazyKt.a(new Function0<Storage>() { // from class: com.amplitude.core.Amplitude$storage$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final Storage invoke() {
                return StorageProvider.getStorage$default(this.this$0.getConfiguration().getStorageProvider(), this.this$0, null, 2, null);
            }
        });
        this.logger = LazyKt.a(new Function0<Logger>() { // from class: com.amplitude.core.Amplitude$logger$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final Logger invoke() {
                return this.this$0.getConfiguration().getLoggerProvider().getLogger(this.this$0);
            }
        });
        this.diagnostics = new Diagnostics();
        this.identityCoordinator = new IdentityCoordinator(store);
        this.diagnosticsClient = LazyKt.a(new Function0<DiagnosticsClientImpl>() { // from class: com.amplitude.core.Amplitude$diagnosticsClient$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final DiagnosticsClientImpl invoke() {
                return new DiagnosticsClientImpl(this.this$0.getConfiguration().getApiKey(), this.this$0.getConfiguration().getServerZone(), this.this$0.getConfiguration().getInstanceName(), this.this$0.diagnosticsStorageDirectory(), this.this$0.getLogger(), this.this$0.getAmplitudeScope(), this.this$0.getNetworkIODispatcher(), this.this$0.getStorageIODispatcher(), this.this$0.getRemoteConfigClient(), new HttpClient(this.this$0.getConfiguration(), this.this$0.getLogger()), this.this$0.diagnosticsContextProvider(), this.this$0.getConfiguration().getEnableDiagnostics(), 0.0d, 0L, 0L, 28672, null);
            }
        });
        this.remoteConfigClient = LazyKt.a(new Function0<RemoteConfigClientImpl>() { // from class: com.amplitude.core.Amplitude$remoteConfigClient$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final RemoteConfigClientImpl invoke() {
                return new RemoteConfigClientImpl(this.this$0.getConfiguration().getApiKey(), this.this$0.getConfiguration().getServerZone(), this.this$0.getAmplitudeScope(), this.this$0.getNetworkIODispatcher(), this.this$0.getStorageIODispatcher(), this.this$0.getStorage(), new HttpClient(this.this$0.getConfiguration(), this.this$0.getLogger()), this.this$0.getLogger());
            }
        });
        t1 t1VarA = u1.a(0, 1000, a.f92142b);
        this._signalFlow = t1VarA;
        this.signalFlow = new n1(t1VarA);
        if (!configuration.isValid()) {
            throw new IllegalArgumentException("invalid configuration");
        }
        this.timeline = createTimeline();
        p0 p0VarBuild = build();
        this.isBuilt = p0VarBuild;
        p0VarBuild.start();
    }

    public static /* synthetic */ Object buildInternal$suspendImpl(Amplitude amplitude, IdentityConfiguration identityConfiguration, Continuation<? super Unit> continuation) {
        amplitude.createIdentityContainer(identityConfiguration);
        EventBridgeContainer.INSTANCE.getInstance(amplitude.configuration.getInstanceName()).getEventBridge().setEventReceiver(EventChannel.EVENT, new AnalyticsEventReceiver(amplitude));
        amplitude.add(new ContextPlugin());
        amplitude.add(new GetAmpliExtrasPlugin());
        amplitude.add(new AmplitudeDestination());
        return Unit.f71706a;
    }

    private final Identify convertPropertiesToIdentify(Map<String, ? extends Object> userProperties) {
        Identify identify = new Identify();
        if (userProperties != null) {
            for (Map.Entry<String, ? extends Object> entry : userProperties.entrySet()) {
                Object value = entry.getValue();
                if (value != null) {
                    identify.set(entry.getKey(), value);
                }
            }
        }
        return identify;
    }

    @RestrictedAmplitudeFeature
    public static /* synthetic */ void getDiagnosticsClient$annotations() {
    }

    public static /* synthetic */ Amplitude groupIdentify$default(Amplitude amplitude, String str, String str2, Map map, EventOptions eventOptions, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: groupIdentify");
        }
        if ((i5 & 8) != 0) {
            eventOptions = null;
        }
        return amplitude.groupIdentify(str, str2, (Map<String, ? extends Object>) map, eventOptions);
    }

    public static /* synthetic */ Amplitude identify$default(Amplitude amplitude, Map map, EventOptions eventOptions, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: identify");
        }
        if ((i5 & 2) != 0) {
            eventOptions = null;
        }
        return amplitude.identify((Map<String, ? extends Object>) map, eventOptions);
    }

    private final void process(BaseEvent event) {
        if (getOptOut()) {
            getLogger().info("Skip event for opt out config.");
            return;
        }
        if (event.getTimestamp() == null) {
            event.setTimestamp(Long.valueOf(System.currentTimeMillis()));
        }
        Map<String, Object> eventProperties = event.getEventProperties();
        event.setEventProperties(eventProperties != null ? JSONKt.deepCopy(eventProperties) : null);
        Map<String, Object> userProperties = event.getUserProperties();
        event.setUserProperties(userProperties != null ? JSONKt.deepCopy(userProperties) : null);
        Map<String, Object> groups = event.getGroups();
        event.setGroups(groups != null ? JSONKt.deepCopy(groups) : null);
        Map<String, Object> groupProperties = event.getGroupProperties();
        event.setGroupProperties(groupProperties != null ? JSONKt.deepCopy(groupProperties) : null);
        getLogger().debug("Logged event with type: " + event.getEventType());
        this.timeline.process(event);
    }

    public static /* synthetic */ Amplitude revenue$default(Amplitude amplitude, Revenue revenue, EventOptions eventOptions, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: revenue");
        }
        if ((i5 & 2) != 0) {
            eventOptions = null;
        }
        return amplitude.revenue(revenue, eventOptions);
    }

    public static /* synthetic */ Amplitude setGroup$default(Amplitude amplitude, String str, String str2, EventOptions eventOptions, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: setGroup");
        }
        if ((i5 & 4) != 0) {
            eventOptions = null;
        }
        return amplitude.setGroup(str, str2, eventOptions);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ Amplitude track$default(Amplitude amplitude, BaseEvent baseEvent, EventOptions eventOptions, Function3 function3, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: track");
        }
        if ((i5 & 2) != 0) {
            eventOptions = null;
        }
        if ((i5 & 4) != 0) {
            function3 = null;
        }
        return amplitude.track(baseEvent, eventOptions, (Function3<? super BaseEvent, ? super Integer, ? super String, Unit>) function3);
    }

    @NotNull
    public final Amplitude add(@NotNull Plugin plugin) {
        Intrinsics.g(plugin, "plugin");
        if (plugin instanceof ObservePlugin) {
            this.store.add((ObservePlugin) plugin, this);
            return this;
        }
        this.timeline.add(plugin);
        return this;
    }

    @NotNull
    public p0 build() {
        j0 j0Var = this.amplitudeScope;
        c0 c0Var = this.amplitudeDispatcher;
        l0 l0Var = l0.f88814b;
        Function2 amplitude$build$built$1 = new Amplitude$build$built$1(this, this, null);
        y1 y1Var = new y1(z.b(j0Var, c0Var), amplitude$build$built$1);
        y1Var.l0(l0Var, y1Var, amplitude$build$built$1);
        return y1Var;
    }

    @Nullable
    public Object buildInternal(@NotNull IdentityConfiguration identityConfiguration, @NotNull Continuation<? super Unit> continuation) {
        return buildInternal$suspendImpl(this, identityConfiguration, continuation);
    }

    @NotNull
    public IdentityConfiguration createIdentityConfiguration() {
        String instanceName = this.configuration.getInstanceName();
        String apiKey = this.configuration.getApiKey();
        IdentityStorageProvider identityStorageProvider = this.configuration.getIdentityStorageProvider();
        Logger logger = getLogger();
        return new IdentityConfiguration(instanceName, apiKey, null, identityStorageProvider, new File("/tmp/amplitude-identity/" + this.configuration.getInstanceName()), "amplitude-identity-" + this.configuration.getInstanceName(), logger, 4, null);
    }

    public final void createIdentityContainer(@NotNull IdentityConfiguration identityConfiguration) {
        Intrinsics.g(identityConfiguration, "identityConfiguration");
        this.idContainer = IdentityContainer.INSTANCE.getInstance(identityConfiguration);
        this.identityCoordinator.bootstrap$core(getIdContainer().getIdentityManager());
    }

    @NotNull
    public Timeline createTimeline() {
        Timeline timeline = new Timeline();
        timeline.setAmplitude(this);
        return timeline;
    }

    @Nullable
    public DiagnosticsContextProvider diagnosticsContextProvider() {
        return null;
    }

    @NotNull
    public File diagnosticsStorageDirectory() {
        return new File("/tmp/amplitude-diagnostics/" + this.configuration.getInstanceName());
    }

    public final void emitSignal$core(@NotNull Signal signal) {
        Intrinsics.g(signal, "signal");
        this._signalFlow.c(signal);
    }

    public final void flush() {
        m0.t(this.amplitudeScope, this.amplitudeDispatcher, null, new AnonymousClass1(null), 2);
    }

    @NotNull
    public final c0 getAmplitudeDispatcher() {
        return this.amplitudeDispatcher;
    }

    @NotNull
    public final j0 getAmplitudeScope() {
        return this.amplitudeScope;
    }

    @NotNull
    public final Configuration getConfiguration() {
        return this.configuration;
    }

    @Nullable
    public final String getDeviceId() {
        return this.store.getDeviceId();
    }

    @NotNull
    public final Diagnostics getDiagnostics() {
        return this.diagnostics;
    }

    @NotNull
    public final DiagnosticsClient getDiagnosticsClient() {
        return (DiagnosticsClient) this.diagnosticsClient.getValue();
    }

    @NotNull
    public final IdentityContainer getIdContainer() {
        IdentityContainer identityContainer = this.idContainer;
        if (identityContainer != null) {
            return identityContainer;
        }
        Intrinsics.m("idContainer");
        throw null;
    }

    @NotNull
    public final Storage getIdentifyInterceptStorage() {
        Storage storage = this.identifyInterceptStorage;
        if (storage != null) {
            return storage;
        }
        Intrinsics.m("identifyInterceptStorage");
        throw null;
    }

    @NotNull
    /* renamed from: getIdentityCoordinator$core, reason: from getter */
    public final IdentityCoordinator getIdentityCoordinator() {
        return this.identityCoordinator;
    }

    @NotNull
    public final IdentityStorage getIdentityStorage() {
        IdentityStorage identityStorage = this.identityStorage;
        if (identityStorage != null) {
            return identityStorage;
        }
        Intrinsics.m("identityStorage");
        throw null;
    }

    @NotNull
    public final Logger getLogger() {
        return (Logger) this.logger.getValue();
    }

    @NotNull
    public final c0 getNetworkIODispatcher() {
        return this.networkIODispatcher;
    }

    public boolean getOptOut() {
        return this.configuration.getOptOut();
    }

    @NotNull
    public final RemoteConfigClient getRemoteConfigClient() {
        return (RemoteConfigClient) this.remoteConfigClient.getValue();
    }

    @NotNull
    public final q1 getSignalFlow() {
        return this.signalFlow;
    }

    @NotNull
    public final Storage getStorage() {
        return (Storage) this.storage.getValue();
    }

    @NotNull
    public final c0 getStorageIODispatcher() {
        return this.storageIODispatcher;
    }

    @NotNull
    public final State getStore() {
        return this.store;
    }

    @NotNull
    public final Timeline getTimeline() {
        return this.timeline;
    }

    @Nullable
    public final String getUserId() {
        return this.store.getUserId();
    }

    @JvmOverloads
    @NotNull
    public final Amplitude groupIdentify(@NotNull String groupType, @NotNull String groupName, @NotNull Identify identify) {
        Intrinsics.g(groupType, "groupType");
        Intrinsics.g(groupName, "groupName");
        Intrinsics.g(identify, "identify");
        return groupIdentify$default(this, groupType, groupName, identify, (EventOptions) null, 8, (Object) null);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude identify(@NotNull Identify identify) {
        Intrinsics.g(identify, "identify");
        return identify$default(this, identify, (EventOptions) null, 2, (Object) null);
    }

    @NotNull
    /* renamed from: isBuilt, reason: from getter */
    public final p0 getIsBuilt() {
        return this.isBuilt;
    }

    @Deprecated
    @NotNull
    public final Amplitude logEvent(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        return track$default(this, event, (EventOptions) null, (Function3) null, 6, (Object) null);
    }

    @Deprecated
    @NotNull
    public final Amplitude logRevenue(@NotNull Revenue revenue) {
        Intrinsics.g(revenue, "revenue");
        revenue$default(this, revenue, null, 2, null);
        return this;
    }

    @NotNull
    public final Amplitude remove(@NotNull Plugin plugin) {
        Intrinsics.g(plugin, "plugin");
        if (plugin instanceof ObservePlugin) {
            this.store.remove((ObservePlugin) plugin);
            return this;
        }
        this.timeline.remove(plugin);
        return this;
    }

    @NotNull
    public Amplitude reset() {
        setUserId(null);
        setDeviceId(ContextPlugin.INSTANCE.generateRandomDeviceId());
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude revenue(@NotNull Revenue revenue) {
        Intrinsics.g(revenue, "revenue");
        return revenue$default(this, revenue, null, 2, null);
    }

    @NotNull
    public final Amplitude setDeviceId(@NotNull String deviceId) {
        Intrinsics.g(deviceId, "deviceId");
        this.identityCoordinator.setDeviceId(deviceId);
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude setGroup(@NotNull String groupType, @NotNull String groupName) {
        Intrinsics.g(groupType, "groupType");
        Intrinsics.g(groupName, "groupName");
        return setGroup$default(this, groupType, groupName, (EventOptions) null, 4, (Object) null);
    }

    public void setOptOut(boolean z11) {
        this.configuration.setOptOut(z11);
    }

    @NotNull
    public final Amplitude setUserId(@Nullable String userId) {
        this.identityCoordinator.setUserId(userId);
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude track(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        return track$default(this, event, (EventOptions) null, (Function3) null, 6, (Object) null);
    }

    public static /* synthetic */ Amplitude groupIdentify$default(Amplitude amplitude, String str, String str2, Identify identify, EventOptions eventOptions, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: groupIdentify");
        }
        if ((i5 & 8) != 0) {
            eventOptions = null;
        }
        return amplitude.groupIdentify(str, str2, identify, eventOptions);
    }

    public static /* synthetic */ Amplitude identify$default(Amplitude amplitude, Identify identify, EventOptions eventOptions, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: identify");
        }
        if ((i5 & 2) != 0) {
            eventOptions = null;
        }
        return amplitude.identify(identify, eventOptions);
    }

    public static /* synthetic */ Amplitude setGroup$default(Amplitude amplitude, String str, String[] strArr, EventOptions eventOptions, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: setGroup");
        }
        if ((i5 & 4) != 0) {
            eventOptions = null;
        }
        return amplitude.setGroup(str, strArr, eventOptions);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ Amplitude track$default(Amplitude amplitude, String str, Map map, EventOptions eventOptions, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: track");
        }
        if ((i5 & 2) != 0) {
            map = null;
        }
        if ((i5 & 4) != 0) {
            eventOptions = null;
        }
        return amplitude.track(str, (Map<String, ? extends Object>) map, eventOptions);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude groupIdentify(@NotNull String groupType, @NotNull String groupName, @Nullable Map<String, ? extends Object> map) {
        Intrinsics.g(groupType, "groupType");
        Intrinsics.g(groupName, "groupName");
        return groupIdentify$default(this, groupType, groupName, map, (EventOptions) null, 8, (Object) null);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude identify(@Nullable Map<String, ? extends Object> map) {
        return identify$default(this, map, (EventOptions) null, 2, (Object) null);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude revenue(@NotNull Revenue revenue, @Nullable EventOptions options) {
        Intrinsics.g(revenue, "revenue");
        if (!revenue.isValid()) {
            getLogger().warn("Invalid revenue object, missing required fields");
            return this;
        }
        RevenueEvent revenueEvent = revenue.toRevenueEvent();
        if (options != null) {
            revenueEvent.mergeEventOptions(options);
        }
        revenue(revenueEvent);
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude setGroup(@NotNull String groupType, @NotNull String[] groupName) {
        Intrinsics.g(groupType, "groupType");
        Intrinsics.g(groupName, "groupName");
        return setGroup$default(this, groupType, groupName, (EventOptions) null, 4, (Object) null);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude track(@NotNull BaseEvent event, @Nullable EventOptions eventOptions) {
        Intrinsics.g(event, "event");
        return track$default(this, event, eventOptions, (Function3) null, 4, (Object) null);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude groupIdentify(@NotNull String groupType, @NotNull String groupName, @Nullable Map<String, ? extends Object> groupProperties, @Nullable EventOptions options) {
        Intrinsics.g(groupType, "groupType");
        Intrinsics.g(groupName, "groupName");
        return groupIdentify(groupType, groupName, convertPropertiesToIdentify(groupProperties), options);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude identify(@Nullable Map<String, ? extends Object> userProperties, @Nullable EventOptions options) {
        return identify(convertPropertiesToIdentify(userProperties), options);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude setGroup(@NotNull String groupType, @NotNull String groupName, @Nullable EventOptions options) {
        Intrinsics.g(groupType, "groupType");
        Intrinsics.g(groupName, "groupName");
        Identify identify = new Identify().set(groupType, groupName);
        IdentifyEvent identifyEvent = new IdentifyEvent();
        identifyEvent.setGroups(MapsKt.k0(new Pair(groupType, groupName)));
        identifyEvent.setUserProperties(identify.getProperties());
        track$default(this, identifyEvent, options, (Function3) null, 4, (Object) null);
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude track(@NotNull String eventType) {
        Intrinsics.g(eventType, "eventType");
        return track$default(this, eventType, (Map) null, (EventOptions) null, 6, (Object) null);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude groupIdentify(@NotNull String groupType, @NotNull String groupName, @NotNull Identify identify, @Nullable EventOptions options) {
        Intrinsics.g(groupType, "groupType");
        Intrinsics.g(groupName, "groupName");
        Intrinsics.g(identify, "identify");
        GroupIdentifyEvent groupIdentifyEvent = new GroupIdentifyEvent();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        linkedHashMap.put(groupType, groupName);
        groupIdentifyEvent.setGroups(linkedHashMap);
        groupIdentifyEvent.setGroupProperties(identify.getProperties());
        if (options != null) {
            groupIdentifyEvent.mergeEventOptions(options);
        }
        process(groupIdentifyEvent);
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude identify(@NotNull Identify identify, @Nullable EventOptions options) {
        Intrinsics.g(identify, "identify");
        IdentifyEvent identifyEvent = new IdentifyEvent();
        identifyEvent.setUserProperties(identify.getProperties());
        if (options != null) {
            identifyEvent.mergeEventOptions(options);
            String userId = options.getUserId();
            if (userId != null) {
                setUserId(userId);
            }
            String deviceId = options.getDeviceId();
            if (deviceId != null) {
                setDeviceId(deviceId);
            }
        }
        process(identifyEvent);
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude track(@NotNull String eventType, @Nullable Map<String, ? extends Object> map) {
        Intrinsics.g(eventType, "eventType");
        return track$default(this, eventType, map, (EventOptions) null, 4, (Object) null);
    }

    @JvmOverloads
    @NotNull
    public final Amplitude track(@NotNull BaseEvent event, @Nullable EventOptions options, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> callback) {
        Intrinsics.g(event, "event");
        if (options != null) {
            event.mergeEventOptions(options);
        }
        if (callback != null) {
            event.setCallback(callback);
        }
        process(event);
        return this;
    }

    @NotNull
    public final Amplitude revenue(@NotNull RevenueEvent event) {
        Intrinsics.g(event, "event");
        process(event);
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude track(@NotNull String eventType, @Nullable Map<String, ? extends Object> eventProperties, @Nullable EventOptions options) {
        Intrinsics.g(eventType, "eventType");
        BaseEvent baseEvent = new BaseEvent();
        baseEvent.setEventType(eventType);
        baseEvent.setEventProperties(eventProperties != null ? MapsKt.u0(eventProperties) : null);
        if (options != null) {
            baseEvent.mergeEventOptions(options);
        }
        process(baseEvent);
        return this;
    }

    @JvmOverloads
    @NotNull
    public final Amplitude setGroup(@NotNull String groupType, @NotNull String[] groupName, @Nullable EventOptions options) {
        Intrinsics.g(groupType, "groupType");
        Intrinsics.g(groupName, "groupName");
        Identify identify = new Identify().set(groupType, groupName);
        IdentifyEvent identifyEvent = new IdentifyEvent();
        identifyEvent.setGroups(MapsKt.k0(new Pair(groupType, groupName)));
        identifyEvent.setUserProperties(identify.getProperties());
        track$default(this, identifyEvent, options, (Function3) null, 4, (Object) null);
        return this;
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

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public Amplitude(@NotNull Configuration configuration) {
        this(configuration, new State(), null, null, null, null, 60, null);
        Intrinsics.g(configuration, "configuration");
    }
}
