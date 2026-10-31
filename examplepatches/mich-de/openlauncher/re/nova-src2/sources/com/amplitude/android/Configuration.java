package com.amplitude.android;

import ab.e0;
import android.content.Context;
import androidx.recyclerview.widget.u1;
import b70.g;
import com.amplitude.android.storage.AndroidStorageContextV3;
import com.amplitude.android.utilities.AndroidLoggerProvider;
import com.amplitude.core.LoggerProvider;
import com.amplitude.core.ServerZone;
import com.amplitude.core.StorageProvider;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.IngestionMetadata;
import com.amplitude.core.events.Plan;
import com.amplitude.core.utilities.http.HttpClientInterface;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.amplitude.id.IdentityStorageProvider;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.File;
import java.util.Set;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000¬\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010#\n\u0002\bm\n\u0002\u0018\u0002\n\u0002\b\u0014\b\u0016\u0018\u0000 Ç\u00012\u00020\u0001:\u0002Ç\u0001B¥\u0003\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\t\u001a\u00020\u0003\u0012\b\b\u0002\u0010\n\u001a\u00020\u000b\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u000f\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012F\b\u0002\u0010\u0012\u001a@\u0012\u0004\u0012\u00020\u0014\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0017\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0018\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0013j\u0004\u0018\u0001`\u001a\u0012\b\b\u0002\u0010\u001b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\u001c\u001a\u00020\u000b\u0012\b\b\u0002\u0010\u001d\u001a\u00020\u001e\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010!\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010#\u0012\b\b\u0002\u0010$\u001a\u00020\u000b\u0012\b\b\u0002\u0010%\u001a\u00020\u000b\u0012\b\b\u0002\u0010&\u001a\u00020\u000b\u0012\b\b\u0002\u0010'\u001a\u00020(\u0012\b\b\u0002\u0010)\u001a\u00020\u000b\u0012\b\b\u0002\u0010*\u001a\u00020\u000b\u0012\b\b\u0002\u0010+\u001a\u00020\u000b\u0012\b\b\u0002\u0010,\u001a\u00020-\u0012\b\b\u0002\u0010.\u001a\u00020\u000b\u0012\b\b\u0002\u0010/\u001a\u000200\u0012\b\b\u0002\u00101\u001a\u00020-\u0012\b\b\u0002\u00102\u001a\u00020\r\u0012\b\b\u0002\u00103\u001a\u000204\u0012\b\b\u0002\u00105\u001a\u00020\u000b\u0012\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00108\u001a\u0004\u0018\u00010-¢\u0006\u0002\u00109BÓ\u0003\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\t\u001a\u00020\u0003\u0012\b\b\u0002\u0010\n\u001a\u00020\u000b\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u000f\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012F\b\u0002\u0010\u0012\u001a@\u0012\u0004\u0012\u00020\u0014\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0017\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0018\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0013j\u0004\u0018\u0001`\u001a\u0012\b\b\u0002\u0010\u001b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\u001c\u001a\u00020\u000b\u0012\b\b\u0002\u0010\u001d\u001a\u00020\u001e\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010!\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010#\u0012\b\b\u0002\u0010$\u001a\u00020\u000b\u0012\b\b\u0002\u0010%\u001a\u00020\u000b\u0012\b\b\u0002\u0010&\u001a\u00020\u000b\u0012\b\b\u0002\u0010'\u001a\u00020(\u0012\b\b\u0002\u0010)\u001a\u00020\u000b\u0012\b\b\u0002\u0010*\u001a\u00020\u000b\u0012\b\b\u0002\u0010+\u001a\u00020\u000b\u0012\b\b\u0002\u0010,\u001a\u00020-\u0012\u000e\b\u0002\u0010:\u001a\b\u0012\u0004\u0012\u00020<0;\u0012\b\b\u0002\u00101\u001a\u00020-\u0012\b\b\u0002\u00102\u001a\u00020\r\u0012\b\b\u0002\u00103\u001a\u000204\u0012\b\b\u0002\u00105\u001a\u00020\u000b\u0012\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00108\u001a\u0004\u0018\u00010-\u0012\n\b\u0002\u0010=\u001a\u0004\u0018\u00010>\u0012\b\b\u0002\u0010?\u001a\u00020@\u0012\b\b\u0002\u0010A\u001a\u00020\u000b\u0012\b\b\u0002\u0010B\u001a\u00020\u000b\u0012\b\b\u0002\u0010C\u001a\u00020\u000b¢\u0006\u0002\u0010DJ\u0010\u0010Ä\u0001\u001a\u00030´\u0001H\u0000¢\u0006\u0003\bÅ\u0001J\r\u0010Æ\u0001\u001a\u00020\u0019*\u000200H\u0002R\u0014\u0010E\u001a\b\u0012\u0004\u0012\u00020<0FX\u0082\u000e¢\u0006\u0002\n\u0000R0\u0010:\u001a\b\u0012\u0004\u0012\u00020<0;2\f\u0010G\u001a\b\u0012\u0004\u0012\u00020<0;8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bH\u0010I\"\u0004\bJ\u0010KRX\u0010\u0012\u001a@\u0012\u0004\u0012\u00020\u0014\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0017\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0018\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0013j\u0004\u0018\u0001`\u001aX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bL\u0010M\"\u0004\bN\u0010OR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\bP\u0010QR,\u0010/\u001a\u0002002\u0006\u0010G\u001a\u0002008\u0006@FX\u0087\u000e¢\u0006\u0014\n\u0000\u0012\u0004\bR\u0010S\u001a\u0004\bT\u0010U\"\u0004\bV\u0010WR\u001c\u00107\u001a\u0004\u0018\u00010\u0003X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bX\u0010Y\"\u0004\bZ\u0010[R\u001a\u0010C\u001a\u00020\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\\\u0010]\"\u0004\b^\u0010_R\u001a\u0010)\u001a\u00020\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b`\u0010]\"\u0004\ba\u0010_R\u001a\u0010A\u001a\u00020\u000bX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bb\u0010]\"\u0004\bc\u0010_R\u001a\u0010B\u001a\u00020\u000bX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bd\u0010]\"\u0004\be\u0010_R\u001a\u0010+\u001a\u00020\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bf\u0010]\"\u0004\bg\u0010_R\u001a\u0010\b\u001a\u00020\u0007X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bh\u0010i\"\u0004\bj\u0010kR\u001a\u0010\u001b\u001a\u00020\u0007X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bl\u0010i\"\u0004\bm\u0010kR\u001a\u0010\u0006\u001a\u00020\u0007X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bn\u0010i\"\u0004\bo\u0010kR\u001c\u0010=\u001a\u0004\u0018\u00010>X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bp\u0010q\"\u0004\br\u0010sR\u001a\u00101\u001a\u00020-X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bt\u0010u\"\u0004\bv\u0010wR\u001a\u00102\u001a\u00020\rX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bx\u0010y\"\u0004\bz\u0010{R\u001a\u00103\u001a\u000204X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b|\u0010}\"\u0004\b~\u0010\u007fR \u0010\"\u001a\u0004\u0018\u00010#X\u0096\u000e¢\u0006\u0012\n\u0000\u001a\u0006\b\u0080\u0001\u0010\u0081\u0001\"\u0006\b\u0082\u0001\u0010\u0083\u0001R\u001c\u0010\t\u001a\u00020\u0003X\u0096\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u0084\u0001\u0010Y\"\u0005\b\u0085\u0001\u0010[R\u001e\u0010?\u001a\u00020@X\u0086\u000e¢\u0006\u0012\n\u0000\u001a\u0006\b\u0086\u0001\u0010\u0087\u0001\"\u0006\b\u0088\u0001\u0010\u0089\u0001R\u001c\u0010*\u001a\u00020\u000bX\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u008a\u0001\u0010]\"\u0005\b\u008b\u0001\u0010_R\u001e\u0010\u000e\u001a\u00020\u000fX\u0096\u000e¢\u0006\u0012\n\u0000\u001a\u0006\b\u008c\u0001\u0010\u008d\u0001\"\u0006\b\u008e\u0001\u0010\u008f\u0001R\u001c\u00105\u001a\u00020\u000bX\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u0090\u0001\u0010]\"\u0005\b\u0091\u0001\u0010_R#\u0010\u0010\u001a\u0004\u0018\u00010\u0007X\u0096\u000e¢\u0006\u0015\n\u0003\u0010\u0096\u0001\u001a\u0006\b\u0092\u0001\u0010\u0093\u0001\"\u0006\b\u0094\u0001\u0010\u0095\u0001R\u001c\u0010,\u001a\u00020-X\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u0097\u0001\u0010u\"\u0005\b\u0098\u0001\u0010wR\u001c\u0010&\u001a\u00020\u000bX\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b\u0099\u0001\u0010]\"\u0005\b\u009a\u0001\u0010_R#\u00106\u001a\u0004\u0018\u00010\u000bX\u0096\u000e¢\u0006\u0015\n\u0003\u0010\u009f\u0001\u001a\u0006\b\u009b\u0001\u0010\u009c\u0001\"\u0006\b\u009d\u0001\u0010\u009e\u0001R\u001c\u0010\n\u001a\u00020\u000bX\u0096\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b \u0001\u0010]\"\u0005\b¡\u0001\u0010_R\u001e\u0010\u0011\u001a\u0004\u0018\u00010\u0003X\u0096\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b¢\u0001\u0010Y\"\u0005\b£\u0001\u0010[R \u0010 \u001a\u0004\u0018\u00010!X\u0096\u000e¢\u0006\u0012\n\u0000\u001a\u0006\b¤\u0001\u0010¥\u0001\"\u0006\b¦\u0001\u0010§\u0001R\u001e\u0010\u001f\u001a\u0004\u0018\u00010\u0003X\u0096\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b¨\u0001\u0010Y\"\u0005\b©\u0001\u0010[R\u001e\u0010\u001d\u001a\u00020\u001eX\u0096\u000e¢\u0006\u0012\n\u0000\u001a\u0006\bª\u0001\u0010«\u0001\"\u0006\b¬\u0001\u0010\u00ad\u0001R#\u00108\u001a\u0004\u0018\u00010-X\u0096\u000e¢\u0006\u0015\n\u0003\u0010²\u0001\u001a\u0006\b®\u0001\u0010¯\u0001\"\u0006\b°\u0001\u0010±\u0001R\u0012\u0010³\u0001\u001a\u0005\u0018\u00010´\u0001X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\f\u001a\u00020\rX\u0096\u000e¢\u0006\u0010\n\u0000\u001a\u0005\bµ\u0001\u0010y\"\u0005\b¶\u0001\u0010{R\u001e\u0010'\u001a\u00020(X\u0086\u000e¢\u0006\u0012\n\u0000\u001a\u0006\b·\u0001\u0010¸\u0001\"\u0006\b¹\u0001\u0010º\u0001R-\u0010.\u001a\u00020\u000b2\u0006\u0010G\u001a\u00020\u000b8F@FX\u0087\u000e¢\u0006\u0015\u0012\u0005\b»\u0001\u0010S\u001a\u0005\b¼\u0001\u0010]\"\u0005\b½\u0001\u0010_R\u001c\u0010$\u001a\u00020\u000bX\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\b¾\u0001\u0010]\"\u0005\b¿\u0001\u0010_R\u001c\u0010%\u001a\u00020\u000bX\u0086\u000e¢\u0006\u0010\n\u0000\u001a\u0005\bÀ\u0001\u0010]\"\u0005\bÁ\u0001\u0010_R\u001c\u0010\u001c\u001a\u00020\u000bX\u0096\u000e¢\u0006\u0010\n\u0000\u001a\u0005\bÂ\u0001\u0010]\"\u0005\bÃ\u0001\u0010_¨\u0006È\u0001"}, d2 = {"Lcom/amplitude/android/Configuration;", "Lcom/amplitude/core/Configuration;", "apiKey", b.f42142b, "context", "Landroid/content/Context;", "flushQueueSize", b.f42142b, "flushIntervalMillis", "instanceName", "optOut", b.f42142b, "storageProvider", "Lcom/amplitude/core/StorageProvider;", "loggerProvider", "Lcom/amplitude/core/LoggerProvider;", "minIdLength", "partnerId", "callback", "Lkotlin/Function3;", "Lcom/amplitude/core/events/BaseEvent;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "status", PglCryptUtils.KEY_MESSAGE, b.f42142b, "Lcom/amplitude/core/EventCallBack;", "flushMaxRetries", "useBatch", "serverZone", "Lcom/amplitude/core/ServerZone;", "serverUrl", "plan", "Lcom/amplitude/core/events/Plan;", "ingestionMetadata", "Lcom/amplitude/core/events/IngestionMetadata;", "useAdvertisingIdForDeviceId", "useAppSetIdForDeviceId", "newDeviceIdPerInstall", "trackingOptions", "Lcom/amplitude/android/TrackingOptions;", "enableCoppaControl", "locationListening", "flushEventsOnClose", "minTimeBetweenSessionsMillis", b.f42142b, "trackingSessionEvents", "defaultTracking", "Lcom/amplitude/android/DefaultTrackingOptions;", "identifyBatchIntervalMillis", "identifyInterceptStorageProvider", "identityStorageProvider", "Lcom/amplitude/id/IdentityStorageProvider;", "migrateLegacyData", "offline", "deviceId", "sessionId", "(Ljava/lang/String;Landroid/content/Context;IILjava/lang/String;ZLcom/amplitude/core/StorageProvider;Lcom/amplitude/core/LoggerProvider;Ljava/lang/Integer;Ljava/lang/String;Lkotlin/jvm/functions/Function3;IZLcom/amplitude/core/ServerZone;Ljava/lang/String;Lcom/amplitude/core/events/Plan;Lcom/amplitude/core/events/IngestionMetadata;ZZZLcom/amplitude/android/TrackingOptions;ZZZJZLcom/amplitude/android/DefaultTrackingOptions;JLcom/amplitude/core/StorageProvider;Lcom/amplitude/id/IdentityStorageProvider;ZLjava/lang/Boolean;Ljava/lang/String;Ljava/lang/Long;)V", "autocapture", b.f42142b, "Lcom/amplitude/android/AutocaptureOption;", "httpClient", "Lcom/amplitude/core/utilities/http/HttpClientInterface;", "interactionsOptions", "Lcom/amplitude/android/InteractionsOptions;", "enableDiagnostics", "enableRequestBodyCompression", "enableAutocaptureRemoteConfig", "(Ljava/lang/String;Landroid/content/Context;IILjava/lang/String;ZLcom/amplitude/core/StorageProvider;Lcom/amplitude/core/LoggerProvider;Ljava/lang/Integer;Ljava/lang/String;Lkotlin/jvm/functions/Function3;IZLcom/amplitude/core/ServerZone;Ljava/lang/String;Lcom/amplitude/core/events/Plan;Lcom/amplitude/core/events/IngestionMetadata;ZZZLcom/amplitude/android/TrackingOptions;ZZZJLjava/util/Set;JLcom/amplitude/core/StorageProvider;Lcom/amplitude/id/IdentityStorageProvider;ZLjava/lang/Boolean;Ljava/lang/String;Ljava/lang/Long;Lcom/amplitude/core/utilities/http/HttpClientInterface;Lcom/amplitude/android/InteractionsOptions;ZZZ)V", "_autocapture", b.f42142b, "value", "getAutocapture", "()Ljava/util/Set;", "setAutocapture", "(Ljava/util/Set;)V", "getCallback", "()Lkotlin/jvm/functions/Function3;", "setCallback", "(Lkotlin/jvm/functions/Function3;)V", "getContext", "()Landroid/content/Context;", "getDefaultTracking$annotations", "()V", "getDefaultTracking", "()Lcom/amplitude/android/DefaultTrackingOptions;", "setDefaultTracking", "(Lcom/amplitude/android/DefaultTrackingOptions;)V", "getDeviceId", "()Ljava/lang/String;", "setDeviceId", "(Ljava/lang/String;)V", "getEnableAutocaptureRemoteConfig", "()Z", "setEnableAutocaptureRemoteConfig", "(Z)V", "getEnableCoppaControl", "setEnableCoppaControl", "getEnableDiagnostics", "setEnableDiagnostics", "getEnableRequestBodyCompression", "setEnableRequestBodyCompression", "getFlushEventsOnClose", "setFlushEventsOnClose", "getFlushIntervalMillis", "()I", "setFlushIntervalMillis", "(I)V", "getFlushMaxRetries", "setFlushMaxRetries", "getFlushQueueSize", "setFlushQueueSize", "getHttpClient", "()Lcom/amplitude/core/utilities/http/HttpClientInterface;", "setHttpClient", "(Lcom/amplitude/core/utilities/http/HttpClientInterface;)V", "getIdentifyBatchIntervalMillis", "()J", "setIdentifyBatchIntervalMillis", "(J)V", "getIdentifyInterceptStorageProvider", "()Lcom/amplitude/core/StorageProvider;", "setIdentifyInterceptStorageProvider", "(Lcom/amplitude/core/StorageProvider;)V", "getIdentityStorageProvider", "()Lcom/amplitude/id/IdentityStorageProvider;", "setIdentityStorageProvider", "(Lcom/amplitude/id/IdentityStorageProvider;)V", "getIngestionMetadata", "()Lcom/amplitude/core/events/IngestionMetadata;", "setIngestionMetadata", "(Lcom/amplitude/core/events/IngestionMetadata;)V", "getInstanceName", "setInstanceName", "getInteractionsOptions", "()Lcom/amplitude/android/InteractionsOptions;", "setInteractionsOptions", "(Lcom/amplitude/android/InteractionsOptions;)V", "getLocationListening", "setLocationListening", "getLoggerProvider", "()Lcom/amplitude/core/LoggerProvider;", "setLoggerProvider", "(Lcom/amplitude/core/LoggerProvider;)V", "getMigrateLegacyData", "setMigrateLegacyData", "getMinIdLength", "()Ljava/lang/Integer;", "setMinIdLength", "(Ljava/lang/Integer;)V", "Ljava/lang/Integer;", "getMinTimeBetweenSessionsMillis", "setMinTimeBetweenSessionsMillis", "getNewDeviceIdPerInstall", "setNewDeviceIdPerInstall", "getOffline", "()Ljava/lang/Boolean;", "setOffline", "(Ljava/lang/Boolean;)V", "Ljava/lang/Boolean;", "getOptOut", "setOptOut", "getPartnerId", "setPartnerId", "getPlan", "()Lcom/amplitude/core/events/Plan;", "setPlan", "(Lcom/amplitude/core/events/Plan;)V", "getServerUrl", "setServerUrl", "getServerZone", "()Lcom/amplitude/core/ServerZone;", "setServerZone", "(Lcom/amplitude/core/ServerZone;)V", "getSessionId", "()Ljava/lang/Long;", "setSessionId", "(Ljava/lang/Long;)V", "Ljava/lang/Long;", "storageDirectory", "Ljava/io/File;", "getStorageProvider", "setStorageProvider", "getTrackingOptions", "()Lcom/amplitude/android/TrackingOptions;", "setTrackingOptions", "(Lcom/amplitude/android/TrackingOptions;)V", "getTrackingSessionEvents$annotations", "getTrackingSessionEvents", "setTrackingSessionEvents", "getUseAdvertisingIdForDeviceId", "setUseAdvertisingIdForDeviceId", "getUseAppSetIdForDeviceId", "setUseAppSetIdForDeviceId", "getUseBatch", "setUseBatch", "getStorageDirectory", "getStorageDirectory$android_release", "updateAutocaptureOnPropertyChange", k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class Configuration extends com.amplitude.core.Configuration {
    public static final long MIN_TIME_BETWEEN_SESSIONS_MILLIS = 300000;

    @NotNull
    private Set<AutocaptureOption> _autocapture;

    @Nullable
    private Function3<? super BaseEvent, ? super Integer, ? super String, Unit> callback;

    @NotNull
    private final Context context;

    @NotNull
    private DefaultTrackingOptions defaultTracking;

    @Nullable
    private String deviceId;
    private boolean enableAutocaptureRemoteConfig;
    private boolean enableCoppaControl;
    private boolean enableDiagnostics;
    private boolean enableRequestBodyCompression;
    private boolean flushEventsOnClose;
    private int flushIntervalMillis;
    private int flushMaxRetries;
    private int flushQueueSize;

    @Nullable
    private HttpClientInterface httpClient;
    private long identifyBatchIntervalMillis;

    @NotNull
    private StorageProvider identifyInterceptStorageProvider;

    @NotNull
    private IdentityStorageProvider identityStorageProvider;

    @Nullable
    private IngestionMetadata ingestionMetadata;

    @NotNull
    private String instanceName;

    @NotNull
    private InteractionsOptions interactionsOptions;
    private boolean locationListening;

    @NotNull
    private LoggerProvider loggerProvider;
    private boolean migrateLegacyData;

    @Nullable
    private Integer minIdLength;
    private long minTimeBetweenSessionsMillis;
    private boolean newDeviceIdPerInstall;

    @Nullable
    private Boolean offline;
    private boolean optOut;

    @Nullable
    private String partnerId;

    @Nullable
    private Plan plan;

    @Nullable
    private String serverUrl;

    @NotNull
    private ServerZone serverZone;

    @Nullable
    private Long sessionId;

    @Nullable
    private File storageDirectory;

    @NotNull
    private StorageProvider storageProvider;

    @NotNull
    private TrackingOptions trackingOptions;
    private boolean useAdvertisingIdForDeviceId;
    private boolean useAppSetIdForDeviceId;
    private boolean useBatch;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context) {
        this(apiKey, context, 0, 0, null, false, null, null, null, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -4, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
    }

    @Deprecated
    public static /* synthetic */ void getDefaultTracking$annotations() {
    }

    @Deprecated
    public static /* synthetic */ void getTrackingSessionEvents$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateAutocaptureOnPropertyChange(DefaultTrackingOptions defaultTrackingOptions) {
        this._autocapture = defaultTrackingOptions.getAutocaptureOptions$android_release();
    }

    @NotNull
    public final Set<AutocaptureOption> getAutocapture() {
        return this._autocapture;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public Function3<BaseEvent, Integer, String, Unit> getCallback() {
        return this.callback;
    }

    @NotNull
    public final Context getContext() {
        return this.context;
    }

    @NotNull
    public final DefaultTrackingOptions getDefaultTracking() {
        return this.defaultTracking;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public String getDeviceId() {
        return this.deviceId;
    }

    public final boolean getEnableAutocaptureRemoteConfig() {
        return this.enableAutocaptureRemoteConfig;
    }

    public final boolean getEnableCoppaControl() {
        return this.enableCoppaControl;
    }

    @Override // com.amplitude.core.Configuration
    public boolean getEnableDiagnostics() {
        return this.enableDiagnostics;
    }

    @Override // com.amplitude.core.Configuration
    public boolean getEnableRequestBodyCompression() {
        return this.enableRequestBodyCompression;
    }

    public final boolean getFlushEventsOnClose() {
        return this.flushEventsOnClose;
    }

    @Override // com.amplitude.core.Configuration
    public int getFlushIntervalMillis() {
        return this.flushIntervalMillis;
    }

    @Override // com.amplitude.core.Configuration
    public int getFlushMaxRetries() {
        return this.flushMaxRetries;
    }

    @Override // com.amplitude.core.Configuration
    public int getFlushQueueSize() {
        return this.flushQueueSize;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public HttpClientInterface getHttpClient() {
        return this.httpClient;
    }

    @Override // com.amplitude.core.Configuration
    public long getIdentifyBatchIntervalMillis() {
        return this.identifyBatchIntervalMillis;
    }

    @Override // com.amplitude.core.Configuration
    @NotNull
    public StorageProvider getIdentifyInterceptStorageProvider() {
        return this.identifyInterceptStorageProvider;
    }

    @Override // com.amplitude.core.Configuration
    @NotNull
    public IdentityStorageProvider getIdentityStorageProvider() {
        return this.identityStorageProvider;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public IngestionMetadata getIngestionMetadata() {
        return this.ingestionMetadata;
    }

    @Override // com.amplitude.core.Configuration
    @NotNull
    public String getInstanceName() {
        return this.instanceName;
    }

    @NotNull
    public final InteractionsOptions getInteractionsOptions() {
        return this.interactionsOptions;
    }

    public final boolean getLocationListening() {
        return this.locationListening;
    }

    @Override // com.amplitude.core.Configuration
    @NotNull
    public LoggerProvider getLoggerProvider() {
        return this.loggerProvider;
    }

    public final boolean getMigrateLegacyData() {
        return this.migrateLegacyData;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public Integer getMinIdLength() {
        return this.minIdLength;
    }

    public final long getMinTimeBetweenSessionsMillis() {
        return this.minTimeBetweenSessionsMillis;
    }

    public final boolean getNewDeviceIdPerInstall() {
        return this.newDeviceIdPerInstall;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public Boolean getOffline() {
        return this.offline;
    }

    @Override // com.amplitude.core.Configuration
    public boolean getOptOut() {
        return this.optOut;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public String getPartnerId() {
        return this.partnerId;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public Plan getPlan() {
        return this.plan;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public String getServerUrl() {
        return this.serverUrl;
    }

    @Override // com.amplitude.core.Configuration
    @NotNull
    public ServerZone getServerZone() {
        return this.serverZone;
    }

    @Override // com.amplitude.core.Configuration
    @Nullable
    public Long getSessionId() {
        return this.sessionId;
    }

    @NotNull
    public final File getStorageDirectory$android_release() {
        if (this.storageDirectory == null) {
            File file = new File(this.context.getDir("amplitude", 0), this.context.getPackageName() + '/' + getInstanceName() + "/analytics/");
            this.storageDirectory = file;
            file.mkdirs();
        }
        File file2 = this.storageDirectory;
        Intrinsics.d(file2);
        return file2;
    }

    @Override // com.amplitude.core.Configuration
    @NotNull
    public StorageProvider getStorageProvider() {
        return this.storageProvider;
    }

    @NotNull
    public final TrackingOptions getTrackingOptions() {
        return this.trackingOptions;
    }

    public final boolean getTrackingSessionEvents() {
        return this._autocapture.contains(AutocaptureOption.SESSIONS);
    }

    public final boolean getUseAdvertisingIdForDeviceId() {
        return this.useAdvertisingIdForDeviceId;
    }

    public final boolean getUseAppSetIdForDeviceId() {
        return this.useAppSetIdForDeviceId;
    }

    @Override // com.amplitude.core.Configuration
    public boolean getUseBatch() {
        return this.useBatch;
    }

    public final void setAutocapture(@NotNull Set<? extends AutocaptureOption> value) {
        Intrinsics.g(value, "value");
        this._autocapture = g.M1(value);
    }

    @Override // com.amplitude.core.Configuration
    public void setCallback(@Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3) {
        this.callback = function3;
    }

    public final void setDefaultTracking(@NotNull DefaultTrackingOptions value) {
        Intrinsics.g(value, "value");
        this.defaultTracking = value;
        this._autocapture = value.getAutocaptureOptions$android_release();
        value.addPropertyChangeListener$android_release(new Function1<DefaultTrackingOptions, Unit>() { // from class: com.amplitude.android.Configuration$defaultTracking$2
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DefaultTrackingOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DefaultTrackingOptions addPropertyChangeListener) {
                Intrinsics.g(addPropertyChangeListener, "$this$addPropertyChangeListener");
                this.this$0.updateAutocaptureOnPropertyChange(addPropertyChangeListener);
            }
        });
    }

    @Override // com.amplitude.core.Configuration
    public void setDeviceId(@Nullable String str) {
        this.deviceId = str;
    }

    public final void setEnableAutocaptureRemoteConfig(boolean z11) {
        this.enableAutocaptureRemoteConfig = z11;
    }

    public final void setEnableCoppaControl(boolean z11) {
        this.enableCoppaControl = z11;
    }

    @Override // com.amplitude.core.Configuration
    public void setEnableDiagnostics(boolean z11) {
        this.enableDiagnostics = z11;
    }

    @Override // com.amplitude.core.Configuration
    public void setEnableRequestBodyCompression(boolean z11) {
        this.enableRequestBodyCompression = z11;
    }

    public final void setFlushEventsOnClose(boolean z11) {
        this.flushEventsOnClose = z11;
    }

    @Override // com.amplitude.core.Configuration
    public void setFlushIntervalMillis(int i5) {
        this.flushIntervalMillis = i5;
    }

    @Override // com.amplitude.core.Configuration
    public void setFlushMaxRetries(int i5) {
        this.flushMaxRetries = i5;
    }

    @Override // com.amplitude.core.Configuration
    public void setFlushQueueSize(int i5) {
        this.flushQueueSize = i5;
    }

    @Override // com.amplitude.core.Configuration
    public void setHttpClient(@Nullable HttpClientInterface httpClientInterface) {
        this.httpClient = httpClientInterface;
    }

    @Override // com.amplitude.core.Configuration
    public void setIdentifyBatchIntervalMillis(long j11) {
        this.identifyBatchIntervalMillis = j11;
    }

    @Override // com.amplitude.core.Configuration
    public void setIdentifyInterceptStorageProvider(@NotNull StorageProvider storageProvider) {
        Intrinsics.g(storageProvider, "<set-?>");
        this.identifyInterceptStorageProvider = storageProvider;
    }

    @Override // com.amplitude.core.Configuration
    public void setIdentityStorageProvider(@NotNull IdentityStorageProvider identityStorageProvider) {
        Intrinsics.g(identityStorageProvider, "<set-?>");
        this.identityStorageProvider = identityStorageProvider;
    }

    @Override // com.amplitude.core.Configuration
    public void setIngestionMetadata(@Nullable IngestionMetadata ingestionMetadata) {
        this.ingestionMetadata = ingestionMetadata;
    }

    @Override // com.amplitude.core.Configuration
    public void setInstanceName(@NotNull String str) {
        Intrinsics.g(str, "<set-?>");
        this.instanceName = str;
    }

    public final void setInteractionsOptions(@NotNull InteractionsOptions interactionsOptions) {
        Intrinsics.g(interactionsOptions, "<set-?>");
        this.interactionsOptions = interactionsOptions;
    }

    public final void setLocationListening(boolean z11) {
        this.locationListening = z11;
    }

    public void setLoggerProvider(@NotNull LoggerProvider loggerProvider) {
        Intrinsics.g(loggerProvider, "<set-?>");
        this.loggerProvider = loggerProvider;
    }

    public final void setMigrateLegacyData(boolean z11) {
        this.migrateLegacyData = z11;
    }

    @Override // com.amplitude.core.Configuration
    public void setMinIdLength(@Nullable Integer num) {
        this.minIdLength = num;
    }

    public final void setMinTimeBetweenSessionsMillis(long j11) {
        this.minTimeBetweenSessionsMillis = j11;
    }

    public final void setNewDeviceIdPerInstall(boolean z11) {
        this.newDeviceIdPerInstall = z11;
    }

    @Override // com.amplitude.core.Configuration
    public void setOffline(@Nullable Boolean bool) {
        this.offline = bool;
    }

    @Override // com.amplitude.core.Configuration
    public void setOptOut(boolean z11) {
        this.optOut = z11;
    }

    @Override // com.amplitude.core.Configuration
    public void setPartnerId(@Nullable String str) {
        this.partnerId = str;
    }

    @Override // com.amplitude.core.Configuration
    public void setPlan(@Nullable Plan plan) {
        this.plan = plan;
    }

    @Override // com.amplitude.core.Configuration
    public void setServerUrl(@Nullable String str) {
        this.serverUrl = str;
    }

    @Override // com.amplitude.core.Configuration
    public void setServerZone(@NotNull ServerZone serverZone) {
        Intrinsics.g(serverZone, "<set-?>");
        this.serverZone = serverZone;
    }

    @Override // com.amplitude.core.Configuration
    public void setSessionId(@Nullable Long l9) {
        this.sessionId = l9;
    }

    public void setStorageProvider(@NotNull StorageProvider storageProvider) {
        Intrinsics.g(storageProvider, "<set-?>");
        this.storageProvider = storageProvider;
    }

    public final void setTrackingOptions(@NotNull TrackingOptions trackingOptions) {
        Intrinsics.g(trackingOptions, "<set-?>");
        this.trackingOptions = trackingOptions;
    }

    public final void setTrackingSessionEvents(boolean z11) {
        if (z11) {
            this._autocapture.add(AutocaptureOption.SESSIONS);
        } else {
            this._autocapture.remove(AutocaptureOption.SESSIONS);
        }
    }

    public final void setUseAdvertisingIdForDeviceId(boolean z11) {
        this.useAdvertisingIdForDeviceId = z11;
    }

    public final void setUseAppSetIdForDeviceId(boolean z11) {
        this.useAppSetIdForDeviceId = z11;
    }

    @Override // com.amplitude.core.Configuration
    public void setUseBatch(boolean z11) {
        this.useBatch = z11;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5) {
        this(apiKey, context, i5, 0, null, false, null, null, null, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -8, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11) {
        this(apiKey, context, i5, i11, null, false, null, null, null, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -16, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName) {
        this(apiKey, context, i5, i11, instanceName, false, null, null, null, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -32, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11) {
        this(apiKey, context, i5, i11, instanceName, z11, null, null, null, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -64, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, null, null, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -128, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, null, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -256, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -512, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, BackupConstant.UNFINISHED_FAIL_CODE, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, BackupConstant.CLOSE_NOT_SHOW_CODE, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, false, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -4096, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, null, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -8192, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, null, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -16384, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, null, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -32768, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, null, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -65536, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, false, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -131072, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, false, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -262144, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, false, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -524288, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, null, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -1048576, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, false, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -2097152, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, false, false, 0L, false, null, 0L, null, null, false, null, null, null, -4194304, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, false, 0L, false, null, 0L, null, null, false, null, null, null, -8388608, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, 0L, false, null, 0L, null, null, false, null, null, null, -16777216, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, false, null, 0L, null, null, false, null, null, null, -33554432, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, z19, null, 0L, null, null, false, null, null, null, -67108864, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, @NotNull DefaultTrackingOptions defaultTracking) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, z19, defaultTracking, 0L, null, null, false, null, null, null, -134217728, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(defaultTracking, "defaultTracking");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, @NotNull DefaultTrackingOptions defaultTracking, long j12) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, z19, defaultTracking, j12, null, null, false, null, null, null, -268435456, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(defaultTracking, "defaultTracking");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, @NotNull DefaultTrackingOptions defaultTracking, long j12, @NotNull StorageProvider identifyInterceptStorageProvider) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, z19, defaultTracking, j12, identifyInterceptStorageProvider, null, false, null, null, null, -536870912, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(defaultTracking, "defaultTracking");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, @NotNull DefaultTrackingOptions defaultTracking, long j12, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, z19, defaultTracking, j12, identifyInterceptStorageProvider, identityStorageProvider, false, null, null, null, -1073741824, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(defaultTracking, "defaultTracking");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, @NotNull DefaultTrackingOptions defaultTracking, long j12, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, boolean z21) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, z19, defaultTracking, j12, identifyInterceptStorageProvider, identityStorageProvider, z21, null, null, null, Integer.MIN_VALUE, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(defaultTracking, "defaultTracking");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, @NotNull DefaultTrackingOptions defaultTracking, long j12, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, boolean z21, @Nullable Boolean bool) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, z19, defaultTracking, j12, identifyInterceptStorageProvider, identityStorageProvider, z21, bool, null, null, 0, 3, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(defaultTracking, "defaultTracking");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, @NotNull DefaultTrackingOptions defaultTracking, long j12, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, boolean z21, @Nullable Boolean bool, @Nullable String str3) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, z19, defaultTracking, j12, identifyInterceptStorageProvider, identityStorageProvider, z21, bool, str3, null, 0, 2, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(defaultTracking, "defaultTracking");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    public /* synthetic */ Configuration(String str, Context context, int i5, int i11, String str2, boolean z11, StorageProvider storageProvider, LoggerProvider loggerProvider, Integer num, String str3, Function3 function3, int i12, boolean z12, ServerZone serverZone, String str4, Plan plan, IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, Set set, long j12, StorageProvider storageProvider2, IdentityStorageProvider identityStorageProvider, boolean z19, Boolean bool, String str5, Long l9, HttpClientInterface httpClientInterface, InteractionsOptions interactionsOptions, boolean z21, boolean z22, boolean z23, int i13, int i14, DefaultConstructorMarker defaultConstructorMarker) {
        String str6;
        InteractionsOptions interactionsOptions2;
        int i15 = (i13 & 4) != 0 ? 30 : i5;
        int i16 = (i13 & 8) != 0 ? com.amplitude.core.Configuration.FLUSH_INTERVAL_MILLIS : i11;
        String str7 = (i13 & 16) != 0 ? com.amplitude.core.Configuration.DEFAULT_INSTANCE : str2;
        boolean z24 = (i13 & 32) != 0 ? false : z11;
        StorageProvider eventsStorageProvider = (i13 & 64) != 0 ? AndroidStorageContextV3.INSTANCE.getEventsStorageProvider() : storageProvider;
        LoggerProvider androidLoggerProvider = (i13 & 128) != 0 ? new AndroidLoggerProvider() : loggerProvider;
        Integer num2 = (i13 & 256) != 0 ? null : num;
        String str8 = (i13 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : str3;
        Function3 function32 = (i13 & 1024) != 0 ? null : function3;
        int i17 = (i13 & 2048) != 0 ? 5 : i12;
        boolean z25 = (i13 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? false : z12;
        ServerZone serverZone2 = (i13 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? ServerZone.US : serverZone;
        String str9 = (i13 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : str4;
        Plan plan2 = (i13 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? null : plan;
        IngestionMetadata ingestionMetadata2 = (i13 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? null : ingestionMetadata;
        boolean z26 = (i13 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? false : z13;
        boolean z27 = (i13 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? false : z14;
        boolean z28 = (i13 & 524288) != 0 ? false : z15;
        TrackingOptions trackingOptions2 = (i13 & 1048576) != 0 ? new TrackingOptions() : trackingOptions;
        boolean z29 = (i13 & 2097152) != 0 ? false : z16;
        boolean z31 = (i13 & 4194304) != 0 ? false : z17;
        boolean z32 = (i13 & 8388608) != 0 ? true : z18;
        long j13 = (i13 & 16777216) != 0 ? 300000L : j11;
        Set setU = (i13 & 33554432) != 0 ? e0.U(AutocaptureOption.SESSIONS) : set;
        long j14 = (i13 & 67108864) != 0 ? 30000L : j12;
        StorageProvider identifyInterceptStorageProvider = (i13 & 134217728) != 0 ? AndroidStorageContextV3.INSTANCE.getIdentifyInterceptStorageProvider() : storageProvider2;
        IdentityStorageProvider identityStorageProvider2 = (i13 & 268435456) != 0 ? AndroidStorageContextV3.INSTANCE.getIdentityStorageProvider() : identityStorageProvider;
        boolean z33 = (i13 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? true : z19;
        Boolean bool2 = (i13 & 1073741824) != 0 ? Boolean.FALSE : bool;
        String str10 = (i13 & Integer.MIN_VALUE) != 0 ? null : str5;
        Long l11 = (i14 & 1) != 0 ? null : l9;
        HttpClientInterface httpClientInterface2 = (i14 & 2) != 0 ? null : httpClientInterface;
        if ((i14 & 4) != 0) {
            str6 = str10;
            interactionsOptions2 = new InteractionsOptions(null, null, 3, null);
        } else {
            str6 = str10;
            interactionsOptions2 = interactionsOptions;
        }
        this(str, context, i15, i16, str7, z24, eventsStorageProvider, androidLoggerProvider, num2, str8, function32, i17, z25, serverZone2, str9, plan2, ingestionMetadata2, z26, z27, z28, trackingOptions2, z29, z31, z32, j13, setU, j14, identifyInterceptStorageProvider, identityStorageProvider2, z33, bool2, str6, l11, httpClientInterface2, interactionsOptions2, (i14 & 8) != 0 ? true : z21, (i14 & 16) != 0 ? false : z22, (i14 & 32) != 0 ? true : z23);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, @NotNull Set<? extends AutocaptureOption> autocapture, long j12, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, boolean z19, @Nullable Boolean bool, @Nullable String str3, @Nullable Long l9, @Nullable HttpClientInterface httpClientInterface, @NotNull InteractionsOptions interactionsOptions, boolean z21, boolean z22, boolean z23) {
        super(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j12, identifyInterceptStorageProvider, identityStorageProvider, bool, str3, l9, httpClientInterface, z21, z22);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(autocapture, "autocapture");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
        Intrinsics.g(interactionsOptions, "interactionsOptions");
        this.context = context;
        this.flushQueueSize = i5;
        this.flushIntervalMillis = i11;
        this.instanceName = instanceName;
        this.optOut = z11;
        this.storageProvider = storageProvider;
        this.loggerProvider = loggerProvider;
        this.minIdLength = num;
        this.partnerId = str;
        this.callback = function3;
        this.flushMaxRetries = i12;
        this.useBatch = z12;
        this.serverZone = serverZone;
        this.serverUrl = str2;
        this.plan = plan;
        this.ingestionMetadata = ingestionMetadata;
        this.useAdvertisingIdForDeviceId = z13;
        this.useAppSetIdForDeviceId = z14;
        this.newDeviceIdPerInstall = z15;
        this.trackingOptions = trackingOptions;
        this.enableCoppaControl = z16;
        this.locationListening = z17;
        this.flushEventsOnClose = z18;
        this.minTimeBetweenSessionsMillis = j11;
        this.identifyBatchIntervalMillis = j12;
        this.identifyInterceptStorageProvider = identifyInterceptStorageProvider;
        this.identityStorageProvider = identityStorageProvider;
        this.migrateLegacyData = z19;
        this.offline = bool;
        this.deviceId = str3;
        this.sessionId = l9;
        this.httpClient = httpClientInterface;
        this.interactionsOptions = interactionsOptions;
        this.enableDiagnostics = z21;
        this.enableRequestBodyCompression = z22;
        this.enableAutocaptureRemoteConfig = z23;
        this._autocapture = g.M1(autocapture);
        this.defaultTracking = new DefaultTrackingOptions(new Function1<DefaultTrackingOptions, Unit>() { // from class: com.amplitude.android.Configuration$defaultTracking$1
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((DefaultTrackingOptions) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull DefaultTrackingOptions $receiver) {
                Intrinsics.g($receiver, "$this$$receiver");
                this.this$0.updateAutocaptureOnPropertyChange($receiver);
            }
        });
    }

    public /* synthetic */ Configuration(String str, Context context, int i5, int i11, String str2, boolean z11, StorageProvider storageProvider, LoggerProvider loggerProvider, Integer num, String str3, Function3 function3, int i12, boolean z12, ServerZone serverZone, String str4, Plan plan, IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, DefaultTrackingOptions defaultTrackingOptions, long j12, StorageProvider storageProvider2, IdentityStorageProvider identityStorageProvider, boolean z21, Boolean bool, String str5, Long l9, int i13, int i14, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, context, (i13 & 4) != 0 ? 30 : i5, (i13 & 8) != 0 ? com.amplitude.core.Configuration.FLUSH_INTERVAL_MILLIS : i11, (i13 & 16) != 0 ? com.amplitude.core.Configuration.DEFAULT_INSTANCE : str2, (i13 & 32) != 0 ? false : z11, (i13 & 64) != 0 ? AndroidStorageContextV3.INSTANCE.getEventsStorageProvider() : storageProvider, (i13 & 128) != 0 ? new AndroidLoggerProvider() : loggerProvider, (i13 & 256) != 0 ? null : num, (i13 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : str3, (i13 & 1024) != 0 ? null : function3, (i13 & 2048) != 0 ? 5 : i12, (i13 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? false : z12, (i13 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? ServerZone.US : serverZone, (i13 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : str4, (i13 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? null : plan, (i13 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? null : ingestionMetadata, (i13 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? false : z13, (i13 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? false : z14, (i13 & 524288) != 0 ? false : z15, (i13 & 1048576) != 0 ? new TrackingOptions() : trackingOptions, (i13 & 2097152) != 0 ? false : z16, (i13 & 4194304) == 0 ? z17 : false, (i13 & 8388608) != 0 ? true : z18, (i13 & 16777216) != 0 ? 300000L : j11, (i13 & 33554432) != 0 ? true : z19, (i13 & 67108864) != 0 ? new DefaultTrackingOptions(false, false, false, false, 15, null) : defaultTrackingOptions, (i13 & 134217728) != 0 ? 30000L : j12, (i13 & 268435456) != 0 ? AndroidStorageContextV3.INSTANCE.getIdentifyInterceptStorageProvider() : storageProvider2, (i13 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? AndroidStorageContextV3.INSTANCE.getIdentityStorageProvider() : identityStorageProvider, (i13 & 1073741824) == 0 ? z21 : true, (i13 & Integer.MIN_VALUE) != 0 ? Boolean.FALSE : bool, (i14 & 1) != 0 ? null : str5, (i14 & 2) != 0 ? null : l9);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated
    @JvmOverloads
    public Configuration(@NotNull String apiKey, @NotNull Context context, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, boolean z13, boolean z14, boolean z15, @NotNull TrackingOptions trackingOptions, boolean z16, boolean z17, boolean z18, long j11, boolean z19, @NotNull DefaultTrackingOptions defaultTracking, long j12, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, boolean z21, @Nullable Boolean bool, @Nullable String str3, @Nullable Long l9) {
        this(apiKey, context, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, z13, z14, z15, trackingOptions, z16, z17, z18, j11, defaultTracking.getAutocaptureOptions$android_release(), j12, identifyInterceptStorageProvider, identityStorageProvider, z21, bool, str3, l9, null, null, false, false, false, 0, 62, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(trackingOptions, "trackingOptions");
        Intrinsics.g(defaultTracking, "defaultTracking");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
        if (!z19) {
            defaultTracking.setSessions(false);
        }
        setDefaultTracking(defaultTracking);
    }
}
