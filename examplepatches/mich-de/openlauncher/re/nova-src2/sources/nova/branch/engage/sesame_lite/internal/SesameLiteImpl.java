package nova.branch.engage.sesame_lite.internal;

import ab.e0;
import android.app.AppOpsManager;
import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import com.amplitude.core.events.Plan;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.proactive.AiDatabase;
import com.tiktok.util.TTConst;
import e10.z2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.ktor.utils.io.g0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.Predicate;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.NotImplementedError;
import kotlin.ResultKt;
import kotlin.UByte;
import kotlin.Unit;
import kotlin.collections.ArraysKt___ArraysJvmKt$asList$6;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntProgressionIterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import m3.a0;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import nova.branch.engage.sesame_lite.internal.IdHash;
import nova.branch.engage.sesame_lite.internal.SesameLiteImpl;
import nova.branch.engage.sesame_lite.internal.data.UserHandleDataSource;
import nova.branch.engage.sesame_lite.internal.stores.IgnoreStore;
import nova.branch.engage.sesame_lite.internal.stores.LinkStore;
import nova.branch.engage.sesame_lite.internal.stores.UsageStore;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r80.z;
import t70.j0;
import t70.m0;
import t70.r1;
import t70.y0;

@Metadata(d1 = {"\u0000\u009a\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0016\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u001e\n\u0002\u0010\u0000\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\u0013\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\u0018\u0000 ¨\u00012\u00020\u0001:\b¨\u0001©\u0001ª\u0001«\u0001BY\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010\u0015\u001a\u00020\u0014¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0018H\u0017¢\u0006\u0004\b\u001b\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u001c\u0010\u001aJ\u0081\u0001\u00102\u001a\b\u0012\u0004\u0012\u0002010(2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001d2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u001f2\b\u0010#\u001a\u0004\u0018\u00010\"2\u0006\u0010%\u001a\u00020$2\u0006\u0010&\u001a\u00020$2\u0006\u0010'\u001a\u00020$2\f\u0010)\u001a\b\u0012\u0004\u0012\u00020\u001d0(2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020*0(2\f\u0010.\u001a\b\u0012\u0004\u0012\u00020-0,2\u0006\u00100\u001a\u00020/H\u0016¢\u0006\u0004\b2\u00103J]\u00107\u001a\b\u0012\u0004\u0012\u0002010(2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001d2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u001f2\b\u00104\u001a\u0004\u0018\u00010\"2\u0006\u0010'\u001a\u00020$2\u0006\u00105\u001a\u00020$2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020*0(2\u0006\u00106\u001a\u00020-H\u0016¢\u0006\u0004\b7\u00108Jm\u0010?\u001a\b\u0012\u0004\u0012\u0002010(2\u0006\u0010:\u001a\u0002092\u0006\u0010;\u001a\u00020\u001d2\b\u0010<\u001a\u0004\u0018\u00010\u001d2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u001f2\u0006\u0010=\u001a\u00020\u00122\u0006\u0010>\u001a\u00020$2\b\u0010#\u001a\u0004\u0018\u00010\"2\u0006\u0010'\u001a\u00020$2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020*0(H\u0016¢\u0006\u0004\b?\u0010@J/\u0010C\u001a\u0004\u0018\u0001012\u0006\u0010;\u001a\u00020\u001d2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020A0(2\u0006\u0010B\u001a\u00020\u0012H\u0016¢\u0006\u0004\bC\u0010DJ9\u0010G\u001a\b\u0012\u0004\u0012\u0002010(2\f\u0010F\u001a\b\u0012\u0004\u0012\u00020E0(2\u0006\u0010'\u001a\u00020$2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020*0(H\u0016¢\u0006\u0004\bG\u0010HJI\u0010G\u001a\b\u0012\u0004\u0012\u0002010(2\u0006\u0010I\u001a\u00020\u001d2\u0006\u00104\u001a\u0002092\f\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u001f2\u0006\u0010'\u001a\u00020$2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020*0(H\u0016¢\u0006\u0004\bG\u0010JJC\u0010K\u001a\b\u0012\u0004\u0012\u0002010(2\b\u0010#\u001a\u0004\u0018\u00010\"2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u001f2\u0006\u0010'\u001a\u00020$2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020*0(H\u0016¢\u0006\u0004\bK\u0010LJ\u0018\u0010N\u001a\u00020\u00182\u0006\u0010M\u001a\u000209H\u0096@¢\u0006\u0004\bN\u0010OJ*\u0010P\u001a\u00020\u00182\b\u0010<\u001a\u0004\u0018\u00010\u001d2\u000e\u0010!\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010(H\u0096@¢\u0006\u0004\bP\u0010QJ\u0010\u0010R\u001a\u00020\u0018H\u0096@¢\u0006\u0004\bR\u0010SJ(\u0010V\u001a\u00020\u00122\u0006\u0010I\u001a\u00020\u001d2\u0006\u00104\u001a\u0002092\u0006\u0010U\u001a\u00020TH\u0096@¢\u0006\u0004\bV\u0010WJ*\u0010Z\u001a\u00020\u00122\u0006\u0010X\u001a\u00020E2\b\u0010Y\u001a\u0004\u0018\u00010\u001d2\u0006\u0010U\u001a\u00020TH\u0096@¢\u0006\u0004\bZ\u0010[J\u001d\u0010_\u001a\u00020\u00182\f\u0010^\u001a\b\u0012\u0004\u0012\u00020]0\\H\u0016¢\u0006\u0004\b_\u0010`J\u0017\u0010b\u001a\u00020\u00182\u0006\u0010a\u001a\u00020/H\u0016¢\u0006\u0004\bb\u0010cJ\u000f\u0010d\u001a\u00020\u0018H\u0016¢\u0006\u0004\bd\u0010\u001aJ\u000f\u0010f\u001a\u00020eH\u0016¢\u0006\u0004\bf\u0010gJ\u0018\u0010j\u001a\u00020$2\u0006\u0010i\u001a\u00020hH\u0096@¢\u0006\u0004\bj\u0010kJ1\u0010o\u001a\u0004\u0018\u00010E2\u0006\u0010m\u001a\u00020l2\u0006\u0010n\u001a\u00020 2\u0006\u0010\u001e\u001a\u00020\u001d2\u0006\u00104\u001a\u000209H\u0016¢\u0006\u0004\bo\u0010pJ\u0017\u0010q\u001a\u00020\u00122\u0006\u0010X\u001a\u00020EH\u0016¢\u0006\u0004\bq\u0010rJ\u0010\u0010s\u001a\u00020\u0018H\u0086@¢\u0006\u0004\bs\u0010SJW\u0010x\u001a\b\u0012\u0004\u0012\u00020w0v2\u0006\u0010u\u001a\u00020t2\u0006\u00106\u001a\u00020-2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001d2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u001f2\u0006\u00105\u001a\u00020$2\b\u0010#\u001a\u0004\u0018\u00010\"2\u0006\u0010M\u001a\u000209H\u0002¢\u0006\u0004\bx\u0010yJ\u0017\u0010|\u001a\u00020\u00182\u0006\u0010{\u001a\u00020zH\u0002¢\u0006\u0004\b|\u0010}JI\u0010\u0081\u0001\u001a\b\u0012\u0004\u0012\u0002010(2\u0006\u0010'\u001a\u00020$2\f\u0010+\u001a\b\u0012\u0004\u0012\u00020*0(2\u0019\u0010\u0080\u0001\u001a\u0014\u0012\u0004\u0012\u00020t\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u007f0\\0~H\u0002¢\u0006\u0006\b\u0081\u0001\u0010\u0082\u0001JR\u0010\u0087\u0001\u001a\t\u0012\u0005\u0012\u00030\u0086\u00010(2\u0006\u0010u\u001a\u00020t2\u0007\u0010\u0083\u0001\u001a\u00020\u007f2\u0006\u00106\u001a\u00020-2\r\u0010\u0084\u0001\u001a\b\u0012\u0004\u0012\u00020*0(2\u0007\u0010\u0085\u0001\u001a\u00020$2\u0006\u0010M\u001a\u000209H\u0002¢\u0006\u0006\b\u0087\u0001\u0010\u0088\u0001JA\u0010\u008c\u0001\u001a\b\u0012\u0004\u0012\u00020w0,2\u0006\u0010:\u001a\u0002092\u0007\u0010\u0089\u0001\u001a\u00020\u001d2\r\u0010\u008a\u0001\u001a\b\u0012\u0004\u0012\u00020\u007f0,2\u0007\u0010\u008b\u0001\u001a\u00020\u0012H\u0002¢\u0006\u0006\b\u008c\u0001\u0010\u008d\u0001R\u0015\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0003\u0010\u008e\u0001R\u001a\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\u000f\n\u0005\b\u0005\u0010\u008f\u0001\u001a\u0006\b\u0090\u0001\u0010\u0091\u0001R\u0015\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0007\u0010\u0092\u0001R\u001d\u0010\t\u001a\u00020\b8\u0016X\u0096\u0004¢\u0006\u000f\n\u0005\b\t\u0010\u0093\u0001\u001a\u0006\b\u0094\u0001\u0010\u0095\u0001R\u0015\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u000b\u0010\u0096\u0001R\u0015\u0010\r\u001a\u00020\f8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\r\u0010\u0097\u0001R\u0015\u0010\u000f\u001a\u00020\u000e8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u000f\u0010\u0098\u0001R\u0015\u0010\u0011\u001a\u00020\u00108\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0011\u0010\u0099\u0001R\u0015\u0010\u0013\u001a\u00020\u00128\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0013\u0010\u009a\u0001R\u0015\u0010\u0015\u001a\u00020\u00148\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0015\u0010\u009b\u0001R\u001f\u0010\u009c\u0001\u001a\u00020\n8\u0016X\u0096\u0004¢\u0006\u0010\n\u0006\b\u009c\u0001\u0010\u0096\u0001\u001a\u0006\b\u009d\u0001\u0010\u009e\u0001R\u0018\u0010 \u0001\u001a\u00030\u009f\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b \u0001\u0010¡\u0001R\u0018\u0010£\u0001\u001a\u00030¢\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b£\u0001\u0010¤\u0001R \u0010¦\u0001\u001a\t\u0012\u0005\u0012\u00030¥\u00010,8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b¦\u0001\u0010§\u0001¨\u0006¬\u0001"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl;", "Lr80/l;", "Landroid/content/Context;", "context", "Lnova/branch/engage/sesame_lite/internal/Prefs;", "prefs", "Lnova/branch/engage/sesame_lite/internal/Pkgs;", "pkgs", "Lnova/branch/engage/sesame_lite/internal/DB;", "db", "Lnova/branch/engage/sesame_lite/internal/DataImporters;", "importers", "Lnova/branch/engage/sesame_lite/internal/AppUsageUpdater;", "appUsageUpdater", "Landroid/app/AppOpsManager;", "appOpsManager", "Landroid/content/ContentResolver;", "contentResolver", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ignoreHostPackage", "Lnova/branch/engage/sesame_lite/internal/data/UserHandleDataSource;", "userHandleDataSource", "<init>", "(Landroid/content/Context;Lnova/branch/engage/sesame_lite/internal/Prefs;Lnova/branch/engage/sesame_lite/internal/Pkgs;Lnova/branch/engage/sesame_lite/internal/DB;Lnova/branch/engage/sesame_lite/internal/DataImporters;Lnova/branch/engage/sesame_lite/internal/AppUsageUpdater;Landroid/app/AppOpsManager;Landroid/content/ContentResolver;ZLnova/branch/engage/sesame_lite/internal/data/UserHandleDataSource;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d, "()V", "resetDatabase", "rebuildDb", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "groupId", "Ljava/util/EnumSet;", "Lr80/d;", "types", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userSerials", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "maxViewedCount_clicked", "maxViewedCount_unclicked", "maxUsageTimesCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "fallbacks", "Lr80/b;", "contactActionTypes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lr80/z;", "resultSlots", "Lt70/j0;", "recordViewCountScope", "Lr80/x;", "zeroState", "(Ljava/lang/String;Ljava/util/EnumSet;[JIII[Ljava/lang/String;[Lr80/b;Ljava/util/List;Lt70/j0;)[Lr80/x;", "userSerial", "maxResultCount", "sortingModel", "suggestedLinks", "(Ljava/lang/String;Ljava/util/EnumSet;[JII[Lr80/b;Lr80/z;)[Lr80/x;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "matchingType", "query", "pkgName", "useTypoMatching", "maxShortcutCount", "search", "(JLjava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;ZI[JI[Lr80/b;)[Lr80/x;", "Lnova/branch/engage/sesame_lite/internal/SearchMoreType;", "allowWebFallback", "searchMore", "(Ljava/lang/String;[Lnova/branch/engage/sesame_lite/internal/SearchMoreType;Z)Lr80/x;", "Lnova/branch/engage/sesame_lite/internal/IdHash;", "idHashes", "get", "([Lnova/branch/engage/sesame_lite/internal/IdHash;I[Lr80/b;)[Lr80/x;", "packageName", "(Ljava/lang/String;JLjava/util/EnumSet;I[Lr80/b;)[Lr80/x;", "getAll", "([JLjava/util/EnumSet;I[Lr80/b;)[Lr80/x;", "now", "refreshUsageStats", "(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "refreshData", "(Ljava/lang/String;[Lr80/d;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "refreshContactActionIcons", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lr80/j;", "openLocation", "recordAppOpen", "(Ljava/lang/String;JLr80/j;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "idHash", "extra", "recordShortcutOpen", "(Lnova/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Lr80/j;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "data", "importBranchShortcuts", "(Ljava/util/Collection;)V", "scope", "registerAndroidListeners", "(Lt70/j0;)V", "unregisterAndroidListeners", "Lr80/g;", "getPerfStats", "()Lr80/g;", "Ls80/c;", "integration", "ingestIntegration", "(Ls80/c;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lnova/branch/engage/sesame_lite/api_integration/ExternalLink;", "link", "linkType", "insertExternalLink", "(Lnova/branch/engage/sesame_lite/api_integration/ExternalLink;Lr80/d;Ljava/lang/String;J)Lnova/branch/engage/sesame_lite/internal/IdHash;", "deleteLink", "(Lnova/branch/engage/sesame_lite/internal/IdHash;)Z", "killSwitch", "Lnova/branch/engage/sesame_lite/internal/DbView;", "dbView", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;", "getSuggestedLinkResults", "(Lnova/branch/engage/sesame_lite/internal/DbView;Lr80/z;Ljava/lang/String;Ljava/util/EnumSet;I[JJ)Ljava/util/List;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "elapsedMillis", "recordElapsedTime", "(D)V", "Lkotlin/Function1;", "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "fetchFromStoreBlock", "internalGet", "(I[Lr80/b;Lkotlin/jvm/functions/Function1;)[Lr80/x;", "contactEntity", "contactTypes", "maxTimesCount", "Lr80/y;", "createContactShortcutActions", "(Lnova/branch/engage/sesame_lite/internal/DbView;Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lr80/z;[Lr80/b;IJ)[Lr80/y;", "normalizedNeedle", "haystack", "matchTypos", "matchAllTerms", "(JLjava/lang/String;Ljava/util/List;Z)Ljava/util/List;", "Landroid/content/Context;", "Lnova/branch/engage/sesame_lite/internal/Prefs;", "getPrefs", "()Lnova/branch/engage/sesame_lite/internal/Prefs;", "Lnova/branch/engage/sesame_lite/internal/Pkgs;", "Lnova/branch/engage/sesame_lite/internal/DB;", "getDb", "()Lnova/branch/engage/sesame_lite/internal/DB;", "Lnova/branch/engage/sesame_lite/internal/DataImporters;", "Lnova/branch/engage/sesame_lite/internal/AppUsageUpdater;", "Landroid/app/AppOpsManager;", "Landroid/content/ContentResolver;", "Z", "Lnova/branch/engage/sesame_lite/internal/data/UserHandleDataSource;", "ingester", "getIngester", "()Lnova/branch/engage/sesame_lite/internal/DataImporters;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "timingsBuff", "[D", "Ljava/util/concurrent/atomic/AtomicLong;", "timingsIdx", "Ljava/util/concurrent/atomic/AtomicLong;", "Lt70/r1;", "listenerJobs", "Ljava/util/List;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "JoinedResult", "SearchMoreJoinedResult", "MatchedResultComparator", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class SesameLiteImpl implements r80.l {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    public static final String TAG = "SSML-FrontEnd";

    @NotNull
    private final AppOpsManager appOpsManager;

    @NotNull
    private final AppUsageUpdater appUsageUpdater;

    @NotNull
    private final ContentResolver contentResolver;

    @NotNull
    private final Context context;

    @NotNull
    private final DB db;
    private final boolean ignoreHostPackage;

    @NotNull
    private final DataImporters importers;

    @NotNull
    private final DataImporters ingester;

    @NotNull
    private List<? extends r1> listenerJobs;

    @NotNull
    private final Pkgs pkgs;

    @NotNull
    private final Prefs prefs;

    @NotNull
    private final double[] timingsBuff;

    @NotNull
    private final AtomicLong timingsIdx;

    @NotNull
    private final UserHandleDataSource userHandleDataSource;

    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J=\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0005\u001a\u00020\u00042\u0010\b\u0002\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ+\u0010\u0012\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u00042\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0002¢\u0006\u0004\b\u0012\u0010\u0013J1\u0010\u0014\u001a\u00020\r2\u0006\u0010\u0005\u001a\u00020\u00042\u0010\b\u0002\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\tH\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u001f\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0016\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\tH\u0002¢\u0006\u0004\b\u0017\u0010\u0018R\u0014\u0010\u001a\u001a\u00020\u00198\u0000X\u0080T¢\u0006\u0006\n\u0004\b\u001a\u0010\u001b¨\u0006\u001c"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;", "joined", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lr80/y;", "actions", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "maxOpenTimeCount", "Lr80/z;", Plan.AMP_PLAN_SOURCE, "Lr80/x;", "makeShortcut", "(Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;[Lr80/y;ILr80/z;)Lr80/x;", "action", "parentJoin", "makeActionResult", "(Lr80/y;Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;Lr80/z;)Lr80/x;", "makeSearchShortcut", "(Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;[Lr80/y;I)Lr80/x;", "result", "makeShortcutAction", "(Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;I)Lr80/y;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "TAG", "Ljava/lang/String;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        /* loaded from: classes5.dex */
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[r80.d.values().length];
                try {
                    r80.c cVar = r80.d.Companion;
                    iArr[1] = 1;
                } catch (NoSuchFieldError unused) {
                }
                try {
                    r80.c cVar2 = r80.d.Companion;
                    iArr[0] = 2;
                } catch (NoSuchFieldError unused2) {
                }
                try {
                    r80.c cVar3 = r80.d.Companion;
                    iArr[7] = 3;
                } catch (NoSuchFieldError unused3) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final r80.x makeActionResult(r80.y action, JoinedResult parentJoin, z source) {
            String displayLabel;
            String displayLabel2;
            LinkEntity entity = parentJoin.getEntity();
            SearchableLabel alias = parentJoin.getAlias();
            String groupId = entity.getGroupId();
            r80.d type = entity.getType();
            if (alias == null || (displayLabel = alias.getDisplayLabel()) == null) {
                displayLabel = entity.getDisplayLabel();
            }
            String str = displayLabel;
            if (alias == null || (displayLabel2 = alias.getDisplayLabel()) == null) {
                displayLabel2 = entity.getDisplayLabel();
            }
            return new r80.x(groupId, type, str, displayLabel2, 0.0d, new int[0], new int[0], false, parentJoin.getSearchTimesScore(), parentJoin.getUsageTimesScore(), action, new r80.y[0], source);
        }

        public static /* synthetic */ r80.x makeActionResult$default(Companion companion, r80.y yVar, JoinedResult joinedResult, z zVar, int i5, Object obj) {
            if ((i5 & 4) != 0) {
                zVar = null;
            }
            return companion.makeActionResult(yVar, joinedResult, zVar);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final r80.x makeSearchShortcut(JoinedResult joined, r80.y[] actions, int maxOpenTimeCount) {
            LinkEntity entity = joined.getEntity();
            SearchableLabel alias = joined.getAlias();
            Intrinsics.d(alias);
            String displayLabel = alias.getDisplayLabel();
            if (alias.canHighlight()) {
                StringBuilder sb2 = new StringBuilder();
                String displayLabel2 = alias.getDisplayLabel();
                int i5 = 0;
                for (int i11 : joined.getMatches()) {
                    if (i11 >= 0) {
                        sb2.append((CharSequence) displayLabel2, i5, i11);
                        sb2.append("<b>");
                        i5 = i11 + 1;
                        sb2.append((CharSequence) displayLabel2, i11, i5);
                        sb2.append("</b>");
                    }
                }
                sb2.append((CharSequence) displayLabel2, i5, displayLabel2.length());
                displayLabel = r70.j.F0(sb2.toString(), "</b><b>", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false);
            }
            String str = displayLabel;
            String groupId = entity.getGroupId();
            r80.d type = entity.getType();
            String displayLabel3 = alias.getDisplayLabel();
            double matchScore = joined.getMatchScore();
            int[] matches = joined.getMatches();
            int[] typos = joined.getTypos();
            Pattern pattern = r80.k.f85688a;
            return new r80.x(groupId, type, displayLabel3, str, matchScore, matches, typos, r80.k.f(joined.getMatches()), joined.getSearchTimesScore(), joined.getUsageTimesScore(), makeShortcutAction(joined, maxOpenTimeCount), actions == null ? new r80.y[0] : actions, null);
        }

        public static /* synthetic */ r80.x makeSearchShortcut$default(Companion companion, JoinedResult joinedResult, r80.y[] yVarArr, int i5, int i11, Object obj) {
            if ((i11 & 2) != 0) {
                yVarArr = null;
            }
            return companion.makeSearchShortcut(joinedResult, yVarArr, i5);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final r80.x makeShortcut(JoinedResult joined, r80.y[] actions, int maxOpenTimeCount, z source) {
            String displayLabel;
            String displayLabel2;
            LinkEntity entity = joined.getEntity();
            SearchableLabel alias = joined.getAlias();
            String groupId = entity.getGroupId();
            r80.d type = entity.getType();
            if (alias == null || (displayLabel = alias.getDisplayLabel()) == null) {
                displayLabel = entity.getDisplayLabel();
            }
            String str = displayLabel;
            if (alias == null || (displayLabel2 = alias.getDisplayLabel()) == null) {
                displayLabel2 = entity.getDisplayLabel();
            }
            return new r80.x(groupId, type, str, displayLabel2, 0.0d, new int[0], new int[0], false, joined.getSearchTimesScore(), joined.getUsageTimesScore(), makeShortcutAction(joined, maxOpenTimeCount), actions == null ? new r80.y[0] : actions, source);
        }

        public static /* synthetic */ r80.x makeShortcut$default(Companion companion, JoinedResult joinedResult, r80.y[] yVarArr, int i5, z zVar, int i11, Object obj) {
            if ((i11 & 2) != 0) {
                yVarArr = null;
            }
            if ((i11 & 8) != 0) {
                zVar = null;
            }
            return companion.makeShortcut(joinedResult, yVarArr, i5, zVar);
        }

        private final r80.y makeShortcutAction(JoinedResult result, int maxOpenTimeCount) {
            long[] clickTimes;
            long[] usageTimes;
            r80.w uVar;
            r80.w tVar;
            LinkEntity entity = result.getEntity();
            IdHash idHash = entity.getIdHash();
            String packageName = entity.getPackageName();
            long userSerial = entity.getUserSerial();
            r80.d type = entity.getType();
            String displayLabel = entity.getDisplayLabel();
            String iconUri = entity.getIconUri();
            Uri uri = iconUri != null ? Utils.INSTANCE.toUri(iconUri) : null;
            LinkUsage usage = result.getUsage();
            if (usage == null || (clickTimes = usage.getClickTimes()) == null) {
                clickTimes = new long[0];
            }
            long[] jArrJ1 = b70.g.J1(kotlin.collections.c.Y0(clickTimes, maxOpenTimeCount));
            LinkUsage usage2 = result.getUsage();
            if (usage2 == null || (usageTimes = usage2.getUsageTimes()) == null) {
                usageTimes = new long[0];
            }
            long[] jArrJ12 = b70.g.J1(kotlin.collections.c.Y0(usageTimes, maxOpenTimeCount));
            int i5 = WhenMappings.$EnumSwitchMapping$0[entity.getType().ordinal()];
            if (i5 == 1) {
                IdHash idHash2 = entity.getIdHash();
                String packageName2 = entity.getPackageName();
                Intrinsics.d(packageName2);
                uVar = new r80.u(packageName2, entity.getTypeSpecificKey(), entity.getUserSerial(), DeveloperShortcutTypeFlags.m439isDynamicimpl(DeveloperShortcutTypeFlags.m435constructorimpl(entity.m455getTypeSpecificFlagssVKNKU())), idHash2);
            } else if (i5 != 2) {
                if (i5 != 3) {
                    tVar = new r80.v(entity.getIntentUri(), entity.getGroupId(), entity.getIdHash());
                } else {
                    String typeSpecificKey = entity.getTypeSpecificKey();
                    String groupId = entity.getGroupId();
                    entity.getUserSerial();
                    tVar = new r80.t(typeSpecificKey, groupId, entity.getIdHash());
                }
                uVar = tVar;
            } else {
                String packageName3 = entity.getPackageName();
                Intrinsics.d(packageName3);
                uVar = new r80.q(packageName3, entity.getTypeSpecificKey(), entity.getUserSerial(), entity.getIdHash());
            }
            return new r80.y(idHash, packageName, userSerial, type, displayLabel, uri, jArrJ1, jArrJ12, uVar);
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0015\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0002\u0018\u0000 )2\u0012\u0012\u0004\u0012\u00020\u00020\u0001j\b\u0012\u0004\u0012\u00020\u0002`\u0003:\u0001)B\u0011\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0006\u0010\u000f\u001a\u00020\u0010J\u0018\u0010\u0011\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u00022\u0006\u0010\u0013\u001a\u00020\u0002H\u0016J\u0018\u0010\u0014\u001a\u00020\t2\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0016H\u0002J\u0018\u0010\u0018\u001a\u00020\t2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001aH\u0002J<\u0010\u001c\u001a\u00020\t2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010!\u001a\u00020\u001e2\b\u0010\"\u001a\u0004\u0018\u00010#2\b\u0010$\u001a\u0004\u0018\u00010#H\u0002J\u001c\u0010%\u001a\u00020\t2\b\u0010\"\u001a\u0004\u0018\u00010#2\b\u0010$\u001a\u0004\u0018\u00010#H\u0002J\u0010\u0010&\u001a\u00020\t2\u0006\u0010'\u001a\u00020(H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R$\u0010\n\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\t@BX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000e¨\u0006*"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$MatchedResultComparator;", "Ljava/util/Comparator;", "Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;", "Lkotlin/Comparator;", "isAppSearch", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Z)V", "value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "maxDepth", "getMaxDepth", "()I", "setMaxDepth", "(I)V", "resetMaxDepth", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "compare", "lhs", "rhs", "compareAlpha", "lhsAlias", "Lnova/branch/engage/sesame_lite/internal/SearchableLabel;", "rhsAlias", "compareMatchIndex", "lhsMatches", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "rhsMatches", "compareUsage", "lhsSearchScore", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "rhsSearchScore", "lhsUsageScore", "rhsUsageScore", "lhsUsage", "Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "rhsUsage", "compareUsageBuckets", "getTypeRank", "ent", "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class MatchedResultComparator implements Comparator<JoinedResult> {
        public static final int ENTITY_TYPE = 6;
        public static final int LABEL_ALPHA = 8;
        public static final int MATCH_IDX_V1 = 3;
        public static final int MATCH_IDX_V2 = 7;
        public static final int OWN_USAGE = 4;
        public static final int PARENT_USAGE = 5;
        public static final int QUERY_MATCH = 2;
        public static final int USAGE_BUCKET = 1;
        private final boolean isAppSearch;
        private int maxDepth;

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[r80.d.values().length];
                try {
                    r80.c cVar = r80.d.Companion;
                    iArr[1] = 1;
                } catch (NoSuchFieldError unused) {
                }
                try {
                    r80.c cVar2 = r80.d.Companion;
                    iArr[3] = 2;
                } catch (NoSuchFieldError unused2) {
                }
                try {
                    r80.c cVar3 = r80.d.Companion;
                    iArr[5] = 3;
                } catch (NoSuchFieldError unused3) {
                }
                try {
                    r80.c cVar4 = r80.d.Companion;
                    iArr[4] = 4;
                } catch (NoSuchFieldError unused4) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        public MatchedResultComparator() {
            this(false, 1, null);
        }

        private final int compareAlpha(SearchableLabel lhsAlias, SearchableLabel rhsAlias) {
            return lhsAlias.getDisplayLabel().compareTo(rhsAlias.getDisplayLabel());
        }

        private final int compareMatchIndex(int[] lhsMatches, int[] rhsMatches) {
            Integer numY0 = kotlin.collections.c.y0(lhsMatches);
            int iIntValue = numY0 != null ? numY0.intValue() : -1;
            Integer numY02 = kotlin.collections.c.y0(rhsMatches);
            return Intrinsics.h(iIntValue, numY02 != null ? numY02.intValue() : -1);
        }

        private final int compareUsage(double lhsSearchScore, double rhsSearchScore, double lhsUsageScore, double rhsUsageScore, LinkUsage lhsUsage, LinkUsage rhsUsage) {
            int iCompare;
            if (lhsSearchScore != rhsSearchScore) {
                iCompare = Double.compare(lhsSearchScore, rhsSearchScore);
            } else if (lhsUsageScore != rhsUsageScore) {
                iCompare = Double.compare(lhsUsageScore, rhsUsageScore);
            } else {
                if (lhsUsage != null && rhsUsage == null) {
                    return -1;
                }
                if (lhsUsage == null && rhsUsage != null) {
                    return 1;
                }
                if (lhsUsage == null || rhsUsage == null) {
                    return 0;
                }
                if (lhsUsage.getMaxClickTime() != rhsUsage.getMaxClickTime()) {
                    iCompare = Intrinsics.i(lhsUsage.getMaxClickTime(), rhsUsage.getMaxClickTime());
                } else {
                    if (lhsUsage.getMaxUsageTime() == rhsUsage.getMaxUsageTime()) {
                        return 0;
                    }
                    iCompare = Intrinsics.i(lhsUsage.getMaxUsageTime(), rhsUsage.getMaxUsageTime());
                }
            }
            return iCompare * (-1);
        }

        private final int compareUsageBuckets(LinkUsage lhsUsage, LinkUsage rhsUsage) {
            int i5 = 0;
            int i11 = (lhsUsage == null || (lhsUsage.getUsageTimes().length == 0 && lhsUsage.getClickTimes().length == 0)) ? 0 : lhsUsage.getClickTimes().length == 0 ? 1 : 2;
            if (rhsUsage != null && (rhsUsage.getUsageTimes().length != 0 || rhsUsage.getClickTimes().length != 0)) {
                i5 = rhsUsage.getClickTimes().length == 0 ? 1 : 2;
            }
            return Intrinsics.h(i11, i5) * (-1);
        }

        private final int getTypeRank(LinkEntity ent) {
            int i5 = WhenMappings.$EnumSwitchMapping$0[ent.getType().ordinal()];
            if (i5 == 1) {
                return DeveloperShortcutTypeFlags.m439isDynamicimpl(DeveloperShortcutTypeFlags.m435constructorimpl(ent.m455getTypeSpecificFlagssVKNKU())) ? 1 : 3;
            }
            if (i5 == 2) {
                return 2;
            }
            if (i5 != 3) {
                return i5 != 4 ? 6 : 5;
            }
            return 4;
        }

        private final void setMaxDepth(int i5) {
            int i11 = this.maxDepth;
            if (i5 <= i11) {
                i5 = i11;
            }
            this.maxDepth = i5;
        }

        public final int getMaxDepth() {
            return this.maxDepth;
        }

        public final void resetMaxDepth() {
            setMaxDepth(0);
        }

        public MatchedResultComparator(boolean z11) {
            this.isAppSearch = z11;
        }

        @Override // java.util.Comparator
        public int compare(@NotNull JoinedResult lhs, @NotNull JoinedResult rhs) {
            int iCompareUsageBuckets;
            Intrinsics.g(lhs, "lhs");
            Intrinsics.g(rhs, "rhs");
            setMaxDepth(1);
            LinkUsage usage = lhs.getUsage();
            LinkUsage usage2 = rhs.getUsage();
            if (!this.isAppSearch && (iCompareUsageBuckets = compareUsageBuckets(usage, usage2)) != 0) {
                return iCompareUsageBuckets;
            }
            setMaxDepth(2);
            if (lhs.isExactMatch() != rhs.isExactMatch()) {
                return Boolean.compare(lhs.isExactMatch(), rhs.isExactMatch()) * (-1);
            }
            if (lhs.isSubstringMatch() != rhs.isSubstringMatch()) {
                return Boolean.compare(lhs.isSubstringMatch(), rhs.isSubstringMatch()) * (-1);
            }
            if (lhs.getMatchScore() != rhs.getMatchScore()) {
                return Double.compare(lhs.getMatchScore(), rhs.getMatchScore()) * (-1);
            }
            if (this.isAppSearch) {
                setMaxDepth(3);
                int iCompareMatchIndex = compareMatchIndex(lhs.getMatches(), rhs.getMatches());
                if (iCompareMatchIndex != 0) {
                    return iCompareMatchIndex;
                }
            }
            setMaxDepth(4);
            int iCompareUsage = compareUsage(lhs.getSearchTimesScore(), rhs.getSearchTimesScore(), lhs.getUsageTimesScore(), rhs.getUsageTimesScore(), lhs.getUsage(), rhs.getUsage());
            if (iCompareUsage != 0) {
                return iCompareUsage;
            }
            setMaxDepth(5);
            int iCompareUsage2 = compareUsage(lhs.getParentSearchTimesScore(), rhs.getParentSearchTimesScore(), lhs.getParentUsageTimesScore(), rhs.getParentUsageTimesScore(), lhs.getParentUsage(), rhs.getParentUsage());
            if (iCompareUsage2 != 0) {
                return iCompareUsage2;
            }
            setMaxDepth(6);
            LinkEntity entity = lhs.getEntity();
            LinkEntity entity2 = rhs.getEntity();
            int typeRank = getTypeRank(entity);
            int typeRank2 = getTypeRank(entity2);
            if (typeRank2 != typeRank) {
                return Intrinsics.h(typeRank, typeRank2);
            }
            r80.d type = entity.getType();
            r80.d dVar = r80.d.f85660g;
            int iM427getBaseScoreimpl = type == dVar ? ContactTypeFlags.m427getBaseScoreimpl(ContactTypeFlags.m424constructorimpl(entity.m455getTypeSpecificFlagssVKNKU())) : 0;
            int iM427getBaseScoreimpl2 = entity2.getType() == dVar ? ContactTypeFlags.m427getBaseScoreimpl(ContactTypeFlags.m424constructorimpl(entity2.m455getTypeSpecificFlagssVKNKU())) : 0;
            if (iM427getBaseScoreimpl != iM427getBaseScoreimpl2) {
                return Intrinsics.h(iM427getBaseScoreimpl, iM427getBaseScoreimpl2) * (-1);
            }
            if (!this.isAppSearch) {
                setMaxDepth(7);
                int iCompareMatchIndex2 = compareMatchIndex(lhs.getMatches(), rhs.getMatches());
                if (iCompareMatchIndex2 != 0) {
                    return iCompareMatchIndex2;
                }
            }
            setMaxDepth(8);
            SearchableLabel alias = lhs.getAlias();
            Intrinsics.d(alias);
            SearchableLabel alias2 = rhs.getAlias();
            Intrinsics.d(alias2);
            return compareAlpha(alias, alias2);
        }

        public /* synthetic */ MatchedResultComparator(boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? false : z11);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;
        public static final /* synthetic */ int[] $EnumSwitchMapping$2;

        static {
            int[] iArr = new int[z.values().length];
            try {
                z zVar = z.f85741a;
                iArr[1] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                z zVar2 = z.f85741a;
                iArr[2] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                z zVar3 = z.f85741a;
                iArr[0] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[r80.j.values().length];
            try {
                r80.j jVar = r80.j.f85683a;
                iArr2[0] = 1;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                r80.j jVar2 = r80.j.f85683a;
                iArr2[1] = 2;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                r80.j jVar3 = r80.j.f85683a;
                iArr2[2] = 3;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                r80.j jVar4 = r80.j.f85683a;
                iArr2[3] = 4;
            } catch (NoSuchFieldError unused7) {
            }
            $EnumSwitchMapping$1 = iArr2;
            int[] iArr3 = new int[s80.e.values().length];
            try {
                s80.e eVar = s80.e.f86765a;
                iArr3[1] = 1;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                s80.e eVar2 = s80.e.f86765a;
                iArr3[0] = 2;
            } catch (NoSuchFieldError unused9) {
            }
            $EnumSwitchMapping$2 = iArr3;
        }
    }

    @Metadata(d1 = {"\u0000\u0019\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0007*\u0001\u0000\b\n\u0018\u00002\u00020\u0001B\u0019\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"nova/branch/engage/sesame_lite/internal/SesameLiteImpl$createContactShortcutActions$UsagesJoin", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "usage", "Lnova/branch/engage/sesame_lite/internal/LinkUsage;", AiDatabase.COL_INSIGHT_SCORE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Lnova/branch/engage/sesame_lite/internal/LinkUsage;D)V", "getUsage", "()Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "getScore", "()D", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class UsagesJoin {
        private final double score;
        private final LinkUsage usage;

        public UsagesJoin(LinkUsage linkUsage, double d5) {
            this.usage = linkUsage;
            this.score = d5;
        }

        public final double getScore() {
            return this.score;
        }

        public final LinkUsage getUsage() {
            return this.usage;
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.SesameLiteImpl", f = "SesameLiteImpl.kt", l = {1771, 1782}, m = "ingestIntegration")
    /* renamed from: nova.branch.engage.sesame_lite.internal.SesameLiteImpl$ingestIntegration$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        long J$0;
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
            return SesameLiteImpl.this.ingestIntegration(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.SesameLiteImpl", f = "SesameLiteImpl.kt", l = {1152}, m = "recordAppOpen")
    /* renamed from: nova.branch.engage.sesame_lite.internal.SesameLiteImpl$recordAppOpen$1, reason: invalid class name and case insensitive filesystem */
    /* loaded from: classes5.dex */
    public static final class C35191 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C35191(Continuation<? super C35191> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return SesameLiteImpl.this.recordAppOpen(null, 0L, null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.SesameLiteImpl$zeroState$2", f = "SesameLiteImpl.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: nova.branch.engage.sesame_lite.internal.SesameLiteImpl$zeroState$2, reason: invalid class name */
    /* loaded from: classes5.dex */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ Set<IdHash> $viewedIdHashes;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass2(Set<IdHash> set, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$viewedIdHashes = set;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final WriteBack invokeSuspend$lambda$1(Set set, DbView dbView) {
            LinkUsage linkUsage;
            Iterator it = set.iterator();
            while (it.hasNext()) {
                IdHash idHash = (IdHash) it.next();
                LinkUsage linkUsage2 = dbView.getUsageStore().get((UsageStore) idHash);
                if (linkUsage2 == null) {
                    linkUsage = new LinkUsage(idHash, 0L, (long[]) null, (long[]) null, (long[]) null, (long[]) null, (long[]) null, (long[]) null, 252, (DefaultConstructorMarker) null);
                } else {
                    linkUsage = linkUsage2;
                }
                dbView.getUsageStore().put((UsageStore) LinkUsage.withTrimmedTimes$default(linkUsage, 0L, null, null, null, null, null, Long.valueOf(linkUsage.getViewedCount() + 1), null, 191, null));
            }
            return new WriteBack(dbView.getUsageStore());
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return SesameLiteImpl.this.new AnonymousClass2(this.$viewedIdHashes, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            State state = State.INSTANCE;
            r80.p log = state.getLog();
            Set<IdHash> set = this.$viewedIdHashes;
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 3) {
                log.getWriter().debug("SSML-FrontEnd", "Adding view counts to " + set.size() + " LinkUsages");
            }
            SesameLiteImpl.this.getDb().writeTx(new y(this.$viewedIdHashes, 0));
            r80.p log2 = state.getLog();
            Set<IdHash> set2 = this.$viewedIdHashes;
            if (log2.getLevel().ordinal() >= 3) {
                log2.getWriter().debug("SSML-FrontEnd", "Added view counts to " + set2.size() + " LinkUsages");
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public SesameLiteImpl(@NotNull Context context, @NotNull Prefs prefs, @NotNull Pkgs pkgs, @NotNull DB db2, @NotNull DataImporters importers, @NotNull AppUsageUpdater appUsageUpdater, @NotNull AppOpsManager appOpsManager, @NotNull ContentResolver contentResolver, boolean z11, @NotNull UserHandleDataSource userHandleDataSource) {
        Intrinsics.g(context, "context");
        Intrinsics.g(prefs, "prefs");
        Intrinsics.g(pkgs, "pkgs");
        Intrinsics.g(db2, "db");
        Intrinsics.g(importers, "importers");
        Intrinsics.g(appUsageUpdater, "appUsageUpdater");
        Intrinsics.g(appOpsManager, "appOpsManager");
        Intrinsics.g(contentResolver, "contentResolver");
        Intrinsics.g(userHandleDataSource, "userHandleDataSource");
        this.context = context;
        this.prefs = prefs;
        this.pkgs = pkgs;
        this.db = db2;
        this.importers = importers;
        this.appUsageUpdater = appUsageUpdater;
        this.appOpsManager = appOpsManager;
        this.contentResolver = contentResolver;
        this.ignoreHostPackage = z11;
        this.userHandleDataSource = userHandleDataSource;
        this.ingester = importers;
        if (!getDb().getHasLoadedFromDisk()) {
            throw new IllegalStateException("SesameLiteImpl must be created with an already loaded Database. Use SesameLite.newInstance()");
        }
        double[] dArr = new double[50];
        for (int i5 = 0; i5 < 50; i5++) {
            dArr[i5] = -1.0d;
        }
        this.timingsBuff = dArr;
        this.timingsIdx = new AtomicLong(0L);
        this.listenerJobs = EmptyList.f71733a;
    }

    private final r80.y[] createContactShortcutActions(DbView dbView, LinkEntity contactEntity, z sortingModel, r80.b[] contactTypes, int maxTimesCount, long now) {
        double dB;
        double dB2;
        double maxEngagementTime;
        UsagesJoin usagesJoin;
        long jM424constructorimpl = ContactTypeFlags.m424constructorimpl(contactEntity.m455getTypeSpecificFlagssVKNKU());
        ArrayList arrayList = new ArrayList();
        for (r80.b bVar : contactTypes) {
            if (ContactTypeFlags.m428hasActionimpl(jM424constructorimpl, bVar)) {
                arrayList.add(bVar);
            }
        }
        int iD0 = b70.k.d0(b70.c.u0(arrayList, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        int size = arrayList.size();
        int i5 = 0;
        while (i5 < size) {
            Object obj = arrayList.get(i5);
            i5++;
            IdHash idHash = contactEntity.getIdHash();
            byte bOrdinal = (byte) ((r80.b) obj).ordinal();
            UByte.Companion companion = UByte.f71693b;
            linkedHashMap.put(obj, idHash.m444copyWithSubtype7apg3OU(bOrdinal));
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(b70.k.d0(linkedHashMap.size()));
        Iterator it = linkedHashMap.entrySet().iterator();
        while (true) {
            int i11 = 2;
            int i12 = 1;
            if (!it.hasNext()) {
                List<r80.b> listD1 = b70.g.D1(new q(new p(linkedHashMap2, i12), i11), arrayList);
                ArrayList arrayList2 = new ArrayList();
                for (r80.b bVar2 : listD1) {
                    UsagesJoin usagesJoin2 = (UsagesJoin) linkedHashMap2.get(bVar2);
                    r80.y yVarMakeShortcutAction = ContactActionsHelper.INSTANCE.makeShortcutAction(this.context, this.prefs, this.pkgs, contactEntity, bVar2, usagesJoin2 != null ? usagesJoin2.getUsage() : null, maxTimesCount);
                    if (yVarMakeShortcutAction != null) {
                        arrayList2.add(yVarMakeShortcutAction);
                    }
                }
                return (r80.y[]) arrayList2.toArray(new r80.y[0]);
            }
            Map.Entry entry = (Map.Entry) it.next();
            Object key = entry.getKey();
            LinkUsage linkUsage = dbView.getUsageStore().get((UsageStore) entry.getValue());
            if (linkUsage == null) {
                usagesJoin = new UsagesJoin(null, 0.0d);
            } else {
                int i13 = WhenMappings.$EnumSwitchMapping$0[sortingModel.ordinal()];
                if (i13 == 1) {
                    Pattern pattern = r80.k.f85688a;
                    dB = r80.k.b(linkUsage.getUsageTimes(), now);
                    dB2 = r80.k.b(linkUsage.getClickTimes(), now);
                } else if (i13 == 2) {
                    Pattern pattern2 = r80.k.f85688a;
                    dB = r80.k.a(linkUsage.getUsageTimes(), now);
                    dB2 = r80.k.a(linkUsage.getClickTimes(), now);
                } else {
                    if (i13 != 3) {
                        throw new NoWhenBranchMatchedException();
                    }
                    maxEngagementTime = linkUsage.getMaxEngagementTime();
                    usagesJoin = new UsagesJoin(linkUsage, maxEngagementTime);
                }
                maxEngagementTime = dB + dB2;
                usagesJoin = new UsagesJoin(linkUsage, maxEngagementTime);
            }
            linkedHashMap2.put(key, usagesJoin);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int createContactShortcutActions$lambda$76(Map map, r80.b bVar, r80.b bVar2) {
        UsagesJoin usagesJoin = (UsagesJoin) map.get(bVar);
        UsagesJoin usagesJoin2 = (UsagesJoin) map.get(bVar2);
        if (usagesJoin != null && usagesJoin2 != null) {
            return Double.compare(usagesJoin.getScore(), usagesJoin2.getScore()) * (-1);
        }
        if (usagesJoin == null && usagesJoin2 != null) {
            return 1;
        }
        if (usagesJoin != null && usagesJoin2 == null) {
            return -1;
        }
        r80.b.Companion.getClass();
        List list = r80.b.f85648a;
        return Intrinsics.h(list.indexOf(bVar), list.indexOf(bVar2));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int createContactShortcutActions$lambda$77(Function2 function2, Object obj, Object obj2) {
        return ((Number) function2.invoke(obj, obj2)).intValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final WriteBack deleteLink$lambda$100(IdHash idHash, Ref.BooleanRef booleanRef, DbView writeView) {
        Intrinsics.g(writeView, "writeView");
        LinkEntity linkEntity = writeView.getLinkStore().get((LinkStore) idHash);
        if (linkEntity == null) {
            return WriteBack.INSTANCE.getNO_OP();
        }
        writeView.getLinkStore().remove((LinkStore) linkEntity);
        booleanRef.f71859a = true;
        return new WriteBack(writeView.getLinkStore());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Collection get$lambda$61(IdHash[] idHashArr, DbView it) {
        Intrinsics.g(it, "it");
        return it.getLinkStore().get((Collection) u90.b.f(idHashArr));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Collection get$lambda$63(String str, long j11, EnumSet enumSet, DbView it) {
        Intrinsics.g(it, "it");
        return it.getLinkStore().get(str, j11, enumSet);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Collection getAll$lambda$65(long[] jArr, EnumSet enumSet, DbView it) {
        Intrinsics.g(it, "it");
        return LinkStore.get$default(it.getLinkStore(), jArr, enumSet, (Set) null, (Set) null, 12, (Object) null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final r80.g getPerfStats$lambda$94(SesameLiteImpl sesameLiteImpl, DbView readView) {
        long jCount;
        long jCount2;
        long j11;
        long length;
        Intrinsics.g(readView, "readView");
        long j12 = -1;
        try {
            jCount = readView.getLinkStore().count();
        } catch (Throwable th2) {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 2) {
                log.getWriter().warn("SSML-FrontEnd", String.valueOf(th2.getMessage()));
            }
            jCount = -1;
        }
        try {
            jCount2 = readView.getUsageStore().count();
        } catch (Throwable th3) {
            r80.p log2 = State.INSTANCE.getLog();
            int iOrdinal2 = log2.getLevel().ordinal();
            r80.o oVar2 = r80.o.f85697a;
            if (iOrdinal2 >= 2) {
                log2.getWriter().warn("SSML-FrontEnd", String.valueOf(th3.getMessage()));
            }
            jCount2 = -1;
        }
        try {
            Iterator it = LinkStore.get$default(readView.getLinkStore(), (long[]) null, (EnumSet) null, (Set) null, (Set) null, 15, (Object) null).iterator();
            int size = 0;
            while (it.hasNext()) {
                size += ((LinkEntity) it.next()).getAliases().size();
            }
            j11 = size;
        } catch (Throwable th4) {
            r80.p log3 = State.INSTANCE.getLog();
            int iOrdinal3 = log3.getLevel().ordinal();
            r80.o oVar3 = r80.o.f85697a;
            if (iOrdinal3 >= 2) {
                log3.getWriter().warn("SSML-FrontEnd", String.valueOf(th4.getMessage()));
            }
            j11 = -1;
        }
        try {
            length = SearchMoreType.values().length;
        } catch (Throwable th5) {
            r80.p log4 = State.INSTANCE.getLog();
            int iOrdinal4 = log4.getLevel().ordinal();
            r80.o oVar4 = r80.o.f85697a;
            if (iOrdinal4 >= 2) {
                log4.getWriter().warn("SSML-FrontEnd", String.valueOf(th5.getMessage()));
            }
            length = -1;
        }
        long sizeOnDisk = sesameLiteImpl.getDb().getSizeOnDisk();
        try {
            j12 = sesameLiteImpl.prefs.getLong("app_usage_state_last_updated", -1L);
        } catch (Throwable th6) {
            r80.p log5 = State.INSTANCE.getLog();
            int iOrdinal5 = log5.getLevel().ordinal();
            r80.o oVar5 = r80.o.f85697a;
            if (iOrdinal5 >= 2) {
                log5.getWriter().warn("SSML-FrontEnd", String.valueOf(th6.getMessage()));
            }
        }
        long j13 = j12;
        double[] dArr = sesameLiteImpl.timingsBuff;
        Intrinsics.g(dArr, "<this>");
        ArraysKt___ArraysJvmKt$asList$6 arraysKt___ArraysJvmKt$asList$6 = new ArraysKt___ArraysJvmKt$asList$6(dArr);
        ArrayList arrayList = new ArrayList();
        b70.a aVar = new b70.a(arraysKt___ArraysJvmKt$asList$6);
        while (aVar.hasNext()) {
            double dDoubleValue = ((Number) aVar.next()).doubleValue();
            Double dValueOf = dDoubleValue > 0.0d ? Double.valueOf(dDoubleValue) : null;
            if (dValueOf != null) {
                arrayList.add(dValueOf);
            }
        }
        return new r80.g(jCount, jCount2, j11, length, sizeOnDisk, j13, arrayList);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00fb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final List<JoinedResult> getSuggestedLinkResults(DbView dbView, z sortingModel, String groupId, EnumSet<r80.d> types, int maxResultCount, long[] userSerials, long now) {
        JoinedResult joinedResult;
        long[] clickTimes;
        double dB;
        List list = LinkStore.get$default(dbView.getLinkStore(), userSerials != null ? u90.b.W(userSerials, -1L) : null, types, groupId != null ? e0.U(groupId) : null, (Set) null, 8, (Object) null);
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        while (true) {
            int i5 = 0;
            if (!it.hasNext()) {
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                int size = arrayList.size();
                while (i5 < size) {
                    Object obj = arrayList.get(i5);
                    i5++;
                    String groupId2 = ((JoinedResult) obj).getEntity().getGroupId();
                    Object arrayList2 = linkedHashMap.get(groupId2);
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList();
                        linkedHashMap.put(groupId2, arrayList2);
                    }
                    ((List) arrayList2).add(obj);
                }
                ArrayList arrayList3 = new ArrayList(linkedHashMap.size());
                Iterator it2 = linkedHashMap.entrySet().iterator();
                while (it2.hasNext()) {
                    Iterator it3 = ((Iterable) ((Map.Entry) it2.next()).getValue()).iterator();
                    if (!it3.hasNext()) {
                        throw new NoSuchElementException();
                    }
                    Object next = it3.next();
                    if (it3.hasNext()) {
                        double sortingModelScore = ((JoinedResult) next).getSortingModelScore();
                        do {
                            Object next2 = it3.next();
                            double sortingModelScore2 = ((JoinedResult) next2).getSortingModelScore();
                            if (Double.compare(sortingModelScore, sortingModelScore2) < 0) {
                                next = next2;
                                sortingModelScore = sortingModelScore2;
                            }
                        } while (it3.hasNext());
                    }
                    arrayList3.add((JoinedResult) next);
                }
                ArrayList arrayListK1 = b70.g.K1(arrayList3);
                final a0 a0Var = new a0(8);
                b70.c.y0(arrayListK1, new Comparator() { // from class: nova.branch.engage.sesame_lite.internal.s
                    @Override // java.util.Comparator
                    public final int compare(Object obj2, Object obj3) {
                        return SesameLiteImpl.getSuggestedLinkResults$lambda$41(a0Var, obj2, obj3);
                    }
                });
                if (maxResultCount > -1) {
                    IntProgressionIterator it4 = kotlin.ranges.a.j0(arrayListK1.size() - 1, maxResultCount).iterator();
                    while (it4.f71911c) {
                        arrayListK1.remove(it4.nextInt());
                    }
                }
                return arrayListK1;
            }
            LinkEntity linkEntity = (LinkEntity) it.next();
            String packageName = linkEntity.getPackageName();
            if (packageName != null) {
                IgnoreStore ignoreStore = dbView.getIgnoreStore();
                long userSerial = linkEntity.getUserSerial();
                String packageName2 = this.context.getPackageName();
                Intrinsics.f(packageName2, "getPackageName(...)");
                if (ignoreStore.isIgnored(packageName, userSerial, packageName2, this.ignoreHostPackage)) {
                    joinedResult = null;
                } else {
                    LinkUsage linkUsage = dbView.getUsageStore().get((UsageStore) linkEntity.getIdHash());
                    if (linkUsage != null && linkUsage.getClickTimes().length != 0) {
                        joinedResult = new JoinedResult(null, linkEntity, linkUsage, null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, sortingModel, 0.0d, null, 114681, null);
                        joinedResult.setParentEntity(dbView.getLinkStore().getParentApp(joinedResult.getEntity()));
                        LinkUsage usage = joinedResult.getUsage();
                        if (usage == null || (clickTimes = usage.getClickTimes()) == null) {
                            clickTimes = new long[0];
                        }
                        int i11 = WhenMappings.$EnumSwitchMapping$0[sortingModel.ordinal()];
                        if (i11 == 1) {
                            dB = r80.k.b(clickTimes, now);
                        } else if (i11 == 2) {
                            dB = r80.k.a(clickTimes, now);
                        } else {
                            if (i11 != 3) {
                                throw new NoWhenBranchMatchedException();
                            }
                            dB = joinedResult.getUsage() != null ? r6.getMaxClickTime() : -1.0d;
                        }
                        joinedResult.setSortingModelScore(dB);
                    }
                }
            }
            if (joinedResult != null) {
                arrayList.add(joinedResult);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int getSuggestedLinkResults$lambda$40(JoinedResult joinedResult, JoinedResult joinedResult2) {
        return Double.compare(joinedResult.getSortingModelScore(), joinedResult2.getSortingModelScore()) * (-1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int getSuggestedLinkResults$lambda$41(Function2 function2, Object obj, Object obj2) {
        return ((Number) function2.invoke(obj, obj2)).intValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final LinkEntity ingestIntegration$lambda$96(s80.c cVar, long j11, DbView readView) {
        Intrinsics.g(readView, "readView");
        return readView.getLinkStore().getFirst(cVar.d(), j11, r80.d.f85655b);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final WriteBack insertExternalLink$lambda$98(LinkEntity linkEntity, DbView writeView) {
        Intrinsics.g(writeView, "writeView");
        writeView.getLinkStore().put((LinkStore) linkEntity);
        return new WriteBack(writeView.getLinkStore());
    }

    private final r80.x[] internalGet(int maxUsageTimesCount, final r80.b[] contactActionTypes, final Function1<? super DbView, ? extends Collection<LinkEntity>> fetchFromStoreBlock) {
        if (maxUsageTimesCount < 0) {
            maxUsageTimesCount = LayoutNode.NotPlacedPlaceOrder;
        }
        final int i5 = maxUsageTimesCount;
        final long jCurrentTimeMillis = System.currentTimeMillis();
        long jNanoTime = System.nanoTime();
        r80.x[] xVarArr = (r80.x[]) getDb().readTx(new Function1() { // from class: nova.branch.engage.sesame_lite.internal.v
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return SesameLiteImpl.internalGet$lambda$66(fetchFromStoreBlock, contactActionTypes, this, i5, jCurrentTimeMillis, (DbView) obj);
            }
        });
        long jNanoTime2 = System.nanoTime() - jNanoTime;
        r80.p log = State.INSTANCE.getLog();
        int iOrdinal = log.getLevel().ordinal();
        r80.o oVar = r80.o.f85697a;
        if (iOrdinal >= 3) {
            log.getWriter().debug("SSML-FrontEnd", a80.m.f(xVarArr.length, "Get returning ", " shortcuts, elapsed: ", Strs.INSTANCE.formatDuration(jNanoTime2)));
        }
        return xVarArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final r80.x[] internalGet$lambda$66(Function1 function1, r80.b[] bVarArr, SesameLiteImpl sesameLiteImpl, int i5, long j11, DbView dbView) {
        DbView readView = dbView;
        Intrinsics.g(readView, "readView");
        Collection<LinkEntity> collection = (Collection) function1.invoke(readView);
        ArrayList arrayList = new ArrayList();
        for (LinkEntity linkEntity : collection) {
            arrayList.add(Companion.makeShortcut$default(INSTANCE, new JoinedResult(null, linkEntity, dbView.getUsageStore().get((UsageStore) linkEntity.getIdHash()), null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, null, 0.0d, null, 131065, null), (bVarArr.length != 0 && linkEntity.getType() == r80.d.f85660g) ? sesameLiteImpl.createContactShortcutActions(readView, linkEntity, z.f85742b, bVarArr, i5, j11) : null, i5, null, 8, null));
            readView = dbView;
        }
        return (r80.x[]) arrayList.toArray(new r80.x[0]);
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0152 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final List<JoinedResult> matchAllTerms(long matchingType, String normalizedNeedle, List<LinkEntity> haystack, boolean matchTypos) {
        int i5;
        boolean zI;
        JoinedResult joinedResult;
        ArrayList arrayList;
        int iOrdinal;
        int length = normalizedNeedle.length();
        int[] iArr = new int[length];
        int i11 = 0;
        int[] iArr2 = matchTypos ? new int[]{-1} : new int[0];
        ArrayList arrayList2 = new ArrayList();
        for (LinkEntity linkEntity : haystack) {
            List<SearchableLabel> searchableLabels = linkEntity.getSearchableLabels();
            ArrayList arrayList3 = new ArrayList();
            int i12 = i11;
            for (Object obj : searchableLabels) {
                int i13 = i12 + 1;
                if (i12 < 0) {
                    ul.b.e0();
                    throw null;
                }
                SearchableLabel searchableLabel = (SearchableLabel) obj;
                if (matchingType == 2000) {
                    try {
                        Pattern pattern = r80.k.f85688a;
                        zI = r80.k.i(normalizedNeedle, searchableLabel.getMatchDisplay(), searchableLabel.getMatchNormalized(), iArr, iArr2);
                    } catch (Throwable th2) {
                        th = th2;
                        i5 = length;
                        arrayList = arrayList3;
                        r80.p log = State.INSTANCE.getLog();
                        iOrdinal = log.getLevel().ordinal();
                        r80.o oVar = r80.o.f85697a;
                        if (iOrdinal >= 2) {
                        }
                        joinedResult = null;
                        if (joinedResult != null) {
                        }
                        arrayList3 = arrayList;
                        i12 = i13;
                        length = i5;
                    }
                } else {
                    Pattern pattern2 = r80.k.f85688a;
                    zI = r80.k.h(normalizedNeedle, searchableLabel.getMatchDisplay(), searchableLabel.getMatchNormalized(), iArr, iArr2);
                }
                if (zI) {
                    int[] iArrCopyOf = Arrays.copyOf(iArr, length);
                    Intrinsics.f(iArrCopyOf, "copyOf(...)");
                    ArrayList arrayList4 = new ArrayList();
                    int length2 = iArr2.length;
                    int i14 = 0;
                    while (i14 < length2) {
                        i5 = length;
                        try {
                            int i15 = iArr2[i14];
                            int i16 = i14;
                            if (i15 != -1) {
                                try {
                                    arrayList4.add(Integer.valueOf(i15));
                                } catch (Throwable th3) {
                                    th = th3;
                                    arrayList = arrayList3;
                                    r80.p log2 = State.INSTANCE.getLog();
                                    iOrdinal = log2.getLevel().ordinal();
                                    r80.o oVar2 = r80.o.f85697a;
                                    if (iOrdinal >= 2) {
                                        log2.getWriter().warn("SSML-FrontEnd", "ERROR: matchTerm[" + matchingType + "] failed on alias=" + searchableLabel + ": " + th.getMessage());
                                    }
                                    joinedResult = null;
                                    if (joinedResult != null) {
                                    }
                                    arrayList3 = arrayList;
                                    i12 = i13;
                                    length = i5;
                                }
                            }
                            i14 = i16 + 1;
                            length = i5;
                        } catch (Throwable th4) {
                            th = th4;
                        }
                    }
                    i5 = length;
                    int[] iArrH1 = b70.g.H1(arrayList4);
                    Pattern pattern3 = r80.k.f85688a;
                    String matchDisplay = searchableLabel.getMatchDisplay();
                    Integer numY0 = kotlin.collections.c.y0(iArr2);
                    double dL = r80.k.l(numY0 != null ? numY0.intValue() : -1, matchDisplay, iArr) - (i12 * 0.001d);
                    boolean zF = r80.k.f(iArr);
                    String normalizedHay = searchableLabel.getMatchNormalized();
                    Intrinsics.g(normalizedHay, "normalizedHay");
                    arrayList = arrayList3;
                    try {
                        joinedResult = new JoinedResult(searchableLabel, linkEntity, null, null, null, 0.0d, 0.0d, iArrCopyOf, iArrH1, dL, 0.0d, 0.0d, zF, normalizedNeedle.equals(normalizedHay), null, 0.0d, null, 117884, null);
                    } catch (Throwable th5) {
                        th = th5;
                        r80.p log22 = State.INSTANCE.getLog();
                        iOrdinal = log22.getLevel().ordinal();
                        r80.o oVar22 = r80.o.f85697a;
                        if (iOrdinal >= 2) {
                        }
                        joinedResult = null;
                        if (joinedResult != null) {
                        }
                        arrayList3 = arrayList;
                        i12 = i13;
                        length = i5;
                    }
                    if (joinedResult != null) {
                        arrayList.add(joinedResult);
                    }
                    arrayList3 = arrayList;
                    i12 = i13;
                    length = i5;
                } else {
                    i5 = length;
                    arrayList = arrayList3;
                    joinedResult = null;
                    if (joinedResult != null) {
                    }
                    arrayList3 = arrayList;
                    i12 = i13;
                    length = i5;
                }
            }
            b70.d.z0(arrayList3, arrayList2);
            length = length;
            i11 = 0;
        }
        return arrayList2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final IdHash recordAppOpen$lambda$68(String str, long j11, DbView readView) {
        Intrinsics.g(readView, "readView");
        LinkEntity defaultComponent = readView.getLinkStore().getDefaultComponent(str, j11);
        if (defaultComponent != null) {
            return defaultComponent.getIdHash();
        }
        return null;
    }

    private final void recordElapsedTime(double elapsedMillis) {
        long jIncrementAndGet = this.timingsIdx.incrementAndGet();
        if (jIncrementAndGet < 0) {
            if (!this.timingsIdx.compareAndSet(jIncrementAndGet, 0L)) {
                return;
            } else {
                jIncrementAndGet = 0;
            }
        }
        this.timingsBuff[(int) (jIncrementAndGet % r2.length)] = elapsedMillis;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:13:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final WriteBack recordShortcutOpen$lambda$72(SesameLiteImpl sesameLiteImpl, IdHash idHash, r80.j jVar, Ref.BooleanRef booleanRef, DbView readView) throws Throwable {
        ArrayList arrayList;
        Iterator it;
        Long l9;
        int i5;
        boolean z11;
        UsageStore usageStore;
        LinkUsage linkUsageWithTrimmedTimes$default;
        LinkEntity parentApp;
        Intrinsics.g(readView, "readView");
        boolean zIsUsageStatsGranted = Utils.INSTANCE.isUsageStatsGranted(sesameLiteImpl.context);
        Long l11 = null;
        if (zIsUsageStatsGranted) {
            m0.u(EmptyCoroutineContext.f71803a, new SesameLiteImpl$recordShortcutOpen$2$1(sesameLiteImpl, null));
        }
        long currentUserId = sesameLiteImpl.userHandleDataSource.getCurrentUserId();
        long jCurrentTimeMillis = System.currentTimeMillis();
        ArrayList arrayListT = ul.b.T(idHash);
        int i11 = 3;
        if (idHash.getType() != r80.d.f85657d) {
            if (idHash.getType() == r80.d.f85660g) {
                byte bM447getSubtypew2LRezQ = idHash.m447getSubtypew2LRezQ();
                byte b11 = (byte) 0;
                UByte.Companion companion = UByte.f71693b;
                if (bM447getSubtypew2LRezQ != b11) {
                    arrayListT.add(idHash.m444copyWithSubtype7apg3OU((byte) 0));
                } else {
                    LinkEntity linkEntity = readView.getLinkStore().get((LinkStore) idHash);
                    if (linkEntity == null) {
                        r80.p log = State.INSTANCE.getLog();
                        int iOrdinal = log.getLevel().ordinal();
                        r80.o oVar = r80.o.f85697a;
                        if (iOrdinal >= 3) {
                            log.getWriter().debug("SSML-FrontEnd", "ERROR: Can't find LinkEntity for idHash=" + idHash + ". Skipping...");
                        }
                        arrayListT.remove(idHash);
                    } else {
                        r80.d type = linkEntity.getType();
                        type.getClass();
                        if (r80.d.f85654a.contains(type) && (parentApp = readView.getLinkStore().getParentApp(linkEntity)) != null) {
                            arrayListT.add(parentApp.getIdHash());
                        }
                    }
                }
            }
        }
        r80.p log2 = State.INSTANCE.getLog();
        int iOrdinal2 = log2.getLevel().ordinal();
        r80.o oVar2 = r80.o.f85697a;
        if (iOrdinal2 >= 3) {
            arrayList = arrayListT;
            log2.getWriter().debug("SSML-FrontEnd", c0.r(a80.m.l(jCurrentTimeMillis, "Recording usage for known IDs at ", " (", Strs.INSTANCE.formatTimestamp(jCurrentTimeMillis)), ") for parsed IDs=[ ", b70.g.f1(arrayList, null, null, null, 0, null, 63), " ]"));
        } else {
            arrayList = arrayListT;
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            IdHash idHash2 = (IdHash) it2.next();
            LinkUsage linkUsage = readView.getUsageStore().get((UsageStore) idHash2);
            if (linkUsage == null) {
                linkUsage = new LinkUsage(idHash2, 0L, (long[]) null, (long[]) null, (long[]) null, (long[]) null, (long[]) null, (long[]) null, 254, (DefaultConstructorMarker) null);
            }
            LinkEntity linkEntity2 = readView.getLinkStore().get((LinkStore) idHash2);
            Long lValueOf = (linkEntity2 == null || !zIsUsageStatsGranted || currentUserId == linkEntity2.getUserSerial()) ? l11 : Long.valueOf(jCurrentTimeMillis);
            UsageStore usageStore2 = readView.getUsageStore();
            int iOrdinal3 = jVar.ordinal();
            if (iOrdinal3 == 0) {
                it = it2;
                l9 = l11;
                LinkUsage linkUsage2 = linkUsage;
                i5 = i11;
                z11 = true;
                Long l12 = lValueOf;
                usageStore = usageStore2;
                linkUsageWithTrimmedTimes$default = LinkUsage.withTrimmedTimes$default(linkUsage2, jCurrentTimeMillis, l12, Long.valueOf(jCurrentTimeMillis), null, null, null, 0L, null, 184, null);
            } else if (iOrdinal3 == 1) {
                it = it2;
                l9 = l11;
                LinkUsage linkUsage3 = linkUsage;
                i5 = i11;
                z11 = true;
                Long l13 = lValueOf;
                usageStore = usageStore2;
                linkUsageWithTrimmedTimes$default = LinkUsage.withTrimmedTimes$default(linkUsage3, jCurrentTimeMillis, l13, null, Long.valueOf(jCurrentTimeMillis), null, null, 0L, null, 180, null);
            } else if (iOrdinal3 == 2) {
                it = it2;
                l9 = l11;
                LinkUsage linkUsage4 = linkUsage;
                i5 = i11;
                z11 = true;
                Long l14 = lValueOf;
                usageStore = usageStore2;
                linkUsageWithTrimmedTimes$default = LinkUsage.withTrimmedTimes$default(linkUsage4, jCurrentTimeMillis, l14, null, null, Long.valueOf(jCurrentTimeMillis), null, 0L, null, 172, null);
            } else {
                if (iOrdinal3 != i11) {
                    throw new NoWhenBranchMatchedException();
                }
                i5 = i11;
                it = it2;
                z11 = true;
                l9 = l11;
                LinkUsage linkUsage5 = linkUsage;
                Long l15 = lValueOf;
                usageStore = usageStore2;
                linkUsageWithTrimmedTimes$default = LinkUsage.withTrimmedTimes$default(linkUsage5, jCurrentTimeMillis, l15, null, null, null, Long.valueOf(jCurrentTimeMillis), 0L, null, 156, null);
            }
            usageStore.put((UsageStore) linkUsageWithTrimmedTimes$default);
            booleanRef.f71859a = z11;
            it2 = it;
            l11 = l9;
            i11 = i5;
        }
        return new WriteBack(readView.getUsageStore());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final r80.x[] search$lambda$50(EnumSet enumSet, r80.b[] bVarArr, SesameLiteImpl sesameLiteImpl, int i5, long j11, int i11, String[] strArr, boolean z11, long j12, boolean z12, DbView dbView) {
        r80.y[] yVarArrCreateContactShortcutActions;
        SesameLiteImpl sesameLiteImpl2 = sesameLiteImpl;
        long j13 = j11;
        DbView readView = dbView;
        Intrinsics.g(readView, "readView");
        List list = LinkStore.get$default(readView.getLinkStore(), (long[]) null, enumSet, (Set) null, (Set) null, 13, (Object) null);
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        while (true) {
            boolean zIsIgnored = true;
            if (!it.hasNext()) {
                break;
            }
            Object next = it.next();
            LinkEntity linkEntity = (LinkEntity) next;
            String packageName = linkEntity.getPackageName();
            if (packageName != null) {
                IgnoreStore ignoreStore = readView.getIgnoreStore();
                long userSerial = linkEntity.getUserSerial();
                String packageName2 = sesameLiteImpl2.context.getPackageName();
                Intrinsics.f(packageName2, "getPackageName(...)");
                zIsIgnored = true ^ ignoreStore.isIgnored(packageName, userSerial, packageName2, sesameLiteImpl2.ignoreHostPackage);
            }
            if (zIsIgnored) {
                arrayList.add(next);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        int length = strArr.length;
        int i12 = 0;
        while (i12 < length) {
            b70.d.z0(sesameLiteImpl2.matchAllTerms(j12, strArr[i12], arrayList, z12), arrayList2);
            i12++;
            sesameLiteImpl2 = sesameLiteImpl;
        }
        ArrayList<JoinedResult> arrayListK1 = b70.g.K1(arrayList2);
        MatchedResultComparator matchedResultComparator = new MatchedResultComparator(z11);
        b70.c.y0(arrayListK1, matchedResultComparator);
        HashSet hashSet = new HashSet();
        ArrayList arrayList3 = new ArrayList();
        Iterator it2 = arrayListK1.iterator();
        while (it2.hasNext()) {
            Object next2 = it2.next();
            if (hashSet.add(((JoinedResult) next2).getEntity().getIdHash())) {
                arrayList3.add(next2);
            }
        }
        if (matchedResultComparator.getMaxDepth() == 2) {
            arrayListK1 = arrayList3;
        } else {
            arrayListK1.clear();
            arrayListK1.addAll(arrayList3);
            matchedResultComparator.resetMaxDepth();
            Iterator it3 = arrayListK1.iterator();
            while (it3.hasNext()) {
                JoinedResult joinedResult = (JoinedResult) it3.next();
                LinkUsage linkUsage = readView.getUsageStore().get((UsageStore) joinedResult.getEntity().getIdHash());
                if (linkUsage != null) {
                    joinedResult.setUsage(linkUsage);
                    Pattern pattern = r80.k.f85688a;
                    joinedResult.setSearchTimesScore(r80.k.b(linkUsage.getClickTimes(), j13));
                    joinedResult.setUsageTimesScore(r80.k.b(linkUsage.getUsageTimes(), j13));
                }
            }
            b70.c.y0(arrayListK1, matchedResultComparator);
            if (matchedResultComparator.getMaxDepth() > 4) {
                matchedResultComparator.resetMaxDepth();
                Iterator it4 = arrayListK1.iterator();
                while (it4.hasNext()) {
                    JoinedResult joinedResult2 = (JoinedResult) it4.next();
                    LinkEntity parentApp = readView.getLinkStore().getParentApp(joinedResult2.getEntity());
                    if (parentApp != null) {
                        joinedResult2.setParentEntity(parentApp);
                        LinkUsage linkUsage2 = readView.getUsageStore().get((UsageStore) parentApp.getIdHash());
                        if (linkUsage2 != null) {
                            joinedResult2.setParentUsage(linkUsage2);
                            Pattern pattern2 = r80.k.f85688a;
                            joinedResult2.setParentSearchTimesScore(r80.k.b(linkUsage2.getClickTimes(), j13));
                            joinedResult2.setParentUsageTimesScore(r80.k.b(linkUsage2.getUsageTimes(), j13));
                        }
                    }
                }
                b70.c.y0(arrayListK1, matchedResultComparator);
                if (matchedResultComparator.getMaxDepth() > 5) {
                    matchedResultComparator.resetMaxDepth();
                }
            }
        }
        ArrayList arrayList4 = new ArrayList();
        for (JoinedResult joinedResult3 : arrayListK1) {
            if (!(bVarArr.length == 0) && joinedResult3.getEntity().getType() == r80.d.f85660g) {
                z sortingModel = joinedResult3.getSortingModel();
                if (sortingModel == null) {
                    sortingModel = z.f85742b;
                }
                yVarArrCreateContactShortcutActions = sesameLiteImpl.createContactShortcutActions(readView, joinedResult3.getEntity(), sortingModel, bVarArr, i5, j13);
            } else {
                yVarArrCreateContactShortcutActions = null;
            }
            arrayList4.add(INSTANCE.makeSearchShortcut(joinedResult3, yVarArrCreateContactShortcutActions, i5));
            if (arrayList4.size() >= i11) {
                break;
            }
            j13 = j11;
            readView = dbView;
        }
        return (r80.x[]) arrayList4.toArray(new r80.x[0]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final r80.y[] searchMore$lambda$58(SearchMoreType[] searchMoreTypeArr, long j11, SesameLiteImpl sesameLiteImpl, ArrayList arrayList, boolean z11, String str, long j12, DbView readView) {
        double dB;
        String string;
        Uri iconUri;
        long[] clickTimes;
        long[] usageTimes;
        String iconUri2;
        Intrinsics.g(readView, "readView");
        for (SearchMoreType searchMoreType : searchMoreTypeArr) {
            IgnoreStore ignoreStore = readView.getIgnoreStore();
            String packageName = searchMoreType.getPackageName();
            String packageName2 = sesameLiteImpl.context.getPackageName();
            Intrinsics.f(packageName2, "getPackageName(...)");
            if (!ignoreStore.isIgnored(packageName, j11, packageName2, sesameLiteImpl.ignoreHostPackage)) {
                arrayList.add(new SearchMoreJoinedResult(searchMoreType, readView.getLinkStore().getFirst(searchMoreType.getPackageName(), j11, r80.d.f85657d), readView.getUsageStore().get((UsageStore) searchMoreType.getIdHash()), 0.0d, null, 24, null));
            }
        }
        Iterator it = arrayList.iterator();
        Intrinsics.f(it, "iterator(...)");
        while (it.hasNext()) {
            Object next = it.next();
            Intrinsics.f(next, "next(...)");
            SearchMoreJoinedResult searchMoreJoinedResult = (SearchMoreJoinedResult) next;
            LinkUsage usage = searchMoreJoinedResult.getUsage();
            if (usage != null) {
                Pattern pattern = r80.k.f85688a;
                dB = r80.k.b(usage.getClickTimes(), j12);
            } else {
                dB = -1.0d;
            }
            searchMoreJoinedResult.setSearchTimesScore(dB);
            String appTemplate = searchMoreJoinedResult.getAppLink() != null ? searchMoreJoinedResult.getType().getAppTemplate() : (!z11 || searchMoreJoinedResult.getType().getIconRes() == null) ? null : searchMoreJoinedResult.getType().getWebTemplate();
            if (appTemplate == null) {
                r80.p log = State.INSTANCE.getLog();
                int iOrdinal = log.getLevel().ordinal();
                r80.o oVar = r80.o.f85697a;
                if (iOrdinal >= 2) {
                    log.getWriter().warn("SSML-FrontEnd", "ERROR: Unable to find SearchMore template for type " + searchMoreJoinedResult.getType() + ", useWebFallback=" + z11);
                }
                it.remove();
            } else {
                Intrinsics.d(str);
                String strF0 = r70.j.F0(appTemplate, "%s", str, false);
                IdHash idHash = searchMoreJoinedResult.getType().getIdHash();
                String packageName3 = searchMoreJoinedResult.getType().getPackageName();
                r80.d dVar = r80.d.f85657d;
                LinkEntity appLink = searchMoreJoinedResult.getAppLink();
                if (appLink == null || (string = appLink.getDisplayLabel()) == null) {
                    string = sesameLiteImpl.context.getString(searchMoreJoinedResult.getType().getLabelRes());
                    Intrinsics.f(string, "getString(...)");
                }
                String str2 = string;
                LinkEntity appLink2 = searchMoreJoinedResult.getAppLink();
                if (appLink2 == null || (iconUri2 = appLink2.getIconUri()) == null || (iconUri = Utils.INSTANCE.toUri(iconUri2)) == null) {
                    iconUri = searchMoreJoinedResult.getType().getIconUri(sesameLiteImpl.context);
                }
                Uri uri = iconUri;
                LinkUsage usage2 = searchMoreJoinedResult.getUsage();
                if (usage2 == null || (clickTimes = usage2.getClickTimes()) == null) {
                    clickTimes = new long[0];
                }
                long[] jArr = clickTimes;
                LinkUsage usage3 = searchMoreJoinedResult.getUsage();
                if (usage3 == null || (usageTimes = usage3.getUsageTimes()) == null) {
                    usageTimes = new long[0];
                }
                searchMoreJoinedResult.setAction(new r80.y(idHash, packageName3, -1L, dVar, str2, uri, jArr, usageTimes, new r80.v(strF0, null, searchMoreJoinedResult.getType().getIdHash(), str)));
            }
        }
        b70.c.y0(arrayList, new q(new Function2() { // from class: nova.branch.engage.sesame_lite.internal.x
            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return Integer.valueOf(SesameLiteImpl.searchMore$lambda$58$lambda$55((SesameLiteImpl.SearchMoreJoinedResult) obj, (SesameLiteImpl.SearchMoreJoinedResult) obj2));
            }
        }, 1));
        ArrayList arrayList2 = new ArrayList();
        int size = arrayList.size();
        int i5 = 0;
        while (i5 < size) {
            Object obj = arrayList.get(i5);
            i5++;
            r80.y action = ((SearchMoreJoinedResult) obj).getAction();
            if (action != null) {
                arrayList2.add(action);
            }
        }
        return (r80.y[]) arrayList2.toArray(new r80.y[0]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int searchMore$lambda$58$lambda$55(SearchMoreJoinedResult searchMoreJoinedResult, SearchMoreJoinedResult searchMoreJoinedResult2) {
        int iCompare;
        if (searchMoreJoinedResult.getSearchTimesScore() == searchMoreJoinedResult2.getSearchTimesScore()) {
            LinkUsage usage = searchMoreJoinedResult.getUsage();
            LinkUsage usage2 = searchMoreJoinedResult2.getUsage();
            if (usage != null && usage2 == null) {
                return -1;
            }
            if (usage == null && usage2 != null) {
                return 1;
            }
            if (usage == null || usage2 == null || usage.getMaxClickTime() == usage2.getMaxClickTime()) {
                return 0;
            }
            iCompare = Intrinsics.i(usage.getMaxClickTime(), usage2.getMaxClickTime());
        } else {
            iCompare = Double.compare(searchMoreJoinedResult.getSearchTimesScore(), searchMoreJoinedResult2.getSearchTimesScore());
        }
        return iCompare * (-1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int searchMore$lambda$58$lambda$56(Function2 function2, Object obj, Object obj2) {
        return ((Number) function2.invoke(obj, obj2)).intValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final r80.x[] suggestedLinks$lambda$32(SesameLiteImpl sesameLiteImpl, z zVar, String str, EnumSet enumSet, int i5, long[] jArr, long j11, r80.b[] bVarArr, int i11, DbView dbView) {
        r80.y[] yVarArrCreateContactShortcutActions;
        Intrinsics.g(dbView, "dbView");
        List<JoinedResult> suggestedLinkResults = sesameLiteImpl.getSuggestedLinkResults(dbView, zVar, str, enumSet, i5, jArr, j11);
        ArrayList arrayList = new ArrayList();
        Iterator<JoinedResult> it = suggestedLinkResults.iterator();
        while (true) {
            boolean z11 = false;
            if (!it.hasNext()) {
                return (r80.x[]) arrayList.toArray(new r80.x[0]);
            }
            JoinedResult next = it.next();
            if (bVarArr.length != 0 && next.getEntity().getType() == r80.d.f85660g) {
                z11 = true;
            }
            if (z11) {
                yVarArrCreateContactShortcutActions = sesameLiteImpl.createContactShortcutActions(dbView, next.getEntity(), zVar, bVarArr, i11, j11);
                r80.y yVar = (r80.y) kotlin.collections.c.z0(yVarArrCreateContactShortcutActions);
                if (yVar != null) {
                    arrayList.add(INSTANCE.makeActionResult(yVar, next, next.getSortingModel()));
                }
            } else {
                LinkEntity entity = next.getEntity();
                LinkEntity parentEntity = next.getParentEntity();
                yVarArrCreateContactShortcutActions = null;
                next = JoinedResult.copy$default(next, null, entity.m454copyVIp7_1Y((1919 & 1) != 0 ? entity.getIdHash() : null, (1919 & 2) != 0 ? entity.groupId : null, (1919 & 4) != 0 ? entity.typeSpecificKey : null, (1919 & 8) != 0 ? entity.userSerial : 0L, (1919 & 16) != 0 ? entity.displayLabelPrefix : null, (1919 & 32) != 0 ? entity.displayLabel : null, (1919 & 64) != 0 ? entity.expirationOn : 0L, (1919 & 128) != 0 ? entity.customIconUri : parentEntity != null ? parentEntity.getIconUri() : null, (1919 & 256) != 0 ? entity.intentUri : null, (1919 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? entity.typeSpecificFlags : 0L, (1919 & 1024) != 0 ? entity.aliases : null), null, null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, null, 0.0d, null, 131069, null);
            }
            arrayList.add(INSTANCE.makeShortcut(next, yVarArrCreateContactShortcutActions, i11, next.getSortingModel()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:141:0x03e4  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x046c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0223  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final r80.x[] zeroState$lambda$30(List list, List list2, boolean z11, int i5, long[] jArr, String str, EnumSet enumSet, String[] strArr, r80.b[] bVarArr, SesameLiteImpl sesameLiteImpl, int i11, long j11, Set set, DbView dbView) {
        int i12;
        final String str2;
        int i13;
        r80.y[] yVarArrCreateContactShortcutActions;
        int i14;
        String strSubstring;
        String strSubstring2;
        LinkUsage linkUsage;
        JoinedResult joinedResult;
        JoinedResult joinedResult2;
        LinkUsage linkUsage2;
        JoinedResult joinedResult3;
        z zVar;
        List list3 = list2;
        String str3 = str;
        SesameLiteImpl sesameLiteImpl2 = sesameLiteImpl;
        DbView readView = dbView;
        Intrinsics.g(readView, "readView");
        int iD0 = b70.k.d0(b70.c.u0(list, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        for (Object obj : list) {
            z zVar2 = (z) obj;
            List<LinkEntity> list4 = LinkStore.get$default(readView.getLinkStore(), jArr != null ? u90.b.W(jArr, -1L) : null, enumSet, str3 != null ? e0.U(str3) : null, (Set) null, 8, (Object) null);
            ArrayList arrayList = new ArrayList();
            for (LinkEntity linkEntity : list4) {
                String packageName = linkEntity.getPackageName();
                if (packageName != null) {
                    IgnoreStore ignoreStore = readView.getIgnoreStore();
                    long userSerial = linkEntity.getUserSerial();
                    String packageName2 = sesameLiteImpl2.context.getPackageName();
                    Intrinsics.f(packageName2, "getPackageName(...)");
                    if (!ignoreStore.isIgnored(packageName, userSerial, packageName2, sesameLiteImpl2.ignoreHostPackage)) {
                        Unit unit = Unit.f71706a;
                        linkUsage2 = dbView.getUsageStore().get((UsageStore) linkEntity.getIdHash());
                        if (linkUsage2 == null && (linkUsage2.getUsageStatsTimes().length != 0 || linkUsage2.getClickTimes().length != 0)) {
                            boolean z12 = linkUsage2.getMaxClickTime() <= j11 - 604800000;
                            if (!z11 || z12) {
                                joinedResult3 = new JoinedResult(null, linkEntity, linkUsage2, null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, zVar2, 0.0d, null, 114681, null);
                                zVar = zVar2;
                                joinedResult3.calculateSortingModelScore(zVar, j11);
                            }
                        }
                    }
                    zVar = zVar2;
                    joinedResult3 = null;
                } else {
                    linkUsage2 = dbView.getUsageStore().get((UsageStore) linkEntity.getIdHash());
                    if (linkUsage2 == null) {
                        zVar = zVar2;
                        joinedResult3 = null;
                    } else {
                        if (linkUsage2.getMaxClickTime() <= j11 - 604800000) {
                        }
                        if (!z11) {
                        }
                        joinedResult3 = new JoinedResult(null, linkEntity, linkUsage2, null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, zVar2, 0.0d, null, 114681, null);
                        zVar = zVar2;
                        joinedResult3.calculateSortingModelScore(zVar, j11);
                    }
                }
                if (joinedResult3 != null) {
                    arrayList.add(joinedResult3);
                }
                readView = dbView;
                zVar2 = zVar;
            }
            ArrayList arrayListK1 = b70.g.K1(arrayList);
            b70.c.y0(arrayListK1, JoinedResult.INSTANCE);
            if (arrayListK1.size() > i5) {
                arrayListK1.subList(i5, arrayListK1.size()).clear();
            }
            linkedHashMap.put(obj, arrayListK1);
            readView = dbView;
        }
        ArrayList arrayList2 = new ArrayList();
        int size = list3.size();
        int i15 = 0;
        while (i15 < size) {
            List list5 = (List) linkedHashMap.get(list3.get(i15));
            if (list5 != null && (joinedResult2 = (JoinedResult) b70.d.G0(list5)) != null) {
                arrayList2.add(joinedResult2);
                for (Map.Entry entry : linkedHashMap.entrySet()) {
                    if (entry.getKey() != list3.get(i15)) {
                        b70.d.E0((List) entry.getValue(), new y(joinedResult2, 2));
                        list3 = list2;
                    }
                }
            }
            i15++;
            list3 = list2;
        }
        if (!z11 && arrayList2.size() < i5) {
            LinkStore linkStore = dbView.getLinkStore();
            long[] jArrW = jArr != null ? u90.b.W(jArr, -1L) : null;
            Set setU = str3 != null ? e0.U(str3) : null;
            EnumSet enumSetOf = EnumSet.of(r80.d.f85655b);
            Intrinsics.f(enumSetOf, "of(...)");
            List<LinkEntity> list6 = LinkStore.get$default(linkStore, jArrW, enumSetOf, setU, (Set) null, 8, (Object) null);
            ArrayList arrayList3 = new ArrayList();
            for (LinkEntity linkEntity2 : list6) {
                String packageName3 = linkEntity2.getPackageName();
                if (packageName3 != null) {
                    IgnoreStore ignoreStore2 = dbView.getIgnoreStore();
                    long userSerial2 = linkEntity2.getUserSerial();
                    String packageName4 = sesameLiteImpl2.context.getPackageName();
                    Intrinsics.f(packageName4, "getPackageName(...)");
                    if (!ignoreStore2.isIgnored(packageName3, userSerial2, packageName4, sesameLiteImpl2.ignoreHostPackage)) {
                        Unit unit2 = Unit.f71706a;
                        linkUsage = dbView.getUsageStore().get((UsageStore) linkEntity2.getIdHash());
                        if (linkUsage != null) {
                            z zVar3 = z.f85741a;
                            joinedResult = new JoinedResult(null, linkEntity2, linkUsage, null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, zVar3, 0.0d, null, 114681, null);
                            joinedResult.calculateSortingModelScore(zVar3, j11);
                        }
                    }
                    joinedResult = null;
                } else {
                    linkUsage = dbView.getUsageStore().get((UsageStore) linkEntity2.getIdHash());
                    if (linkUsage != null) {
                        joinedResult = null;
                    }
                }
                if (joinedResult != null) {
                    arrayList3.add(joinedResult);
                }
            }
            List listD1 = b70.g.D1(JoinedResult.INSTANCE, arrayList3);
            for (int i16 = 0; arrayList2.size() < i5 && i16 < listD1.size(); i16++) {
                List<LinkEntity> list7 = LinkStore.get$default(dbView.getLinkStore(), jArr != null ? u90.b.W(jArr, -1L) : null, enumSet, e0.U(((JoinedResult) listD1.get(i16)).getEntity().getGroupId()), (Set) null, 8, (Object) null);
                ArrayList arrayList4 = new ArrayList(b70.c.u0(list7, 10));
                for (LinkEntity linkEntity3 : list7) {
                    LinkUsage linkUsage3 = dbView.getUsageStore().get((UsageStore) linkEntity3.getIdHash());
                    z zVar4 = z.f85742b;
                    JoinedResult joinedResult4 = new JoinedResult(null, linkEntity3, linkUsage3, null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, zVar4, 0.0d, null, 114681, null);
                    joinedResult4.calculateSortingModelScore(zVar4, j11);
                    arrayList4.add(joinedResult4);
                }
                JoinedResult joinedResult5 = (JoinedResult) b70.g.Y0(b70.g.D1(JoinedResult.INSTANCE, arrayList4));
                if (joinedResult5 != null) {
                    if (arrayList2.isEmpty()) {
                        arrayList2.add(joinedResult5);
                    } else {
                        int size2 = arrayList2.size();
                        int i17 = 0;
                        while (i17 < size2) {
                            Object obj2 = arrayList2.get(i17);
                            i17++;
                            if (Intrinsics.b(((JoinedResult) obj2).getEntity().getIdHash(), joinedResult5.getEntity().getIdHash())) {
                                break;
                            }
                        }
                        arrayList2.add(joinedResult5);
                    }
                }
            }
        }
        if (i5 - arrayList2.size() <= 0 || strArr.length == 0) {
            i12 = 0;
        } else {
            ArrayList arrayList5 = new ArrayList(b70.c.u0(arrayList2, 10));
            int size3 = arrayList2.size();
            int i18 = 0;
            while (i18 < size3) {
                Object obj3 = arrayList2.get(i18);
                i18++;
                arrayList5.add(((JoinedResult) obj3).getEntity().getIdHash());
            }
            long[] jArrW2 = jArr != null ? u90.b.W(jArr, -1L) : null;
            int length = strArr.length;
            Integer[] numArr = new Integer[length];
            int i19 = 0;
            while (i19 < length) {
                Integer[] numArr2 = numArr;
                numArr2[i19] = Integer.valueOf(r70.k.R0(AbstractJsonLexerKt.COLON, 0, 6, strArr[i19]));
                i19++;
                length = length;
                numArr = numArr2;
            }
            Integer[] numArr3 = numArr;
            int length2 = strArr.length;
            String[] strArr2 = new String[length2];
            int i21 = 0;
            while (true) {
                i14 = -1;
                if (i21 >= length2) {
                    break;
                }
                int i22 = i21;
                int iIntValue = numArr3[i21].intValue();
                if (iIntValue == -1) {
                    strSubstring2 = strArr[i22];
                } else {
                    strSubstring2 = strArr[i22].substring(0, iIntValue);
                    Intrinsics.f(strSubstring2, "substring(...)");
                }
                strArr2[i22] = strSubstring2;
                i21 = i22 + 1;
            }
            int length3 = strArr.length;
            String[] strArr3 = new String[length3];
            int i23 = 0;
            while (i23 < length3) {
                int iIntValue2 = numArr3[i23].intValue();
                if (iIntValue2 == i14) {
                    strSubstring = null;
                } else {
                    strSubstring = strArr[i23].substring(iIntValue2 + 1);
                    Intrinsics.f(strSubstring, "substring(...)");
                    if (r70.k.U0(strSubstring)) {
                    }
                }
                strArr3[i23] = strSubstring;
                i23++;
                i14 = -1;
            }
            boolean z13 = (length3 == 0 || kotlin.collections.c.o0(null, strArr3)) ? false : true;
            LinkStore linkStore2 = dbView.getLinkStore();
            HashSet hashSet = new HashSet(b70.k.d0(length2));
            kotlin.collections.c.Z0(strArr2, hashSet);
            List list8 = LinkStore.get$default(linkStore2, (long[]) null, enumSet, hashSet, (Set) null, 9, (Object) null);
            ArrayList arrayList6 = new ArrayList();
            for (Object obj4 : list8) {
                LinkEntity linkEntity4 = (LinkEntity) obj4;
                String packageName5 = linkEntity4.getPackageName();
                if (packageName5 != null) {
                    IgnoreStore ignoreStore3 = dbView.getIgnoreStore();
                    long userSerial3 = linkEntity4.getUserSerial();
                    String packageName6 = sesameLiteImpl2.context.getPackageName();
                    Intrinsics.f(packageName6, "getPackageName(...)");
                    if (!ignoreStore3.isIgnored(packageName5, userSerial3, packageName6, sesameLiteImpl2.ignoreHostPackage)) {
                        Unit unit3 = Unit.f71706a;
                        if (str3 != null || r70.k.U0(str3) || Intrinsics.b(linkEntity4.getGroupId(), str3)) {
                            if ((jArrW2 != null || kotlin.collections.c.s0(jArrW2, linkEntity4.getUserSerial())) && ((!z13 || kotlin.collections.c.o0(linkEntity4.getTypeSpecificKey(), strArr3)) && !arrayList5.contains(linkEntity4.getIdHash()))) {
                                arrayList6.add(obj4);
                            }
                            str3 = str;
                        }
                    }
                } else if (str3 != null) {
                    if (jArrW2 != null) {
                        arrayList6.add(obj4);
                        str3 = str;
                    } else {
                        arrayList6.add(obj4);
                        str3 = str;
                    }
                }
            }
            ArrayList arrayListK12 = b70.g.K1(arrayList6);
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            Iterator it = arrayListK12.iterator();
            while (it.hasNext()) {
                LinkEntity linkEntity5 = (LinkEntity) it.next();
                if (linkEntity5.getType() == r80.d.f85655b) {
                    int i24 = 0;
                    while (true) {
                        if (i24 >= length2) {
                            break;
                        }
                        if (Intrinsics.b(strArr2[i24], linkEntity5.getPackageName()) && strArr3[i24] == null) {
                            linkedHashMap2.put(linkEntity5.getIdHash(), Integer.valueOf(i24));
                            break;
                        }
                        i24++;
                    }
                } else {
                    r80.d type = linkEntity5.getType();
                    type.getClass();
                    if (r80.d.f85654a.contains(type)) {
                        int i25 = 0;
                        while (true) {
                            if (i25 >= length2) {
                                break;
                            }
                            if (Intrinsics.b(strArr2[i25], linkEntity5.getPackageName()) && Intrinsics.b(strArr3[i25], linkEntity5.getTypeSpecificKey())) {
                                linkedHashMap2.put(linkEntity5.getIdHash(), Integer.valueOf(i25));
                                break;
                            }
                            i25++;
                        }
                    }
                }
            }
            b70.d.E0(arrayListK12, new y(linkedHashMap2, 3));
            i12 = 0;
            b70.c.y0(arrayListK12, new q(new p(linkedHashMap2, i12), i12));
            ArrayList arrayList7 = new ArrayList(b70.c.u0(arrayListK12, 10));
            Iterator it2 = arrayListK12.iterator();
            while (it2.hasNext()) {
                arrayList7.add(new JoinedResult(null, (LinkEntity) it2.next(), null, null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, null, 0.0d, null, 131069, null));
            }
            arrayList2.addAll(arrayList7);
        }
        int size4 = i5 - arrayList2.size();
        if (size4 > 0) {
            ArrayList arrayList8 = new ArrayList(b70.c.u0(arrayList2, 10));
            int size5 = arrayList2.size();
            int i26 = i12;
            while (i26 < size5) {
                Object obj5 = arrayList2.get(i26);
                i26++;
                arrayList8.add(((JoinedResult) obj5).getEntity().getIdHash());
            }
            List list9 = LinkStore.get$default(dbView.getLinkStore(), jArr != null ? u90.b.W(jArr, -1L) : null, enumSet, (str == null || r70.k.U0(str)) ? null : e0.U(str), (Set) null, 8, (Object) null);
            ArrayList arrayList9 = new ArrayList();
            for (Object obj6 : list9) {
                LinkEntity linkEntity6 = (LinkEntity) obj6;
                String packageName7 = linkEntity6.getPackageName();
                if (packageName7 != null) {
                    IgnoreStore ignoreStore4 = dbView.getIgnoreStore();
                    long userSerial4 = linkEntity6.getUserSerial();
                    String packageName8 = sesameLiteImpl2.context.getPackageName();
                    Intrinsics.f(packageName8, "getPackageName(...)");
                    if (!ignoreStore4.isIgnored(packageName7, userSerial4, packageName8, sesameLiteImpl2.ignoreHostPackage)) {
                        Unit unit4 = Unit.f71706a;
                    }
                }
                arrayList9.add(obj6);
            }
            ArrayList arrayListK13 = b70.g.K1(arrayList9);
            final y yVar = new y(arrayList8, 4);
            arrayListK13.removeIf(new Predicate() { // from class: nova.branch.engage.sesame_lite.internal.r
                @Override // java.util.function.Predicate
                public final boolean test(Object obj7) {
                    return SesameLiteImpl.zeroState$lambda$30$lambda$27$lambda$25(yVar, obj7);
                }
            });
            if (arrayListK13.size() > 1) {
                str2 = str;
                b70.c.y0(arrayListK13, new Comparator() { // from class: nova.branch.engage.sesame_lite.internal.SesameLiteImpl$zeroState$lambda$30$lambda$27$$inlined$sortBy$1
                    /* JADX WARN: Multi-variable type inference failed */
                    @Override // java.util.Comparator
                    public final int compare(T t6, T t9) {
                        LinkEntity linkEntity7 = (LinkEntity) t6;
                        LinkEntity linkEntity8 = (LinkEntity) t9;
                        return e0.t(str2 == null ? ((SearchableLabel) b70.g.W0(linkEntity7.getSearchableLabels())).getDisplayLabel() : linkEntity7.getDisplayLabel(), str2 == null ? ((SearchableLabel) b70.g.W0(linkEntity8.getSearchableLabels())).getDisplayLabel() : linkEntity8.getDisplayLabel());
                    }
                });
            } else {
                str2 = str;
            }
            List listE1 = b70.g.E1(arrayListK13, size4);
            ArrayList arrayList10 = new ArrayList(b70.c.u0(listE1, 10));
            Iterator it3 = listE1.iterator();
            while (it3.hasNext()) {
                arrayList10.add(new JoinedResult(null, (LinkEntity) it3.next(), null, null, null, 0.0d, 0.0d, null, null, 0.0d, 0.0d, 0.0d, false, false, null, 0.0d, null, 131069, null));
            }
            arrayList2.addAll(arrayList10);
        } else {
            str2 = str;
        }
        ArrayList arrayList11 = new ArrayList();
        int size6 = arrayList2.size();
        int i27 = i12;
        while (true) {
            if (i27 >= size6) {
                i13 = i12;
                break;
            }
            Object obj7 = arrayList2.get(i27);
            i27++;
            JoinedResult joinedResult6 = (JoinedResult) obj7;
            if (bVarArr.length != 0 && joinedResult6.getEntity().getType() == r80.d.f85660g) {
                z sortingModel = joinedResult6.getSortingModel();
                if (sortingModel == null) {
                    sortingModel = z.f85742b;
                }
                i13 = i12;
                yVarArrCreateContactShortcutActions = sesameLiteImpl2.createContactShortcutActions(dbView, joinedResult6.getEntity(), sortingModel, bVarArr, i11, j11);
            } else {
                i13 = i12;
                yVarArrCreateContactShortcutActions = null;
            }
            Object objW0 = b70.g.W0(joinedResult6.getEntity().getSearchableLabels());
            if (str2 != null) {
                objW0 = null;
            }
            joinedResult6.setAlias((SearchableLabel) objW0);
            arrayList11.add(INSTANCE.makeShortcut(joinedResult6, yVarArrCreateContactShortcutActions, i11, joinedResult6.getSortingModel()));
            if (str2 == null && joinedResult6.getEntity().getType() != r80.d.f85655b) {
                set.add(joinedResult6.getEntity().getIdHash());
            }
            if (arrayList11.size() >= i5) {
                break;
            }
            sesameLiteImpl2 = sesameLiteImpl;
            i12 = i13;
        }
        return (r80.x[]) arrayList11.toArray(new r80.x[i13]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean zeroState$lambda$30$lambda$17(Map map, LinkEntity it) {
        Intrinsics.g(it, "it");
        return !map.containsKey(it.getIdHash());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int zeroState$lambda$30$lambda$18(Map map, LinkEntity linkEntity, LinkEntity linkEntity2) {
        Object obj = map.get(linkEntity.getIdHash());
        Intrinsics.d(obj);
        int iIntValue = ((Number) obj).intValue();
        Object obj2 = map.get(linkEntity2.getIdHash());
        Intrinsics.d(obj2);
        return Intrinsics.h(iIntValue, ((Number) obj2).intValue());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int zeroState$lambda$30$lambda$19(Function2 function2, Object obj, Object obj2) {
        return ((Number) function2.invoke(obj, obj2)).intValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean zeroState$lambda$30$lambda$27$lambda$24(List list, LinkEntity it) {
        Intrinsics.g(it, "it");
        return list.contains(it.getIdHash());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean zeroState$lambda$30$lambda$27$lambda$25(Function1 function1, Object obj) {
        return ((Boolean) function1.invoke(obj)).booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean zeroState$lambda$30$lambda$6(JoinedResult joinedResult, JoinedResult it) {
        Intrinsics.g(it, "it");
        return Intrinsics.b(it.getEntity().getIdHash(), joinedResult.getEntity().getIdHash());
    }

    @Override // r80.l
    public void close() {
        r80.p log = State.INSTANCE.getLog();
        int iOrdinal = log.getLevel().ordinal();
        r80.o oVar = r80.o.f85697a;
        if (iOrdinal >= 3) {
            log.getWriter().debug("SSML-FrontEnd", "Closing database and removing listeners");
        }
        unregisterAndroidListeners();
    }

    @Override // r80.l
    public boolean deleteLink(@NotNull IdHash idHash) {
        Intrinsics.g(idHash, "idHash");
        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        try {
            getDb().writeTx(new b(4, idHash, booleanRef));
        } catch (Throwable th2) {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 2) {
                log.getWriter().warn("SSML-FrontEnd", "Failed to delete link: " + th2.getMessage());
            }
        }
        return booleanRef.f71859a;
    }

    @Override // r80.l
    @NotNull
    public r80.x[] get(@NotNull IdHash[] idHashes, int maxUsageTimesCount, @NotNull r80.b[] contactActionTypes) {
        r80.b[] bVarArr;
        Intrinsics.g(idHashes, "idHashes");
        Intrinsics.g(contactActionTypes, "contactActionTypes");
        try {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 3) {
                bVarArr = contactActionTypes;
                log.getWriter().debug("SSML-FrontEnd", "Get: idHashes.size=[" + idHashes.length + "], maxUsageTimesCount=" + maxUsageTimesCount + ", contactActionTypes=[" + kotlin.collections.c.O0(bVarArr, null, null, null, null, 63) + "]");
            } else {
                bVarArr = contactActionTypes;
            }
            return internalGet(maxUsageTimesCount, bVarArr, new y(idHashes, 7));
        } catch (Throwable th2) {
            r80.p log2 = State.INSTANCE.getLog();
            int iOrdinal2 = log2.getLevel().ordinal();
            r80.o oVar2 = r80.o.f85697a;
            if (iOrdinal2 >= 1) {
                log2.getWriter().error("SSML-FrontEnd", th2);
            }
            return new r80.x[0];
        }
    }

    @Override // r80.l
    @NotNull
    public r80.x[] getAll(@Nullable long[] userSerials, @NotNull EnumSet<r80.d> types, int maxUsageTimesCount, @NotNull r80.b[] contactActionTypes) {
        EnumSet<r80.d> enumSet;
        r80.b[] bVarArr;
        Intrinsics.g(types, "types");
        Intrinsics.g(contactActionTypes, "contactActionTypes");
        try {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            int i5 = 3;
            if (iOrdinal >= 3) {
                r80.n writer = log.getWriter();
                String strN0 = userSerials != null ? kotlin.collections.c.N0(userSerials) : null;
                bVarArr = contactActionTypes;
                enumSet = types;
                writer.debug("SSML-FrontEnd", "Get all: userSerials=[" + strN0 + "], types=[" + b70.g.f1(types, null, null, null, 0, null, 63) + "], maxUsageTimesCount=" + maxUsageTimesCount + ", contactActionTypes=[" + kotlin.collections.c.O0(bVarArr, null, null, null, null, 63) + "]");
            } else {
                enumSet = types;
                bVarArr = contactActionTypes;
            }
            try {
                return (enumSet.size() == 0 || (userSerials != null && userSerials.length == 0)) ? new r80.x[0] : internalGet(maxUsageTimesCount, bVarArr, new b(i5, userSerials, enumSet));
            } catch (Throwable th2) {
                th = th2;
                r80.p log2 = State.INSTANCE.getLog();
                int iOrdinal2 = log2.getLevel().ordinal();
                r80.o oVar2 = r80.o.f85697a;
                if (iOrdinal2 >= 1) {
                    log2.getWriter().error("SSML-FrontEnd", th);
                }
                return new r80.x[0];
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    @NotNull
    public DB getDb() {
        return this.db;
    }

    @Override // r80.l
    @NotNull
    public DataImporters getIngester() {
        return this.ingester;
    }

    @NotNull
    public r80.g getPerfStats() {
        return (r80.g) getDb().readTx(new y(this, 5));
    }

    @NotNull
    public final Prefs getPrefs() {
        return this.prefs;
    }

    public void importBranchShortcuts(@NotNull Collection<Object> data) {
        Intrinsics.g(data, "data");
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r80.l
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object ingestIntegration(@NotNull s80.c cVar, @NotNull Continuation<? super Integer> continuation) {
        AnonymousClass1 anonymousClass1;
        SesameLiteImpl sesameLiteImpl;
        long j11;
        SesameLiteImpl sesameLiteImpl2;
        long j12;
        List<ExternalLink> list;
        List<ExternalLink> list2;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object objE = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        int i12 = 1;
        if (i11 != 0) {
            if (i11 == 1) {
                j11 = anonymousClass1.J$0;
                cVar = (s80.c) anonymousClass1.L$1;
                sesameLiteImpl = (SesameLiteImpl) anonymousClass1.L$0;
                ResultKt.b(objE);
                list = (List) objE;
                if (list != null) {
                    sesameLiteImpl.importers.ingestCustomLinks(cVar.d(), j11, list);
                    size = list.size();
                }
                return new Integer(size);
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j12 = anonymousClass1.J$0;
            cVar = (s80.c) anonymousClass1.L$1;
            sesameLiteImpl2 = (SesameLiteImpl) anonymousClass1.L$0;
            ResultKt.b(objE);
            list2 = (List) objE;
            if (list2 != null) {
                sesameLiteImpl2.importers.ingestApiLinks(cVar.d(), j12, list2);
            }
            return new Integer(list2 != null ? list2.size() : 0);
        }
        ResultKt.b(objE);
        long currentUserId = this.userHandleDataSource.getCurrentUserId();
        s80.e eVarA = cVar.a();
        int i13 = WhenMappings.$EnumSwitchMapping$2[eVarA.ordinal()];
        if (i13 == 1) {
            anonymousClass1.L$0 = this;
            anonymousClass1.L$1 = cVar;
            anonymousClass1.J$0 = currentUserId;
            anonymousClass1.label = 1;
            objE = ((s80.d) cVar).e(anonymousClass1);
            if (objE != coroutineSingletons) {
                sesameLiteImpl = this;
                j11 = currentUserId;
                list = (List) objE;
                if (list != null) {
                }
                return new Integer(size);
            }
        } else {
            if (i13 != 2) {
                r80.p log = State.INSTANCE.getLog();
                int iOrdinal = log.getLevel().ordinal();
                r80.o oVar = r80.o.f85697a;
                if (iOrdinal >= 2) {
                    log.getWriter().warn("SSML-FrontEnd", "Unsupported integration type: " + eVarA);
                }
                return new Integer(0);
            }
            s80.d dVar = (s80.d) cVar;
            if (((LinkEntity) getDb().readTx(new a(cVar, currentUserId, i12))) == null) {
                return new Integer(0);
            }
            anonymousClass1.L$0 = this;
            anonymousClass1.L$1 = cVar;
            anonymousClass1.J$0 = currentUserId;
            anonymousClass1.label = 2;
            objE = dVar.e(anonymousClass1);
            if (objE != coroutineSingletons) {
                sesameLiteImpl2 = this;
                j12 = currentUserId;
                list2 = (List) objE;
                if (list2 != null) {
                }
                return new Integer(list2 != null ? list2.size() : 0);
            }
        }
        return coroutineSingletons;
    }

    @Override // r80.l
    @Nullable
    public IdHash insertExternalLink(@NotNull ExternalLink link, @NotNull r80.d linkType, @NotNull String groupId, long userSerial) {
        Intrinsics.g(link, "link");
        Intrinsics.g(linkType, "linkType");
        Intrinsics.g(groupId, "groupId");
        try {
            IdHash idHashM448ofKY3lZgs$default = IdHash.Companion.m448ofKY3lZgs$default(IdHash.INSTANCE, linkType, groupId, link.f78377a, userSerial, (byte) 0, 16, null);
            String str = link.f78377a;
            Long l9 = link.f78382f;
            LinkEntity linkEntity = new LinkEntity(idHashM448ofKY3lZgs$default, groupId, str, userSerial, link.f78379c, link.f78378b, l9 != null ? l9.longValue() : -1L, link.f78380d, link.f78381e, 0L, null, 1536, null);
            getDb().writeTx(new y(linkEntity, 6));
            return linkEntity.getIdHash();
        } catch (Throwable th2) {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal < 2) {
                return null;
            }
            log.getWriter().warn("SSML-FrontEnd", "Failed to insert external link: " + th2.getMessage());
            return null;
        }
    }

    @Nullable
    public final Object killSwitch(@NotNull Continuation<? super Unit> continuation) {
        try {
            try {
                close();
            } catch (Throwable th2) {
                r80.p log = State.INSTANCE.getLog();
                int iOrdinal = log.getLevel().ordinal();
                r80.o oVar = r80.o.f85697a;
                if (iOrdinal >= 2) {
                    log.getWriter().warn("SSML-FrontEnd", String.valueOf(th2.getMessage()));
                }
            }
            try {
                getDb().reset();
            } catch (Throwable th3) {
                r80.p log2 = State.INSTANCE.getLog();
                int iOrdinal2 = log2.getLevel().ordinal();
                r80.o oVar2 = r80.o.f85697a;
                if (iOrdinal2 >= 2) {
                    log2.getWriter().warn("SSML-FrontEnd", String.valueOf(th3.getMessage()));
                }
            }
            try {
                getDb().deleteFiles();
            } catch (Throwable th4) {
                r80.p log3 = State.INSTANCE.getLog();
                int iOrdinal3 = log3.getLevel().ordinal();
                r80.o oVar3 = r80.o.f85697a;
                if (iOrdinal3 >= 2) {
                    log3.getWriter().warn("SSML-FrontEnd", String.valueOf(th4.getMessage()));
                }
            }
            this.prefs.putLong("app_usage_state_last_updated", -1L);
        } catch (Throwable th5) {
            r80.p log4 = State.INSTANCE.getLog();
            int iOrdinal4 = log4.getLevel().ordinal();
            r80.o oVar4 = r80.o.f85697a;
            if (iOrdinal4 >= 2) {
                log4.getWriter().warn("SSML-FrontEnd", String.valueOf(th5.getMessage()));
            }
        }
        return Unit.f71706a;
    }

    public void rebuildDb() {
        this.prefs.putBoolean("invoke_db_rebuild", true);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object recordAppOpen(@NotNull String str, long j11, @NotNull r80.j jVar, @NotNull Continuation<? super Boolean> continuation) {
        C35191 c35191;
        if (continuation instanceof C35191) {
            c35191 = (C35191) continuation;
            int i5 = c35191.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c35191.label = i5 - Integer.MIN_VALUE;
            } else {
                c35191 = new C35191(continuation);
            }
        }
        C35191 c351912 = c35191;
        Object obj = c351912.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c351912.label;
        int i12 = 1;
        try {
            if (i11 != 0) {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            IdHash idHash = (IdHash) getDb().readTx(new e(str, j11, i12));
            if (idHash == null) {
                return Boolean.FALSE;
            }
            c351912.label = 1;
            Object objY0 = z2.y0(this, idHash, null, jVar, c351912, 2);
            return objY0 == coroutineSingletons ? coroutineSingletons : objY0;
        } catch (Throwable th2) {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 1) {
                log.getWriter().error("SSML-FrontEnd", th2);
            }
            return Boolean.FALSE;
        }
    }

    @Nullable
    public Object recordShortcutOpen(@NotNull r80.w wVar, @NotNull Continuation<? super Boolean> continuation) {
        return z2.y0(this, wVar.a(), wVar.b(), null, continuation, 4);
    }

    @Nullable
    public Object refreshContactActionIcons(@NotNull Continuation<? super Unit> continuation) {
        this.importers.refreshContactActionIcons_sync();
        return Unit.f71706a;
    }

    @Override // r80.l
    @Nullable
    public Object refreshData(@Nullable String str, @Nullable r80.d[] dVarArr, @NotNull Continuation<? super Unit> continuation) {
        DataImporters dataImporters = this.importers;
        if (dVarArr == null) {
            dVarArr = r80.d.values();
        }
        Object objRefreshData = dataImporters.refreshData(dVarArr, continuation);
        return objRefreshData == CoroutineSingletons.f71806a ? objRefreshData : Unit.f71706a;
    }

    @Override // r80.l
    @Nullable
    public Object refreshUsageStats(long j11, @NotNull Continuation<? super Unit> continuation) {
        this.appUsageUpdater.updateUsageStats(j11);
        return Unit.f71706a;
    }

    @Override // r80.l
    public void registerAndroidListeners(@NotNull j0 scope) {
        Intrinsics.g(scope, "scope");
        unregisterAndroidListeners();
        ArrayList arrayList = new ArrayList();
        try {
            arrayList.add(m0.t(scope, null, null, new SesameLiteImpl$registerAndroidListeners$appOpsListenerJob$1(ListenersKt.getAppOpsChangeFlow(this.appOpsManager, ul.b.Q("android:read_contacts", "android:get_usage_stats")), this, scope, null), 3));
        } catch (Exception e3) {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 1) {
                log.getWriter().error("SSML-FrontEnd", e3, "Could not register appOpsChangeFlow");
            }
        }
        if (Utils.INSTANCE.hasPermission(this.context, "android.permission.READ_CONTACTS")) {
            arrayList.add(m0.t(scope, null, null, new SesameLiteImpl$registerAndroidListeners$contactsJob$1(this, null), 3));
        }
        try {
            arrayList.add(m0.t(scope, null, null, new SesameLiteImpl$registerAndroidListeners$dialerChangedJob$1(this, null), 3));
        } catch (Exception e11) {
            r80.p log2 = State.INSTANCE.getLog();
            int iOrdinal2 = log2.getLevel().ordinal();
            r80.o oVar2 = r80.o.f85697a;
            if (iOrdinal2 >= 1) {
                log2.getWriter().error("SSML-FrontEnd", e11, "Could not register dialer broadcastReceiverFlow");
            }
        }
        this.listenerJobs = arrayList;
    }

    public void resetDatabase() {
        getDb().reset();
        this.prefs.putLong("app_usage_state_last_updated", -1L);
    }

    @Override // r80.l
    @NotNull
    public r80.x[] search(final long matchingType, @NotNull String query, @Nullable String pkgName, @NotNull final EnumSet<r80.d> types, final boolean useTypoMatching, int maxShortcutCount, @Nullable long[] userSerials, int maxUsageTimesCount, @NotNull final r80.b[] contactActionTypes) {
        String[] strArr;
        Intrinsics.g(query, "query");
        Intrinsics.g(types, "types");
        Intrinsics.g(contactActionTypes, "contactActionTypes");
        try {
            if (query.length() != 0 && maxShortcutCount != 0) {
                String[] strArrK = r80.k.k(query);
                if (strArrK.length == 0) {
                    return new r80.x[0];
                }
                int i5 = maxShortcutCount < 0 ? LayoutNode.NotPlacedPlaceOrder : maxShortcutCount;
                boolean z11 = types.size() == 1 && types.contains(r80.d.f85655b);
                State state = State.INSTANCE;
                r80.p log = state.getLog();
                int iOrdinal = log.getLevel().ordinal();
                r80.o oVar = r80.o.f85697a;
                if (iOrdinal >= 3) {
                    strArr = strArrK;
                    log.getWriter().debug("SSML-FrontEnd", "Search: queries=[" + kotlin.collections.c.O0(strArrK, null, null, null, null, 63) + "], pkgName=" + pkgName + ", queryTypes=[" + b70.g.f1(types, null, null, null, 0, null, 63) + "], contactActionTypes=[" + kotlin.collections.c.O0(contactActionTypes, null, null, null, null, 63) + "], isAppSearch=" + z11 + " maxResultCount=" + i5 + ", userSerials=" + (userSerials != null ? kotlin.collections.c.N0(userSerials) : null));
                } else {
                    strArr = strArrK;
                }
                if (types.isEmpty()) {
                    return new r80.x[0];
                }
                final int i11 = maxUsageTimesCount < 0 ? LayoutNode.NotPlacedPlaceOrder : maxUsageTimesCount;
                final long jCurrentTimeMillis = System.currentTimeMillis();
                long jNanoTime = System.nanoTime();
                final int i12 = i5;
                final boolean z12 = z11;
                final String[] strArr2 = strArr;
                try {
                    r80.x[] xVarArr = (r80.x[]) getDb().readTx(new Function1() { // from class: nova.branch.engage.sesame_lite.internal.u
                        @Override // kotlin.jvm.functions.Function1
                        public final Object invoke(Object obj) {
                            return SesameLiteImpl.search$lambda$50(types, contactActionTypes, this, i11, jCurrentTimeMillis, i12, strArr2, z12, matchingType, useTypoMatching, (DbView) obj);
                        }
                    });
                    long jNanoTime2 = System.nanoTime() - jNanoTime;
                    try {
                        recordElapsedTime(jNanoTime2 / 1000000.0d);
                        r80.p log2 = state.getLog();
                        if (log2.getLevel().ordinal() < 3) {
                            return xVarArr;
                        }
                        log2.getWriter().debug("SSML-FrontEnd", "Search returning " + xVarArr.length + " shortcuts: elapsed: " + Strs.INSTANCE.formatDuration(jNanoTime2));
                        return xVarArr;
                    } catch (Throwable th2) {
                        th = th2;
                        r80.p log3 = State.INSTANCE.getLog();
                        int iOrdinal2 = log3.getLevel().ordinal();
                        r80.o oVar2 = r80.o.f85697a;
                        if (iOrdinal2 >= 1) {
                            log3.getWriter().error("SSML-FrontEnd", th);
                        }
                        return new r80.x[0];
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            }
            return new r80.x[0];
        } catch (Throwable th4) {
            th = th4;
        }
    }

    @Nullable
    public r80.x searchMore(@NotNull String query, @NotNull final SearchMoreType[] types, boolean allowWebFallback) {
        final boolean z11;
        Intrinsics.g(query, "query");
        Intrinsics.g(types, "types");
        try {
            final String strEncode = Uri.encode(r70.k.u1(query).toString());
            State state = State.INSTANCE;
            r80.p log = state.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 3) {
                r80.n writer = log.getWriter();
                String strO0 = kotlin.collections.c.O0(types, null, null, null, null, 63);
                StringBuilder sb2 = new StringBuilder("SearchMore: query=[");
                sb2.append(strEncode);
                sb2.append("], types=[");
                sb2.append(strO0);
                sb2.append("], allowWebFallback=");
                z11 = allowWebFallback;
                sb2.append(z11);
                sb2.append("]");
                writer.debug("SSML-FrontEnd", sb2.toString());
            } else {
                z11 = allowWebFallback;
            }
            Intrinsics.d(strEncode);
            if (strEncode.length() != 0 && types.length != 0) {
                long jNanoTime = System.nanoTime();
                final long jCurrentTimeMillis = System.currentTimeMillis();
                final long currentUserId = this.userHandleDataSource.getCurrentUserId();
                final ArrayList arrayList = new ArrayList(types.length);
                r80.y[] yVarArr = (r80.y[]) getDb().readTx(new Function1() { // from class: nova.branch.engage.sesame_lite.internal.w
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj) {
                        return SesameLiteImpl.searchMore$lambda$58(types, currentUserId, this, arrayList, z11, strEncode, jCurrentTimeMillis, (DbView) obj);
                    }
                });
                IdHash.Companion companion = IdHash.INSTANCE;
                r80.d dVar = r80.d.f85657d;
                IdHash idHashM448ofKY3lZgs$default = IdHash.Companion.m448ofKY3lZgs$default(companion, dVar, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1L, (byte) 0, 16, null);
                r80.y yVar = new r80.y(idHashM448ofKY3lZgs$default, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1L, dVar, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, new long[0], new long[0], new r80.v(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, idHashM448ofKY3lZgs$default));
                r80.x xVar = new r80.x("SEARCH_MORE", yVar.f(), "Search \"" + r70.k.u1(query).toString() + "\" in...", "Search \"<b>" + r70.k.u1(query).toString() + "</b>\" in...", 0.0d, new int[0], new int[0], false, 0.0d, 0.0d, yVar, yVarArr, null);
                r80.p log2 = state.getLog();
                if (log2.getLevel().ordinal() >= 3) {
                    log2.getWriter().debug("SSML-FrontEnd", "SearchMore returning " + yVarArr.length + " SearchMore actions: elapsed: " + Strs.INSTANCE.formatDuration(System.nanoTime() - jNanoTime));
                }
                return xVar;
            }
        } catch (Throwable th2) {
            r80.p log3 = State.INSTANCE.getLog();
            int iOrdinal2 = log3.getLevel().ordinal();
            r80.o oVar2 = r80.o.f85697a;
            if (iOrdinal2 >= 1) {
                log3.getWriter().error("SSML-FrontEnd", th2);
            }
        }
        return null;
    }

    @Override // r80.l
    @NotNull
    public r80.x[] suggestedLinks(@Nullable final String groupId, @NotNull final EnumSet<r80.d> types, @Nullable final long[] userSerial, int maxUsageTimesCount, final int maxResultCount, @NotNull final r80.b[] contactActionTypes, @NotNull final z sortingModel) {
        Intrinsics.g(types, "types");
        Intrinsics.g(contactActionTypes, "contactActionTypes");
        Intrinsics.g(sortingModel, "sortingModel");
        try {
            if (types.isEmpty()) {
                return new r80.x[0];
            }
            final int i5 = maxUsageTimesCount < 0 ? Integer.MAX_VALUE : maxUsageTimesCount;
            long jNanoTime = System.nanoTime();
            final long jCurrentTimeMillis = System.currentTimeMillis();
            try {
                r80.x[] xVarArr = (r80.x[]) getDb().readTx(new Function1() { // from class: nova.branch.engage.sesame_lite.internal.t
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj) {
                        return SesameLiteImpl.suggestedLinks$lambda$32(this.f78450a, sortingModel, groupId, types, maxResultCount, userSerial, jCurrentTimeMillis, contactActionTypes, i5, (DbView) obj);
                    }
                });
                long jNanoTime2 = System.nanoTime() - jNanoTime;
                try {
                    recordElapsedTime(jNanoTime2 / 1000000.0d);
                    r80.p log = State.INSTANCE.getLog();
                    int iOrdinal = log.getLevel().ordinal();
                    r80.o oVar = r80.o.f85697a;
                    if (iOrdinal < 3) {
                        return xVarArr;
                    }
                    log.getWriter().debug("SSML-FrontEnd", "SuggestedLinks returning " + xVarArr.length + " shortcuts: elapsed: " + Strs.INSTANCE.formatDuration(jNanoTime2));
                    return xVarArr;
                } catch (Throwable th2) {
                    th = th2;
                    r80.p log2 = State.INSTANCE.getLog();
                    int iOrdinal2 = log2.getLevel().ordinal();
                    r80.o oVar2 = r80.o.f85697a;
                    if (iOrdinal2 >= 1) {
                        log2.getWriter().error("SSML-FrontEnd", th);
                    }
                    return new r80.x[0];
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    public void unregisterAndroidListeners() {
        r80.p log = State.INSTANCE.getLog();
        int iOrdinal = log.getLevel().ordinal();
        r80.o oVar = r80.o.f85697a;
        if (iOrdinal >= 3) {
            log.getWriter().debug("SSML-FrontEnd", "Removing listeners");
        }
        List<? extends r1> list = this.listenerJobs;
        this.listenerJobs = EmptyList.f71733a;
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            ((r1) it.next()).c(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x01b2  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0039  */
    @Override // r80.l
    @NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public r80.x[] zeroState(@Nullable final String groupId, @NotNull final EnumSet<r80.d> types, @Nullable final long[] userSerials, int maxViewedCount_clicked, int maxViewedCount_unclicked, int maxUsageTimesCount, @NotNull final String[] fallbacks, @NotNull final r80.b[] contactActionTypes, @NotNull final List<? extends z> resultSlots, @NotNull j0 recordViewCountScope) {
        String str;
        int i5;
        int iOrdinal;
        String str2;
        List list;
        Intrinsics.g(types, "types");
        Intrinsics.g(fallbacks, "fallbacks");
        Intrinsics.g(contactActionTypes, "contactActionTypes");
        Intrinsics.g(resultSlots, "resultSlots");
        Intrinsics.g(recordViewCountScope, "recordViewCountScope");
        try {
            if (!resultSlots.isEmpty()) {
                try {
                    if (types.isEmpty()) {
                        str = "SSML-FrontEnd";
                        i5 = 0;
                        try {
                            return new r80.x[0];
                        } catch (Throwable th2) {
                            th = th2;
                        }
                    } else {
                        final int size = resultSlots.size();
                        List listP0 = b70.g.P0(resultSlots);
                        if (types.size() == 1) {
                            try {
                                boolean z11 = types.contains(r80.d.f85655b);
                                int i11 = maxUsageTimesCount < 0 ? Integer.MAX_VALUE : maxUsageTimesCount;
                                State state = State.INSTANCE;
                                r80.p log = state.getLog();
                                int iOrdinal2 = log.getLevel().ordinal();
                                r80.o oVar = r80.o.f85697a;
                                if (iOrdinal2 >= 3) {
                                    r80.n writer = log.getWriter();
                                    str2 = "ZeroState returning ";
                                    list = listP0;
                                    String strF1 = b70.g.f1(types, null, null, null, 0, null, 63);
                                    String strO0 = kotlin.collections.c.O0(contactActionTypes, null, null, null, null, 63);
                                    String strN0 = userSerials != null ? kotlin.collections.c.N0(userSerials) : null;
                                    writer.debug("SSML-FrontEnd", "ZeroState: groupId=" + groupId + ", types=[" + strF1 + "], contactActionTypes=[" + strO0 + "], maxResultCount=" + size + ", sortingModels=[" + list + "] userSerials=" + strN0 + ", fallbacksCount=" + fallbacks.length);
                                } else {
                                    str2 = "ZeroState returning ";
                                    list = listP0;
                                }
                                long jNanoTime = System.nanoTime();
                                final long jCurrentTimeMillis = System.currentTimeMillis();
                                final LinkedHashSet linkedHashSet = new LinkedHashSet();
                                final List list2 = list;
                                final boolean z12 = z11;
                                final int i12 = i11;
                                try {
                                    r80.x[] xVarArr = (r80.x[]) getDb().readTx(new Function1() { // from class: nova.branch.engage.sesame_lite.internal.o
                                        @Override // kotlin.jvm.functions.Function1
                                        public final Object invoke(Object obj) {
                                            return SesameLiteImpl.zeroState$lambda$30(list2, resultSlots, z12, size, userSerials, groupId, types, fallbacks, contactActionTypes, this, i12, jCurrentTimeMillis, linkedHashSet, (DbView) obj);
                                        }
                                    });
                                    if (!linkedHashSet.isEmpty() && groupId == null) {
                                        a80.e eVar = y0.f88884a;
                                        m0.t(recordViewCountScope, a80.d.f488c, null, new AnonymousClass2(linkedHashSet, null), 2);
                                    }
                                    long jNanoTime2 = System.nanoTime() - jNanoTime;
                                    recordElapsedTime(jNanoTime2 / 1000000.0d);
                                    r80.p log2 = state.getLog();
                                    if (log2.getLevel().ordinal() < 3) {
                                        return xVarArr;
                                    }
                                    str = "SSML-FrontEnd";
                                    try {
                                        log2.getWriter().debug(str, str2 + xVarArr.length + " shortcuts: elapsed: " + Strs.INSTANCE.formatDuration(jNanoTime2));
                                        return xVarArr;
                                    } catch (Throwable th3) {
                                        th = th3;
                                        i5 = 0;
                                        r80.p log3 = State.INSTANCE.getLog();
                                        iOrdinal = log3.getLevel().ordinal();
                                        r80.o oVar2 = r80.o.f85697a;
                                        if (iOrdinal >= 1) {
                                        }
                                        return new r80.x[i5];
                                    }
                                } catch (Throwable th4) {
                                    th = th4;
                                    str = "SSML-FrontEnd";
                                }
                            } catch (Throwable th5) {
                                th = th5;
                                str = "SSML-FrontEnd";
                                i5 = 0;
                            }
                        }
                    }
                } catch (Throwable th6) {
                    th = th6;
                    str = "SSML-FrontEnd";
                }
            }
        } catch (Throwable th7) {
            th = th7;
            str = "SSML-FrontEnd";
            i5 = 0;
        }
        r80.p log32 = State.INSTANCE.getLog();
        iOrdinal = log32.getLevel().ordinal();
        r80.o oVar22 = r80.o.f85697a;
        if (iOrdinal >= 1) {
            log32.getWriter().error(str, th);
        }
        return new r80.x[i5];
    }

    @Override // r80.l
    @Nullable
    public Object recordShortcutOpen(@NotNull IdHash idHash, @Nullable String str, @NotNull r80.j jVar, @NotNull Continuation<? super Boolean> continuation) {
        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        try {
            getDb().writeTx(new b10.r(this, idHash, jVar, booleanRef, 18));
        } catch (Throwable th2) {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 1) {
                log.getWriter().error("SSML-FrontEnd", th2);
            }
        }
        return Boolean.valueOf(booleanRef.f71859a);
    }

    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0011\b\u0082\b\u0018\u00002\u00020\u0001B=\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0012\u0010\u0010\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0012\u0010\u0012\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017JH\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\nHÆ\u0001¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001b\u001a\u00020\u001aHÖ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001e\u001a\u00020\u001dHÖ\u0001¢\u0006\u0004\b\u001e\u0010\u001fJ\u001a\u0010\"\u001a\u00020!2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\"\u0010#R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010$\u001a\u0004\b%\u0010\u000fR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010&\u001a\u0004\b'\u0010\u0011R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010(\u001a\u0004\b)\u0010\u0013R\"\u0010\t\u001a\u00020\b8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\t\u0010*\u001a\u0004\b+\u0010\u0015\"\u0004\b,\u0010-R$\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u000b\u0010.\u001a\u0004\b/\u0010\u0017\"\u0004\b0\u00101¨\u00062"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$SearchMoreJoinedResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lnova/branch/engage/sesame_lite/internal/SearchMoreType;", TTConst.TRACK_TYPE, "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "appLink", "Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "usage", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "searchTimesScore", "Lr80/y;", "action", "<init>", "(Lnova/branch/engage/sesame_lite/internal/SearchMoreType;Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lnova/branch/engage/sesame_lite/internal/LinkUsage;DLr80/y;)V", "component1", "()Lnova/branch/engage/sesame_lite/internal/SearchMoreType;", "component2", "()Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "component3", "()Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "component4", "()D", "component5", "()Lr80/y;", "copy", "(Lnova/branch/engage/sesame_lite/internal/SearchMoreType;Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lnova/branch/engage/sesame_lite/internal/LinkUsage;DLr80/y;)Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$SearchMoreJoinedResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "()I", InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "equals", "(Ljava/lang/Object;)Z", "Lnova/branch/engage/sesame_lite/internal/SearchMoreType;", "getType", "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "getAppLink", "Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "getUsage", "D", "getSearchTimesScore", "setSearchTimesScore", "(D)V", "Lr80/y;", "getAction", "setAction", "(Lr80/y;)V", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final /* data */ class SearchMoreJoinedResult {

        @Nullable
        private r80.y action;

        @Nullable
        private final LinkEntity appLink;
        private double searchTimesScore;

        @NotNull
        private final SearchMoreType type;

        @Nullable
        private final LinkUsage usage;

        public SearchMoreJoinedResult(@NotNull SearchMoreType type, @Nullable LinkEntity linkEntity, @Nullable LinkUsage linkUsage, double d5, @Nullable r80.y yVar) {
            Intrinsics.g(type, "type");
            this.type = type;
            this.appLink = linkEntity;
            this.usage = linkUsage;
            this.searchTimesScore = d5;
            this.action = yVar;
        }

        public static /* synthetic */ SearchMoreJoinedResult copy$default(SearchMoreJoinedResult searchMoreJoinedResult, SearchMoreType searchMoreType, LinkEntity linkEntity, LinkUsage linkUsage, double d5, r80.y yVar, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                searchMoreType = searchMoreJoinedResult.type;
            }
            if ((i5 & 2) != 0) {
                linkEntity = searchMoreJoinedResult.appLink;
            }
            if ((i5 & 4) != 0) {
                linkUsage = searchMoreJoinedResult.usage;
            }
            if ((i5 & 8) != 0) {
                d5 = searchMoreJoinedResult.searchTimesScore;
            }
            if ((i5 & 16) != 0) {
                yVar = searchMoreJoinedResult.action;
            }
            r80.y yVar2 = yVar;
            LinkUsage linkUsage2 = linkUsage;
            return searchMoreJoinedResult.copy(searchMoreType, linkEntity, linkUsage2, d5, yVar2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final SearchMoreType getType() {
            return this.type;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final LinkEntity getAppLink() {
            return this.appLink;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final LinkUsage getUsage() {
            return this.usage;
        }

        /* renamed from: component4, reason: from getter */
        public final double getSearchTimesScore() {
            return this.searchTimesScore;
        }

        @Nullable
        /* renamed from: component5, reason: from getter */
        public final r80.y getAction() {
            return this.action;
        }

        @NotNull
        public final SearchMoreJoinedResult copy(@NotNull SearchMoreType type, @Nullable LinkEntity appLink, @Nullable LinkUsage usage, double searchTimesScore, @Nullable r80.y action) {
            Intrinsics.g(type, "type");
            return new SearchMoreJoinedResult(type, appLink, usage, searchTimesScore, action);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SearchMoreJoinedResult)) {
                return false;
            }
            SearchMoreJoinedResult searchMoreJoinedResult = (SearchMoreJoinedResult) other;
            return this.type == searchMoreJoinedResult.type && Intrinsics.b(this.appLink, searchMoreJoinedResult.appLink) && Intrinsics.b(this.usage, searchMoreJoinedResult.usage) && Double.compare(this.searchTimesScore, searchMoreJoinedResult.searchTimesScore) == 0 && Intrinsics.b(this.action, searchMoreJoinedResult.action);
        }

        @Nullable
        public final r80.y getAction() {
            return this.action;
        }

        @Nullable
        public final LinkEntity getAppLink() {
            return this.appLink;
        }

        public final double getSearchTimesScore() {
            return this.searchTimesScore;
        }

        @NotNull
        public final SearchMoreType getType() {
            return this.type;
        }

        @Nullable
        public final LinkUsage getUsage() {
            return this.usage;
        }

        public int hashCode() {
            int iHashCode = this.type.hashCode() * 31;
            LinkEntity linkEntity = this.appLink;
            int iHashCode2 = (iHashCode + (linkEntity == null ? 0 : linkEntity.hashCode())) * 31;
            LinkUsage linkUsage = this.usage;
            int iC = c9.c(this.searchTimesScore, (iHashCode2 + (linkUsage == null ? 0 : linkUsage.hashCode())) * 31, 31);
            r80.y yVar = this.action;
            return iC + (yVar != null ? yVar.hashCode() : 0);
        }

        public final void setAction(@Nullable r80.y yVar) {
            this.action = yVar;
        }

        public final void setSearchTimesScore(double d5) {
            this.searchTimesScore = d5;
        }

        @NotNull
        public String toString() {
            return "SearchMoreJoinedResult(type=" + this.type + ", appLink=" + this.appLink + ", usage=" + this.usage + ", searchTimesScore=" + this.searchTimesScore + ", action=" + this.action + ")";
        }

        public /* synthetic */ SearchMoreJoinedResult(SearchMoreType searchMoreType, LinkEntity linkEntity, LinkUsage linkUsage, double d5, r80.y yVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(searchMoreType, (i5 & 2) != 0 ? null : linkEntity, (i5 & 4) != 0 ? null : linkUsage, (i5 & 8) != 0 ? -1.0d : d5, (i5 & 16) != 0 ? null : yVar);
        }
    }

    @NotNull
    public r80.x[] get(@NotNull String packageName, long userSerial, @NotNull EnumSet<r80.d> types, int maxUsageTimesCount, @NotNull r80.b[] contactActionTypes) {
        long j11;
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(types, "types");
        Intrinsics.g(contactActionTypes, "contactActionTypes");
        try {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 3) {
                r80.n writer = log.getWriter();
                String strF1 = b70.g.f1(types, null, null, null, 0, null, 63);
                String strO0 = kotlin.collections.c.O0(contactActionTypes, null, null, null, null, 63);
                StringBuilder sb2 = new StringBuilder("Get: packageName=[");
                sb2.append(packageName);
                sb2.append("], userSerial=");
                j11 = userSerial;
                sb2.append(j11);
                sb2.append(", types=[");
                sb2.append(strF1);
                sb2.append("], maxUsageTimesCount=");
                sb2.append(maxUsageTimesCount);
                sb2.append(", contactActionTypes=[");
                sb2.append(strO0);
                sb2.append("]");
                writer.debug("SSML-FrontEnd", sb2.toString());
            } else {
                j11 = userSerial;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            return internalGet(maxUsageTimesCount, contactActionTypes, new g0(packageName, j11, types, 1));
        } catch (Throwable th3) {
            th = th3;
            r80.p log2 = State.INSTANCE.getLog();
            int iOrdinal2 = log2.getLevel().ordinal();
            r80.o oVar2 = r80.o.f85697a;
            if (iOrdinal2 >= 1) {
                log2.getWriter().error("SSML-FrontEnd", th);
            }
            return new r80.x[0];
        }
    }

    @Metadata(d1 = {"\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\u0015\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u001d\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b0\b\u0080\b\u0018\u0000 p2\u00020\u0001:\u0001pB»\u0001\u0012\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n\u0012\b\b\u0002\u0010\f\u001a\u00020\n\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r\u0012\b\b\u0002\u0010\u000f\u001a\u00020\r\u0012\b\b\u0002\u0010\u0010\u001a\u00020\n\u0012\b\b\u0002\u0010\u0011\u001a\u00020\n\u0012\b\b\u0002\u0010\u0012\u001a\u00020\n\u0012\b\b\u0002\u0010\u0014\u001a\u00020\u0013\u0012\b\b\u0002\u0010\u0015\u001a\u00020\u0013\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\b\b\u0002\u0010\u0018\u001a\u00020\n\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019¢\u0006\u0004\b\u001b\u0010\u001cJ\u001d\u0010!\u001a\u00020 2\u0006\u0010\u001d\u001a\u00020\u00162\u0006\u0010\u001f\u001a\u00020\u001e¢\u0006\u0004\b!\u0010\"J\u0012\u0010#\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b%\u0010&J\u0012\u0010'\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b'\u0010(J\u0012\u0010)\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b)\u0010&J\u0012\u0010*\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b*\u0010(J\u0010\u0010+\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b+\u0010,J\u0010\u0010-\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b-\u0010,J\u0010\u0010.\u001a\u00020\rHÆ\u0003¢\u0006\u0004\b.\u0010/J\u0010\u00100\u001a\u00020\rHÆ\u0003¢\u0006\u0004\b0\u0010/J\u0010\u00101\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b1\u0010,J\u0010\u00102\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b2\u0010,J\u0010\u00103\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b3\u0010,J\u0010\u00104\u001a\u00020\u0013HÆ\u0003¢\u0006\u0004\b4\u00105J\u0010\u00106\u001a\u00020\u0013HÆ\u0003¢\u0006\u0004\b6\u00105J\u0012\u00107\u001a\u0004\u0018\u00010\u0016HÆ\u0003¢\u0006\u0004\b7\u00108J\u0010\u00109\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b9\u0010,J\u0012\u0010:\u001a\u0004\u0018\u00010\u0019HÆ\u0003¢\u0006\u0004\b:\u0010;JÆ\u0001\u0010<\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\u000b\u001a\u00020\n2\b\b\u0002\u0010\f\u001a\u00020\n2\b\b\u0002\u0010\u000e\u001a\u00020\r2\b\b\u0002\u0010\u000f\u001a\u00020\r2\b\b\u0002\u0010\u0010\u001a\u00020\n2\b\b\u0002\u0010\u0011\u001a\u00020\n2\b\b\u0002\u0010\u0012\u001a\u00020\n2\b\b\u0002\u0010\u0014\u001a\u00020\u00132\b\b\u0002\u0010\u0015\u001a\u00020\u00132\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\b\b\u0002\u0010\u0018\u001a\u00020\n2\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÆ\u0001¢\u0006\u0004\b<\u0010=J\u0010\u0010?\u001a\u00020>HÖ\u0001¢\u0006\u0004\b?\u0010@J\u0010\u0010B\u001a\u00020AHÖ\u0001¢\u0006\u0004\bB\u0010CJ\u001a\u0010E\u001a\u00020\u00132\b\u0010D\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\bE\u0010FR$\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0003\u0010G\u001a\u0004\bH\u0010$\"\u0004\bI\u0010JR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010K\u001a\u0004\bL\u0010&R$\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0007\u0010M\u001a\u0004\bN\u0010(\"\u0004\bO\u0010PR$\u0010\b\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\b\u0010K\u001a\u0004\bQ\u0010&\"\u0004\bR\u0010SR$\u0010\t\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\t\u0010M\u001a\u0004\bT\u0010(\"\u0004\bU\u0010PR\"\u0010\u000b\u001a\u00020\n8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u000b\u0010V\u001a\u0004\bW\u0010,\"\u0004\bX\u0010YR\"\u0010\f\u001a\u00020\n8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\f\u0010V\u001a\u0004\bZ\u0010,\"\u0004\b[\u0010YR\u0017\u0010\u000e\u001a\u00020\r8\u0006¢\u0006\f\n\u0004\b\u000e\u0010\\\u001a\u0004\b]\u0010/R\u0017\u0010\u000f\u001a\u00020\r8\u0006¢\u0006\f\n\u0004\b\u000f\u0010\\\u001a\u0004\b^\u0010/R\u0017\u0010\u0010\u001a\u00020\n8\u0006¢\u0006\f\n\u0004\b\u0010\u0010V\u001a\u0004\b_\u0010,R\"\u0010\u0011\u001a\u00020\n8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0011\u0010V\u001a\u0004\b`\u0010,\"\u0004\ba\u0010YR\"\u0010\u0012\u001a\u00020\n8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0012\u0010V\u001a\u0004\bb\u0010,\"\u0004\bc\u0010YR\u0017\u0010\u0014\u001a\u00020\u00138\u0006¢\u0006\f\n\u0004\b\u0014\u0010d\u001a\u0004\b\u0014\u00105R\u0017\u0010\u0015\u001a\u00020\u00138\u0006¢\u0006\f\n\u0004\b\u0015\u0010d\u001a\u0004\b\u0015\u00105R$\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0017\u0010e\u001a\u0004\bf\u00108\"\u0004\bg\u0010hR\"\u0010\u0018\u001a\u00020\n8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0018\u0010V\u001a\u0004\bi\u0010,\"\u0004\bj\u0010YR$\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u001a\u0010k\u001a\u0004\bl\u0010;\"\u0004\bm\u0010nR\u0014\u0010o\u001a\u00020\n8\u0002X\u0082D¢\u0006\u0006\n\u0004\bo\u0010V¨\u0006q"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lnova/branch/engage/sesame_lite/internal/SearchableLabel;", "alias", "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "entity", "Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "usage", "parentEntity", "parentUsage", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "parentSearchTimesScore", "parentUsageTimesScore", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "matches", "typos", "matchScore", "searchTimesScore", "usageTimesScore", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isSubstringMatch", "isExactMatch", "Lr80/z;", "sortingModel", "sortingModelScore", "Lr80/x;", "shortcut", "<init>", "(Lnova/branch/engage/sesame_lite/internal/SearchableLabel;Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lnova/branch/engage/sesame_lite/internal/LinkUsage;Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lnova/branch/engage/sesame_lite/internal/LinkUsage;DD[I[IDDDZZLr80/z;DLr80/x;)V", "model", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "now", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "calculateSortingModelScore", "(Lr80/z;J)V", "component1", "()Lnova/branch/engage/sesame_lite/internal/SearchableLabel;", "component2", "()Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "component3", "()Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "component4", "component5", "component6", "()D", "component7", "component8", "()[I", "component9", "component10", "component11", "component12", "component13", "()Z", "component14", "component15", "()Lr80/z;", "component16", "component17", "()Lr80/x;", "copy", "(Lnova/branch/engage/sesame_lite/internal/SearchableLabel;Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lnova/branch/engage/sesame_lite/internal/LinkUsage;Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lnova/branch/engage/sesame_lite/internal/LinkUsage;DD[I[IDDDZZLr80/z;DLr80/x;)Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "()I", InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "Lnova/branch/engage/sesame_lite/internal/SearchableLabel;", "getAlias", "setAlias", "(Lnova/branch/engage/sesame_lite/internal/SearchableLabel;)V", "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "getEntity", "Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "getUsage", "setUsage", "(Lnova/branch/engage/sesame_lite/internal/LinkUsage;)V", "getParentEntity", "setParentEntity", "(Lnova/branch/engage/sesame_lite/internal/LinkEntity;)V", "getParentUsage", "setParentUsage", "D", "getParentSearchTimesScore", "setParentSearchTimesScore", "(D)V", "getParentUsageTimesScore", "setParentUsageTimesScore", "[I", "getMatches", "getTypos", "getMatchScore", "getSearchTimesScore", "setSearchTimesScore", "getUsageTimesScore", "setUsageTimesScore", "Z", "Lr80/z;", "getSortingModel", "setSortingModel", "(Lr80/z;)V", "getSortingModelScore", "setSortingModelScore", "Lr80/x;", "getShortcut", "setShortcut", "(Lr80/x;)V", "USAGE_SCORE_PENALTY_FOR_REQUENCY", "SortingComparator", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final /* data */ class JoinedResult {

        /* renamed from: SortingComparator, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion(null);
        private final double USAGE_SCORE_PENALTY_FOR_REQUENCY;

        @Nullable
        private SearchableLabel alias;

        @NotNull
        private final LinkEntity entity;
        private final boolean isExactMatch;
        private final boolean isSubstringMatch;
        private final double matchScore;

        @NotNull
        private final int[] matches;

        @Nullable
        private LinkEntity parentEntity;
        private double parentSearchTimesScore;

        @Nullable
        private LinkUsage parentUsage;
        private double parentUsageTimesScore;
        private double searchTimesScore;

        @Nullable
        private r80.x shortcut;

        @Nullable
        private z sortingModel;
        private double sortingModelScore;

        @NotNull
        private final int[] typos;

        @Nullable
        private LinkUsage usage;
        private double usageTimesScore;

        @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u0012\u0012\u0004\u0012\u00020\u00020\u0001j\b\u0012\u0004\u0012\u00020\u0002`\u0003B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0018\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\u0002H\u0016¨\u0006\n"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult$SortingComparator;", "Ljava/util/Comparator;", "Lnova/branch/engage/sesame_lite/internal/SesameLiteImpl$JoinedResult;", "Lkotlin/Comparator;", "<init>", "()V", "compare", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lhs", "rhs", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        /* renamed from: nova.branch.engage.sesame_lite.internal.SesameLiteImpl$JoinedResult$SortingComparator, reason: from kotlin metadata */
        public static final class Companion implements Comparator<JoinedResult> {
            public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }

            private Companion() {
            }

            @Override // java.util.Comparator
            public int compare(@NotNull JoinedResult lhs, @NotNull JoinedResult rhs) {
                int iCompareTo;
                Intrinsics.g(lhs, "lhs");
                Intrinsics.g(rhs, "rhs");
                if (lhs.getUsage() != null && rhs.getUsage() != null) {
                    iCompareTo = Double.compare(lhs.getSortingModelScore(), rhs.getSortingModelScore());
                } else {
                    if (lhs.getUsage() == null && rhs.getUsage() != null) {
                        return 1;
                    }
                    if (lhs.getUsage() != null && rhs.getUsage() == null) {
                        return -1;
                    }
                    iCompareTo = ((SearchableLabel) b70.g.W0(lhs.getEntity().getSearchableLabels())).getDisplayLabel().compareTo(((SearchableLabel) b70.g.W0(rhs.getEntity().getSearchableLabels())).getDisplayLabel());
                }
                return iCompareTo * (-1);
            }
        }

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[z.values().length];
                try {
                    z zVar = z.f85741a;
                    iArr[2] = 1;
                } catch (NoSuchFieldError unused) {
                }
                try {
                    z zVar2 = z.f85741a;
                    iArr[0] = 2;
                } catch (NoSuchFieldError unused2) {
                }
                try {
                    z zVar3 = z.f85741a;
                    iArr[1] = 3;
                } catch (NoSuchFieldError unused3) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        public JoinedResult(@Nullable SearchableLabel searchableLabel, @NotNull LinkEntity entity, @Nullable LinkUsage linkUsage, @Nullable LinkEntity linkEntity, @Nullable LinkUsage linkUsage2, double d5, double d11, @NotNull int[] matches, @NotNull int[] typos, double d12, double d13, double d14, boolean z11, boolean z12, @Nullable z zVar, double d15, @Nullable r80.x xVar) {
            Intrinsics.g(entity, "entity");
            Intrinsics.g(matches, "matches");
            Intrinsics.g(typos, "typos");
            this.alias = searchableLabel;
            this.entity = entity;
            this.usage = linkUsage;
            this.parentEntity = linkEntity;
            this.parentUsage = linkUsage2;
            this.parentSearchTimesScore = d5;
            this.parentUsageTimesScore = d11;
            this.matches = matches;
            this.typos = typos;
            this.matchScore = d12;
            this.searchTimesScore = d13;
            this.usageTimesScore = d14;
            this.isSubstringMatch = z11;
            this.isExactMatch = z12;
            this.sortingModel = zVar;
            this.sortingModelScore = d15;
            this.shortcut = xVar;
            this.USAGE_SCORE_PENALTY_FOR_REQUENCY = 0.004d;
        }

        public static /* synthetic */ JoinedResult copy$default(JoinedResult joinedResult, SearchableLabel searchableLabel, LinkEntity linkEntity, LinkUsage linkUsage, LinkEntity linkEntity2, LinkUsage linkUsage2, double d5, double d11, int[] iArr, int[] iArr2, double d12, double d13, double d14, boolean z11, boolean z12, z zVar, double d15, r80.x xVar, int i5, Object obj) {
            r80.x xVar2;
            double d16;
            SearchableLabel searchableLabel2 = (i5 & 1) != 0 ? joinedResult.alias : searchableLabel;
            LinkEntity linkEntity3 = (i5 & 2) != 0 ? joinedResult.entity : linkEntity;
            LinkUsage linkUsage3 = (i5 & 4) != 0 ? joinedResult.usage : linkUsage;
            LinkEntity linkEntity4 = (i5 & 8) != 0 ? joinedResult.parentEntity : linkEntity2;
            LinkUsage linkUsage4 = (i5 & 16) != 0 ? joinedResult.parentUsage : linkUsage2;
            double d17 = (i5 & 32) != 0 ? joinedResult.parentSearchTimesScore : d5;
            double d18 = (i5 & 64) != 0 ? joinedResult.parentUsageTimesScore : d11;
            int[] iArr3 = (i5 & 128) != 0 ? joinedResult.matches : iArr;
            int[] iArr4 = (i5 & 256) != 0 ? joinedResult.typos : iArr2;
            double d19 = (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? joinedResult.matchScore : d12;
            SearchableLabel searchableLabel3 = searchableLabel2;
            LinkEntity linkEntity5 = linkEntity3;
            double d21 = (i5 & 1024) != 0 ? joinedResult.searchTimesScore : d13;
            double d22 = (i5 & 2048) != 0 ? joinedResult.usageTimesScore : d14;
            boolean z13 = (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? joinedResult.isSubstringMatch : z11;
            double d23 = d22;
            boolean z14 = (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? joinedResult.isExactMatch : z12;
            z zVar2 = (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? joinedResult.sortingModel : zVar;
            boolean z15 = z14;
            double d24 = (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? joinedResult.sortingModelScore : d15;
            if ((i5 & SQLiteDatabase.OPEN_FULLMUTEX) != 0) {
                d16 = d24;
                xVar2 = joinedResult.shortcut;
            } else {
                xVar2 = xVar;
                d16 = d24;
            }
            return joinedResult.copy(searchableLabel3, linkEntity5, linkUsage3, linkEntity4, linkUsage4, d17, d18, iArr3, iArr4, d19, d21, d23, z13, z15, zVar2, d16, xVar2);
        }

        public final void calculateSortingModelScore(@NotNull z model, long now) {
            long[] usageStatsTimes;
            long[] clickTimes;
            double d5;
            double d11;
            double d12;
            Intrinsics.g(model, "model");
            LinkUsage linkUsage = this.usage;
            if (linkUsage == null || (usageStatsTimes = linkUsage.getUsageStatsTimes()) == null) {
                usageStatsTimes = new long[0];
            }
            LinkUsage linkUsage2 = this.usage;
            if (linkUsage2 == null || (clickTimes = linkUsage2.getClickTimes()) == null) {
                clickTimes = new long[0];
            }
            int[] iArr = WhenMappings.$EnumSwitchMapping$0;
            if (iArr[model.ordinal()] == 1) {
                this.usageTimesScore = r80.k.a(usageStatsTimes, now);
                this.searchTimesScore = r80.k.a(clickTimes, now);
            } else {
                this.usageTimesScore = r80.k.b(usageStatsTimes, now);
                this.searchTimesScore = r80.k.b(clickTimes, now);
            }
            int i5 = iArr[model.ordinal()];
            if (i5 == 1) {
                d5 = this.usageTimesScore;
                d11 = this.searchTimesScore;
            } else if (i5 == 2) {
                d12 = this.usage != null ? r8.getMaxEngagementTime() : -1.0d;
                this.sortingModelScore = d12;
            } else {
                if (i5 != 3) {
                    throw new NoWhenBranchMatchedException();
                }
                d5 = this.usageTimesScore * this.USAGE_SCORE_PENALTY_FOR_REQUENCY;
                d11 = this.searchTimesScore;
            }
            d12 = d5 + d11;
            this.sortingModelScore = d12;
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final SearchableLabel getAlias() {
            return this.alias;
        }

        /* renamed from: component10, reason: from getter */
        public final double getMatchScore() {
            return this.matchScore;
        }

        /* renamed from: component11, reason: from getter */
        public final double getSearchTimesScore() {
            return this.searchTimesScore;
        }

        /* renamed from: component12, reason: from getter */
        public final double getUsageTimesScore() {
            return this.usageTimesScore;
        }

        /* renamed from: component13, reason: from getter */
        public final boolean getIsSubstringMatch() {
            return this.isSubstringMatch;
        }

        /* renamed from: component14, reason: from getter */
        public final boolean getIsExactMatch() {
            return this.isExactMatch;
        }

        @Nullable
        /* renamed from: component15, reason: from getter */
        public final z getSortingModel() {
            return this.sortingModel;
        }

        /* renamed from: component16, reason: from getter */
        public final double getSortingModelScore() {
            return this.sortingModelScore;
        }

        @Nullable
        /* renamed from: component17, reason: from getter */
        public final r80.x getShortcut() {
            return this.shortcut;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final LinkEntity getEntity() {
            return this.entity;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final LinkUsage getUsage() {
            return this.usage;
        }

        @Nullable
        /* renamed from: component4, reason: from getter */
        public final LinkEntity getParentEntity() {
            return this.parentEntity;
        }

        @Nullable
        /* renamed from: component5, reason: from getter */
        public final LinkUsage getParentUsage() {
            return this.parentUsage;
        }

        /* renamed from: component6, reason: from getter */
        public final double getParentSearchTimesScore() {
            return this.parentSearchTimesScore;
        }

        /* renamed from: component7, reason: from getter */
        public final double getParentUsageTimesScore() {
            return this.parentUsageTimesScore;
        }

        @NotNull
        /* renamed from: component8, reason: from getter */
        public final int[] getMatches() {
            return this.matches;
        }

        @NotNull
        /* renamed from: component9, reason: from getter */
        public final int[] getTypos() {
            return this.typos;
        }

        @NotNull
        public final JoinedResult copy(@Nullable SearchableLabel alias, @NotNull LinkEntity entity, @Nullable LinkUsage usage, @Nullable LinkEntity parentEntity, @Nullable LinkUsage parentUsage, double parentSearchTimesScore, double parentUsageTimesScore, @NotNull int[] matches, @NotNull int[] typos, double matchScore, double searchTimesScore, double usageTimesScore, boolean isSubstringMatch, boolean isExactMatch, @Nullable z sortingModel, double sortingModelScore, @Nullable r80.x shortcut) {
            Intrinsics.g(entity, "entity");
            Intrinsics.g(matches, "matches");
            Intrinsics.g(typos, "typos");
            return new JoinedResult(alias, entity, usage, parentEntity, parentUsage, parentSearchTimesScore, parentUsageTimesScore, matches, typos, matchScore, searchTimesScore, usageTimesScore, isSubstringMatch, isExactMatch, sortingModel, sortingModelScore, shortcut);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof JoinedResult)) {
                return false;
            }
            JoinedResult joinedResult = (JoinedResult) other;
            return Intrinsics.b(this.alias, joinedResult.alias) && Intrinsics.b(this.entity, joinedResult.entity) && Intrinsics.b(this.usage, joinedResult.usage) && Intrinsics.b(this.parentEntity, joinedResult.parentEntity) && Intrinsics.b(this.parentUsage, joinedResult.parentUsage) && Double.compare(this.parentSearchTimesScore, joinedResult.parentSearchTimesScore) == 0 && Double.compare(this.parentUsageTimesScore, joinedResult.parentUsageTimesScore) == 0 && Intrinsics.b(this.matches, joinedResult.matches) && Intrinsics.b(this.typos, joinedResult.typos) && Double.compare(this.matchScore, joinedResult.matchScore) == 0 && Double.compare(this.searchTimesScore, joinedResult.searchTimesScore) == 0 && Double.compare(this.usageTimesScore, joinedResult.usageTimesScore) == 0 && this.isSubstringMatch == joinedResult.isSubstringMatch && this.isExactMatch == joinedResult.isExactMatch && this.sortingModel == joinedResult.sortingModel && Double.compare(this.sortingModelScore, joinedResult.sortingModelScore) == 0 && Intrinsics.b(this.shortcut, joinedResult.shortcut);
        }

        @Nullable
        public final SearchableLabel getAlias() {
            return this.alias;
        }

        @NotNull
        public final LinkEntity getEntity() {
            return this.entity;
        }

        public final double getMatchScore() {
            return this.matchScore;
        }

        @NotNull
        public final int[] getMatches() {
            return this.matches;
        }

        @Nullable
        public final LinkEntity getParentEntity() {
            return this.parentEntity;
        }

        public final double getParentSearchTimesScore() {
            return this.parentSearchTimesScore;
        }

        @Nullable
        public final LinkUsage getParentUsage() {
            return this.parentUsage;
        }

        public final double getParentUsageTimesScore() {
            return this.parentUsageTimesScore;
        }

        public final double getSearchTimesScore() {
            return this.searchTimesScore;
        }

        @Nullable
        public final r80.x getShortcut() {
            return this.shortcut;
        }

        @Nullable
        public final z getSortingModel() {
            return this.sortingModel;
        }

        public final double getSortingModelScore() {
            return this.sortingModelScore;
        }

        @NotNull
        public final int[] getTypos() {
            return this.typos;
        }

        @Nullable
        public final LinkUsage getUsage() {
            return this.usage;
        }

        public final double getUsageTimesScore() {
            return this.usageTimesScore;
        }

        public int hashCode() {
            SearchableLabel searchableLabel = this.alias;
            int iHashCode = (this.entity.hashCode() + ((searchableLabel == null ? 0 : searchableLabel.hashCode()) * 31)) * 31;
            LinkUsage linkUsage = this.usage;
            int iHashCode2 = (iHashCode + (linkUsage == null ? 0 : linkUsage.hashCode())) * 31;
            LinkEntity linkEntity = this.parentEntity;
            int iHashCode3 = (iHashCode2 + (linkEntity == null ? 0 : linkEntity.hashCode())) * 31;
            LinkUsage linkUsage2 = this.parentUsage;
            int iF = c9.f(c9.f(c9.c(this.usageTimesScore, c9.c(this.searchTimesScore, c9.c(this.matchScore, (Arrays.hashCode(this.typos) + ((Arrays.hashCode(this.matches) + c9.c(this.parentUsageTimesScore, c9.c(this.parentSearchTimesScore, (iHashCode3 + (linkUsage2 == null ? 0 : linkUsage2.hashCode())) * 31, 31), 31)) * 31)) * 31, 31), 31), 31), 31, this.isSubstringMatch), 31, this.isExactMatch);
            z zVar = this.sortingModel;
            int iC = c9.c(this.sortingModelScore, (iF + (zVar == null ? 0 : zVar.hashCode())) * 31, 31);
            r80.x xVar = this.shortcut;
            return iC + (xVar != null ? xVar.hashCode() : 0);
        }

        public final boolean isExactMatch() {
            return this.isExactMatch;
        }

        public final boolean isSubstringMatch() {
            return this.isSubstringMatch;
        }

        public final void setAlias(@Nullable SearchableLabel searchableLabel) {
            this.alias = searchableLabel;
        }

        public final void setParentEntity(@Nullable LinkEntity linkEntity) {
            this.parentEntity = linkEntity;
        }

        public final void setParentSearchTimesScore(double d5) {
            this.parentSearchTimesScore = d5;
        }

        public final void setParentUsage(@Nullable LinkUsage linkUsage) {
            this.parentUsage = linkUsage;
        }

        public final void setParentUsageTimesScore(double d5) {
            this.parentUsageTimesScore = d5;
        }

        public final void setSearchTimesScore(double d5) {
            this.searchTimesScore = d5;
        }

        public final void setShortcut(@Nullable r80.x xVar) {
            this.shortcut = xVar;
        }

        public final void setSortingModel(@Nullable z zVar) {
            this.sortingModel = zVar;
        }

        public final void setSortingModelScore(double d5) {
            this.sortingModelScore = d5;
        }

        public final void setUsage(@Nullable LinkUsage linkUsage) {
            this.usage = linkUsage;
        }

        public final void setUsageTimesScore(double d5) {
            this.usageTimesScore = d5;
        }

        @NotNull
        public String toString() {
            SearchableLabel searchableLabel = this.alias;
            LinkEntity linkEntity = this.entity;
            LinkUsage linkUsage = this.usage;
            LinkEntity linkEntity2 = this.parentEntity;
            LinkUsage linkUsage2 = this.parentUsage;
            double d5 = this.parentSearchTimesScore;
            double d11 = this.parentUsageTimesScore;
            String string = Arrays.toString(this.matches);
            String string2 = Arrays.toString(this.typos);
            double d12 = this.matchScore;
            double d13 = this.searchTimesScore;
            double d14 = this.usageTimesScore;
            boolean z11 = this.isSubstringMatch;
            boolean z12 = this.isExactMatch;
            z zVar = this.sortingModel;
            double d15 = this.sortingModelScore;
            r80.x xVar = this.shortcut;
            StringBuilder sb2 = new StringBuilder("JoinedResult(alias=");
            sb2.append(searchableLabel);
            sb2.append(", entity=");
            sb2.append(linkEntity);
            sb2.append(", usage=");
            sb2.append(linkUsage);
            sb2.append(", parentEntity=");
            sb2.append(linkEntity2);
            sb2.append(", parentUsage=");
            sb2.append(linkUsage2);
            sb2.append(", parentSearchTimesScore=");
            sb2.append(d5);
            sb2.append(", parentUsageTimesScore=");
            sb2.append(d11);
            sb2.append(", matches=");
            c0.D(sb2, string, ", typos=", string2, ", matchScore=");
            sb2.append(d12);
            sb2.append(", searchTimesScore=");
            sb2.append(d13);
            sb2.append(", usageTimesScore=");
            sb2.append(d14);
            sb2.append(", isSubstringMatch=");
            sb2.append(z11);
            sb2.append(", isExactMatch=");
            sb2.append(z12);
            sb2.append(", sortingModel=");
            sb2.append(zVar);
            sb2.append(", sortingModelScore=");
            sb2.append(d15);
            sb2.append(", shortcut=");
            sb2.append(xVar);
            sb2.append(")");
            return sb2.toString();
        }

        public /* synthetic */ JoinedResult(SearchableLabel searchableLabel, LinkEntity linkEntity, LinkUsage linkUsage, LinkEntity linkEntity2, LinkUsage linkUsage2, double d5, double d11, int[] iArr, int[] iArr2, double d12, double d13, double d14, boolean z11, boolean z12, z zVar, double d15, r80.x xVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? null : searchableLabel, linkEntity, (i5 & 4) != 0 ? null : linkUsage, (i5 & 8) != 0 ? null : linkEntity2, (i5 & 16) != 0 ? null : linkUsage2, (i5 & 32) != 0 ? -1.0d : d5, (i5 & 64) != 0 ? -1.0d : d11, (i5 & 128) != 0 ? new int[0] : iArr, (i5 & 256) != 0 ? new int[0] : iArr2, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? -1.0d : d12, (i5 & 1024) != 0 ? -1.0d : d13, (i5 & 2048) != 0 ? -1.0d : d14, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? false : z11, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? false : z12, (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : zVar, (32768 & i5) != 0 ? -1.0d : d15, (i5 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? null : xVar);
        }
    }

    public /* synthetic */ SesameLiteImpl(Context context, Prefs prefs, Pkgs pkgs, DB db2, DataImporters dataImporters, AppUsageUpdater appUsageUpdater, AppOpsManager appOpsManager, ContentResolver contentResolver, boolean z11, UserHandleDataSource userHandleDataSource, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, prefs, pkgs, db2, dataImporters, appUsageUpdater, appOpsManager, contentResolver, (i5 & 256) != 0 ? false : z11, userHandleDataSource);
    }
}
