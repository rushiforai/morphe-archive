package com.instabridge.ai.context;

import a1.m;
import a80.e;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.util.Log;
import aq.f;
import aq.h0;
import b.c0;
import b.u4;
import b70.g;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.instabridge.ai.auth.AccountDeletedInterceptor;
import com.instabridge.ai.auth.AiAuthManager;
import com.instabridge.ai.auth.ConsentStatus;
import com.instabridge.ai.context.collectors.AppUsageCollector;
import com.instabridge.ai.context.collectors.CalendarEvent;
import com.instabridge.ai.context.collectors.CalendarEventsCollector;
import com.instabridge.ai.context.collectors.CallHistoryCollector;
import com.instabridge.ai.context.collectors.ConnectivityCollector;
import com.instabridge.ai.context.collectors.ContactEntry;
import com.instabridge.ai.context.collectors.ContactsCollector;
import com.instabridge.ai.context.collectors.DeviceStateCollector;
import com.instabridge.ai.context.collectors.SmsHistoryCollector;
import com.instabridge.ai.context.summarizers.AppUsageEntry;
import com.instabridge.ai.context.summarizers.AppUsageSummarizer;
import com.instabridge.ai.context.summarizers.CalendarEventsSummarizer;
import com.instabridge.ai.context.summarizers.CallEntry;
import com.instabridge.ai.context.summarizers.CallHistorySummarizer;
import com.instabridge.ai.context.summarizers.ConnectivitySummarizer;
import com.instabridge.ai.context.summarizers.ContactsSummarizer;
import com.instabridge.ai.context.summarizers.DeviceStateSummarizer;
import com.instabridge.ai.context.summarizers.InstalledAppsSummarizer;
import com.instabridge.ai.context.summarizers.LocationSummarizer;
import com.instabridge.ai.context.summarizers.SmsEntry;
import com.instabridge.ai.context.summarizers.SmsHistorySummarizer;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import fo.d;
import h6.c1;
import io.p;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.c;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Charsets;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.y0;
import x7.h;
import x80.d0;
import x80.e0;

@Metadata(d1 = {"\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0010\u0006\n\u0002\b\u0019\n\u0002\u0010$\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0007\u0018\u0000 v2\u00020\u0001:\u0001vB\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ&\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\n2\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\fH\u0086@¢\u0006\u0004\b\u0010\u0010\u0011J \u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\rH\u0086@¢\u0006\u0004\b\u0010\u0010\u0013J\u0015\u0010\u0014\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0018\u001a\u00020\u000f2\u0006\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\"\u0010\u001d\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b\u001d\u0010\u001eJ\u0018\u0010\u001f\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b\u001f\u0010 J2\u0010%\u001a\u00020\u000f2\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020!2\u0006\u0010$\u001a\u00020\r2\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b%\u0010&J(\u0010'\u001a\u00020\u000f2\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020!2\u0006\u0010$\u001a\u00020\rH\u0086@¢\u0006\u0004\b'\u0010(J\"\u0010)\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b)\u0010\u001eJ\u0018\u0010*\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0087@¢\u0006\u0004\b*\u0010 J0\u0010+\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\n2\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\f2\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b+\u0010,J\"\u0010-\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b-\u0010\u001eJ\u0018\u0010.\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b.\u0010 J\"\u0010/\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b/\u0010\u001eJ\u0018\u00100\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b0\u0010 J\"\u00101\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b1\u0010\u001eJ\u0018\u00102\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b2\u0010 J\"\u00103\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b3\u0010\u001eJ\u0018\u00104\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b4\u0010 J\"\u00105\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b5\u0010\u001eJ\u0018\u00106\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b6\u0010 J\"\u00107\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b7\u0010\u001eJ\u0018\u00108\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b8\u0010 J\"\u00109\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00022\b\b\u0002\u0010\u001c\u001a\u00020\u001bH\u0086@¢\u0006\u0004\b9\u0010\u001eJ\u0018\u0010:\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b:\u0010 J$\u0010<\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u000f0;2\u0006\u0010\u001a\u001a\u00020\u0002H\u0086@¢\u0006\u0004\b<\u0010 J\u001d\u0010=\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\b=\u0010>J\u0015\u0010@\u001a\u00020?2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b@\u0010AJ\u0015\u0010B\u001a\u00020\u001b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\bB\u0010CJ\r\u0010D\u001a\u00020?¢\u0006\u0004\bD\u0010EJ)\u0010H\u001a\u0004\u0018\u00010\r2\u0006\u0010\u001a\u001a\u00020\u00022\u0006\u0010F\u001a\u00020!2\u0006\u0010G\u001a\u00020!H\u0002¢\u0006\u0004\bH\u0010IJ\u0012\u0010J\u001a\u0004\u0018\u00010\rH\u0082@¢\u0006\u0004\bJ\u0010KJ.\u0010P\u001a\u00020\u000f2\u0006\u0010L\u001a\u00020\r2\u0006\u0010M\u001a\u00020\r2\f\u0010O\u001a\b\u0012\u0004\u0012\u00020N0\fH\u0082@¢\u0006\u0004\bP\u0010QJ\u001d\u0010R\u001a\b\u0012\u0004\u0012\u00020\r0\f2\u0006\u0010\u001a\u001a\u00020\u0002H\u0002¢\u0006\u0004\bR\u0010SJ\u0017\u0010V\u001a\u00020\u000f2\u0006\u0010U\u001a\u00020TH\u0002¢\u0006\u0004\bV\u0010WJ\u0017\u0010X\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00020\nH\u0002¢\u0006\u0004\bX\u0010YJ\u0017\u0010Z\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00020\nH\u0002¢\u0006\u0004\bZ\u0010YJ\u000f\u0010[\u001a\u00020\rH\u0002¢\u0006\u0004\b[\u0010\\J\u000f\u0010]\u001a\u00020\rH\u0002¢\u0006\u0004\b]\u0010\\J\u000f\u0010^\u001a\u00020\rH\u0002¢\u0006\u0004\b^\u0010\\J\u0017\u0010`\u001a\u00020?2\u0006\u0010_\u001a\u00020\rH\u0002¢\u0006\u0004\b`\u0010aJ\u0017\u0010b\u001a\u00020?2\u0006\u0010_\u001a\u00020\rH\u0002¢\u0006\u0004\bb\u0010aR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010cR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010dR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010eR\u001b\u0010k\u001a\u00020f8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\bg\u0010h\u001a\u0004\bi\u0010jR\u001b\u0010p\u001a\u00020l8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\bm\u0010h\u001a\u0004\bn\u0010oR\u001b\u0010u\u001a\u00020q8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\br\u0010h\u001a\u0004\bs\u0010t¨\u0006w"}, d2 = {"Lcom/instabridge/ai/context/AiContextManager;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/content/Context;", "appContext", "Lfo/a;", "config", "Lcom/instabridge/ai/auth/AiAuthManager;", "authManager", "<init>", "(Landroid/content/Context;Lfo/a;Lcom/instabridge/ai/auth/AiAuthManager;)V", "Lcom/instabridge/ai/context/ContextType;", TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "items", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "addContext", "(Lcom/instabridge/ai/context/ContextType;Ljava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "item", "(Lcom/instabridge/ai/context/ContextType;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "isContextTypeAllowed", "(Lcom/instabridge/ai/context/ContextType;)Z", "Lio/p;", "category", "isCategoryAllowed", "(Lio/p;)Z", "context", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "intervalMs", "syncInstalledAppsIfNeeded", "(Landroid/content/Context;JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "syncInstalledApps", "(Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "latitude", "longitude", "placeName", "syncLocationIfNeeded", "(DDLjava/lang/String;JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "syncLocation", "(DDLjava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "syncLocationFromDeviceIfNeeded", "syncLocationFromDevice", "addContextIfNeeded", "(Lcom/instabridge/ai/context/ContextType;Ljava/util/List;JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "syncDeviceStateIfNeeded", "syncDeviceState", "syncCalendarEventsIfNeeded", "syncCalendarEvents", "syncContactsIfNeeded", "syncContacts", "syncConnectivityIfNeeded", "syncConnectivity", "syncAppUsageIfNeeded", "syncAppUsage", "syncCallHistoryIfNeeded", "syncCallHistory", "syncSmsHistoryIfNeeded", "syncSmsHistory", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "syncAllIfNeeded", "shouldSync", "(Lcom/instabridge/ai/context/ContextType;J)Z", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "markSynced", "(Lcom/instabridge/ai/context/ContextType;)V", "getLastSyncTime", "(Lcom/instabridge/ai/context/ContextType;)J", "clearSyncState", "()V", "lat", "lng", "reverseGeocode", "(Landroid/content/Context;DD)Ljava/lang/String;", "getToken", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "token", "contextType", "Lcom/instabridge/ai/context/ContextItem;", "contextItems", "sendContext", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getInstalledApps", "(Landroid/content/Context;)Ljava/util/List;", "Landroid/content/pm/ApplicationInfo;", "appInfo", "isSystemApp", "(Landroid/content/pm/ApplicationInfo;)Z", "getSyncKey", "(Lcom/instabridge/ai/context/ContextType;)Ljava/lang/String;", "getContentHashKey", "currentDateString", "()Ljava/lang/String;", "currentDateStringUtc", "currentTimeString", PglCryptUtils.KEY_MESSAGE, "log", "(Ljava/lang/String;)V", "logVerbose", "Landroid/content/Context;", "Lfo/a;", "Lcom/instabridge/ai/auth/AiAuthManager;", "Landroid/content/SharedPreferences;", "prefs$delegate", "Lkotlin/Lazy;", "getPrefs", "()Landroid/content/SharedPreferences;", "prefs", "Laq/h0;", "moshi$delegate", "getMoshi", "()Laq/h0;", "moshi", "Lcom/instabridge/ai/context/ContextApiEndpoint;", "contextApi$delegate", "getContextApi", "()Lcom/instabridge/ai/context/ContextApiEndpoint;", "contextApi", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiContextManager {
    private static final int APPS_FORMAT_VERSION = 2;
    public static final long APP_USAGE_SYNC_INTERVAL_MS = 3600000;
    public static final long CALENDAR_SYNC_INTERVAL_MS = 3600000;
    public static final long CALL_HISTORY_SYNC_INTERVAL_MS = 3600000;
    public static final long CONNECTIVITY_SYNC_INTERVAL_MS = 900000;
    public static final long CONTACTS_SYNC_INTERVAL_MS = 86400000;
    private static final int CONTENT_HASH_VERSION = 1;
    public static final long DEFAULT_SYNC_INTERVAL_MS = 86400000;
    public static final long DEVICE_STATE_SYNC_INTERVAL_MS = 900000;

    @NotNull
    private static final String KEY_LAST_CONTENT_HASH_PREFIX = "last_content_hash_";

    @NotNull
    private static final String KEY_LAST_SYNC_PREFIX = "last_sync_";
    public static final long LOCATION_SYNC_INTERVAL_MS = 3600000;

    @NotNull
    private static final String PREFS_NAME = "instabridge_ai_context_prefs";
    public static final long SMS_HISTORY_SYNC_INTERVAL_MS = 3600000;

    @NotNull
    private final Context appContext;

    @NotNull
    private final AiAuthManager authManager;

    @NotNull
    private final fo.a config;

    /* renamed from: contextApi$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy contextApi;

    /* renamed from: moshi$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy moshi;

    /* renamed from: prefs$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy prefs;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0000\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\t\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J*\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u000e2\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\u0013J\u001a\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00152\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00050\u0015J\u001c\u0010\u0017\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u00102\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00050\u0015R\u0014\u0010\u0004\u001a\u00020\u00058BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007R\u000e\u0010\b\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\fX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u001aX\u0086T¢\u0006\u0002\n\u0000¨\u0006#"}, d2 = {"Lcom/instabridge/ai/context/AiContextManager$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "TAG", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getTAG", "()Ljava/lang/String;", "PREFS_NAME", "KEY_LAST_SYNC_PREFIX", "KEY_LAST_CONTENT_HASH_PREFIX", "CONTENT_HASH_VERSION", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isContextTypeAllowedFor", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, "Lcom/instabridge/ai/context/ContextType;", "globalEnabled", "serverTypes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "filterSendableItems", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "items", "computeContextContentHash", "APPS_FORMAT_VERSION", "DEFAULT_SYNC_INTERVAL_MS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "LOCATION_SYNC_INTERVAL_MS", "DEVICE_STATE_SYNC_INTERVAL_MS", "CALENDAR_SYNC_INTERVAL_MS", "CONTACTS_SYNC_INTERVAL_MS", "CONNECTIVITY_SYNC_INTERVAL_MS", "APP_USAGE_SYNC_INTERVAL_MS", "CALL_HISTORY_SYNC_INTERVAL_MS", "SMS_HISTORY_SYNC_INTERVAL_MS", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final CharSequence computeContextContentHash$lambda$5(byte b11) {
            return String.format("%02x", Arrays.copyOf(new Object[]{Byte.valueOf(b11)}, 1));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String getTAG() {
            return d.j() ? d.c().f55441f : "AiContextManager";
        }

        @NotNull
        public final String computeContextContentHash(@NotNull ContextType type, @NotNull List<String> items) throws NoSuchAlgorithmException {
            Intrinsics.g(type, "type");
            Intrinsics.g(items, "items");
            StringBuilder sb2 = new StringBuilder("v=1\ntype=");
            sb2.append(type.getApiValue());
            for (String str : items) {
                sb2.append("\n");
                sb2.append(str.length());
                sb2.append(":");
                sb2.append(str);
            }
            String string = sb2.toString();
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = string.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            byte[] bArrDigest = messageDigest.digest(bytes);
            Intrinsics.f(bArrDigest, "digest(...)");
            return c.M0(bArrDigest, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, new a00.a(17), 30);
        }

        @NotNull
        public final List<String> filterSendableItems(@NotNull List<String> items) {
            Intrinsics.g(items, "items");
            ArrayList arrayList = new ArrayList();
            for (Object obj : items) {
                if (!r70.k.U0((String) obj)) {
                    arrayList.add(obj);
                }
            }
            return arrayList;
        }

        public final boolean isContextTypeAllowedFor(@NotNull ContextType type, boolean globalEnabled, @NotNull Map<String, Boolean> serverTypes) {
            boolean zB;
            Intrinsics.g(type, "type");
            Intrinsics.g(serverTypes, "serverTypes");
            if (globalEnabled) {
                i70.a aVar = p.f66716s;
                ArrayList arrayList = new ArrayList();
                aVar.getClass();
                b70.a aVar2 = new b70.a(aVar);
                while (aVar2.hasNext()) {
                    Object next = aVar2.next();
                    if (((p) next).f66717a.contains(type)) {
                        arrayList.add(next);
                    }
                }
                if (!arrayList.isEmpty() && !arrayList.isEmpty()) {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        p pVar = (p) it.next();
                        if (pVar.f66721e) {
                            String str = pVar.f66720d;
                            zB = str == null ? false : Intrinsics.b(serverTypes.get(str), Boolean.TRUE);
                        } else {
                            zB = true;
                        }
                        if (zB) {
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        private Companion() {
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 142}, m = "addContext")
    /* renamed from: com.instabridge.ai.context.AiContextManager$addContext$1, reason: invalid class name */
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
            return AiContextManager.this.addContext((ContextType) null, (List<String>) null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {431}, m = "addContextIfNeeded")
    /* renamed from: com.instabridge.ai.context.AiContextManager$addContextIfNeeded$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28361 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28361(Continuation<? super C28361> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.addContextIfNeeded(null, null, 0L, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {790}, m = "sendContext")
    /* renamed from: com.instabridge.ai.context.AiContextManager$sendContext$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28371 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C28371(Continuation<? super C28371> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.sendContext(null, null, null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager$sendContext$2", f = "AiContextManager.kt", l = {791}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.context.AiContextManager$sendContext$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ List<ContextItem> $contextItems;
        final /* synthetic */ String $contextType;
        final /* synthetic */ String $token;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass2(String str, String str2, List<ContextItem> list, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$token = str;
            this.$contextType = str2;
            this.$contextItems = list;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiContextManager.this.new AnonymousClass2(this.$token, this.$contextType, this.$contextItems, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                ContextApiEndpoint contextApi = AiContextManager.this.getContextApi();
                String str = "Bearer " + this.$token;
                String str2 = AiContextManager.this.config.f55436a;
                String str3 = AiContextManager.this.config.n;
                AddContextRequest addContextRequest = new AddContextRequest(this.$contextType, this.$contextItems);
                this.label = 1;
                if (contextApi.addContext(str, str2, str3, addContextRequest, this) == coroutineSingletons) {
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
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {719, 720, 721, 722, 726, 727, 728}, m = "syncAllIfNeeded")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncAllIfNeeded$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28381 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        int label;
        /* synthetic */ Object result;

        public C28381(Continuation<? super C28381> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncAllIfNeeded(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {625}, m = "syncAppUsage")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncAppUsage$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28391 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C28391(Continuation<? super C28391> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncAppUsage(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {515}, m = "syncCalendarEvents")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncCalendarEvents$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28401 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C28401(Continuation<? super C28401> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncCalendarEvents(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {664}, m = "syncCallHistory")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncCallHistory$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28411 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28411(Continuation<? super C28411> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncCallHistory(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {586}, m = "syncConnectivity")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncConnectivity$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28421 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28421(Continuation<? super C28421> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncConnectivity(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {552}, m = "syncContacts")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncContacts$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28431 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C28431(Continuation<? super C28431> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncContacts(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {465}, m = "syncDeviceState")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncDeviceState$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28441 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28441(Continuation<? super C28441> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncDeviceState(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {244}, m = "syncInstalledApps")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncInstalledApps$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28451 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C28451(Continuation<? super C28451> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncInstalledApps(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {291}, m = "syncLocation")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncLocation$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28461 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28461(Continuation<? super C28461> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncLocation(0.0d, 0.0d, null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {371}, m = "syncLocationFromDevice")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncLocationFromDevice$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28471 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28471(Continuation<? super C28471> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncLocationFromDevice(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.context.AiContextManager", f = "AiContextManager.kt", l = {Sdk.SDKError.Reason.DOH_FETCH_FAILED_VALUE}, m = "syncSmsHistory")
    /* renamed from: com.instabridge.ai.context.AiContextManager$syncSmsHistory$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28481 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28481(Continuation<? super C28481> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiContextManager.this.syncSmsHistory(null, this);
        }
    }

    public AiContextManager(@NotNull Context appContext, @NotNull fo.a config, @NotNull AiAuthManager authManager) {
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(config, "config");
        Intrinsics.g(authManager, "authManager");
        this.appContext = appContext;
        this.config = config;
        this.authManager = authManager;
        final int i5 = 0;
        this.prefs = LazyKt.a(new Function0(this) { // from class: com.instabridge.ai.context.b

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ AiContextManager f35517b;

            {
                this.f35517b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        return AiContextManager.prefs_delegate$lambda$0(this.f35517b);
                    default:
                        return AiContextManager.contextApi_delegate$lambda$2(this.f35517b);
                }
            }
        });
        this.moshi = LazyKt.a(new m(29));
        final int i11 = 1;
        this.contextApi = LazyKt.a(new Function0(this) { // from class: com.instabridge.ai.context.b

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ AiContextManager f35517b;

            {
                this.f35517b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return AiContextManager.prefs_delegate$lambda$0(this.f35517b);
                    default:
                        return AiContextManager.contextApi_delegate$lambda$2(this.f35517b);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence addContext$lambda$4(AiContextManager aiContextManager, p cat) {
        Intrinsics.g(cat, "cat");
        StringBuilder sb2 = new StringBuilder();
        sb2.append(cat.name());
        sb2.append("(consent=");
        sb2.append(aiContextManager.authManager.isCategoryConsentEnabled(cat.name()));
        sb2.append(", explicit=");
        return a2.c.p(sb2, cat.f66721e, ')');
    }

    public static /* synthetic */ Object addContextIfNeeded$default(AiContextManager aiContextManager, ContextType contextType, List list, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            j11 = 86400000;
        }
        return aiContextManager.addContextIfNeeded(contextType, list, j11, continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final ContextApiEndpoint contextApi_delegate$lambda$2(AiContextManager aiContextManager) {
        h hVar = new h(5);
        hVar.b(aiContextManager.config.f55437b);
        d0 d0Var = new d0();
        d0Var.a(AccountDeletedInterceptor.INSTANCE);
        hVar.f95137b = new e0(d0Var);
        h0 moshi = aiContextManager.getMoshi();
        if (moshi == null) {
            throw new NullPointerException("moshi == null");
        }
        hVar.a(new fb0.a(moshi));
        return (ContextApiEndpoint) hVar.c().l(ContextApiEndpoint.class);
    }

    private final String currentDateString() {
        String str = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
        Intrinsics.f(str, "format(...)");
        return str;
    }

    private final String currentDateStringUtc() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'", Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        String str = simpleDateFormat.format(new Date());
        Intrinsics.f(str, "format(...)");
        return str;
    }

    private final String currentTimeString() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm z", Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getDefault());
        String str = simpleDateFormat.format(new Date());
        Intrinsics.f(str, "format(...)");
        return str;
    }

    private final String getContentHashKey(ContextType type) {
        return KEY_LAST_CONTENT_HASH_PREFIX + type.getApiValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final ContextApiEndpoint getContextApi() {
        Object value = this.contextApi.getValue();
        Intrinsics.f(value, "getValue(...)");
        return (ContextApiEndpoint) value;
    }

    private final List<String> getInstalledApps(Context context) {
        String string;
        try {
            PackageManager packageManager = context.getPackageManager();
            String packageName = context.getPackageName();
            List<ApplicationInfo> installedApplications = packageManager.getInstalledApplications(128);
            Intrinsics.f(installedApplications, "getInstalledApplications(...)");
            ArrayList arrayList = new ArrayList();
            for (Object obj : installedApplications) {
                ApplicationInfo applicationInfo = (ApplicationInfo) obj;
                Intrinsics.d(applicationInfo);
                if (!isSystemApp(applicationInfo) && !Intrinsics.b(applicationInfo.packageName, packageName)) {
                    arrayList.add(obj);
                }
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                try {
                    string = packageManager.getApplicationLabel((ApplicationInfo) it.next()).toString();
                } catch (Exception unused) {
                    string = null;
                }
                if (string != null) {
                    arrayList2.add(string);
                }
            }
            return g.C1(g.P0(arrayList2));
        } catch (Exception e3) {
            log(c1.s(e3, new StringBuilder("Failed to get installed apps: ")));
            return EmptyList.f71733a;
        }
    }

    private final h0 getMoshi() {
        Object value = this.moshi.getValue();
        Intrinsics.f(value, "getValue(...)");
        return (h0) value;
    }

    private final SharedPreferences getPrefs() {
        Object value = this.prefs.getValue();
        Intrinsics.f(value, "getValue(...)");
        return (SharedPreferences) value;
    }

    private final String getSyncKey(ContextType type) {
        return KEY_LAST_SYNC_PREFIX + type.getApiValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object getToken(Continuation<? super String> continuation) {
        return this.authManager.getToken(continuation);
    }

    private final boolean isSystemApp(ApplicationInfo appInfo) {
        return (appInfo.flags & 1) != 0;
    }

    private final void log(String message) {
        this.config.getClass();
    }

    private final void logVerbose(String message) {
        this.config.getClass();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final h0 moshi_delegate$lambda$1() {
        aq.e0 e0Var = new aq.e0(0);
        e0Var.d(new f(6));
        return new h0(e0Var);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final SharedPreferences prefs_delegate$lambda$0(AiContextManager aiContextManager) {
        return aiContextManager.appContext.getSharedPreferences(PREFS_NAME, 0);
    }

    private final String reverseGeocode(Context context, double lat, double lng) throws IOException {
        Address address;
        if (Geocoder.isPresent()) {
            try {
                List<Address> fromLocation = new Geocoder(context, Locale.getDefault()).getFromLocation(lat, lng, 1);
                if (fromLocation != null && (address = (Address) g.Y0(fromLocation)) != null) {
                    String addressLine = address.getAddressLine(0);
                    if (addressLine != null && !r70.k.U0(addressLine)) {
                        return addressLine;
                    }
                    String thoroughfare = address.getThoroughfare();
                    if (thoroughfare != null) {
                        String subThoroughfare = address.getSubThoroughfare();
                        if (subThoroughfare != null) {
                            String str = thoroughfare + ' ' + subThoroughfare;
                            if (str != null) {
                                thoroughfare = str;
                            }
                        }
                    } else {
                        thoroughfare = null;
                    }
                    String postalCode = address.getPostalCode();
                    if (postalCode != null) {
                        String locality = address.getLocality();
                        if (locality != null) {
                            String str2 = postalCode + ' ' + locality;
                            if (str2 != null) {
                                postalCode = str2;
                            }
                        }
                    } else {
                        postalCode = null;
                    }
                    String locality2 = address.getLocality();
                    if (locality2 == null && (locality2 = address.getSubAdminArea()) == null) {
                        locality2 = address.getAdminArea();
                    }
                    String strF1 = g.f1(g.P0(c.v0(new String[]{thoroughfare, postalCode, locality2, address.getCountryName()})), ", ", null, null, 0, null, 62);
                    if (!r70.k.U0(strF1)) {
                        return strF1;
                    }
                }
            } catch (Exception unused) {
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object sendContext(String str, String str2, List<ContextItem> list, Continuation<? super Boolean> continuation) {
        C28371 c28371;
        String str3;
        Exception exc;
        a80.d dVar;
        AnonymousClass2 anonymousClass2;
        List<ContextItem> list2;
        if (continuation instanceof C28371) {
            c28371 = (C28371) continuation;
            int i5 = c28371.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28371.label = i5 - Integer.MIN_VALUE;
            } else {
                c28371 = new C28371(continuation);
            }
        }
        Object obj = c28371.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28371.label;
        boolean z11 = true;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list2 = (List) c28371.L$1;
            str2 = (String) c28371.L$0;
            try {
                ResultKt.b(obj);
            } catch (Exception e3) {
                exc = e3;
            }
            try {
                log("sendContext(" + str2 + "): success, " + list2.size() + " items");
            } catch (Exception e11) {
                e = e11;
                exc = e;
                String tag = INSTANCE.getTAG();
                StringBuilder sbK = u4.k("sendContext(", str2, ") failed: ");
                sbK.append(exc.getMessage());
                Log.w(tag, sbK.toString(), exc);
                z11 = false;
                return Boolean.valueOf(z11);
            }
            return Boolean.valueOf(z11);
        }
        ResultKt.b(obj);
        try {
            e eVar = y0.f88884a;
            dVar = a80.d.f488c;
        } catch (Exception e12) {
            e = e12;
            str3 = str2;
        }
        try {
            str3 = str2;
        } catch (Exception e13) {
            e = e13;
            exc = e;
            String tag2 = INSTANCE.getTAG();
            StringBuilder sbK2 = u4.k("sendContext(", str2, ") failed: ");
            sbK2.append(exc.getMessage());
            Log.w(tag2, sbK2.toString(), exc);
            z11 = false;
            return Boolean.valueOf(z11);
        }
        try {
            anonymousClass2 = new AnonymousClass2(str, str3, list, null);
            c28371.L$0 = str3;
            c28371.L$1 = list;
            c28371.label = 1;
        } catch (Exception e14) {
            e = e14;
            exc = e;
            str2 = str3;
            String tag22 = INSTANCE.getTAG();
            StringBuilder sbK22 = u4.k("sendContext(", str2, ") failed: ");
            sbK22.append(exc.getMessage());
            Log.w(tag22, sbK22.toString(), exc);
            z11 = false;
            return Boolean.valueOf(z11);
        }
        if (m0.y(dVar, anonymousClass2, c28371) == coroutineSingletons) {
            return coroutineSingletons;
        }
        str2 = str3;
        list2 = list;
        log("sendContext(" + str2 + "): success, " + list2.size() + " items");
        return Boolean.valueOf(z11);
        String tag222 = INSTANCE.getTAG();
        StringBuilder sbK222 = u4.k("sendContext(", str2, ") failed: ");
        sbK222.append(exc.getMessage());
        Log.w(tag222, sbK222.toString(), exc);
        z11 = false;
        return Boolean.valueOf(z11);
    }

    public static /* synthetic */ Object syncAppUsageIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 3600000;
        }
        return aiContextManager.syncAppUsageIfNeeded(context, j11, continuation);
    }

    public static /* synthetic */ Object syncCalendarEventsIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 3600000;
        }
        return aiContextManager.syncCalendarEventsIfNeeded(context, j11, continuation);
    }

    public static /* synthetic */ Object syncCallHistoryIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 3600000;
        }
        return aiContextManager.syncCallHistoryIfNeeded(context, j11, continuation);
    }

    public static /* synthetic */ Object syncConnectivityIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 900000;
        }
        return aiContextManager.syncConnectivityIfNeeded(context, j11, continuation);
    }

    public static /* synthetic */ Object syncContactsIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 86400000;
        }
        return aiContextManager.syncContactsIfNeeded(context, j11, continuation);
    }

    public static /* synthetic */ Object syncDeviceStateIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 900000;
        }
        return aiContextManager.syncDeviceStateIfNeeded(context, j11, continuation);
    }

    public static /* synthetic */ Object syncInstalledAppsIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 86400000;
        }
        return aiContextManager.syncInstalledAppsIfNeeded(context, j11, continuation);
    }

    public static /* synthetic */ Object syncLocationFromDeviceIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 3600000;
        }
        return aiContextManager.syncLocationFromDeviceIfNeeded(context, j11, continuation);
    }

    public static /* synthetic */ Object syncSmsHistoryIfNeeded$default(AiContextManager aiContextManager, Context context, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = 3600000;
        }
        return aiContextManager.syncSmsHistoryIfNeeded(context, j11, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x01bf  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object addContext(@NotNull ContextType contextType, @NotNull List<String> list, @NotNull Continuation<? super Boolean> continuation) throws NoSuchAlgorithmException, IOException {
        AnonymousClass1 anonymousClass1;
        List<String> listFilterSendableItems;
        Object token;
        String str;
        String str2;
        Boolean bool;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object objSendContext = anonymousClass1.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(objSendContext);
            if (!isContextTypeAllowed(contextType)) {
                i70.a aVar = p.f66716s;
                ArrayList arrayList = new ArrayList();
                aVar.getClass();
                b70.a aVar2 = new b70.a(aVar);
                while (aVar2.hasNext()) {
                    Object next = aVar2.next();
                    if (((p) next).f66717a.contains(contextType)) {
                        arrayList.add(next);
                    }
                }
                String strF1 = g.f1(arrayList, ", ", null, null, 0, new a(this, 0), 30);
                Log.w(INSTANCE.getTAG(), "addContext: type " + contextType + " BLOCKED — global=" + this.authManager.isContextConsentEnabled() + ", categories=[" + strF1 + AbstractJsonLexerKt.END_LIST);
                return Boolean.FALSE;
            }
            listFilterSendableItems = INSTANCE.filterSendableItems(list);
            if (listFilterSendableItems.size() != list.size()) {
                log("addContext(" + contextType + "): dropped " + (list.size() - listFilterSendableItems.size()) + " empty items");
            }
            if (listFilterSendableItems.isEmpty()) {
                log("No items to add for " + contextType + " (all empty or none provided)");
                return Boolean.FALSE;
            }
            anonymousClass1.L$0 = contextType;
            anonymousClass1.L$1 = listFilterSendableItems;
            anonymousClass1.label = 1;
            token = getToken(anonymousClass1);
            if (token != obj) {
            }
            return obj;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str2 = (String) anonymousClass1.L$1;
            str = (String) anonymousClass1.L$0;
            ResultKt.b(objSendContext);
            bool = (Boolean) objSendContext;
            if (bool.booleanValue()) {
                a2.c.v(getPrefs(), str2, str);
            }
            return bool;
        }
        List<String> list2 = (List) anonymousClass1.L$1;
        ContextType contextType2 = (ContextType) anonymousClass1.L$0;
        ResultKt.b(objSendContext);
        listFilterSendableItems = list2;
        contextType = contextType2;
        token = objSendContext;
        String str3 = (String) token;
        if (str3 == null) {
            Log.w(INSTANCE.getTAG(), "addContext: token is null, cannot upload " + contextType);
            return Boolean.FALSE;
        }
        if (d.j()) {
            d.c();
        }
        String strComputeContextContentHash = INSTANCE.computeContextContentHash(contextType, listFilterSendableItems);
        String contentHashKey = getContentHashKey(contextType);
        if (Intrinsics.b(getPrefs().getString(contentHashKey, null), strComputeContextContentHash)) {
            log("addContext(" + contextType + "): unchanged, skipping upload");
            return Boolean.TRUE;
        }
        List<String> list3 = listFilterSendableItems;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(list3, 10));
        Iterator<T> it = list3.iterator();
        while (it.hasNext()) {
            arrayList2.add(new ContextItem((String) it.next()));
        }
        String apiValue = contextType.getApiValue();
        anonymousClass1.L$0 = strComputeContextContentHash;
        anonymousClass1.L$1 = contentHashKey;
        anonymousClass1.label = 2;
        objSendContext = sendContext(str3, apiValue, arrayList2, anonymousClass1);
        if (objSendContext != obj) {
            str = strComputeContextContentHash;
            str2 = contentHashKey;
            bool = (Boolean) objSendContext;
            if (bool.booleanValue()) {
            }
            return bool;
        }
        return obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object addContextIfNeeded(@NotNull ContextType contextType, @NotNull List<String> list, long j11, @NotNull Continuation<? super Boolean> continuation) throws NoSuchAlgorithmException, IOException {
        C28361 c28361;
        if (continuation instanceof C28361) {
            c28361 = (C28361) continuation;
            int i5 = c28361.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28361.label = i5 - Integer.MIN_VALUE;
            } else {
                c28361 = new C28361(continuation);
            }
        }
        Object objAddContext = c28361.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28361.label;
        if (i11 == 0) {
            ResultKt.b(objAddContext);
            if (!shouldSync(contextType, j11)) {
                log(contextType + " sync not needed yet");
                return Boolean.FALSE;
            }
            c28361.L$0 = contextType;
            c28361.label = 1;
            objAddContext = addContext(contextType, list, c28361);
            if (objAddContext == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            contextType = (ContextType) c28361.L$0;
            ResultKt.b(objAddContext);
        }
        boolean zBooleanValue = ((Boolean) objAddContext).booleanValue();
        if (zBooleanValue) {
            markSynced(contextType);
        }
        return Boolean.valueOf(zBooleanValue);
    }

    public final void clearSyncState() {
        getPrefs().edit().clear().apply();
    }

    public final long getLastSyncTime(@NotNull ContextType type) {
        Intrinsics.g(type, "type");
        return getPrefs().getLong(getSyncKey(type), 0L);
    }

    public final boolean isCategoryAllowed(@NotNull p category) {
        Intrinsics.g(category, "category");
        if (!this.authManager.isContextConsentEnabled()) {
            return false;
        }
        if (category == p.f66706g && !d.k()) {
            return false;
        }
        if (category.f66721e) {
            return this.authManager.isCategoryConsentEnabled(category.name());
        }
        return true;
    }

    public final boolean isContextTypeAllowed(@NotNull ContextType type) {
        Map<String, Boolean> types;
        Intrinsics.g(type, "type");
        if (type == ContextType.LOCATION && !d.k()) {
            return false;
        }
        Companion companion = INSTANCE;
        boolean zIsContextConsentEnabled = this.authManager.isContextConsentEnabled();
        ConsentStatus consentSnapshot = this.authManager.getConsentSnapshot();
        if (consentSnapshot == null || (types = consentSnapshot.getTypes()) == null) {
            types = b70.h.f17594a;
        }
        return companion.isContextTypeAllowedFor(type, zIsContextConsentEnabled, types);
    }

    public final void markSynced(@NotNull ContextType type) {
        Intrinsics.g(type, "type");
        getPrefs().edit().putLong(getSyncKey(type), System.currentTimeMillis()).apply();
    }

    public final boolean shouldSync(@NotNull ContextType type, long intervalMs) {
        Intrinsics.g(type, "type");
        return System.currentTimeMillis() - getPrefs().getLong(getSyncKey(type), 0L) >= intervalMs;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0143  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x019b  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncAllIfNeeded(@NotNull Context context, @NotNull Continuation<? super Map<ContextType, Boolean>> continuation) {
        C28381 c28381;
        Context context2;
        Map map;
        ContextType contextType;
        Map map2;
        ContextType contextType2;
        Map map3;
        ContextType contextType3;
        Map map4;
        ContextType contextType4;
        Map map5;
        ContextType contextType5;
        Map map6;
        ContextType contextType6;
        Map map7;
        ContextType contextType7;
        Map map8;
        Map map9;
        if (continuation instanceof C28381) {
            c28381 = (C28381) continuation;
            int i5 = c28381.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28381.label = i5 - Integer.MIN_VALUE;
            } else {
                c28381 = new C28381(continuation);
            }
        }
        C28381 c283812 = c28381;
        Object objSyncAppUsageIfNeeded$default = c283812.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (c283812.label) {
            case 0:
                ResultKt.b(objSyncAppUsageIfNeeded$default);
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                ContextType contextType8 = ContextType.PHONE_APPS;
                c283812.L$0 = context;
                c283812.L$1 = linkedHashMap;
                c283812.L$2 = linkedHashMap;
                c283812.L$3 = contextType8;
                c283812.label = 1;
                context2 = context;
                Object objSyncInstalledAppsIfNeeded$default = syncInstalledAppsIfNeeded$default(this, context2, 0L, c283812, 2, null);
                if (objSyncInstalledAppsIfNeeded$default != coroutineSingletons) {
                    map = linkedHashMap;
                    objSyncAppUsageIfNeeded$default = objSyncInstalledAppsIfNeeded$default;
                    contextType = contextType8;
                    map2 = map;
                    map.put(contextType, objSyncAppUsageIfNeeded$default);
                    contextType2 = ContextType.APP_USAGE;
                    c283812.L$0 = context2;
                    c283812.L$1 = map2;
                    c283812.L$2 = map2;
                    c283812.L$3 = contextType2;
                    c283812.label = 2;
                    objSyncAppUsageIfNeeded$default = syncAppUsageIfNeeded$default(this, context2, 0L, c283812, 2, null);
                    if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                        map3 = map2;
                        map3.put(contextType2, objSyncAppUsageIfNeeded$default);
                        contextType3 = ContextType.CALENDAR_EVENTS;
                        c283812.L$0 = context2;
                        c283812.L$1 = map2;
                        c283812.L$2 = map2;
                        c283812.L$3 = contextType3;
                        c283812.label = 3;
                        objSyncAppUsageIfNeeded$default = syncCalendarEventsIfNeeded$default(this, context2, 0L, c283812, 2, null);
                        if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                            map4 = map2;
                            map4.put(contextType3, objSyncAppUsageIfNeeded$default);
                            contextType4 = ContextType.CONTACTS;
                            c283812.L$0 = context2;
                            c283812.L$1 = map2;
                            c283812.L$2 = map2;
                            c283812.L$3 = contextType4;
                            c283812.label = 4;
                            objSyncAppUsageIfNeeded$default = syncContactsIfNeeded$default(this, context2, 0L, c283812, 2, null);
                            if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                                map5 = map2;
                                map5.put(contextType4, objSyncAppUsageIfNeeded$default);
                                contextType5 = ContextType.LOCATION;
                                c283812.L$0 = context2;
                                c283812.L$1 = map2;
                                c283812.L$2 = map2;
                                c283812.L$3 = contextType5;
                                c283812.label = 5;
                                objSyncAppUsageIfNeeded$default = syncLocationFromDeviceIfNeeded$default(this, context2, 0L, c283812, 2, null);
                                if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                                    map6 = map2;
                                    map6.put(contextType5, objSyncAppUsageIfNeeded$default);
                                    contextType6 = ContextType.CALL_HISTORY;
                                    c283812.L$0 = context2;
                                    c283812.L$1 = map2;
                                    c283812.L$2 = map2;
                                    c283812.L$3 = contextType6;
                                    c283812.label = 6;
                                    objSyncAppUsageIfNeeded$default = syncCallHistoryIfNeeded$default(this, context2, 0L, c283812, 2, null);
                                    if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                                        map7 = map2;
                                        map7.put(contextType6, objSyncAppUsageIfNeeded$default);
                                        contextType7 = ContextType.SMS_HISTORY;
                                        c283812.L$0 = map2;
                                        c283812.L$1 = map2;
                                        c283812.L$2 = contextType7;
                                        c283812.L$3 = null;
                                        c283812.label = 7;
                                        objSyncAppUsageIfNeeded$default = syncSmsHistoryIfNeeded$default(this, context2, 0L, c283812, 2, null);
                                        if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                                            map8 = map2;
                                            map9 = map8;
                                            map8.put(contextType7, objSyncAppUsageIfNeeded$default);
                                            return map9;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                return coroutineSingletons;
            case 1:
                contextType = (ContextType) c283812.L$3;
                map = (Map) c283812.L$2;
                Map map10 = (Map) c283812.L$1;
                Context context3 = (Context) c283812.L$0;
                ResultKt.b(objSyncAppUsageIfNeeded$default);
                map2 = map10;
                context2 = context3;
                map.put(contextType, objSyncAppUsageIfNeeded$default);
                contextType2 = ContextType.APP_USAGE;
                c283812.L$0 = context2;
                c283812.L$1 = map2;
                c283812.L$2 = map2;
                c283812.L$3 = contextType2;
                c283812.label = 2;
                objSyncAppUsageIfNeeded$default = syncAppUsageIfNeeded$default(this, context2, 0L, c283812, 2, null);
                if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 2:
                contextType2 = (ContextType) c283812.L$3;
                map3 = (Map) c283812.L$2;
                Map map11 = (Map) c283812.L$1;
                Context context4 = (Context) c283812.L$0;
                ResultKt.b(objSyncAppUsageIfNeeded$default);
                map2 = map11;
                context2 = context4;
                map3.put(contextType2, objSyncAppUsageIfNeeded$default);
                contextType3 = ContextType.CALENDAR_EVENTS;
                c283812.L$0 = context2;
                c283812.L$1 = map2;
                c283812.L$2 = map2;
                c283812.L$3 = contextType3;
                c283812.label = 3;
                objSyncAppUsageIfNeeded$default = syncCalendarEventsIfNeeded$default(this, context2, 0L, c283812, 2, null);
                if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 3:
                contextType3 = (ContextType) c283812.L$3;
                map4 = (Map) c283812.L$2;
                Map map12 = (Map) c283812.L$1;
                Context context5 = (Context) c283812.L$0;
                ResultKt.b(objSyncAppUsageIfNeeded$default);
                map2 = map12;
                context2 = context5;
                map4.put(contextType3, objSyncAppUsageIfNeeded$default);
                contextType4 = ContextType.CONTACTS;
                c283812.L$0 = context2;
                c283812.L$1 = map2;
                c283812.L$2 = map2;
                c283812.L$3 = contextType4;
                c283812.label = 4;
                objSyncAppUsageIfNeeded$default = syncContactsIfNeeded$default(this, context2, 0L, c283812, 2, null);
                if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 4:
                contextType4 = (ContextType) c283812.L$3;
                map5 = (Map) c283812.L$2;
                Map map13 = (Map) c283812.L$1;
                Context context6 = (Context) c283812.L$0;
                ResultKt.b(objSyncAppUsageIfNeeded$default);
                map2 = map13;
                context2 = context6;
                map5.put(contextType4, objSyncAppUsageIfNeeded$default);
                contextType5 = ContextType.LOCATION;
                c283812.L$0 = context2;
                c283812.L$1 = map2;
                c283812.L$2 = map2;
                c283812.L$3 = contextType5;
                c283812.label = 5;
                objSyncAppUsageIfNeeded$default = syncLocationFromDeviceIfNeeded$default(this, context2, 0L, c283812, 2, null);
                if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 5:
                contextType5 = (ContextType) c283812.L$3;
                map6 = (Map) c283812.L$2;
                Map map14 = (Map) c283812.L$1;
                Context context7 = (Context) c283812.L$0;
                ResultKt.b(objSyncAppUsageIfNeeded$default);
                map2 = map14;
                context2 = context7;
                map6.put(contextType5, objSyncAppUsageIfNeeded$default);
                contextType6 = ContextType.CALL_HISTORY;
                c283812.L$0 = context2;
                c283812.L$1 = map2;
                c283812.L$2 = map2;
                c283812.L$3 = contextType6;
                c283812.label = 6;
                objSyncAppUsageIfNeeded$default = syncCallHistoryIfNeeded$default(this, context2, 0L, c283812, 2, null);
                if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 6:
                contextType6 = (ContextType) c283812.L$3;
                map7 = (Map) c283812.L$2;
                Map map15 = (Map) c283812.L$1;
                Context context8 = (Context) c283812.L$0;
                ResultKt.b(objSyncAppUsageIfNeeded$default);
                map2 = map15;
                context2 = context8;
                map7.put(contextType6, objSyncAppUsageIfNeeded$default);
                contextType7 = ContextType.SMS_HISTORY;
                c283812.L$0 = map2;
                c283812.L$1 = map2;
                c283812.L$2 = contextType7;
                c283812.L$3 = null;
                c283812.label = 7;
                objSyncAppUsageIfNeeded$default = syncSmsHistoryIfNeeded$default(this, context2, 0L, c283812, 2, null);
                if (objSyncAppUsageIfNeeded$default != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 7:
                contextType7 = (ContextType) c283812.L$2;
                map8 = (Map) c283812.L$1;
                map9 = (Map) c283812.L$0;
                ResultKt.b(objSyncAppUsageIfNeeded$default);
                map8.put(contextType7, objSyncAppUsageIfNeeded$default);
                return map9;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncAppUsage(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28391 c28391;
        List<AppUsageEntry> list;
        String str;
        if (continuation instanceof C28391) {
            c28391 = (C28391) continuation;
            int i5 = c28391.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28391.label = i5 - Integer.MIN_VALUE;
            } else {
                c28391 = new C28391(continuation);
            }
        }
        Object obj = c28391.result;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = c28391.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            List<AppUsageEntry> listCollect = new AppUsageCollector().collect(context);
            if (listCollect.isEmpty()) {
                logVerbose("App usage sync: collector returned 0 entries (host package excluded, or no usage data yet)");
                return Boolean.FALSE;
            }
            String strSummarize = new AppUsageSummarizer().summarize(listCollect, currentTimeString());
            INSTANCE.getTAG();
            listCollect.size();
            strSummarize.getClass();
            ContextType contextType = ContextType.APP_USAGE;
            c28391.L$0 = listCollect;
            c28391.L$1 = strSummarize;
            c28391.label = 1;
            Object objAddContext = addContext(contextType, strSummarize, c28391);
            if (objAddContext == obj2) {
                return obj2;
            }
            list = listCollect;
            str = strSummarize;
            obj = objAddContext;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = (String) c28391.L$1;
            list = (List) c28391.L$0;
            ResultKt.b(obj);
        }
        Boolean bool = (Boolean) obj;
        if (bool.booleanValue()) {
            markSynced(ContextType.APP_USAGE);
            INSTANCE.getTAG();
            list.size();
            str.getClass();
        } else {
            Log.e(INSTANCE.getTAG(), "syncAppUsage: FAILED — addContext returned false for " + list.size() + " apps (consent? token? network?)");
        }
        return bool;
    }

    @Nullable
    public final Object syncAppUsageIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.APP_USAGE, j11)) {
            return syncAppUsage(context, continuation);
        }
        log("App usage sync not needed yet");
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncCalendarEvents(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28401 c28401;
        String strSummarize;
        List list;
        if (continuation instanceof C28401) {
            c28401 = (C28401) continuation;
            int i5 = c28401.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28401.label = i5 - Integer.MIN_VALUE;
            } else {
                c28401 = new C28401(continuation);
            }
        }
        Object objAddContext = c28401.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28401.label;
        if (i11 == 0) {
            ResultKt.b(objAddContext);
            List<CalendarEvent> listCollect = new CalendarEventsCollector().collect(context);
            if (listCollect.isEmpty()) {
                logVerbose("No calendar events to sync");
                return Boolean.FALSE;
            }
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            ArrayList arrayList = new ArrayList();
            for (Object obj2 : listCollect) {
                CalendarEvent calendarEvent = (CalendarEvent) obj2;
                StringBuilder sb2 = new StringBuilder();
                String lowerCase = calendarEvent.getTitle().toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                sb2.append(r70.k.u1(lowerCase).toString());
                sb2.append('|');
                sb2.append(calendarEvent.getEventDate());
                if (linkedHashSet.add(sb2.toString())) {
                    arrayList.add(obj2);
                }
            }
            int size = listCollect.size() - arrayList.size();
            if (size > 0) {
                log(c0.i(size, "Calendar sync: deduplicated ", " events"));
            }
            strSummarize = new CalendarEventsSummarizer().summarize(arrayList, currentDateStringUtc());
            ContextType contextType = ContextType.CALENDAR_EVENTS;
            c28401.L$0 = arrayList;
            c28401.L$1 = strSummarize;
            c28401.label = 1;
            objAddContext = addContext(contextType, strSummarize, c28401);
            if (objAddContext == obj) {
                return obj;
            }
            list = arrayList;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            strSummarize = (String) c28401.L$1;
            list = (List) c28401.L$0;
            ResultKt.b(objAddContext);
        }
        Boolean bool = (Boolean) objAddContext;
        if (bool.booleanValue()) {
            markSynced(ContextType.CALENDAR_EVENTS);
            log("Synced " + list.size() + " calendar events (" + strSummarize.length() + " chars)");
        }
        return bool;
    }

    @Nullable
    public final Object syncCalendarEventsIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.CALENDAR_EVENTS, j11)) {
            return syncCalendarEvents(context, continuation);
        }
        log("Calendar events sync not needed yet");
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncCallHistory(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28411 c28411;
        List<CallEntry> listCollect;
        if (continuation instanceof C28411) {
            c28411 = (C28411) continuation;
            int i5 = c28411.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28411.label = i5 - Integer.MIN_VALUE;
            } else {
                c28411 = new C28411(continuation);
            }
        }
        Object objAddContext = c28411.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28411.label;
        if (i11 == 0) {
            ResultKt.b(objAddContext);
            listCollect = new CallHistoryCollector().collect(context);
            if (listCollect.isEmpty()) {
                logVerbose("No call history to sync");
                return Boolean.FALSE;
            }
            String strSummarize$default = CallHistorySummarizer.summarize$default(new CallHistorySummarizer(), listCollect, null, 2, null);
            ContextType contextType = ContextType.CALL_HISTORY;
            c28411.L$0 = listCollect;
            c28411.label = 1;
            objAddContext = addContext(contextType, strSummarize$default, c28411);
            if (objAddContext == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            listCollect = (List) c28411.L$0;
            ResultKt.b(objAddContext);
        }
        Boolean bool = (Boolean) objAddContext;
        if (bool.booleanValue()) {
            markSynced(ContextType.CALL_HISTORY);
            log("Synced call history for " + listCollect.size() + " contacts");
        }
        return bool;
    }

    @Nullable
    public final Object syncCallHistoryIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.CALL_HISTORY, j11)) {
            return syncCallHistory(context, continuation);
        }
        log("Call history sync not needed yet");
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncConnectivity(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28421 c28421;
        if (continuation instanceof C28421) {
            c28421 = (C28421) continuation;
            int i5 = c28421.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28421.label = i5 - Integer.MIN_VALUE;
            } else {
                c28421 = new C28421(continuation);
            }
        }
        Object objAddContext = c28421.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28421.label;
        if (i11 == 0) {
            ResultKt.b(objAddContext);
            String strSummarize = new ConnectivitySummarizer().summarize(new ConnectivityCollector().collect(context), currentTimeString());
            ContextType contextType = ContextType.CONNECTIVITY;
            c28421.label = 1;
            objAddContext = addContext(contextType, strSummarize, c28421);
            if (objAddContext == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objAddContext);
        }
        Boolean bool = (Boolean) objAddContext;
        if (bool.booleanValue()) {
            markSynced(ContextType.CONNECTIVITY);
            log("Synced connectivity");
        }
        return bool;
    }

    @Nullable
    public final Object syncConnectivityIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.CONNECTIVITY, j11)) {
            return syncConnectivity(context, continuation);
        }
        log("Connectivity sync not needed yet");
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncContacts(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28431 c28431;
        List<ContactEntry> list;
        String str;
        if (continuation instanceof C28431) {
            c28431 = (C28431) continuation;
            int i5 = c28431.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28431.label = i5 - Integer.MIN_VALUE;
            } else {
                c28431 = new C28431(continuation);
            }
        }
        Object obj = c28431.result;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = c28431.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            List<ContactEntry> listCollect = new ContactsCollector().collect(context);
            if (listCollect.isEmpty()) {
                logVerbose("No contacts to sync");
                return Boolean.FALSE;
            }
            String strSummarize = new ContactsSummarizer().summarize(listCollect, currentDateString());
            ContextType contextType = ContextType.CONTACTS;
            c28431.L$0 = listCollect;
            c28431.L$1 = strSummarize;
            c28431.label = 1;
            Object objAddContext = addContext(contextType, strSummarize, c28431);
            if (objAddContext == obj2) {
                return obj2;
            }
            list = listCollect;
            str = strSummarize;
            obj = objAddContext;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = (String) c28431.L$1;
            list = (List) c28431.L$0;
            ResultKt.b(obj);
        }
        Boolean bool = (Boolean) obj;
        if (bool.booleanValue()) {
            markSynced(ContextType.CONTACTS);
            log("Synced " + list.size() + " contacts (" + str.length() + " chars)");
        } else {
            Boxing.a(Log.e(INSTANCE.getTAG(), "syncContacts: FAILED — addContext returned false"));
        }
        return bool;
    }

    @Nullable
    public final Object syncContactsIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.CONTACTS, j11)) {
            return syncContacts(context, continuation);
        }
        log("Contacts sync not needed yet");
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncDeviceState(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28441 c28441;
        if (continuation instanceof C28441) {
            c28441 = (C28441) continuation;
            int i5 = c28441.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28441.label = i5 - Integer.MIN_VALUE;
            } else {
                c28441 = new C28441(continuation);
            }
        }
        Object objAddContext = c28441.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28441.label;
        if (i11 == 0) {
            ResultKt.b(objAddContext);
            String strSummarize = new DeviceStateSummarizer().summarize(new DeviceStateCollector().collect(context), currentTimeString());
            ContextType contextType = ContextType.DEVICE_STATE;
            c28441.label = 1;
            objAddContext = addContext(contextType, strSummarize, c28441);
            if (objAddContext == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objAddContext);
        }
        Boolean bool = (Boolean) objAddContext;
        if (bool.booleanValue()) {
            markSynced(ContextType.DEVICE_STATE);
        }
        return bool;
    }

    @Nullable
    public final Object syncDeviceStateIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.DEVICE_STATE, j11)) {
            return syncDeviceState(context, continuation);
        }
        log("Device state sync not needed yet");
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncInstalledApps(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28451 c28451;
        List<String> list;
        String str;
        if (continuation instanceof C28451) {
            c28451 = (C28451) continuation;
            int i5 = c28451.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28451.label = i5 - Integer.MIN_VALUE;
            } else {
                c28451 = new C28451(continuation);
            }
        }
        Object obj = c28451.result;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = c28451.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            List<String> installedApps = getInstalledApps(context);
            if (installedApps.isEmpty()) {
                logVerbose("No installed apps to sync");
                return Boolean.FALSE;
            }
            String strSummarize = new InstalledAppsSummarizer().summarize(installedApps, currentDateString());
            ContextType contextType = ContextType.PHONE_APPS;
            c28451.L$0 = installedApps;
            c28451.L$1 = strSummarize;
            c28451.label = 1;
            Object objAddContext = addContext(contextType, strSummarize, c28451);
            if (objAddContext == obj2) {
                return obj2;
            }
            list = installedApps;
            str = strSummarize;
            obj = objAddContext;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = (String) c28451.L$1;
            list = (List) c28451.L$0;
            ResultKt.b(obj);
        }
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        if (zBooleanValue) {
            markSynced(ContextType.PHONE_APPS);
            log("Synced " + list.size() + " installed apps (" + str.length() + " chars)");
        }
        return Boolean.valueOf(zBooleanValue);
    }

    @Nullable
    public final Object syncInstalledAppsIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        int i5 = getPrefs().getInt("apps_format_version", 0);
        if (i5 < 2) {
            log(c0.i(i5, "Installed apps format changed (", " -> 2) — forcing re-sync"));
            getPrefs().edit().putInt("apps_format_version", 2).apply();
            return syncInstalledApps(context, continuation);
        }
        if (shouldSync(ContextType.PHONE_APPS, j11)) {
            return syncInstalledApps(context, continuation);
        }
        log("Installed apps sync not needed yet");
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncLocation(double d5, double d11, @NotNull String str, @NotNull Continuation<? super Boolean> continuation) {
        C28461 c28461;
        String str2;
        if (continuation instanceof C28461) {
            c28461 = (C28461) continuation;
            int i5 = c28461.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28461.label = i5 - Integer.MIN_VALUE;
            } else {
                c28461 = new C28461(continuation);
            }
        }
        Object objAddContext = c28461.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28461.label;
        if (i11 == 0) {
            ResultKt.b(objAddContext);
            if (r70.k.U0(str)) {
                log("Place name is blank, skipping location sync");
                return Boolean.FALSE;
            }
            String strSummarize = new LocationSummarizer().summarize(str, d5, d11, currentTimeString());
            ContextType contextType = ContextType.LOCATION;
            c28461.L$0 = str;
            c28461.label = 1;
            objAddContext = addContext(contextType, strSummarize, c28461);
            if (objAddContext == obj) {
                return obj;
            }
            str2 = str;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str2 = (String) c28461.L$0;
            ResultKt.b(objAddContext);
        }
        Boolean bool = (Boolean) objAddContext;
        if (bool.booleanValue()) {
            markSynced(ContextType.LOCATION);
            log("Synced location: " + str2);
        }
        return bool;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @SuppressLint({"MissingPermission"})
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncLocationFromDevice(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28471 c28471;
        if (continuation instanceof C28471) {
            c28471 = (C28471) continuation;
            int i5 = c28471.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28471.label = i5 - Integer.MIN_VALUE;
            } else {
                c28471 = new C28471(continuation);
            }
        }
        C28471 c284712 = c28471;
        Object objSyncLocation = c284712.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c284712.label;
        boolean zBooleanValue = false;
        try {
            if (i11 == 0) {
                ResultKt.b(objSyncLocation);
                if (!d.k()) {
                    logVerbose("syncLocationFromDevice: location processing not allowed by host, skipping");
                    return Boolean.FALSE;
                }
                boolean z11 = o4.a.a(context, "android.permission.ACCESS_FINE_LOCATION") == 0;
                boolean z12 = o4.a.a(context, "android.permission.ACCESS_COARSE_LOCATION") == 0;
                if (!z11 && !z12) {
                    logVerbose("syncLocationFromDevice: no location permission, skipping");
                    return Boolean.FALSE;
                }
                Object systemService = context.getSystemService("location");
                LocationManager locationManager = systemService instanceof LocationManager ? (LocationManager) systemService : null;
                if (locationManager == null) {
                    log("syncLocationFromDevice: LocationManager unavailable");
                    return Boolean.FALSE;
                }
                Location lastKnownLocation = locationManager.getLastKnownLocation("fused");
                if (lastKnownLocation == null && (lastKnownLocation = locationManager.getLastKnownLocation("gps")) == null && (lastKnownLocation = locationManager.getLastKnownLocation("network")) == null) {
                    lastKnownLocation = locationManager.getLastKnownLocation("passive");
                }
                Location location = lastKnownLocation;
                if (location == null) {
                    logVerbose("syncLocationFromDevice: no last known location available");
                    return Boolean.FALSE;
                }
                if (location.getAccuracy() > 1000.0f) {
                    log("syncLocationFromDevice: accuracy " + location.getAccuracy() + "m too low, skipping");
                    return Boolean.FALSE;
                }
                String strReverseGeocode = reverseGeocode(context, location.getLatitude(), location.getLongitude());
                if (strReverseGeocode != null && !r70.k.U0(strReverseGeocode)) {
                    double latitude = location.getLatitude();
                    double longitude = location.getLongitude();
                    c284712.label = 1;
                    objSyncLocation = syncLocation(latitude, longitude, strReverseGeocode, c284712);
                    if (objSyncLocation == obj) {
                        return obj;
                    }
                }
                log("syncLocationFromDevice: reverse geocoding returned nothing");
                return Boolean.FALSE;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objSyncLocation);
            zBooleanValue = ((Boolean) objSyncLocation).booleanValue();
        } catch (SecurityException unused) {
            log("syncLocationFromDevice: permission revoked during sync");
        } catch (Exception e3) {
            Log.w(INSTANCE.getTAG(), "syncLocationFromDevice failed: " + e3.getMessage());
        }
        return Boolean.valueOf(zBooleanValue);
    }

    @Nullable
    public final Object syncLocationFromDeviceIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.LOCATION, j11)) {
            return syncLocationFromDevice(context, continuation);
        }
        log("Location device sync not needed yet");
        return Boolean.FALSE;
    }

    @Nullable
    public final Object syncLocationIfNeeded(double d5, double d11, @NotNull String str, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.LOCATION, j11)) {
            return syncLocation(d5, d11, str, continuation);
        }
        log("Location sync not needed yet");
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object syncSmsHistory(@NotNull Context context, @NotNull Continuation<? super Boolean> continuation) {
        C28481 c28481;
        List<SmsEntry> listCollect;
        if (continuation instanceof C28481) {
            c28481 = (C28481) continuation;
            int i5 = c28481.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28481.label = i5 - Integer.MIN_VALUE;
            } else {
                c28481 = new C28481(continuation);
            }
        }
        Object objAddContext = c28481.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28481.label;
        if (i11 == 0) {
            ResultKt.b(objAddContext);
            listCollect = new SmsHistoryCollector().collect(context);
            if (listCollect.isEmpty()) {
                logVerbose("No SMS history to sync");
                return Boolean.FALSE;
            }
            String strSummarize$default = SmsHistorySummarizer.summarize$default(new SmsHistorySummarizer(), listCollect, null, 2, null);
            ContextType contextType = ContextType.SMS_HISTORY;
            c28481.L$0 = listCollect;
            c28481.label = 1;
            objAddContext = addContext(contextType, strSummarize$default, c28481);
            if (objAddContext == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            listCollect = (List) c28481.L$0;
            ResultKt.b(objAddContext);
        }
        Boolean bool = (Boolean) objAddContext;
        if (bool.booleanValue()) {
            markSynced(ContextType.SMS_HISTORY);
            log("Synced SMS history for " + listCollect.size() + " contacts");
        }
        return bool;
    }

    @Nullable
    public final Object syncSmsHistoryIfNeeded(@NotNull Context context, long j11, @NotNull Continuation<? super Boolean> continuation) {
        if (shouldSync(ContextType.SMS_HISTORY, j11)) {
            return syncSmsHistory(context, continuation);
        }
        log("SMS history sync not needed yet");
        return Boolean.FALSE;
    }

    @Nullable
    public final Object addContext(@NotNull ContextType contextType, @NotNull String str, @NotNull Continuation<? super Boolean> continuation) {
        return addContext(contextType, ul.b.P(str), continuation);
    }
}
