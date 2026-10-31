package com.instabridge.ai.proactive;

import a80.e;
import a80.m;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import aq.e0;
import aq.h0;
import aq.r;
import b.u4;
import b70.g;
import c80.f;
import c80.j;
import com.amplitude.android.migration.DatabaseConstants;
import com.google.android.gms.internal.measurement.k2;
import com.instabridge.ai.billing.AiTier;
import com.instabridge.ai.context.AiContextManager;
import com.instabridge.ai.context.ContextType;
import com.instabridge.ai.protocol.AGUIEvent;
import com.instabridge.ai.tools.ToolPreloader;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.l;
import t70.i2;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.p2;
import t70.r1;
import t70.t0;
import t70.y0;
import w70.g2;

@Metadata(d1 = {"\u0000Â\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b$\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0007\u0018\u0000 \u0092\u00012\u00020\u0001:\u0002\u0092\u0001B\u001b\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u0015\u0010\u000e\u001a\u00020\r2\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u000e\u0010\u000fJ%\u0010\u0015\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u0010¢\u0006\u0004\b\u0015\u0010\u0016J\r\u0010\u0017\u001a\u00020\r¢\u0006\u0004\b\u0017\u0010\u0018J\r\u0010\u001a\u001a\u00020\u0019¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\bH\u0000¢\u0006\u0004\b\u001c\u0010\nJ\u0017\u0010\"\u001a\u00020\r2\u0006\u0010\u001f\u001a\u00020\u001eH\u0000¢\u0006\u0004\b \u0010!J\u0017\u0010$\u001a\u00020\r2\b\b\u0002\u0010#\u001a\u00020\b¢\u0006\u0004\b$\u0010%J\r\u0010&\u001a\u00020\r¢\u0006\u0004\b&\u0010\u0018J\r\u0010'\u001a\u00020\r¢\u0006\u0004\b'\u0010\u0018J\u0017\u0010(\u001a\u00020\r2\b\b\u0002\u0010#\u001a\u00020\b¢\u0006\u0004\b(\u0010%J#\u0010.\u001a\b\u0012\u0004\u0012\u00020*0)2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020*0)H\u0001¢\u0006\u0004\b,\u0010-J\u0015\u00101\u001a\u00020\r2\u0006\u00100\u001a\u00020/¢\u0006\u0004\b1\u00102J\u001f\u00107\u001a\u00020\b2\u0006\u00103\u001a\u00020\u00122\u0006\u00104\u001a\u00020\u0019H\u0001¢\u0006\u0004\b5\u00106J\u0017\u0010:\u001a\u00020\r2\u0006\u00103\u001a\u00020\u0012H\u0001¢\u0006\u0004\b8\u00109J\u0015\u0010;\u001a\u00020\r2\u0006\u00100\u001a\u00020/¢\u0006\u0004\b;\u00102J\u0013\u0010<\u001a\b\u0012\u0004\u0012\u00020/0)¢\u0006\u0004\b<\u0010=J\u0013\u0010>\u001a\b\u0012\u0004\u0012\u00020*0)¢\u0006\u0004\b>\u0010=J\r\u0010?\u001a\u00020\r¢\u0006\u0004\b?\u0010\u0018J\u0015\u0010A\u001a\u00020\r2\u0006\u0010@\u001a\u00020\u0010¢\u0006\u0004\bA\u0010BJ\u0015\u0010C\u001a\u00020\r2\u0006\u0010@\u001a\u00020\u0010¢\u0006\u0004\bC\u0010BJ\u0015\u0010D\u001a\u00020\r2\u0006\u00100\u001a\u00020/¢\u0006\u0004\bD\u00102J\r\u0010E\u001a\u00020\r¢\u0006\u0004\bE\u0010\u0018J\u000f\u0010G\u001a\u00020\rH\u0000¢\u0006\u0004\bF\u0010\u0018J\u000f\u0010H\u001a\u00020\bH\u0002¢\u0006\u0004\bH\u0010\nJ\u000f\u0010I\u001a\u00020\bH\u0002¢\u0006\u0004\bI\u0010\nJ\u0017\u0010K\u001a\u00020\r2\u0006\u0010J\u001a\u00020\u0010H\u0002¢\u0006\u0004\bK\u0010BJ\u0017\u0010L\u001a\u00020\r2\u0006\u0010#\u001a\u00020\bH\u0002¢\u0006\u0004\bL\u0010%J\u0018\u0010M\u001a\u00020\r2\u0006\u0010#\u001a\u00020\bH\u0082@¢\u0006\u0004\bM\u0010NJ\u001d\u0010P\u001a\b\u0012\u0004\u0012\u00020*0)2\u0006\u0010O\u001a\u00020\u0010H\u0002¢\u0006\u0004\bP\u0010QR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010RR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010SR\u001a\u0010U\u001a\u00020T8\u0000X\u0080\u0004¢\u0006\f\n\u0004\bU\u0010V\u001a\u0004\bW\u0010XR\u001a\u0010Z\u001a\u00020Y8\u0000X\u0080\u0004¢\u0006\f\n\u0004\bZ\u0010[\u001a\u0004\b\\\u0010]R\u001a\u0010_\u001a\u00020^8\u0000X\u0080\u0004¢\u0006\f\n\u0004\b_\u0010`\u001a\u0004\ba\u0010bR\u001a\u0010d\u001a\u00020c8\u0000X\u0080\u0004¢\u0006\f\n\u0004\bd\u0010e\u001a\u0004\bf\u0010gR\u001c\u0010j\u001a\n i*\u0004\u0018\u00010h0h8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bj\u0010kR\u0014\u0010m\u001a\u00020l8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bm\u0010nR\u0018\u0010p\u001a\u0004\u0018\u00010o8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bp\u0010qR\u0014\u0010s\u001a\u00020r8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bs\u0010tR\u0014\u0010v\u001a\u00020u8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bv\u0010wR\u001a\u0010z\u001a\b\u0012\u0004\u0012\u00020y0x8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bz\u0010{R\u0016\u0010|\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b|\u0010}R\u0016\u0010~\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b~\u0010}R\u0014\u0010\u007f\u001a\u00020\u00128\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u007f\u0010}R)\u0010\u0081\u0001\u001a\u000f\u0012\n\u0012\b\u0012\u0004\u0012\u00020/0)0\u0080\u00018\u0006¢\u0006\u0010\n\u0006\b\u0081\u0001\u0010\u0082\u0001\u001a\u0006\b\u0083\u0001\u0010\u0084\u0001R/\u0010\u0085\u0001\u001a\u000b\u0012\u0006\u0012\u0004\u0018\u00010/0\u0080\u00018\u0006X\u0087\u0004¢\u0006\u0017\n\u0006\b\u0085\u0001\u0010\u0082\u0001\u0012\u0005\b\u0087\u0001\u0010\u0018\u001a\u0006\b\u0086\u0001\u0010\u0084\u0001R\u001b\u0010\u0088\u0001\u001a\u0004\u0018\u00010y8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0088\u0001\u0010\u0089\u0001R\u001b\u0010\u008a\u0001\u001a\u0004\u0018\u00010\b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u008a\u0001\u0010\u008b\u0001R^\u0010\u0091\u0001\u001a@\u0012\u0018\u0012\u0016\u0012\u0004\u0012\u00020* i*\n\u0012\u0004\u0012\u00020*\u0018\u00010)0) i*\u001f\u0012\u0018\u0012\u0016\u0012\u0004\u0012\u00020* i*\n\u0012\u0004\u0012\u00020*\u0018\u00010)0)\u0018\u00010\u008c\u00010\u008c\u00018BX\u0082\u0084\u0002¢\u0006\u0010\n\u0006\b\u008d\u0001\u0010\u008e\u0001\u001a\u0006\b\u008f\u0001\u0010\u0090\u0001¨\u0006\u0093\u0001"}, d2 = {"Lcom/instabridge/ai/proactive/AiProactiveManager;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/content/Context;", "context", "Lcom/instabridge/ai/proactive/ProactiveGenerationConfig;", "generationConfig", "<init>", "(Landroid/content/Context;Lcom/instabridge/ai/proactive/ProactiveGenerationConfig;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isGenerationInFlight", "()Z", "Lcom/instabridge/ai/proactive/NotificationConfig;", "config", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "setNotificationConfig", "(Lcom/instabridge/ai/proactive/NotificationConfig;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lead", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ttlMs", "triggerEvent", "addTriggeredQuery", "(Ljava/lang/String;JLjava/lang/String;)V", "recordFeedOpened", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "feedOpenCount", "()I", "backgroundGenerationAllowed$instabridge_ai_sdk_release", "backgroundGenerationAllowed", "Lcom/instabridge/ai/protocol/AGUIEvent$QuotaExceeded;", DatabaseConstants.EVENT_FIELD, "pauseForQuota$instabridge_ai_sdk_release", "(Lcom/instabridge/ai/protocol/AGUIEvent$QuotaExceeded;)V", "pauseForQuota", "force", "refreshMetaQueries", "(Z)V", "onToolsReady", "onConsentResolved", "requestInsight", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/proactive/AiMetaQueryLead;", "leads", "reorderForBatchDiversity$instabridge_ai_sdk_release", "(Ljava/util/List;)Ljava/util/List;", "reorderForBatchDiversity", "Lcom/instabridge/ai/proactive/AiInsightData;", "insight", "incrementViewCount", "(Lcom/instabridge/ai/proactive/AiInsightData;)V", "nowMs", "freshPoolSize", "shouldNudgeAfterImpression$instabridge_ai_sdk_release", "(JI)Z", "shouldNudgeAfterImpression", "markImpressionNudgeForTesting$instabridge_ai_sdk_release", "(J)V", "markImpressionNudgeForTesting", "removeInsight", "loadInsightHistory", "()Ljava/util/List;", "getMetaQueryLeads", "clearInsightPool", "surface", "reportImpression", "(Ljava/lang/String;)V", "reportTap", "postNotification", "destroy", "scheduleBackgroundRefresh$instabridge_ai_sdk_release", "scheduleBackgroundRefresh", "tierAllowed", "generationReady", "trigger", "executePendingIfReady", "launchGeneration", "generateInsights", "(ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "raw", "parseMetaLeads", "(Ljava/lang/String;)Ljava/util/List;", "Landroid/content/Context;", "Lcom/instabridge/ai/proactive/ProactiveGenerationConfig;", "Lcom/instabridge/ai/proactive/AiInsightStore;", "insightStore", "Lcom/instabridge/ai/proactive/AiInsightStore;", "getInsightStore$instabridge_ai_sdk_release", "()Lcom/instabridge/ai/proactive/AiInsightStore;", "Lcom/instabridge/ai/proactive/AiMetaQueryStore;", "metaStore", "Lcom/instabridge/ai/proactive/AiMetaQueryStore;", "getMetaStore$instabridge_ai_sdk_release", "()Lcom/instabridge/ai/proactive/AiMetaQueryStore;", "Lcom/instabridge/ai/proactive/AiTriggeredQueryStore;", "triggeredQueryStore", "Lcom/instabridge/ai/proactive/AiTriggeredQueryStore;", "getTriggeredQueryStore$instabridge_ai_sdk_release", "()Lcom/instabridge/ai/proactive/AiTriggeredQueryStore;", "Lcom/instabridge/ai/proactive/AiEngagementTracker;", "engagementTracker", "Lcom/instabridge/ai/proactive/AiEngagementTracker;", "getEngagementTracker$instabridge_ai_sdk_release", "()Lcom/instabridge/ai/proactive/AiEngagementTracker;", "Landroid/content/SharedPreferences;", "kotlin.jvm.PlatformType", "prefs", "Landroid/content/SharedPreferences;", "Lcom/instabridge/ai/proactive/ProactiveQuotaPause;", "quotaPause", "Lcom/instabridge/ai/proactive/ProactiveQuotaPause;", "Lcom/instabridge/ai/proactive/AiNotificationManager;", "notificationManager", "Lcom/instabridge/ai/proactive/AiNotificationManager;", "Lt70/j0;", "scope", "Lt70/j0;", "Lc80/a;", "activeJobMutex", "Lc80/a;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lt70/r1;", "activeJobs", "Ljava/util/List;", "lastRequestMs", "J", "lastImpressionNudgeMs", "MIN_REQUEST_INTERVAL_MS", "Lw70/g2;", "insightPool", "Lw70/g2;", "getInsightPool", "()Lw70/g2;", "latestInsight", "getLatestInsight", "getLatestInsight$annotations", "metaJob", "Lt70/r1;", "pendingForce", "Ljava/lang/Boolean;", "Laq/r;", "metaLeadsAdapter$delegate", "Lkotlin/Lazy;", "getMetaLeadsAdapter", "()Laq/r;", "metaLeadsAdapter", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiProactiveManager {

    @NotNull
    private static final String KEY_FEED_OPEN_COUNT = "feed_open_count";

    @NotNull
    private static final Map<String, Object> META_RESPONSE_FORMAT;

    @NotNull
    private static final String PREFS_NAME = "ai_sdk_proactive";
    private final long MIN_REQUEST_INTERVAL_MS;

    @NotNull
    private final c80.a activeJobMutex;

    @NotNull
    private final List<r1> activeJobs;

    @NotNull
    private final Context context;

    @NotNull
    private final AiEngagementTracker engagementTracker;

    @NotNull
    private final ProactiveGenerationConfig generationConfig;

    @NotNull
    private final g2 insightPool;

    @NotNull
    private final AiInsightStore insightStore;
    private volatile long lastImpressionNudgeMs;
    private volatile long lastRequestMs;

    @NotNull
    private final g2 latestInsight;

    @Nullable
    private r1 metaJob;

    /* renamed from: metaLeadsAdapter$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy metaLeadsAdapter;

    @NotNull
    private final AiMetaQueryStore metaStore;

    @Nullable
    private AiNotificationManager notificationManager;

    @Nullable
    private volatile Boolean pendingForce;
    private final SharedPreferences prefs;

    @NotNull
    private final ProactiveQuotaPause quotaPause;

    @NotNull
    private final j0 scope;

    @NotNull
    private final AiTriggeredQueryStore triggeredQueryStore;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\b\u0003\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0014\u0010\u0004\u001a\u00020\u00058BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007R\u000e\u0010\b\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u001f\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/proactive/AiProactiveManager$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "TAG", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getTAG", "()Ljava/lang/String;", "PREFS_NAME", "KEY_FEED_OPEN_COUNT", "META_RESPONSE_FORMAT", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getMETA_RESPONSE_FORMAT", "()Ljava/util/Map;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String getTAG() {
            int i5 = jo.a.f69615a;
            return jo.a.b();
        }

        @NotNull
        public final Map<String, Object> getMETA_RESPONSE_FORMAT() {
            return AiProactiveManager.META_RESPONSE_FORMAT;
        }

        private Companion() {
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.proactive.AiProactiveManager", f = "AiProactiveManager.kt", l = {578, 656, 694, 717, 721}, m = "generateInsights")
    /* renamed from: com.instabridge.ai.proactive.AiProactiveManager$generateInsights$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        double D$0;
        int I$0;
        int I$1;
        Object L$0;
        Object L$1;
        Object L$2;
        boolean Z$0;
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
            return AiProactiveManager.this.generateInsights(false, this);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Ljava/util/List;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.proactive.AiProactiveManager$generateInsights$5", f = "AiProactiveManager.kt", l = {678}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.proactive.AiProactiveManager$generateInsights$5, reason: invalid class name */
    public static final class AnonymousClass5 extends SuspendLambda implements Function2<j0, Continuation<? super List<? extends Unit>>, Object> {
        final /* synthetic */ boolean $aggressiveMode;
        final /* synthetic */ double $ctr;
        final /* synthetic */ boolean $debugRetry;
        final /* synthetic */ Set<Integer> $failedCats;
        final /* synthetic */ List<AiMetaQueryLead> $leads;
        final /* synthetic */ AtomicInteger $saved;
        final /* synthetic */ f $semaphore;
        final /* synthetic */ int $target;
        private /* synthetic */ Object L$0;
        int label;
        final /* synthetic */ AiProactiveManager this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass5(List<AiMetaQueryLead> list, AtomicInteger atomicInteger, int i5, f fVar, AiProactiveManager aiProactiveManager, double d5, boolean z11, boolean z12, Set<Integer> set, Continuation<? super AnonymousClass5> continuation) {
            super(2, continuation);
            this.$leads = list;
            this.$saved = atomicInteger;
            this.$target = i5;
            this.$semaphore = fVar;
            this.this$0 = aiProactiveManager;
            this.$ctr = d5;
            this.$aggressiveMode = z11;
            this.$debugRetry = z12;
            this.$failedCats = set;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            AnonymousClass5 anonymousClass5 = new AnonymousClass5(this.$leads, this.$saved, this.$target, this.$semaphore, this.this$0, this.$ctr, this.$aggressiveMode, this.$debugRetry, this.$failedCats, continuation);
            anonymousClass5.L$0 = obj;
            return anonymousClass5;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            int i11 = 1;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            j0 j0Var = (j0) this.L$0;
            List<AiMetaQueryLead> list = this.$leads;
            AtomicInteger atomicInteger = this.$saved;
            int i12 = this.$target;
            f fVar = this.$semaphore;
            AiProactiveManager aiProactiveManager = this.this$0;
            double d5 = this.$ctr;
            boolean z11 = this.$aggressiveMode;
            boolean z12 = this.$debugRetry;
            Set<Integer> set = this.$failedCats;
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            Iterator it = list.iterator();
            while (it.hasNext()) {
                ArrayList arrayList2 = arrayList;
                arrayList2.add(m0.e(j0Var, null, new AiProactiveManager$generateInsights$5$jobs$1$1(atomicInteger, i12, fVar, aiProactiveManager, (AiMetaQueryLead) it.next(), d5, z11, z12, set, null), 3));
                it = it;
                arrayList = arrayList2;
                i11 = 1;
            }
            this.label = i11;
            Object objF = m0.f(arrayList, this);
            return objF == coroutineSingletons ? coroutineSingletons : objF;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super List<Unit>> continuation) {
            return ((AnonymousClass5) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Ljava/util/List;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.proactive.AiProactiveManager$generateInsights$6", f = "AiProactiveManager.kt", l = {707}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.proactive.AiProactiveManager$generateInsights$6, reason: invalid class name */
    public static final class AnonymousClass6 extends SuspendLambda implements Function2<j0, Continuation<? super List<? extends Unit>>, Object> {
        final /* synthetic */ boolean $aggressiveMode;
        final /* synthetic */ double $ctr;
        final /* synthetic */ List<AiMetaQueryLead> $retryLeads;
        final /* synthetic */ f $retrySemaphore;
        final /* synthetic */ AtomicInteger $saved;
        private /* synthetic */ Object L$0;
        int label;
        final /* synthetic */ AiProactiveManager this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass6(List<AiMetaQueryLead> list, f fVar, AiProactiveManager aiProactiveManager, double d5, boolean z11, AtomicInteger atomicInteger, Continuation<? super AnonymousClass6> continuation) {
            super(2, continuation);
            this.$retryLeads = list;
            this.$retrySemaphore = fVar;
            this.this$0 = aiProactiveManager;
            this.$ctr = d5;
            this.$aggressiveMode = z11;
            this.$saved = atomicInteger;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            AnonymousClass6 anonymousClass6 = new AnonymousClass6(this.$retryLeads, this.$retrySemaphore, this.this$0, this.$ctr, this.$aggressiveMode, this.$saved, continuation);
            anonymousClass6.L$0 = obj;
            return anonymousClass6;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            j0 j0Var = (j0) this.L$0;
            List<AiMetaQueryLead> list = this.$retryLeads;
            f fVar = this.$retrySemaphore;
            AiProactiveManager aiProactiveManager = this.this$0;
            double d5 = this.$ctr;
            boolean z11 = this.$aggressiveMode;
            AtomicInteger atomicInteger = this.$saved;
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                arrayList.add(m0.e(j0Var, null, new AiProactiveManager$generateInsights$6$1$1(fVar, aiProactiveManager, (AiMetaQueryLead) it.next(), d5, z11, atomicInteger, null), 3));
            }
            this.label = 1;
            Object objF = m0.f(arrayList, this);
            return objF == coroutineSingletons ? coroutineSingletons : objF;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super List<Unit>> continuation) {
            return ((AnonymousClass6) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.proactive.AiProactiveManager$launchGeneration$1", f = "AiProactiveManager.kt", l = {901}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.proactive.AiProactiveManager$launchGeneration$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28501 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ boolean $force;
        Object L$0;
        Object L$1;
        boolean Z$0;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28501(boolean z11, Continuation<? super C28501> continuation) {
            super(2, continuation);
            this.$force = z11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final boolean invokeSuspend$lambda$3$lambda$1$lambda$0(r1 r1Var) {
            return !r1Var.b();
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiProactiveManager.this.new C28501(this.$force, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            AiProactiveManager aiProactiveManager;
            boolean z11;
            Object obj2;
            Unit unit;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                c80.a aVar = AiProactiveManager.this.activeJobMutex;
                aiProactiveManager = AiProactiveManager.this;
                boolean z12 = this.$force;
                this.L$0 = aVar;
                this.L$1 = aiProactiveManager;
                this.Z$0 = z12;
                this.label = 1;
                c80.d dVar = (c80.d) aVar;
                if (dVar.e(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                z11 = z12;
                obj2 = dVar;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                z11 = this.Z$0;
                aiProactiveManager = (AiProactiveManager) this.L$1;
                Object obj3 = (c80.a) this.L$0;
                ResultKt.b(obj);
                obj2 = obj3;
            }
            try {
                if (aiProactiveManager.generationReady()) {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    if (z11 || jCurrentTimeMillis - aiProactiveManager.lastRequestMs >= aiProactiveManager.MIN_REQUEST_INTERVAL_MS) {
                        synchronized (aiProactiveManager.activeJobs) {
                            b70.d.E0(aiProactiveManager.activeJobs, new b(0));
                        }
                        int size = aiProactiveManager.activeJobs.size();
                        if (size > 0) {
                            if (!z11) {
                                AiProactiveManager.Companion.getTAG();
                                unit = Unit.f71706a;
                            } else if (size >= aiProactiveManager.generationConfig.getMaxParallelGenerations()) {
                                AiProactiveManager.Companion.getTAG();
                                aiProactiveManager.generationConfig.getMaxParallelGenerations();
                                unit = Unit.f71706a;
                            } else {
                                AiProactiveManager.Companion.getTAG();
                                aiProactiveManager.generationConfig.getMaxParallelGenerations();
                            }
                        }
                        aiProactiveManager.lastRequestMs = jCurrentTimeMillis;
                        t70.g2 g2VarT = m0.t(aiProactiveManager.scope, null, null, new AiProactiveManager$launchGeneration$1$1$newJob$1(aiProactiveManager, z11, null), 3);
                        synchronized (aiProactiveManager.activeJobs) {
                            aiProactiveManager.activeJobs.add(g2VarT);
                            Unit unit2 = Unit.f71706a;
                        }
                        ((c80.d) obj2).g(null);
                        return Unit.f71706a;
                    }
                    AiProactiveManager.Companion.getTAG();
                    long j11 = (jCurrentTimeMillis - aiProactiveManager.lastRequestMs) / 1000;
                    unit = Unit.f71706a;
                } else {
                    unit = Unit.f71706a;
                }
                return unit;
            } finally {
                ((c80.d) obj2).g(null);
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28501) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.proactive.AiProactiveManager$refreshMetaQueries$1", f = "AiProactiveManager.kt", l = {246, 282, 306}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.proactive.AiProactiveManager$refreshMetaQueries$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28511 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ boolean $force;
        long J$0;
        Object L$0;
        Object L$1;
        Object L$2;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28511(boolean z11, Continuation<? super C28511> continuation) {
            super(2, continuation);
            this.$force = z11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final CharSequence invokeSuspend$lambda$0(AiMetaQueryLead aiMetaQueryLead) {
            String str;
            if (aiMetaQueryLead.getQualityScore() != 50) {
                str = " (score: " + aiMetaQueryLead.getQualityScore() + ')';
            } else {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            return "- [cat=" + aiMetaQueryLead.getCat() + "] " + l.G1(120, aiMetaQueryLead.getQuery()) + str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiProactiveManager.this.new C28511(this.$force, continuation);
        }

        /* JADX WARN: Code restructure failed: missing block: B:48:0x0228, code lost:
        
            if (r7 == r9) goto L49;
         */
        /* JADX WARN: Removed duplicated region for block: B:45:0x01a0 A[Catch: Exception -> 0x0035, TryCatch #0 {Exception -> 0x0035, blocks: (B:8:0x002e, B:50:0x022b, B:52:0x022f, B:54:0x023f, B:56:0x024f, B:58:0x026d, B:60:0x0284, B:62:0x0294, B:64:0x02a3, B:67:0x02ad, B:69:0x02c5, B:71:0x02d1, B:73:0x02e9, B:74:0x02f5, B:76:0x02fb, B:78:0x030c, B:79:0x0310, B:81:0x031a, B:82:0x0344, B:83:0x0374, B:85:0x037a, B:87:0x0390, B:88:0x0398, B:89:0x039e, B:90:0x03b0, B:92:0x03b6, B:93:0x03e8, B:95:0x0403, B:97:0x0409, B:99:0x0411, B:101:0x0427, B:15:0x0044, B:43:0x0196, B:45:0x01a0, B:47:0x01a3, B:36:0x00ca, B:38:0x0103, B:40:0x012c, B:35:0x00b3), top: B:106:0x001a }] */
        /* JADX WARN: Removed duplicated region for block: B:47:0x01a3 A[Catch: Exception -> 0x0035, TryCatch #0 {Exception -> 0x0035, blocks: (B:8:0x002e, B:50:0x022b, B:52:0x022f, B:54:0x023f, B:56:0x024f, B:58:0x026d, B:60:0x0284, B:62:0x0294, B:64:0x02a3, B:67:0x02ad, B:69:0x02c5, B:71:0x02d1, B:73:0x02e9, B:74:0x02f5, B:76:0x02fb, B:78:0x030c, B:79:0x0310, B:81:0x031a, B:82:0x0344, B:83:0x0374, B:85:0x037a, B:87:0x0390, B:88:0x0398, B:89:0x039e, B:90:0x03b0, B:92:0x03b6, B:93:0x03e8, B:95:0x0403, B:97:0x0409, B:99:0x0411, B:101:0x0427, B:15:0x0044, B:43:0x0196, B:45:0x01a0, B:47:0x01a3, B:36:0x00ca, B:38:0x0103, B:40:0x012c, B:35:0x00b3), top: B:106:0x001a }] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws Throwable {
            long metaRefreshIntervalMs;
            Object objY;
            String str;
            Object objRunBestEffort;
            StringBuilder sb2;
            Ref.IntRef intRef;
            Ref.ObjectRef objectRef;
            Object objD;
            String query;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            try {
            } catch (Exception e3) {
                Log.e(AiProactiveManager.Companion.getTAG(), "MetaRefresh: FAILED — exception", e3);
            }
            if (i5 == 0) {
                ResultKt.b(obj);
                if (!AiProactiveManager.this.generationReady()) {
                    return Unit.f71706a;
                }
                metaRefreshIntervalMs = AiProactiveManager.this.generationConfig.getMetaRefreshIntervalMs();
                e eVar = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                AiProactiveManager$refreshMetaQueries$1$lastFetchMs$1 aiProactiveManager$refreshMetaQueries$1$lastFetchMs$1 = new AiProactiveManager$refreshMetaQueries$1$lastFetchMs$1(AiProactiveManager.this, null);
                this.J$0 = metaRefreshIntervalMs;
                this.label = 1;
                objY = m0.y(dVar, aiProactiveManager$refreshMetaQueries$1$lastFetchMs$1, this);
                if (objY != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 == 1) {
                metaRefreshIntervalMs = this.J$0;
                ResultKt.b(obj);
                objY = obj;
            } else {
                if (i5 != 2) {
                    if (i5 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    intRef = (Ref.IntRef) this.L$2;
                    objectRef = (Ref.ObjectRef) this.L$1;
                    sb2 = (StringBuilder) this.L$0;
                    ResultKt.b(obj);
                    objD = obj;
                    if (((Unit) objD) == null) {
                        Log.w(AiProactiveManager.Companion.getTAG(), "MetaRefresh: FAILED — stream timed out after 60s");
                        return Unit.f71706a;
                    }
                    AiProactiveManager.Companion.getTAG();
                    int i11 = intRef.f71861a;
                    sb2.getClass();
                    if (objectRef.f71863a != null) {
                        Log.w(AiProactiveManager.Companion.getTAG(), "MetaRefresh: FAILED — stream error: " + ((String) objectRef.f71863a));
                        return Unit.f71706a;
                    }
                    String string = sb2.toString();
                    Intrinsics.f(string, "toString(...)");
                    String string2 = r70.k.u1(string).toString();
                    if (string2.length() == 0) {
                        Log.w(AiProactiveManager.Companion.getTAG(), "MetaRefresh: FAILED — empty response");
                        return Unit.f71706a;
                    }
                    boolean zL0 = r70.k.L0(string2, AbstractJsonLexerKt.BEGIN_LIST);
                    if (r70.k.K0(string2, "\"text\"", false) && r70.k.K0(string2, "\"topic\"", false) && !zL0) {
                        Log.e(AiProactiveManager.Companion.getTAG(), "MetaRefresh: FAILED — server returned bubble object instead of leads array! response_format may not be honored. raw=".concat(l.G1(200, string2)));
                        return Unit.f71706a;
                    }
                    List metaLeads = AiProactiveManager.this.parseMetaLeads(string2);
                    if (metaLeads.isEmpty()) {
                        Log.w(AiProactiveManager.Companion.getTAG(), "MetaRefresh: FAILED — no leads parsed. raw=".concat(l.G1(300, string2)));
                        return Unit.f71706a;
                    }
                    ArrayList arrayList = new ArrayList();
                    for (Object obj2 : metaLeads) {
                        if (!r70.k.U0(((AiMetaQueryLead) obj2).getQuery())) {
                            arrayList.add(obj2);
                        }
                    }
                    if (arrayList.size() < metaLeads.size()) {
                        Log.w(AiProactiveManager.Companion.getTAG(), "MetaRefresh: dropped " + (metaLeads.size() - arrayList.size()) + " leads with blank queries");
                    }
                    AiProactiveManager.this.getMetaStore().save(arrayList);
                    String tag = AiProactiveManager.Companion.getTAG();
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("MetaRefresh: saved ");
                    sb3.append(arrayList.size());
                    sb3.append(" meta leads. Categories: ");
                    LinkedHashMap linkedHashMap = new LinkedHashMap();
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        Object next = it.next();
                        Integer num = new Integer(((AiMetaQueryLead) next).getCat());
                        Object arrayList2 = linkedHashMap.get(num);
                        if (arrayList2 == null) {
                            arrayList2 = new ArrayList();
                            linkedHashMap.put(num, arrayList2);
                        }
                        ((List) arrayList2).add(next);
                    }
                    ArrayList arrayList3 = new ArrayList(linkedHashMap.size());
                    for (Map.Entry entry : linkedHashMap.entrySet()) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append(((Number) entry.getKey()).intValue());
                        sb4.append(AbstractJsonLexerKt.COLON);
                        sb4.append(((List) entry.getValue()).size());
                        arrayList3.add(sb4.toString());
                    }
                    sb3.append(g.f1(arrayList3, null, null, null, 0, null, 63));
                    sb3.append(". Sample: ");
                    AiMetaQueryLead aiMetaQueryLead = (AiMetaQueryLead) g.Y0(arrayList);
                    sb3.append((aiMetaQueryLead == null || (query = aiMetaQueryLead.getQuery()) == null) ? null : l.G1(80, query));
                    Log.i(tag, sb3.toString());
                    if (AiProactiveManager.this.generationConfig.getRefreshInsightsAfterMetaSuccess()) {
                        AiProactiveManager.this.requestInsight(true);
                    }
                    return Unit.f71706a;
                }
                str = (String) this.L$0;
                ResultKt.b(obj);
                objRunBestEffort = obj;
                String str2 = str;
                List<ToolPreloader.Result> list = (List) objRunBestEffort;
                if (AiProactiveManager.this.generationReady()) {
                    return Unit.f71706a;
                }
                Map mapJ0 = MapsKt.j0(new Pair("response_format", AiProactiveManager.Companion.getMETA_RESPONSE_FORMAT()), new Pair("function_name", "meta_lead_generation_v3"), new Pair("bubble_type", "proactive_meta"), new Pair("max_leads", new Integer(12)), new Pair("preloaded_tool_results", ToolPreloader.INSTANCE.toMetadataPayload(list)));
                AiProactiveManager.Companion.getTAG();
                mapJ0.containsKey("response_format");
                Objects.toString(mapJ0.get("bubble_type"));
                StringBuilder sb5 = new StringBuilder();
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                Ref.IntRef intRef2 = new Ref.IntRef();
                AiProactiveManager$refreshMetaQueries$1$streamResult$1 aiProactiveManager$refreshMetaQueries$1$streamResult$1 = new AiProactiveManager$refreshMetaQueries$1$streamResult$1(str2, mapJ0, sb5, intRef2, objectRef2, AiProactiveManager.this, null);
                sb2 = sb5;
                intRef = intRef2;
                objectRef = objectRef2;
                this.L$0 = sb2;
                this.L$1 = objectRef;
                this.L$2 = intRef;
                this.label = 3;
                objD = p2.d(60000L, aiProactiveManager$refreshMetaQueries$1$streamResult$1, this);
            }
            long jLongValue = ((Number) objY).longValue();
            long jCurrentTimeMillis = System.currentTimeMillis() - jLongValue;
            if (!this.$force && jCurrentTimeMillis < metaRefreshIntervalMs) {
                AiProactiveManager.Companion.getTAG();
                long j11 = 60000;
                long j12 = jCurrentTimeMillis / j11;
                long j13 = metaRefreshIntervalMs / j11;
                return Unit.f71706a;
            }
            Log.i(AiProactiveManager.Companion.getTAG(), "MetaRefresh: starting (force=" + this.$force + ", last=" + (jLongValue == 0 ? "never" : (jCurrentTimeMillis / 3600000) + "h ago") + ')');
            List<AiMetaQueryLead> leads = AiProactiveManager.this.getMetaStore().getLeads();
            str = "Generate proactive insight leads based on my current context. Today is " + new SimpleDateFormat("EEEE, MMMM d, yyyy", Locale.US).format(new Date()) + ". Use absolute dates in leads (e.g., 'April 9' not 'today' or 'tomorrow')." + (leads.isEmpty() ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : "\n\nExisting leads (do NOT regenerate these — create NEW angles instead):\n" + g.f1(leads, "\n", null, null, 0, new b(1), 30));
            ToolPreloader toolPreloader = ToolPreloader.INSTANCE;
            Context context = AiProactiveManager.this.context;
            List<OptimisticToolSpec> listQ = ul.b.Q(new OptimisticToolSpec("media_now_playing", null, 2, null), new OptimisticToolSpec("read_calendar_events", b70.k.e0(new Pair("days_ahead", new Integer(14)))));
            Set<String> bACKGROUND_SAFE_TOOLS$instabridge_ai_sdk_release = InsightGenerator.INSTANCE.getBACKGROUND_SAFE_TOOLS$instabridge_ai_sdk_release();
            this.L$0 = str;
            this.label = 2;
            objRunBestEffort = toolPreloader.runBestEffort(context, listQ, bACKGROUND_SAFE_TOOLS$instabridge_ai_sdk_release, this);
            if (objRunBestEffort != coroutineSingletons) {
                String str22 = str;
                List<ToolPreloader.Result> list2 = (List) objRunBestEffort;
                if (AiProactiveManager.this.generationReady()) {
                }
            }
            return coroutineSingletons;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28511) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.proactive.AiProactiveManager$requestInsight$1", f = "AiProactiveManager.kt", l = {461}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.proactive.AiProactiveManager$requestInsight$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28521 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28521(Continuation<? super C28521> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiProactiveManager.this.new C28521(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                this.label = 1;
                if (t0.b(20000L, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            if (AiProactiveManager.this.pendingForce != null) {
                Log.w(AiProactiveManager.Companion.getTAG(), "requestInsight: fallback triggered after 20s — launching without full prerequisites");
                Boolean bool = AiProactiveManager.this.pendingForce;
                if (bool == null) {
                    return Unit.f71706a;
                }
                boolean zBooleanValue = bool.booleanValue();
                AiProactiveManager.this.pendingForce = null;
                AiProactiveManager.this.launchGeneration(zBooleanValue);
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28521) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    static {
        Pair pair = new Pair(TTConst.TRACK_TYPE, "json_schema");
        Pair pair2 = new Pair(PendingUpgradeStore.KEY_NAME, "MetaQueryResponse");
        Pair pair3 = new Pair("strict", Boolean.TRUE);
        Pair pair4 = new Pair(TTConst.TRACK_TYPE, "object");
        Pair pair5 = new Pair(TTConst.TRACK_TYPE, "array");
        Pair pair6 = new Pair(TTConst.TRACK_TYPE, "object");
        Pair pair7 = new Pair("properties", MapsKt.j0(new Pair(AiDatabase.COL_INSIGHT_CAT, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Category ID 1-7."))), new Pair("signals", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "array"), new Pair("items", m.n(TTConst.TRACK_TYPE, "string")))), new Pair("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "A QUESTION or PROMPT for insight generation. NOT an answer."))), new Pair("specificity", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "0-100. References specific context?"))), new Pair("timeliness", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "0-100. Reason to ask NOW?"))), new Pair("cross_signal", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "0-100. Combines 2+ signals?"))), new Pair("novelty", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "0-100. User wouldn't find themselves?")))));
        Pair pair8 = new Pair("required", ul.b.Q(AiDatabase.COL_INSIGHT_CAT, "signals", "query", "specificity", "timeliness", "cross_signal", "novelty"));
        Boolean bool = Boolean.FALSE;
        META_RESPONSE_FORMAT = MapsKt.j0(pair, new Pair("json_schema", MapsKt.j0(pair2, pair3, new Pair("schema", MapsKt.j0(pair4, new Pair("properties", k2.o("leads", MapsKt.j0(pair5, new Pair("items", MapsKt.j0(pair6, pair7, pair8, new Pair("additionalProperties", bool)))))), new Pair("required", ul.b.P("leads")), new Pair("additionalProperties", bool))))));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public AiProactiveManager(@NotNull Context context, @NotNull ProactiveGenerationConfig generationConfig) {
        Intrinsics.g(context, "context");
        Intrinsics.g(generationConfig, "generationConfig");
        this.context = context;
        this.generationConfig = generationConfig.sanitized();
        AiInsightStore aiInsightStore = new AiInsightStore(context);
        this.insightStore = aiInsightStore;
        this.metaStore = new AiMetaQueryStore(context);
        this.triggeredQueryStore = new AiTriggeredQueryStore(context);
        this.engagementTracker = new AiEngagementTracker(context);
        SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, 0);
        this.prefs = prefs;
        Intrinsics.f(prefs, "prefs");
        this.quotaPause = new ProactiveQuotaPause(prefs, null, 2, 0 == true ? 1 : 0);
        i2 i2VarD = m0.d();
        e eVar = y0.f88884a;
        this.scope = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, a80.d.f488c));
        this.activeJobMutex = new c80.d();
        this.activeJobs = new ArrayList();
        this.MIN_REQUEST_INTERVAL_MS = 30000L;
        this.insightPool = aiInsightStore.getInsightPool();
        this.latestInsight = aiInsightStore.getLatestInsight();
        this.metaLeadsAdapter = LazyKt.a(new a());
    }

    private final void executePendingIfReady(String trigger) {
        Object objA;
        Object objA2;
        Object objA3;
        Boolean bool = this.pendingForce;
        if (bool == null) {
            Companion.getTAG();
            return;
        }
        try {
            int i5 = Result.f71687b;
            objA = Boolean.valueOf(fo.d.h().isRegistered());
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Object obj = Boolean.FALSE;
        if (objA instanceof Result.Failure) {
            objA = obj;
        }
        boolean zBooleanValue = ((Boolean) objA).booleanValue();
        try {
            objA2 = Boolean.valueOf(fo.d.a().hasResolvedStartupConsent());
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            objA2 = ResultKt.a(th3);
        }
        Object obj2 = Boolean.FALSE;
        if (objA2 instanceof Result.Failure) {
            objA2 = obj2;
        }
        boolean zBooleanValue2 = ((Boolean) objA2).booleanValue();
        try {
            objA3 = Boolean.valueOf(fo.d.a().isContextConsentEnabled());
        } catch (Throwable th4) {
            int i13 = Result.f71687b;
            objA3 = ResultKt.a(th4);
        }
        Object obj3 = Boolean.FALSE;
        if (objA3 instanceof Result.Failure) {
            objA3 = obj3;
        }
        boolean zBooleanValue3 = ((Boolean) objA3).booleanValue();
        boolean z11 = zBooleanValue2 || zBooleanValue3;
        Companion companion = Companion;
        Log.i(companion.getTAG(), "executePendingIfReady(" + trigger + "): tools=" + zBooleanValue + " consent_resolved=" + zBooleanValue2 + " consent_enabled=" + zBooleanValue3);
        if (!zBooleanValue || !z11) {
            companion.getTAG();
            return;
        }
        this.pendingForce = null;
        Log.i(companion.getTAG(), "✅ executePendingIfReady: ALL prerequisites met → launching generation (force=" + bool + ')');
        launchGeneration(bool.booleanValue());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x042c, code lost:
    
        if (t70.k0.d(r0, r12) == r13) goto L158;
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x0486, code lost:
    
        if (t70.t0.b(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, r12) != r13) goto L147;
     */
    /* JADX WARN: Path cross not found for [B:103:0x0340, B:136:0x0437], limit reached: 191 */
    /* JADX WARN: Removed duplicated region for block: B:140:0x0443  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x04b1  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x04ed  */
    /* JADX WARN: Removed duplicated region for block: B:166:0x0536  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0542  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v2, types: [boolean, int] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:159:0x04e7 -> B:160:0x04e9). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object generateInsights(boolean z11, Continuation<? super Unit> continuation) {
        AnonymousClass1 anonymousClass1;
        boolean z12;
        boolean z13;
        boolean z14;
        boolean z15;
        Set set;
        List<AiMetaQueryLead> list;
        double d5;
        int i5;
        AtomicInteger atomicInteger;
        int i11;
        double d11;
        AtomicInteger atomicInteger2;
        int i12;
        List<AiMetaQueryLead> list2;
        Iterator it;
        AtomicInteger atomicInteger3;
        double d12;
        List<AiMetaQueryLead> list3;
        Object objA;
        Object objA2;
        Object objA3;
        AiProactiveManager aiProactiveManager = this;
        boolean z16 = z11;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i13 = anonymousClass1.label;
            if ((i13 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i13 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = aiProactiveManager.new AnonymousClass1(continuation);
            }
        }
        AnonymousClass1 anonymousClass12 = anonymousClass1;
        Object objSyncAllIfNeeded = anonymousClass12.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i14 = anonymousClass12.label;
        ?? r82 = 1;
        boolean z17 = true;
        try {
        } catch (Exception e3) {
            Log.w(Companion.getTAG(), "InsightRefresh: context sync failed, proceeding with stale data", e3);
        }
        if (i14 == 0) {
            ResultKt.b(objSyncAllIfNeeded);
            String tag = Companion.getTAG();
            StringBuilder sb2 = new StringBuilder("InsightRefresh: starting (force=");
            sb2.append(z16);
            sb2.append(", consent=");
            try {
                int i15 = Result.f71687b;
                objA = Boolean.valueOf(fo.d.a().isContextConsentEnabled());
            } catch (Throwable th2) {
                int i16 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            Boolean bool = Boolean.FALSE;
            boolean z18 = objA instanceof Result.Failure;
            Object obj = objA;
            if (z18) {
                obj = bool;
            }
            sb2.append(((Boolean) obj).booleanValue());
            sb2.append(", tools=");
            try {
                objA2 = Boolean.valueOf(fo.d.h().isRegistered());
            } catch (Throwable th3) {
                int i17 = Result.f71687b;
                objA2 = ResultKt.a(th3);
            }
            Boolean bool2 = Boolean.FALSE;
            boolean z19 = objA2 instanceof Result.Failure;
            Object obj2 = objA2;
            if (z19) {
                obj2 = bool2;
            }
            sb2.append(((Boolean) obj2).booleanValue());
            sb2.append(", pool=");
            try {
                objA3 = new Integer(((List) aiProactiveManager.insightStore.getInsightPool().getValue()).size());
            } catch (Throwable th4) {
                int i18 = Result.f71687b;
                objA3 = ResultKt.a(th4);
            }
            Integer num = new Integer(-1);
            boolean z21 = objA3 instanceof Result.Failure;
            Object obj3 = objA3;
            if (z21) {
                obj3 = num;
            }
            sb2.append(((Number) obj3).intValue());
            sb2.append(')');
            Log.i(tag, sb2.toString());
            if (!aiProactiveManager.generationReady()) {
                Companion.getTAG();
                return Unit.f71706a;
            }
            aiProactiveManager.refreshMetaQueries(false);
            AiContextManager aiContextManagerD = fo.d.d();
            String strF1 = g.f1(ContextType.getEntries(), null, null, null, 0, new com.instabridge.ai.context.a(aiContextManagerD, z17 ? 1 : 0), 31);
            Log.i(Companion.getTAG(), "InsightRefresh: context ages — " + strF1);
            Context context = aiProactiveManager.context;
            anonymousClass12.Z$0 = z16;
            anonymousClass12.label = 1;
            objSyncAllIfNeeded = aiContextManagerD.syncAllIfNeeded(context, anonymousClass12);
            if (objSyncAllIfNeeded == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i14 != 1) {
                if (i14 == 2) {
                    int i19 = anonymousClass12.I$1;
                    i11 = anonymousClass12.I$0;
                    z15 = anonymousClass12.Z$0;
                    double d13 = anonymousClass12.D$0;
                    set = (Set) anonymousClass12.L$2;
                    atomicInteger = (AtomicInteger) anonymousClass12.L$1;
                    List<AiMetaQueryLead> list4 = (List) anonymousClass12.L$0;
                    ResultKt.b(objSyncAllIfNeeded);
                    z13 = true;
                    z14 = false;
                    i5 = i19;
                    d5 = d13;
                    list = list4;
                    if (z15 || set.isEmpty()) {
                        aiProactiveManager = this;
                        d11 = d5;
                    } else {
                        List<AiMetaQueryLead> list5 = list;
                        ArrayList arrayList = new ArrayList(b70.c.u0(list5, 10));
                        Iterator<T> it2 = list5.iterator();
                        while (it2.hasNext()) {
                            arrayList.add(((AiMetaQueryLead) it2.next()).getQuery());
                        }
                        Set setN1 = g.N1(arrayList);
                        double d14 = d5;
                        ArrayList arrayList2 = new ArrayList();
                        Iterator it3 = set.iterator();
                        while (it3.hasNext()) {
                            int iIntValue = ((Number) it3.next()).intValue();
                            List<AiMetaQueryLead> fALLBACK_LEADS$instabridge_ai_sdk_release = InsightGenerator.INSTANCE.getFALLBACK_LEADS$instabridge_ai_sdk_release();
                            ArrayList arrayList3 = new ArrayList();
                            for (Object obj4 : fALLBACK_LEADS$instabridge_ai_sdk_release) {
                                AiMetaQueryLead aiMetaQueryLead = (AiMetaQueryLead) obj4;
                                if (aiMetaQueryLead.getCat() == iIntValue && !setN1.contains(aiMetaQueryLead.getQuery())) {
                                    arrayList3.add(obj4);
                                }
                            }
                            List listL1 = g.L1(arrayList3);
                            Collections.shuffle(listL1);
                            AiMetaQueryLead aiMetaQueryLead2 = (AiMetaQueryLead) g.Y0(listL1);
                            if (aiMetaQueryLead2 != null) {
                                arrayList2.add(aiMetaQueryLead2);
                            }
                        }
                        if (arrayList2.isEmpty()) {
                            aiProactiveManager = this;
                            d11 = d14;
                        } else {
                            Log.i(Companion.getTAG(), "InsightRefresh: debug retry — " + arrayList2.size() + " leads for failed cats " + set);
                            int i21 = c80.k.f19846a;
                            aiProactiveManager = this;
                            d11 = d14;
                            AnonymousClass6 anonymousClass6 = new AnonymousClass6(arrayList2, new j(i11), aiProactiveManager, d11, i5 != 0 ? z13 : z14, atomicInteger, null);
                            anonymousClass12.L$0 = list;
                            anonymousClass12.L$1 = atomicInteger;
                            anonymousClass12.L$2 = null;
                            anonymousClass12.D$0 = d11;
                            anonymousClass12.I$0 = i5;
                            anonymousClass12.label = 3;
                        }
                    }
                    atomicInteger2 = atomicInteger;
                    i12 = i5;
                    list2 = list;
                    if (atomicInteger2.get() == 0) {
                        Log.w(Companion.getTAG(), "InsightRefresh: TOTAL FAILURE — 0/" + list2.size() + " saved. Retrying with 2 simple leads after 10s delay...");
                        anonymousClass12.L$0 = list2;
                        anonymousClass12.L$1 = atomicInteger2;
                        anonymousClass12.L$2 = null;
                        anonymousClass12.D$0 = d11;
                        anonymousClass12.I$0 = i12;
                        anonymousClass12.label = 4;
                    }
                    Log.i(Companion.getTAG(), "InsightRefresh: done — saved " + atomicInteger2.get() + '/' + list2.size() + " insights, pool now " + ((List) aiProactiveManager.insightStore.getInsightPool().getValue()).size());
                    return Unit.f71706a;
                }
                if (i14 == 3) {
                    i12 = anonymousClass12.I$0;
                    d11 = anonymousClass12.D$0;
                    atomicInteger2 = (AtomicInteger) anonymousClass12.L$1;
                    list = (List) anonymousClass12.L$0;
                    ResultKt.b(objSyncAllIfNeeded);
                    z13 = true;
                    z14 = false;
                    list2 = list;
                    if (atomicInteger2.get() == 0 && !list2.isEmpty() && aiProactiveManager.generationReady()) {
                        Log.w(Companion.getTAG(), "InsightRefresh: TOTAL FAILURE — 0/" + list2.size() + " saved. Retrying with 2 simple leads after 10s delay...");
                        anonymousClass12.L$0 = list2;
                        anonymousClass12.L$1 = atomicInteger2;
                        anonymousClass12.L$2 = null;
                        anonymousClass12.D$0 = d11;
                        anonymousClass12.I$0 = i12;
                        anonymousClass12.label = 4;
                    }
                    Log.i(Companion.getTAG(), "InsightRefresh: done — saved " + atomicInteger2.get() + '/' + list2.size() + " insights, pool now " + ((List) aiProactiveManager.insightStore.getInsightPool().getValue()).size());
                    return Unit.f71706a;
                }
                if (i14 == 4) {
                    i12 = anonymousClass12.I$0;
                    d11 = anonymousClass12.D$0;
                    atomicInteger2 = (AtomicInteger) anonymousClass12.L$1;
                    list2 = (List) anonymousClass12.L$0;
                    ResultKt.b(objSyncAllIfNeeded);
                    z13 = true;
                    z14 = false;
                    List<AiMetaQueryLead> fALLBACK_LEADS$instabridge_ai_sdk_release2 = InsightGenerator.INSTANCE.getFALLBACK_LEADS$instabridge_ai_sdk_release();
                    Intrinsics.g(fALLBACK_LEADS$instabridge_ai_sdk_release2, "<this>");
                    List listL12 = g.L1(fALLBACK_LEADS$instabridge_ai_sdk_release2);
                    Collections.shuffle(listL12);
                    AtomicInteger atomicInteger4 = atomicInteger2;
                    it = g.E1(listL12, 2).iterator();
                    atomicInteger3 = atomicInteger4;
                    d12 = d11;
                    list3 = list2;
                    if (it.hasNext()) {
                    }
                    atomicInteger2 = atomicInteger3;
                    list2 = list3;
                    if (atomicInteger2.get() == 0) {
                    }
                    Log.i(Companion.getTAG(), "InsightRefresh: done — saved " + atomicInteger2.get() + '/' + list2.size() + " insights, pool now " + ((List) aiProactiveManager.insightStore.getInsightPool().getValue()).size());
                    return Unit.f71706a;
                }
                if (i14 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i12 = anonymousClass12.I$0;
                double d15 = anonymousClass12.D$0;
                it = (Iterator) anonymousClass12.L$2;
                AtomicInteger atomicInteger5 = (AtomicInteger) anonymousClass12.L$1;
                List<AiMetaQueryLead> list6 = (List) anonymousClass12.L$0;
                ResultKt.b(objSyncAllIfNeeded);
                z13 = true;
                z14 = false;
                d12 = d15;
                list3 = list6;
                AiInsightData aiInsightData = (AiInsightData) objSyncAllIfNeeded;
                if (aiInsightData == null) {
                    aiProactiveManager.insightStore.addInsight(aiInsightData);
                    int iIncrementAndGet = atomicInteger5.incrementAndGet();
                    String tag2 = Companion.getTAG();
                    StringBuilder sbJ = u4.j(iIncrementAndGet, "InsightRefresh: recovery saved #", " cat=");
                    sbJ.append(aiInsightData.getCat());
                    sbJ.append(" score=");
                    sbJ.append(aiInsightData.getScore());
                    sbJ.append(" text=");
                    sbJ.append(l.G1(60, aiInsightData.getText()));
                    Log.i(tag2, sbJ.toString());
                    if (iIncrementAndGet >= 2) {
                        atomicInteger2 = atomicInteger5;
                        list2 = list3;
                        if (atomicInteger2.get() == 0) {
                            Log.e(Companion.getTAG(), "InsightRefresh: recovery also failed — server may be down");
                        }
                        Log.i(Companion.getTAG(), "InsightRefresh: done — saved " + atomicInteger2.get() + '/' + list2.size() + " insights, pool now " + ((List) aiProactiveManager.insightStore.getInsightPool().getValue()).size());
                        return Unit.f71706a;
                    }
                }
                atomicInteger3 = atomicInteger5;
                if (it.hasNext()) {
                    AiMetaQueryLead aiMetaQueryLead3 = (AiMetaQueryLead) it.next();
                    if (aiProactiveManager.generationReady()) {
                        InsightGenerator insightGenerator = InsightGenerator.INSTANCE;
                        Context context2 = aiProactiveManager.context;
                        boolean z22 = i12 != 0 ? z13 : z14;
                        AiProactiveManager$generateInsights$insight$1 aiProactiveManager$generateInsights$insight$1 = new AiProactiveManager$generateInsights$insight$1(aiProactiveManager);
                        AiProactiveManager$generateInsights$insight$2 aiProactiveManager$generateInsights$insight$2 = new AiProactiveManager$generateInsights$insight$2(aiProactiveManager);
                        anonymousClass12.L$0 = list3;
                        anonymousClass12.L$1 = atomicInteger3;
                        anonymousClass12.L$2 = it;
                        anonymousClass12.D$0 = d12;
                        anonymousClass12.I$0 = i12;
                        anonymousClass12.label = 5;
                        Object objGenerateInsight = insightGenerator.generateInsight(context2, aiMetaQueryLead3, d12, z22, aiProactiveManager$generateInsights$insight$1, aiProactiveManager$generateInsights$insight$2, anonymousClass12);
                        if (objGenerateInsight != coroutineSingletons) {
                            atomicInteger5 = atomicInteger3;
                            objSyncAllIfNeeded = objGenerateInsight;
                            AiInsightData aiInsightData2 = (AiInsightData) objSyncAllIfNeeded;
                            if (aiInsightData2 == null) {
                            }
                            atomicInteger3 = atomicInteger5;
                            if (it.hasNext()) {
                            }
                        }
                        return coroutineSingletons;
                    }
                }
                atomicInteger2 = atomicInteger3;
                list2 = list3;
                if (atomicInteger2.get() == 0) {
                }
                Log.i(Companion.getTAG(), "InsightRefresh: done — saved " + atomicInteger2.get() + '/' + list2.size() + " insights, pool now " + ((List) aiProactiveManager.insightStore.getInsightPool().getValue()).size());
                return Unit.f71706a;
            }
            z16 = anonymousClass12.Z$0;
            ResultKt.b(objSyncAllIfNeeded);
        }
        Map map = (Map) objSyncAllIfNeeded;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : map.entrySet()) {
            if (((Boolean) entry.getValue()).booleanValue()) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        Set setKeySet = linkedHashMap.keySet();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (Map.Entry entry2 : map.entrySet()) {
            if (!((Boolean) entry2.getValue()).booleanValue()) {
                linkedHashMap2.put(entry2.getKey(), entry2.getValue());
            }
        }
        Set setKeySet2 = linkedHashMap2.keySet();
        Companion.getTAG();
        g.f1(setKeySet, null, null, null, 0, null, 63);
        g.f1(setKeySet2, null, null, null, 0, null, 63);
        aiProactiveManager.insightStore.pruneExpired();
        ((List) aiProactiveManager.insightStore.getInsightPool().getValue()).size();
        int iFreshActiveCount$default = AiInsightStore.freshActiveCount$default(aiProactiveManager.insightStore, 0, 1, null);
        long jLastFetchTime = aiProactiveManager.insightStore.lastFetchTime();
        long jCurrentTimeMillis = jLastFetchTime > 0 ? System.currentTimeMillis() - jLastFetchTime : Long.MAX_VALUE;
        if (jLastFetchTime != 0) {
            long j11 = jCurrentTimeMillis / 1000;
        }
        Companion companion = Companion;
        companion.getTAG();
        if (!z16 && iFreshActiveCount$default >= aiProactiveManager.generationConfig.getTargetPoolSize() && jCurrentTimeMillis < aiProactiveManager.generationConfig.getMinIntervalMs()) {
            companion.getTAG();
            long j12 = jCurrentTimeMillis / 60000;
            return Unit.f71706a;
        }
        List<AiMetaQueryLead> listReorderForBatchDiversity$instabridge_ai_sdk_release = aiProactiveManager.reorderForBatchDiversity$instabridge_ai_sdk_release(InsightGenerator.INSTANCE.selectLeads(aiProactiveManager.context));
        double dRollingCtr = aiProactiveManager.engagementTracker.rollingCtr();
        AtomicInteger atomicInteger6 = new AtomicInteger(0);
        fo.d.c();
        int starvedBatchSize = iFreshActiveCount$default < aiProactiveManager.generationConfig.getPoolStarvedBelow() ? aiProactiveManager.generationConfig.getStarvedBatchSize() : aiProactiveManager.generationConfig.getSteadyBatchSize();
        if (iFreshActiveCount$default < aiProactiveManager.generationConfig.getPoolStarvedBelow()) {
            z12 = true;
        } else {
            z12 = true;
            r82 = 0;
        }
        companion.getTAG();
        listReorderForBatchDiversity$instabridge_ai_sdk_release.size();
        boolean z23 = z12;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        int targetPoolSize = aiProactiveManager.generationConfig.getTargetPoolSize();
        int i22 = c80.k.f19846a;
        z13 = z23;
        z14 = false;
        AnonymousClass5 anonymousClass5 = new AnonymousClass5(listReorderForBatchDiversity$instabridge_ai_sdk_release, atomicInteger6, targetPoolSize, new j(starvedBatchSize), this, dRollingCtr, r82, false, linkedHashSet, null);
        anonymousClass12.L$0 = listReorderForBatchDiversity$instabridge_ai_sdk_release;
        anonymousClass12.L$1 = atomicInteger6;
        anonymousClass12.L$2 = linkedHashSet;
        anonymousClass12.D$0 = dRollingCtr;
        anonymousClass12.Z$0 = false;
        anonymousClass12.I$0 = starvedBatchSize;
        anonymousClass12.I$1 = r82;
        anonymousClass12.label = 2;
        if (k0.d(anonymousClass5, anonymousClass12) == coroutineSingletons) {
            return coroutineSingletons;
        }
        z15 = false;
        set = linkedHashSet;
        list = listReorderForBatchDiversity$instabridge_ai_sdk_release;
        d5 = dRollingCtr;
        i5 = r82;
        atomicInteger = atomicInteger6;
        i11 = starvedBatchSize;
        if (z15) {
        }
        aiProactiveManager = this;
        d11 = d5;
        atomicInteger2 = atomicInteger;
        i12 = i5;
        list2 = list;
        if (atomicInteger2.get() == 0) {
        }
        Log.i(Companion.getTAG(), "InsightRefresh: done — saved " + atomicInteger2.get() + '/' + list2.size() + " insights, pool now " + ((List) aiProactiveManager.insightStore.getInsightPool().getValue()).size());
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence generateInsights$lambda$15(AiContextManager aiContextManager, ContextType type) {
        Intrinsics.g(type, "type");
        long lastSyncTime = aiContextManager.getLastSyncTime(type);
        return type.name() + '=' + (lastSyncTime > 0 ? a2.c.n(new StringBuilder(), (System.currentTimeMillis() - lastSyncTime) / 60000, 'm') : "never");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean generationReady() {
        return fo.d.j() && backgroundGenerationAllowed$instabridge_ai_sdk_release() && fo.d.a().isContextConsentEnabled();
    }

    @Deprecated
    public static /* synthetic */ void getLatestInsight$annotations() {
    }

    private final r getMetaLeadsAdapter() {
        return (r) this.metaLeadsAdapter.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean isGenerationInFlight$lambda$1$lambda$0(r1 it) {
        Intrinsics.g(it, "it");
        return !it.b();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void launchGeneration(boolean force) {
        if (backgroundGenerationAllowed$instabridge_ai_sdk_release()) {
            m0.t(this.scope, null, null, new C28501(force, null), 3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final r metaLeadsAdapter_delegate$lambda$25() {
        e0 e0Var = new e0(0);
        e0Var.d(new aq.f(6));
        return new h0(e0Var).b(aq.m0.f(List.class, AiMetaQueryLead.class), bq.e.f18422a, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final List<AiMetaQueryLead> parseMetaLeads(String raw) {
        Object objA;
        Object objA2;
        int iS0 = r70.k.S0(raw, "\"leads\"", 0, false, 6);
        if (iS0 >= 0) {
            int iR0 = r70.k.R0(AbstractJsonLexerKt.BEGIN_LIST, iS0, 4, raw);
            int iV0 = r70.k.V0(AbstractJsonLexerKt.END_LIST, 0, 6, raw);
            if (iR0 >= 0 && iV0 > iR0) {
                try {
                    int i5 = Result.f71687b;
                    r metaLeadsAdapter = getMetaLeadsAdapter();
                    String strSubstring = raw.substring(iR0, iV0 + 1);
                    Intrinsics.f(strSubstring, "substring(...)");
                    objA2 = (List) metaLeadsAdapter.b(strSubstring);
                    if (objA2 == null) {
                        objA2 = EmptyList.f71733a;
                    }
                } catch (Throwable th2) {
                    int i11 = Result.f71687b;
                    objA2 = ResultKt.a(th2);
                }
                boolean z11 = objA2 instanceof Result.Failure;
                if (!z11) {
                    if (((List) (z11 ? null : objA2)) != null && (!r9.isEmpty())) {
                        if (z11) {
                            objA2 = null;
                        }
                        Intrinsics.d(objA2);
                        return (List) objA2;
                    }
                }
                Companion.getTAG();
            }
        }
        int iR02 = r70.k.R0(AbstractJsonLexerKt.BEGIN_LIST, 0, 6, raw);
        int iV02 = r70.k.V0(AbstractJsonLexerKt.END_LIST, 0, 6, raw);
        if (iR02 < 0 || iV02 <= iR02) {
            return EmptyList.f71733a;
        }
        try {
            int i12 = Result.f71687b;
            r metaLeadsAdapter2 = getMetaLeadsAdapter();
            String strSubstring2 = raw.substring(iR02, iV02 + 1);
            Intrinsics.f(strSubstring2, "substring(...)");
            objA = (List) metaLeadsAdapter2.b(strSubstring2);
            if (objA == null) {
                objA = EmptyList.f71733a;
            }
        } catch (Throwable th3) {
            int i13 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            Log.w(Companion.getTAG(), "parseMetaLeads: failed: " + thA.getMessage());
            objA = EmptyList.f71733a;
        }
        return (List) objA;
    }

    public static /* synthetic */ void refreshMetaQueries$default(AiProactiveManager aiProactiveManager, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        aiProactiveManager.refreshMetaQueries(z11);
    }

    public static /* synthetic */ void requestInsight$default(AiProactiveManager aiProactiveManager, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        aiProactiveManager.requestInsight(z11);
    }

    private final boolean tierAllowed() {
        AiTier currentTier;
        tx.r rVar = fo.d.f55475m;
        if (rVar == null || (currentTier = rVar.getCurrentTier()) == null) {
            return true;
        }
        return this.generationConfig.getAllowedTiers().contains(currentTier);
    }

    public final void addTriggeredQuery(@NotNull String lead, long ttlMs, @NotNull String triggerEvent) {
        Intrinsics.g(lead, "lead");
        Intrinsics.g(triggerEvent, "triggerEvent");
        this.triggeredQueryStore.add(new AiTriggeredQuery(lead, System.currentTimeMillis() + ttlMs, triggerEvent));
        Companion.getTAG();
        l.G1(60, lead);
        requestInsight(true);
    }

    public final boolean backgroundGenerationAllowed$instabridge_ai_sdk_release() {
        if (this.generationConfig.getEnabled() && tierAllowed() && feedOpenCount() != 0) {
            ProactiveQuotaPause proactiveQuotaPause = this.quotaPause;
            tx.r rVar = fo.d.f55475m;
            if (!proactiveQuotaPause.isPaused(rVar != null ? rVar.getCurrentTier() : null)) {
                return true;
            }
            new Date(this.quotaPause.pausedUntilMs()).toString();
        }
        Companion.getTAG();
        return false;
    }

    public final void clearInsightPool() {
        this.insightStore.clear();
        this.triggeredQueryStore.clear();
        this.metaStore.clear();
        this.lastRequestMs = 0L;
        Companion.getTAG();
        refreshMetaQueries(true);
        requestInsight(true);
    }

    public final void destroy() {
        k0.c(this.scope, null);
    }

    public final int feedOpenCount() {
        return this.prefs.getInt(KEY_FEED_OPEN_COUNT, 0);
    }

    @NotNull
    /* renamed from: getEngagementTracker$instabridge_ai_sdk_release, reason: from getter */
    public final AiEngagementTracker getEngagementTracker() {
        return this.engagementTracker;
    }

    @NotNull
    public final g2 getInsightPool() {
        return this.insightPool;
    }

    @NotNull
    /* renamed from: getInsightStore$instabridge_ai_sdk_release, reason: from getter */
    public final AiInsightStore getInsightStore() {
        return this.insightStore;
    }

    @NotNull
    public final g2 getLatestInsight() {
        return this.latestInsight;
    }

    @NotNull
    public final List<AiMetaQueryLead> getMetaQueryLeads() {
        try {
            return g.D1(new Comparator() { // from class: com.instabridge.ai.proactive.AiProactiveManager$getMetaQueryLeads$$inlined$sortedByDescending$1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // java.util.Comparator
                public final int compare(T t6, T t9) {
                    return ab.e0.t(Integer.valueOf(((AiMetaQueryLead) t9).getQualityScore()), Integer.valueOf(((AiMetaQueryLead) t6).getQualityScore()));
                }
            }, this.metaStore.getLeads());
        } catch (Exception e3) {
            Log.w(Companion.getTAG(), "getMetaQueryLeads failed", e3);
            return EmptyList.f71733a;
        }
    }

    @NotNull
    /* renamed from: getMetaStore$instabridge_ai_sdk_release, reason: from getter */
    public final AiMetaQueryStore getMetaStore() {
        return this.metaStore;
    }

    @NotNull
    /* renamed from: getTriggeredQueryStore$instabridge_ai_sdk_release, reason: from getter */
    public final AiTriggeredQueryStore getTriggeredQueryStore() {
        return this.triggeredQueryStore;
    }

    public final void incrementViewCount(@NotNull AiInsightData insight) {
        Object objA;
        Intrinsics.g(insight, "insight");
        this.insightStore.incrementViewCount(insight);
        long jCurrentTimeMillis = System.currentTimeMillis();
        try {
            int i5 = Result.f71687b;
            objA = Integer.valueOf(AiInsightStore.freshActiveCount$default(this.insightStore, 0, 1, null));
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = 0;
        }
        if (!shouldNudgeAfterImpression$instabridge_ai_sdk_release(jCurrentTimeMillis, ((Number) objA).intValue())) {
            Companion.getTAG();
            insight.getCat();
        } else {
            this.lastImpressionNudgeMs = jCurrentTimeMillis;
            Companion.getTAG();
            insight.getCat();
            requestInsight(false);
        }
    }

    public final boolean isGenerationInFlight() {
        boolean z11;
        synchronized (this.activeJobs) {
            b70.d.E0(this.activeJobs, new b(4));
            z11 = !this.activeJobs.isEmpty();
        }
        return z11;
    }

    @NotNull
    public final List<AiInsightData> loadInsightHistory() {
        return this.insightStore.loadAllForHistory();
    }

    public final void markImpressionNudgeForTesting$instabridge_ai_sdk_release(long nowMs) {
        this.lastImpressionNudgeMs = nowMs;
    }

    public final void onConsentResolved() {
        Object objA;
        Object objA2;
        Object objA3;
        String tag = Companion.getTAG();
        StringBuilder sb2 = new StringBuilder("⚡ onConsentResolved: consent resolved, pending=");
        sb2.append(this.pendingForce != null);
        Log.i(tag, sb2.toString());
        refreshMetaQueries(false);
        executePendingIfReady("consent_resolved");
        try {
            int i5 = Result.f71687b;
            objA = Integer.valueOf(AiInsightStore.freshActiveCount$default(this.insightStore, 0, 1, null));
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = 0;
        }
        int iIntValue = ((Number) objA).intValue();
        try {
            objA2 = Boolean.valueOf(fo.d.h().isRegistered());
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            objA2 = ResultKt.a(th3);
        }
        Object obj = Boolean.FALSE;
        if (objA2 instanceof Result.Failure) {
            objA2 = obj;
        }
        boolean zBooleanValue = ((Boolean) objA2).booleanValue();
        try {
            objA3 = Boolean.valueOf(fo.d.a().isContextConsentEnabled());
        } catch (Throwable th4) {
            int i13 = Result.f71687b;
            objA3 = ResultKt.a(th4);
        }
        Object obj2 = Boolean.FALSE;
        if (objA3 instanceof Result.Failure) {
            objA3 = obj2;
        }
        boolean zBooleanValue2 = ((Boolean) objA3).booleanValue();
        if (iIntValue < this.generationConfig.getPoolStarvedBelow() && zBooleanValue && zBooleanValue2 && this.pendingForce == null) {
            String tag2 = Companion.getTAG();
            StringBuilder sbJ = u4.j(iIntValue, "⚡ onConsentResolved: pool starved (fresh=", " of ");
            sbJ.append(((List) this.insightStore.getInsightPool().getValue()).size());
            sbJ.append(", threshold=");
            sbJ.append(this.generationConfig.getPoolStarvedBelow());
            sbJ.append(") + prerequisites ready → preloading insights");
            Log.i(tag2, sbJ.toString());
            requestInsight(false);
        }
    }

    public final void onToolsReady() {
        String tag = Companion.getTAG();
        StringBuilder sb2 = new StringBuilder("⚡ onToolsReady: tools registered, pending=");
        sb2.append(this.pendingForce != null);
        Log.i(tag, sb2.toString());
        executePendingIfReady("tools_ready");
    }

    public final void pauseForQuota$instabridge_ai_sdk_release(@NotNull AGUIEvent.QuotaExceeded event) {
        Intrinsics.g(event, "event");
        ProactiveQuotaPause proactiveQuotaPause = this.quotaPause;
        String resetIn = event.getResetIn();
        tx.r rVar = fo.d.f55475m;
        proactiveQuotaPause.pause(resetIn, rVar != null ? rVar.getCurrentTier() : null);
        Log.w(Companion.getTAG(), "generation paused: quota_exceeded (plan=" + event.getPlan() + ", used=" + event.getUsed() + '/' + event.getLimit() + ", reset_in=" + event.getResetIn() + ") until " + new Date(this.quotaPause.pausedUntilMs()));
    }

    public final void postNotification(@NotNull AiInsightData insight) {
        Intrinsics.g(insight, "insight");
        AiNotificationManager aiNotificationManager = this.notificationManager;
        if (aiNotificationManager != null) {
            aiNotificationManager.post(insight);
        } else {
            Log.w(Companion.getTAG(), "postNotification called but NotificationConfig not set");
        }
    }

    public final void recordFeedOpened() {
        boolean z11;
        SharedPreferences prefs = this.prefs;
        Intrinsics.f(prefs, "prefs");
        synchronized (prefs) {
            int iFeedOpenCount = feedOpenCount();
            this.prefs.edit().putInt(KEY_FEED_OPEN_COUNT, iFeedOpenCount == Integer.MAX_VALUE ? iFeedOpenCount : iFeedOpenCount + 1).apply();
            z11 = iFeedOpenCount == 0;
        }
        if (z11) {
            requestInsight$default(this, false, 1, null);
        }
    }

    public final void refreshMetaQueries(boolean force) {
        if (generationReady()) {
            r1 r1Var = this.metaJob;
            if (r1Var == null || !r1Var.b()) {
                this.metaJob = m0.t(this.scope, null, null, new C28511(force, null), 3);
            } else {
                Companion.getTAG();
            }
        }
    }

    public final void removeInsight(@NotNull AiInsightData insight) {
        Intrinsics.g(insight, "insight");
        this.insightStore.removeInsight(insight);
    }

    @NotNull
    public final List<AiMetaQueryLead> reorderForBatchDiversity$instabridge_ai_sdk_release(@NotNull List<AiMetaQueryLead> leads) {
        boolean z11;
        Intrinsics.g(leads, "leads");
        if (leads.isEmpty()) {
            return leads;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Object obj : leads) {
            Integer numValueOf = Integer.valueOf(((AiMetaQueryLead) obj).getCat());
            Object arrayList = linkedHashMap.get(numValueOf);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(numValueOf, arrayList);
            }
            ((List) arrayList).add(obj);
        }
        Collection collectionValues = linkedHashMap.values();
        Intrinsics.f(collectionValues, "<get-values>(...)");
        Collection<List> collection = collectionValues;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(collection, 10));
        for (List list : collection) {
            Intrinsics.d(list);
            arrayList2.add(g.K1(list));
        }
        ArrayList arrayList3 = new ArrayList(leads.size());
        for (boolean z12 = true; z12; z12 = z11) {
            Iterator it = arrayList2.iterator();
            z11 = false;
            while (it.hasNext()) {
                List list2 = (List) it.next();
                if (!list2.isEmpty()) {
                    arrayList3.add(list2.remove(0));
                    z11 = true;
                }
            }
        }
        return arrayList3;
    }

    public final void reportImpression(@NotNull String surface) {
        Intrinsics.g(surface, "surface");
        this.engagementTracker.recordImpression(surface);
    }

    public final void reportTap(@NotNull String surface) {
        Intrinsics.g(surface, "surface");
        this.engagementTracker.recordTap(surface);
    }

    public final void requestInsight(boolean force) {
        Object objA;
        Object objA2;
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        Intrinsics.f(stackTrace, "getStackTrace(...)");
        StackTraceElement stackTraceElement = (StackTraceElement) kotlin.collections.c.E0(3, stackTrace);
        if (stackTraceElement != null) {
            StringBuilder sb2 = new StringBuilder();
            String className = stackTraceElement.getClassName();
            Intrinsics.f(className, "getClassName(...)");
            sb2.append(r70.k.n1('.', className, className));
            sb2.append('.');
            sb2.append(stackTraceElement.getMethodName());
            sb2.toString();
        }
        Companion.getTAG();
        if (fo.d.j() && backgroundGenerationAllowed$instabridge_ai_sdk_release()) {
            try {
                int i5 = Result.f71687b;
                objA = Boolean.valueOf(fo.d.h().isRegistered());
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            Object obj = Boolean.FALSE;
            if (objA instanceof Result.Failure) {
                objA = obj;
            }
            boolean zBooleanValue = ((Boolean) objA).booleanValue();
            try {
                objA2 = Boolean.valueOf(fo.d.a().hasResolvedStartupConsent() || fo.d.a().isContextConsentEnabled());
            } catch (Throwable th3) {
                int i12 = Result.f71687b;
                objA2 = ResultKt.a(th3);
            }
            Object obj2 = Boolean.FALSE;
            if (objA2 instanceof Result.Failure) {
                objA2 = obj2;
            }
            boolean zBooleanValue2 = ((Boolean) objA2).booleanValue();
            if (zBooleanValue && zBooleanValue2) {
                launchGeneration(force);
                return;
            }
            Companion.getTAG();
            this.pendingForce = Boolean.valueOf(force);
            m0.t(this.scope, null, null, new C28521(null), 3);
        }
    }

    public final void scheduleBackgroundRefresh$instabridge_ai_sdk_release() {
        Companion.getTAG();
        requestInsight$default(this, false, 1, null);
    }

    public final void setNotificationConfig(@NotNull NotificationConfig config) {
        Intrinsics.g(config, "config");
        this.notificationManager = new AiNotificationManager(this.context, config);
    }

    public final boolean shouldNudgeAfterImpression$instabridge_ai_sdk_release(long nowMs, int freshPoolSize) {
        if (freshPoolSize >= this.generationConfig.getPoolStarvedBelow()) {
            return false;
        }
        return this.lastImpressionNudgeMs == 0 || nowMs - this.lastImpressionNudgeMs >= this.generationConfig.getImpressionRefillMinIntervalMs();
    }

    public /* synthetic */ AiProactiveManager(Context context, ProactiveGenerationConfig proactiveGenerationConfig, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        ProactiveGenerationConfig proactiveGenerationConfig2;
        if ((i5 & 2) != 0) {
            proactiveGenerationConfig2 = new ProactiveGenerationConfig(0, 0, 0, 0, 0L, 0L, 0, 0L, false, false, null, 2047, null);
        } else {
            proactiveGenerationConfig2 = proactiveGenerationConfig;
        }
        this(context, proactiveGenerationConfig2);
    }
}
