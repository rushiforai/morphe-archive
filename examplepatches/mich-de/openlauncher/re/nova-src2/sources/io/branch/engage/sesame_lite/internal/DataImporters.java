package io.branch.engage.sesame_lite.internal;

import ab.e0;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import b.c0;
import b.u4;
import b70.g;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.vungle.ads.internal.protos.Sdk;
import h6.c1;
import io.branch.engage.sesame_lite.internal.DataImporters;
import io.branch.engage.sesame_lite.internal.IdHash;
import io.branch.engage.sesame_lite.internal.data.UserHandleDataSource;
import io.branch.engage.sesame_lite.internal.ingest.IngestibleAlias;
import io.branch.engage.sesame_lite.internal.ingest.IngestibleAndroidApp;
import io.branch.engage.sesame_lite.internal.ingest.IngestibleAndroidAppActivity;
import io.branch.engage.sesame_lite.internal.ingest.IngestibleAndroidAppShortcut;
import io.branch.engage.sesame_lite.internal.stores.AliasEntity;
import io.branch.engage.sesame_lite.internal.stores.AliasStore;
import io.branch.engage.sesame_lite.internal.stores.IgnoreEntity;
import io.branch.engage.sesame_lite.internal.stores.IgnoreStore;
import io.branch.engage.sesame_lite.internal.stores.LinkStore;
import io.branch.engage.sesame_lite.internal.stores.UsageStore;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.y0;
import u40.j;
import u40.l;

@Metadata(d1 = {"\u0000\u0086\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u001e\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\t\n\u0000\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0016\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 H2\u00020\u0001:\u0001HB7\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ%\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0011\u001a\u00020\u00102\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012H\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u001f\u0010\u001a\u001a\u00020\u00152\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0019\u001a\u00020\u0018H\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u0013\u0010\u001e\u001a\u00020\u001d*\u00020\u001cH\u0002¢\u0006\u0004\b\u001e\u0010\u001fJ\u0015\u0010 \u001a\u00020\u00152\u0006\u0010\u0019\u001a\u00020\u0018¢\u0006\u0004\b \u0010!J)\u0010&\u001a\u00020\u00152\u0006\u0010#\u001a\u00020\"2\f\u0010%\u001a\b\u0012\u0004\u0012\u00020\u00180$H\u0086@ø\u0001\u0000¢\u0006\u0004\b&\u0010'J!\u0010*\u001a\u00020\u00152\f\u0010)\u001a\b\u0012\u0004\u0012\u00020(0\u0012H\u0086@ø\u0001\u0000¢\u0006\u0004\b*\u0010+J!\u0010/\u001a\u00020\u001d2\u0006\u0010,\u001a\u00020\u00132\n\b\u0002\u0010.\u001a\u0004\u0018\u00010-¢\u0006\u0004\b/\u00100J\u0015\u00101\u001a\u00020\u001d2\u0006\u0010,\u001a\u00020\u0013¢\u0006\u0004\b1\u00102J1\u00105\u001a\u00020\u001d2\f\u00103\u001a\b\u0012\u0004\u0012\u00020\u00130\u00122\n\b\u0002\u0010.\u001a\u0004\u0018\u00010-2\b\b\u0002\u00104\u001a\u00020\u001d¢\u0006\u0004\b5\u00106J\r\u00107\u001a\u00020\u0015¢\u0006\u0004\b7\u00108J\u0013\u00109\u001a\u00020\u0015H\u0086@ø\u0001\u0000¢\u0006\u0004\b9\u0010:J-\u0010?\u001a\u00020>2\u0006\u0010;\u001a\u00020\u00132\b\b\u0002\u0010#\u001a\u00020\"2\f\u0010=\u001a\b\u0012\u0004\u0012\u00020<0$¢\u0006\u0004\b?\u0010@J-\u0010A\u001a\u00020>2\u0006\u0010;\u001a\u00020\u00132\b\b\u0002\u0010#\u001a\u00020\"2\f\u0010=\u001a\b\u0012\u0004\u0012\u00020<0$¢\u0006\u0004\bA\u0010@R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010BR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010CR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010DR\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010ER\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010FR\u0014\u0010\r\u001a\u00020\f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010G\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006I"}, d2 = {"Lio/branch/engage/sesame_lite/internal/DataImporters;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/content/Context;", "context", "Lio/branch/engage/sesame_lite/internal/DB;", "db", "Lio/branch/engage/sesame_lite/internal/Prefs;", "prefs", "Landroid/content/pm/PackageManager;", "packageManager", "Lio/branch/engage/sesame_lite/internal/AppUsageUpdater;", "appUsageUpdater", "Lio/branch/engage/sesame_lite/internal/data/UserHandleDataSource;", "userHandleDataSource", "<init>", "(Landroid/content/Context;Lio/branch/engage/sesame_lite/internal/DB;Lio/branch/engage/sesame_lite/internal/Prefs;Landroid/content/pm/PackageManager;Lio/branch/engage/sesame_lite/internal/AppUsageUpdater;Lio/branch/engage/sesame_lite/internal/data/UserHandleDataSource;)V", "Lio/branch/engage/sesame_lite/internal/DbView;", "dbView", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageNames", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "updateLinksForAliases", "(Lio/branch/engage/sesame_lite/internal/DbView;Ljava/util/Collection;)V", "Lio/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidApp;", "app", "updateLinkStore", "(Lio/branch/engage/sesame_lite/internal/DbView;Lio/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidApp;)V", "Lio/branch/engage/sesame_lite/internal/SearchMoreType;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hasValidLink", "(Lio/branch/engage/sesame_lite/internal/SearchMoreType;)Z", "ingestAndroidApp", "(Lio/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidApp;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userSerial", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "allApps", "ingestAndPurgeOrphans", "(JLjava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lu40/d;", "searchAliases", "ingestPersistableSearchAliases", "(Ljava/util/Collection;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "packageName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userSerials", "markPackageIgnored", "(Ljava/lang/String;[J)Z", "unmarkPackageIgnored", "(Ljava/lang/String;)Z", "ignoredList", "overwrite", "syncIgnoredPackages", "(Ljava/util/Collection;[JZ)Z", "pullStaticNavigations", "()V", "refreshData", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "groupId", "Lv40/b;", "links", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ingestApiLinks", "(Ljava/lang/String;JLjava/util/List;)I", "ingestCustomLinks", "Landroid/content/Context;", "Lio/branch/engage/sesame_lite/internal/DB;", "Lio/branch/engage/sesame_lite/internal/Prefs;", "Landroid/content/pm/PackageManager;", "Lio/branch/engage/sesame_lite/internal/AppUsageUpdater;", "Lio/branch/engage/sesame_lite/internal/data/UserHandleDataSource;", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class DataImporters {

    @NotNull
    private static final String TAG = "SSML-Importer";

    @NotNull
    private final AppUsageUpdater appUsageUpdater;

    @NotNull
    private final Context context;

    @NotNull
    private final DB db;

    @NotNull
    private final PackageManager packageManager;

    @NotNull
    private final Prefs prefs;

    @NotNull
    private final UserHandleDataSource userHandleDataSource;

    @Metadata(d1 = {"\u0000)\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0004*\u0001\u0000\b\u008a\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\t¢\u0006\u0002\u0010\nJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\u0014\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00030\tHÆ\u0003¢\u0006\u0002\u0010\fJF\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00032\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\tHÆ\u0001¢\u0006\u0002\u0010\u001aJ\u0013\u0010\u001b\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001e\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0019\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\t¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u000f¨\u0006 "}, d2 = {"io/branch/engage/sesame_lite/internal/DataImporters$pullStaticNavigations$StaticNav", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "idTag", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "labelRes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "iconRes", "intentUri", "featureCheck", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;IILjava/lang/String;[Ljava/lang/String;)V", "getFeatureCheck", "()[Ljava/lang/String;", "[Ljava/lang/String;", "getIconRes", "()I", "getIdTag", "()Ljava/lang/String;", "getIntentUri", "getLabelRes", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;IILjava/lang/String;[Ljava/lang/String;)Lio/branch/engage/sesame_lite/internal/DataImporters$pullStaticNavigations$StaticNav;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final /* data */ class StaticNav {

        @NotNull
        private final String[] featureCheck;
        private final int iconRes;

        @NotNull
        private final String idTag;

        @NotNull
        private final String intentUri;
        private final int labelRes;

        public StaticNav(@NotNull String idTag, int i5, int i11, @NotNull String intentUri, @NotNull String[] featureCheck) {
            Intrinsics.g(idTag, "idTag");
            Intrinsics.g(intentUri, "intentUri");
            Intrinsics.g(featureCheck, "featureCheck");
            this.idTag = idTag;
            this.labelRes = i5;
            this.iconRes = i11;
            this.intentUri = intentUri;
            this.featureCheck = featureCheck;
        }

        public static /* synthetic */ StaticNav copy$default(StaticNav staticNav, String str, int i5, int i11, String str2, String[] strArr, int i12, Object obj) {
            if ((i12 & 1) != 0) {
                str = staticNav.idTag;
            }
            if ((i12 & 2) != 0) {
                i5 = staticNav.labelRes;
            }
            if ((i12 & 4) != 0) {
                i11 = staticNav.iconRes;
            }
            if ((i12 & 8) != 0) {
                str2 = staticNav.intentUri;
            }
            if ((i12 & 16) != 0) {
                strArr = staticNav.featureCheck;
            }
            String[] strArr2 = strArr;
            int i13 = i11;
            return staticNav.copy(str, i5, i13, str2, strArr2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getIdTag() {
            return this.idTag;
        }

        /* renamed from: component2, reason: from getter */
        public final int getLabelRes() {
            return this.labelRes;
        }

        /* renamed from: component3, reason: from getter */
        public final int getIconRes() {
            return this.iconRes;
        }

        @NotNull
        /* renamed from: component4, reason: from getter */
        public final String getIntentUri() {
            return this.intentUri;
        }

        @NotNull
        /* renamed from: component5, reason: from getter */
        public final String[] getFeatureCheck() {
            return this.featureCheck;
        }

        @NotNull
        public final StaticNav copy(@NotNull String idTag, int labelRes, int iconRes, @NotNull String intentUri, @NotNull String[] featureCheck) {
            Intrinsics.g(idTag, "idTag");
            Intrinsics.g(intentUri, "intentUri");
            Intrinsics.g(featureCheck, "featureCheck");
            return new StaticNav(idTag, labelRes, iconRes, intentUri, featureCheck);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof StaticNav)) {
                return false;
            }
            StaticNav staticNav = (StaticNav) other;
            return Intrinsics.b(this.idTag, staticNav.idTag) && this.labelRes == staticNav.labelRes && this.iconRes == staticNav.iconRes && Intrinsics.b(this.intentUri, staticNav.intentUri) && Intrinsics.b(this.featureCheck, staticNav.featureCheck);
        }

        @NotNull
        public final String[] getFeatureCheck() {
            return this.featureCheck;
        }

        public final int getIconRes() {
            return this.iconRes;
        }

        @NotNull
        public final String getIdTag() {
            return this.idTag;
        }

        @NotNull
        public final String getIntentUri() {
            return this.intentUri;
        }

        public final int getLabelRes() {
            return this.labelRes;
        }

        public int hashCode() {
            return c0.e(u4.a(this.iconRes, u4.a(this.labelRes, this.idTag.hashCode() * 31, 31), 31), 31, this.intentUri) + Arrays.hashCode(this.featureCheck);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("StaticNav(idTag=");
            sb2.append(this.idTag);
            sb2.append(", labelRes=");
            sb2.append(this.labelRes);
            sb2.append(", iconRes=");
            sb2.append(this.iconRes);
            sb2.append(", intentUri=");
            sb2.append(this.intentUri);
            sb2.append(", featureCheck=");
            return c1.t(sb2, Arrays.toString(this.featureCheck), ')');
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 7, 1})
    @DebugMetadata(c = "io.branch.engage.sesame_lite.internal.DataImporters$refreshData$2", f = "DataImporters.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.engage.sesame_lite.internal.DataImporters$refreshData$2, reason: invalid class name and case insensitive filesystem */
    public static final class C30332 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C30332(Continuation<? super C30332> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return DataImporters.this.new C30332(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            DB db2 = DataImporters.this.db;
            final DataImporters dataImporters = DataImporters.this;
            db2.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.refreshData.2.1
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final WriteBack invoke(@NotNull DbView readView) {
                    Intrinsics.g(readView, "readView");
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    final LinkStore linkStore = readView.getLinkStore();
                    UsageStore usageStore = readView.getUsageStore();
                    dataImporters.pullStaticNavigations();
                    long jCurrentTimeMillis2 = System.currentTimeMillis() - 604800000;
                    l log = State.INSTANCE.getLog();
                    if (log.getLevel().ordinal() >= 3) {
                        j writer = log.getWriter();
                        StringBuilder sb2 = new StringBuilder("Starting database cleanup, including removing deactivated entities older than ");
                        sb2.append(Strs.INSTANCE.formatTimestamp(jCurrentTimeMillis2));
                        sb2.append(" [");
                        writer.debug(DataImporters.TAG, a2.c.n(sb2, jCurrentTimeMillis2, AbstractJsonLexerKt.END_LIST));
                    }
                    List list = LinkStore.get$default(linkStore, (long[]) null, (EnumSet) null, (Set) null, (Set) null, 15, (Object) null);
                    ArrayList arrayList = new ArrayList();
                    for (Object obj2 : list) {
                        long expirationOn = ((LinkEntity) obj2).getExpirationOn();
                        if (1 <= expirationOn && expirationOn <= jCurrentTimeMillis) {
                            arrayList.add(obj2);
                        }
                    }
                    ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        arrayList2.add(((LinkEntity) it.next()).getIdHash());
                    }
                    ArrayList arrayListK1 = g.K1(usageStore.get((Collection) arrayList2));
                    b70.d.E0(arrayListK1, new Function1<LinkUsage, Boolean>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.refreshData.2.1.2
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        @NotNull
                        public final Boolean invoke(@NotNull LinkUsage usage) {
                            Intrinsics.g(usage, "usage");
                            LinkEntity linkEntity = linkStore.get((LinkStore) usage.getIdHash());
                            return Boolean.valueOf((linkEntity != null ? linkEntity.getType() : null) == u40.a.f90555d);
                        }
                    });
                    linkStore.remove(arrayList);
                    usageStore.remove(arrayListK1);
                    List list2 = LinkStore.get$default(linkStore, (long[]) null, (EnumSet) null, (Set) null, (Set) null, 15, (Object) null);
                    ArrayList arrayList3 = new ArrayList(b70.c.u0(list2, 10));
                    Iterator it2 = list2.iterator();
                    while (it2.hasNext()) {
                        arrayList3.add(((LinkEntity) it2.next()).getIdHash());
                    }
                    Set setN1 = g.N1(arrayList3);
                    Collection<LinkUsage> collectionValues = usageStore.get().values();
                    ArrayList arrayList4 = new ArrayList();
                    for (LinkUsage linkUsage : collectionValues) {
                        boolean zContains = setN1.contains(linkUsage.getIdHash());
                        boolean z11 = linkUsage.getIdHash().getType() == u40.a.f90555d;
                        if (zContains || z11) {
                            linkUsage = null;
                        }
                        if (linkUsage != null) {
                            arrayList4.add(linkUsage);
                        }
                    }
                    usageStore.remove(arrayList4);
                    l log2 = State.INSTANCE.getLog();
                    if (log2.getLevel().ordinal() >= 3) {
                        log2.getWriter().debug(DataImporters.TAG, "Removed " + arrayList.size() + " expired links, " + arrayListK1.size() + " expired usages, and " + arrayList4.size() + " orphaned usages");
                    }
                    dataImporters.appUsageUpdater.updateUsageStats(jCurrentTimeMillis);
                    return new WriteBack(readView);
                }
            });
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C30332) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public DataImporters(@NotNull Context context, @NotNull DB db2, @NotNull Prefs prefs, @NotNull PackageManager packageManager, @NotNull AppUsageUpdater appUsageUpdater, @NotNull UserHandleDataSource userHandleDataSource) {
        Intrinsics.g(context, "context");
        Intrinsics.g(db2, "db");
        Intrinsics.g(prefs, "prefs");
        Intrinsics.g(packageManager, "packageManager");
        Intrinsics.g(appUsageUpdater, "appUsageUpdater");
        Intrinsics.g(userHandleDataSource, "userHandleDataSource");
        this.context = context;
        this.db = db2;
        this.prefs = prefs;
        this.packageManager = packageManager;
        this.appUsageUpdater = appUsageUpdater;
        this.userHandleDataSource = userHandleDataSource;
    }

    private final boolean hasValidLink(SearchMoreType searchMoreType) throws URISyntaxException {
        Intrinsics.f(this.packageManager.queryIntentActivities(Intent.parseUri(searchMoreType.getAppTemplate(), 1), SQLiteDatabase.OPEN_SHAREDCACHE), "packageManager.queryInte…PackageManager.MATCH_ALL)");
        return !r4.isEmpty();
    }

    public static /* synthetic */ int ingestApiLinks$default(DataImporters dataImporters, String str, long j11, List list, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = -1;
        }
        return dataImporters.ingestApiLinks(str, j11, list);
    }

    public static /* synthetic */ int ingestCustomLinks$default(DataImporters dataImporters, String str, long j11, List list, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = -1;
        }
        return dataImporters.ingestCustomLinks(str, j11, list);
    }

    public static /* synthetic */ boolean markPackageIgnored$default(DataImporters dataImporters, String str, long[] jArr, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            jArr = null;
        }
        return dataImporters.markPackageIgnored(str, jArr);
    }

    public static /* synthetic */ boolean syncIgnoredPackages$default(DataImporters dataImporters, Collection collection, long[] jArr, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            jArr = null;
        }
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        return dataImporters.syncIgnoredPackages(collection, jArr, z11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:47:0x01e6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void updateLinkStore(DbView dbView, IngestibleAndroidApp app) throws URISyntaxException {
        SearchMoreType searchMoreType;
        LinkEntity linkEntityM324copyVIp7_1Y;
        LinkEntity linkEntity;
        List<IngestibleAndroidAppShortcut> allShortcuts;
        LinkStore linkStore = dbView.getLinkStore();
        List<IngestibleAndroidAppActivity> allActivities = app.getAllActivities();
        if (allActivities != null && allActivities.isEmpty() && (allShortcuts = app.getAllShortcuts()) != null && allShortcuts.isEmpty()) {
            EnumSet<u40.a> enumSetNoneOf = EnumSet.noneOf(u40.a.class);
            enumSetNoneOf.add(u40.a.f90553b);
            enumSetNoneOf.addAll(u40.a.f90552a);
            List<LinkEntity> list = linkStore.get(app.getPackageName(), app.getUserSerial(), enumSetNoneOf);
            l log = State.INSTANCE.getLog();
            if (log.getLevel().ordinal() >= 3) {
                log.getWriter().debug(TAG, "Removing " + list.size() + " LinkEntities for packageName=" + app.getPackageName() + ", userSerial=" + app.getUserSerial());
            }
            linkStore.remove(list);
            return;
        }
        EnumSet<u40.a> replaceTypes = EnumSet.noneOf(u40.a.class);
        if (app.getAllActivities() != null) {
            replaceTypes.add(u40.a.f90553b);
        }
        if (app.getAllShortcuts() != null) {
            replaceTypes.add(u40.a.f90554c);
        }
        Intrinsics.f(replaceTypes, "replaceTypes");
        if (!replaceTypes.isEmpty()) {
            linkStore.remove(linkStore.get(app.getPackageName(), app.getUserSerial(), replaceTypes));
        }
        List<IngestibleAndroidAppActivity> allActivities2 = app.getAllActivities();
        if (allActivities2 != null) {
            for (IngestibleAndroidAppActivity ingestibleAndroidAppActivity : allActivities2) {
                ComponentName componentName = new ComponentName(app.getPackageName(), ingestibleAndroidAppActivity.getClassName());
                List<IngestibleAlias> aliases = ingestibleAndroidAppActivity.getAliases();
                ArrayList arrayList = new ArrayList(b70.c.u0(aliases, 10));
                for (IngestibleAlias ingestibleAlias : aliases) {
                    arrayList.add(new SearchAlias(ingestibleAlias.getMatch(), ingestibleAlias.getDisplayOverride(), false, 4, (DefaultConstructorMarker) null));
                }
                Set setM1 = g.M1(arrayList);
                Collection<AliasEntity> forPackage = dbView.getAliasStore().getForPackage(app.getPackageName());
                ArrayList arrayList2 = new ArrayList(b70.c.u0(forPackage, 10));
                for (AliasEntity aliasEntity : forPackage) {
                    arrayList2.add(new SearchAlias(aliasEntity.getMatch(), aliasEntity.getDisplayOverride(), true));
                }
                setM1.addAll(arrayList2);
                IdHash.Companion companion = IdHash.INSTANCE;
                String packageName = app.getPackageName();
                String className = componentName.getClassName();
                Intrinsics.f(className, "cn.className");
                IdHash idHashOfAppComponent = companion.ofAppComponent(packageName, className, app.getUserSerial());
                String packageName2 = app.getPackageName();
                String className2 = componentName.getClassName();
                Intrinsics.f(className2, "cn.className");
                linkStore.put((LinkStore) new LinkEntity(idHashOfAppComponent, packageName2, className2, app.getUserSerial(), (String) null, ingestibleAndroidAppActivity.getLabel(), 0L, (String) null, (String) null, 0L, g.I1(setM1), 976, (DefaultConstructorMarker) null));
            }
        }
        List<IngestibleAndroidAppShortcut> allShortcuts2 = app.getAllShortcuts();
        int i5 = 0;
        if (allShortcuts2 != null) {
            LinkEntity defaultComponent = linkStore.getDefaultComponent(app.getPackageName(), app.getUserSerial());
            for (IngestibleAndroidAppShortcut ingestibleAndroidAppShortcut : allShortcuts2) {
                String label = ingestibleAndroidAppShortcut.getLabel();
                String activityClass = ingestibleAndroidAppShortcut.getActivityClass();
                if (activityClass != null) {
                    Set<String> setU = e0.U(app.getPackageName());
                    EnumSet<u40.a> enumSetOf = EnumSet.of(u40.a.f90553b);
                    long[] jArr = {app.getUserSerial()};
                    Set<String> setU2 = e0.U(activityClass);
                    Intrinsics.f(enumSetOf, "of(LinkType.APP_COMPONENT)");
                    linkEntity = (LinkEntity) g.Y0(linkStore.get(jArr, enumSetOf, setU, setU2));
                    if (linkEntity == null) {
                        linkEntity = defaultComponent;
                    }
                }
                if (linkEntity != null) {
                    linkStore.put((LinkStore) new LinkEntity(IdHash.INSTANCE.ofShortcut(ingestibleAndroidAppShortcut.getShortcutId(), app.getPackageName(), app.getUserSerial()), app.getPackageName(), ingestibleAndroidAppShortcut.getShortcutId(), app.getUserSerial(), linkEntity.getDisplayLabel(), label, 0L, (String) null, (String) null, DeveloperShortcutTypeFlags.INSTANCE.m315ofrIm0iQ4(ingestibleAndroidAppShortcut.getIsDynamic()), (List) null, 1472, (DefaultConstructorMarker) null));
                }
            }
        }
        SearchMoreType[] searchMoreTypeArrValues = SearchMoreType.values();
        int length = searchMoreTypeArrValues.length;
        while (true) {
            if (i5 >= length) {
                searchMoreType = null;
                break;
            }
            searchMoreType = searchMoreTypeArrValues[i5];
            if (Intrinsics.b(searchMoreType.getPackageName(), app.getPackageName())) {
                break;
            } else {
                i5++;
            }
        }
        SearchMoreType searchMoreType2 = searchMoreType;
        if (searchMoreType2 != null) {
            String packageName3 = searchMoreType2.getPackageName();
            u40.a aVar = u40.a.f90555d;
            List list2 = LinkStore.get$default(linkStore, packageName3, 0L, EnumSet.of(aVar), 2, null);
            boolean zHasValidLink = hasValidLink(searchMoreType2);
            if (!zHasValidLink || !list2.isEmpty()) {
                if (zHasValidLink || list2.isEmpty()) {
                    return;
                }
                linkStore.remove(LinkStore.get$default(linkStore, searchMoreType2.getPackageName(), 0L, EnumSet.of(aVar), 2, null));
                return;
            }
            LinkEntity linkEntity2 = (LinkEntity) g.Y0(LinkStore.get$default(linkStore, searchMoreType2.getPackageName(), 0L, EnumSet.of(u40.a.f90553b), 2, null));
            if (linkEntity2 == null || (linkEntityM324copyVIp7_1Y = linkEntity2.m324copyVIp7_1Y((1790 & 1) != 0 ? linkEntity2.getIdHash() : searchMoreType2.getIdHash(), (1790 & 2) != 0 ? linkEntity2.groupId : null, (1790 & 4) != 0 ? linkEntity2.typeSpecificKey : null, (1790 & 8) != 0 ? linkEntity2.userSerial : 0L, (1790 & 16) != 0 ? linkEntity2.displayLabelPrefix : null, (1790 & 32) != 0 ? linkEntity2.displayLabel : null, (1790 & 64) != 0 ? linkEntity2.expirationOn : 0L, (1790 & 128) != 0 ? linkEntity2.customIconUri : null, (1790 & 256) != 0 ? linkEntity2.intentUri : searchMoreType2.getAppTemplate(), (1790 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? linkEntity2.typeSpecificFlags : 0L, (1790 & 1024) != 0 ? linkEntity2.aliases : null)) == null) {
                return;
            }
            linkStore.put((LinkStore) linkEntityM324copyVIp7_1Y);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateLinksForAliases(DbView dbView, Collection<String> packageNames) {
        LinkStore linkStore = dbView.getLinkStore();
        for (String str : packageNames) {
            for (LinkEntity linkEntity : LinkStore.get$default(linkStore, str, 0L, EnumSet.of(u40.a.f90553b), 2, null)) {
                List<SearchAlias> aliases = linkEntity.getAliases();
                ArrayList arrayList = new ArrayList();
                for (Object obj : aliases) {
                    if (!((SearchAlias) obj).getFromPersistable()) {
                        arrayList.add(obj);
                    }
                }
                Set setM1 = g.M1(arrayList);
                for (AliasEntity aliasEntity : dbView.getAliasStore().getForPackage(str)) {
                    setM1.add(new SearchAlias(aliasEntity.getMatch(), aliasEntity.getDisplayOverride(), true));
                }
                linkStore.put((LinkStore) linkEntity.m324copyVIp7_1Y((1790 & 1) != 0 ? linkEntity.getIdHash() : null, (1790 & 2) != 0 ? linkEntity.groupId : null, (1790 & 4) != 0 ? linkEntity.typeSpecificKey : null, (1790 & 8) != 0 ? linkEntity.userSerial : 0L, (1790 & 16) != 0 ? linkEntity.displayLabelPrefix : null, (1790 & 32) != 0 ? linkEntity.displayLabel : null, (1790 & 64) != 0 ? linkEntity.expirationOn : 0L, (1790 & 128) != 0 ? linkEntity.customIconUri : null, (1790 & 256) != 0 ? linkEntity.intentUri : null, (1790 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? linkEntity.typeSpecificFlags : 0L, (1790 & 1024) != 0 ? linkEntity.aliases : g.I1(setM1)));
            }
        }
    }

    @Nullable
    public final Object ingestAndPurgeOrphans(final long j11, @NotNull final List<IngestibleAndroidApp> list, @NotNull Continuation<? super Unit> continuation) {
        this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.ingestAndPurgeOrphans.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final WriteBack invoke(@NotNull DbView dbView) throws URISyntaxException {
                Intrinsics.g(dbView, "dbView");
                LinkStore linkStore = dbView.getLinkStore();
                EnumSet enumSetOf = EnumSet.of(u40.a.f90553b);
                long[] jArr = {j11};
                Intrinsics.f(enumSetOf, "of(LinkType.APP_COMPONENT)");
                ArrayList arrayListK1 = g.K1(LinkStore.get$default(linkStore, jArr, enumSetOf, (Set) null, (Set) null, 12, (Object) null));
                for (final IngestibleAndroidApp ingestibleAndroidApp : list) {
                    this.updateLinkStore(dbView, ingestibleAndroidApp);
                    b70.d.E0(arrayListK1, new Function1<LinkEntity, Boolean>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.ingestAndPurgeOrphans.2.1
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        @NotNull
                        public final Boolean invoke(@NotNull LinkEntity it) {
                            Intrinsics.g(it, "it");
                            return Boolean.valueOf(Intrinsics.b(ingestibleAndroidApp.getPackageName(), it.getPackageName()) && ingestibleAndroidApp.getUserSerial() == it.getUserSerial());
                        }
                    });
                }
                Iterator it = arrayListK1.iterator();
                while (it.hasNext()) {
                    LinkEntity linkEntity = (LinkEntity) it.next();
                    String packageName = linkEntity.getPackageName();
                    Intrinsics.d(packageName);
                    long userSerial = linkEntity.getUserSerial();
                    EmptyList emptyList = EmptyList.f71733a;
                    this.updateLinkStore(dbView, new IngestibleAndroidApp(packageName, userSerial, emptyList, emptyList));
                }
                return new WriteBack(dbView);
            }
        });
        return Unit.f71706a;
    }

    public final void ingestAndroidApp(@NotNull final IngestibleAndroidApp app) {
        Intrinsics.g(app, "app");
        this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.ingestAndroidApp.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final WriteBack invoke(@NotNull DbView dbView) throws URISyntaxException {
                Intrinsics.g(dbView, "dbView");
                DataImporters.this.updateLinkStore(dbView, app);
                return new WriteBack(dbView);
            }
        });
    }

    public final int ingestApiLinks(@NotNull final String groupId, final long userSerial, @NotNull List<v40.b> links) {
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(links, "links");
        final LinkEntity linkEntity = (LinkEntity) this.db.readTx(new Function1<DbView, LinkEntity>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters$ingestApiLinks$parentApp$1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            @Nullable
            public final LinkEntity invoke(@NotNull DbView it) {
                Intrinsics.g(it, "it");
                return it.getLinkStore().getDefaultComponent(groupId, userSerial);
            }
        });
        if (linkEntity == null) {
            return 0;
        }
        State state = State.INSTANCE;
        l log = state.getLog();
        if (log.getLevel().ordinal() >= 3) {
            log.getWriter().debug(TAG, "Ingesting " + links.size() + " API links for parentApp=" + groupId + " user=" + userSerial);
        }
        final ArrayList arrayList = new ArrayList();
        final HashMap map = new HashMap();
        Iterator<v40.b> it = links.iterator();
        if (it.hasNext()) {
            if (it.next() != null) {
                throw new ClassCastException();
            }
            IdHash.Companion companion = IdHash.INSTANCE;
            EnumSet enumSet = u40.a.f90552a;
            throw null;
        }
        l log2 = state.getLog();
        if (log2.getLevel().ordinal() >= 3) {
            log2.getWriter().debug(TAG, "Generated " + arrayList.size() + " new entities with " + map.size() + " new usages");
        }
        final Ref.IntRef intRef = new Ref.IntRef();
        this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.ingestApiLinks.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final WriteBack invoke(@NotNull DbView dbView) {
                Intrinsics.g(dbView, "dbView");
                if (dbView.getLinkStore().getDefaultComponent(groupId, userSerial) == null) {
                    return WriteBack.INSTANCE.getNO_OP();
                }
                UsageStore usageStore = dbView.getUsageStore();
                Set<IdHash> setKeySet = map.keySet();
                Intrinsics.f(setKeySet, "newUsageTimes.keys");
                Collection<LinkUsage> collection = usageStore.get((Collection) setKeySet);
                int iD0 = b70.k.d0(b70.c.u0(collection, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                for (Object obj : collection) {
                    linkedHashMap.put(((LinkUsage) obj).getIdHash(), obj);
                }
                LinkedHashMap linkedHashMapU0 = MapsKt.u0(linkedHashMap);
                for (Map.Entry<IdHash, ArrayList<Long>> entry : map.entrySet()) {
                    IdHash key = entry.getKey();
                    ArrayList<Long> value = entry.getValue();
                    LinkUsage linkUsage = (LinkUsage) linkedHashMapU0.get(key);
                    if (linkUsage != null) {
                        linkedHashMapU0.put(key, LinkUsage.copy$default(linkUsage, null, 0L, null, null, null, null, null, u90.b.X(linkUsage.getConduitUsageTimes(), g.J1(value)), Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, null));
                    } else {
                        linkedHashMapU0.put(key, new LinkUsage(key, 0L, (long[]) null, (long[]) null, (long[]) null, (long[]) null, (long[]) null, g.J1(value), Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, (DefaultConstructorMarker) null));
                    }
                }
                LinkStore linkStore = dbView.getLinkStore();
                Set setU = e0.U(groupId);
                EnumSet enumSetOf = EnumSet.of(u40.a.f90559h);
                long[] jArr = {userSerial};
                Intrinsics.f(enumSetOf, "of(LinkType.API)");
                List list = LinkStore.get$default(linkStore, jArr, enumSetOf, setU, (Set) null, 8, (Object) null);
                l log3 = State.INSTANCE.getLog();
                ArrayList<LinkEntity> arrayList2 = arrayList;
                LinkEntity linkEntity2 = linkEntity;
                if (log3.getLevel().ordinal() >= 3) {
                    log3.getWriter().debug(DataImporters.TAG, "Removing " + list.size() + " old API entities and replacing with " + arrayList2.size() + " new entities with " + linkedHashMapU0.size() + " LinkUsages for " + linkEntity2.getGroupId());
                }
                dbView.getLinkStore().remove(list);
                dbView.getLinkStore().put(arrayList);
                dbView.getUsageStore().put(linkedHashMapU0.values());
                intRef.f71861a = arrayList.size();
                return new WriteBack(dbView);
            }
        });
        return intRef.f71861a;
    }

    public final int ingestCustomLinks(@NotNull final String groupId, final long userSerial, @NotNull List<v40.b> links) {
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(links, "links");
        State state = State.INSTANCE;
        l log = state.getLog();
        if (log.getLevel().ordinal() >= 3) {
            log.getWriter().debug(TAG, "Ingesting " + links.size() + " CUSTOM links for parentApp=" + groupId + " user=" + userSerial);
        }
        final ArrayList arrayList = new ArrayList();
        final HashMap map = new HashMap();
        Iterator<v40.b> it = links.iterator();
        if (it.hasNext()) {
            if (it.next() != null) {
                throw new ClassCastException();
            }
            IdHash.Companion companion = IdHash.INSTANCE;
            EnumSet enumSet = u40.a.f90552a;
            throw null;
        }
        l log2 = state.getLog();
        if (log2.getLevel().ordinal() >= 3) {
            log2.getWriter().debug(TAG, "Generated " + arrayList.size() + " new entities with " + map.size() + " new usages");
        }
        final Ref.IntRef intRef = new Ref.IntRef();
        this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.ingestCustomLinks.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final WriteBack invoke(@NotNull DbView dbView) {
                Intrinsics.g(dbView, "dbView");
                UsageStore usageStore = dbView.getUsageStore();
                Set<IdHash> setKeySet = map.keySet();
                Intrinsics.f(setKeySet, "newUsageTimes.keys");
                Collection<LinkUsage> collection = usageStore.get((Collection) setKeySet);
                int iD0 = b70.k.d0(b70.c.u0(collection, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                for (Object obj : collection) {
                    linkedHashMap.put(((LinkUsage) obj).getIdHash(), obj);
                }
                LinkedHashMap linkedHashMapU0 = MapsKt.u0(linkedHashMap);
                for (Map.Entry<IdHash, ArrayList<Long>> entry : map.entrySet()) {
                    IdHash key = entry.getKey();
                    ArrayList<Long> value = entry.getValue();
                    LinkUsage linkUsage = (LinkUsage) linkedHashMapU0.get(key);
                    if (linkUsage != null) {
                        linkedHashMapU0.put(key, LinkUsage.copy$default(linkUsage, null, 0L, null, null, null, null, null, u90.b.X(linkUsage.getConduitUsageTimes(), g.J1(value)), Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, null));
                    } else {
                        linkedHashMapU0.put(key, new LinkUsage(key, 0L, (long[]) null, (long[]) null, (long[]) null, (long[]) null, (long[]) null, g.J1(value), Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, (DefaultConstructorMarker) null));
                    }
                }
                LinkStore linkStore = dbView.getLinkStore();
                Set setU = e0.U(groupId);
                EnumSet enumSetOf = EnumSet.of(u40.a.f90560i);
                long j11 = userSerial;
                long[] jArr = j11 == -1 ? null : new long[]{j11};
                Intrinsics.f(enumSetOf, "of(LinkType.CUSTOM)");
                List list = LinkStore.get$default(linkStore, jArr, enumSetOf, setU, (Set) null, 8, (Object) null);
                l log3 = State.INSTANCE.getLog();
                ArrayList<LinkEntity> arrayList2 = arrayList;
                String str = groupId;
                if (log3.getLevel().ordinal() >= 3) {
                    log3.getWriter().debug(DataImporters.TAG, "Removing " + list.size() + " old CUSTOM entities and replacing with " + arrayList2.size() + " new entities with " + linkedHashMapU0.size() + " LinkUsages for " + str);
                }
                dbView.getLinkStore().remove(list);
                dbView.getLinkStore().put(arrayList);
                dbView.getUsageStore().put(linkedHashMapU0.values());
                intRef.f71861a = arrayList.size();
                return new WriteBack(dbView);
            }
        });
        return intRef.f71861a;
    }

    @Nullable
    public final Object ingestPersistableSearchAliases(@NotNull final Collection<u40.d> collection, @NotNull Continuation<? super Unit> continuation) {
        try {
            this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.ingestPersistableSearchAliases.2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final WriteBack invoke(@NotNull DbView dbView) {
                    Intrinsics.g(dbView, "dbView");
                    AliasStore aliasStore = dbView.getAliasStore();
                    ArrayList arrayList = new ArrayList();
                    for (u40.d dVar : collection) {
                        arrayList.add(new AliasEntity(dVar.f90572a, dVar.f90574c, dVar.f90573b, dVar.f90575d));
                    }
                    LinkedHashSet linkedHashSet = new LinkedHashSet();
                    List<AliasEntity> all = aliasStore.getAll();
                    ArrayList arrayList2 = new ArrayList(b70.c.u0(all, 10));
                    Iterator<T> it = all.iterator();
                    while (it.hasNext()) {
                        arrayList2.add(((AliasEntity) it.next()).getPackageName());
                    }
                    linkedHashSet.addAll(arrayList2);
                    Collection<u40.d> collection2 = collection;
                    ArrayList arrayList3 = new ArrayList(b70.c.u0(collection2, 10));
                    Iterator<T> it2 = collection2.iterator();
                    while (it2.hasNext()) {
                        arrayList3.add(((u40.d) it2.next()).f90572a);
                    }
                    linkedHashSet.addAll(arrayList3);
                    aliasStore.removeAll();
                    aliasStore.put(arrayList);
                    this.updateLinksForAliases(dbView, linkedHashSet);
                    return new WriteBack(dbView);
                }
            });
        } catch (Throwable th2) {
            l log = State.INSTANCE.getLog();
            if (log.getLevel().ordinal() >= 1) {
                log.getWriter().error(TAG, th2, "Failed ingesting " + collection.size() + " search aliases");
            }
        }
        return Unit.f71706a;
    }

    public final boolean markPackageIgnored(@NotNull final String packageName, @Nullable final long[] userSerials) {
        Intrinsics.g(packageName, "packageName");
        try {
            this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.markPackageIgnored.1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final WriteBack invoke(@NotNull DbView dbView) {
                    Intrinsics.g(dbView, "dbView");
                    dbView.getIgnoreStore().put((IgnoreStore) new IgnoreEntity(packageName, userSerials));
                    return new WriteBack(dbView);
                }
            });
            return true;
        } catch (Throwable th2) {
            l log = State.INSTANCE.getLog();
            if (log.getLevel().ordinal() < 1) {
                return false;
            }
            log.getWriter().error(TAG, th2, c0.l("Failed marking package=", packageName, " ignored"));
            return false;
        }
    }

    public final void pullStaticNavigations() {
        try {
            long jNanoTime = System.nanoTime();
            boolean z11 = this.prefs.getBoolean("invoke_garbage_collector", true);
            final PackageManager packageManager = this.packageManager;
            final ArrayList arrayListH = ul.b.h(new StaticNav("settingsAccessibility", 2132019559, 2131231460, "intent:#Intent;action=android.settings.ACCESSIBILITY_SETTINGS;end", new String[0]), new StaticNav("settingsAirplaneMode", 2132019560, 2131231461, "intent:#Intent;action=android.settings.AIRPLANE_MODE_SETTINGS;end", new String[0]), new StaticNav("settingsAllApps", 2132019561, 2131231462, "intent:#Intent;action=android.settings.MANAGE_ALL_APPLICATIONS_SETTINGS;end", new String[0]), new StaticNav("settingsBatteryPower", 2132019562, 2131231465, "intent:#Intent;action=android.intent.action.POWER_USAGE_SUMMARY;end", new String[0]), new StaticNav("settingsBatterySaver", 2132019563, 2131231464, "intent:#Intent;action=android.settings.BATTERY_SAVER_SETTINGS;end", new String[0]), new StaticNav("settingsBluetooth", 2132019564, 2131231493, "intent:#Intent;action=android.settings.BLUETOOTH_SETTINGS;end", new String[]{"android.hardware.bluetooth", "android.hardware.bluetooth_le"}), new StaticNav("settingsCast", 2132019565, 2131231468, "intent:#Intent;action=android.settings.CAST_SETTINGS;end", new String[0]), new StaticNav("settingsDateAndTime", 2132019567, 2131231459, "intent:#Intent;action=android.settings.DATE_SETTINGS;end", new String[0]), new StaticNav("settingsDefaultApps", 2132019568, 2131231492, "intent:#Intent;action=android.settings.MANAGE_DEFAULT_APPS_SETTINGS;end", new String[0]), new StaticNav("settingsDeviceInfo", 2132019569, 2131231484, "intent:#Intent;action=android.settings.DEVICE_INFO_SETTINGS;end", new String[0]), new StaticNav("settingsDisplay", 2132019570, 2131231470, "intent:#Intent;action=android.settings.DISPLAY_SETTINGS;end", new String[0]), new StaticNav("settingsInputMethod", 2132019571, 2131231474, "intent:#Intent;action=android.settings.INPUT_METHOD_SETTINGS;end", new String[]{"android.software.input_methods"}), new StaticNav("settingsInternalStorage", 2132019572, 2131231497, "intent:#Intent;action=android.settings.INTERNAL_STORAGE_SETTINGS;end", new String[0]), new StaticNav("settingsLocale", 2132019573, 2131231475, "intent:#Intent;action=android.settings.LOCALE_SETTINGS;end", new String[0]), new StaticNav("settingsMemoryCard", 2132019574, 2131231489, "intent:#Intent;action=android.settings.MEMORY_CARD_SETTINGS;end", new String[0]), new StaticNav("settingsNetworkAndInternet", 2132019575, 2131231479, "intent:#Intent;action=android.settings.WIRELESS_SETTINGS;end", new String[]{"android.hardware.telephony", "android.hardware.wifi", "android.hardware.ethernet"}), new StaticNav("settingsNfc", 2132019576, 2131231481, "intent:#Intent;action=android.settings.NFC_SETTINGS;end", new String[]{"android.hardware.nfc"}), new StaticNav("settingsNfcPayment", 2132019577, 2131231498, "intent:#Intent;action=android.settings.NFC_PAYMENT_SETTINGS;end", new String[]{"android.hardware.nfc"}), new StaticNav("settingsNightDisplay", 2132019578, 2131231477, "intent:#Intent;action=android.settings.NIGHT_DISPLAY_SETTINGS;end", new String[0]), new StaticNav("settingsNotifications", 2132019579, 2131231483, "intent:#Intent;action=android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS;end", new String[0]), new StaticNav("settingsOverlayPermission", 2132019580, 2131231486, "intent:#Intent;action=android.settings.action.MANAGE_OVERLAY_PERMISSION;end", new String[0]), new StaticNav("settingsPrivacy", 2132019581, 2131231487, "intent:#Intent;action=android.settings.PRIVACY_SETTINGS;end", new String[0]), new StaticNav("settingsSecurity", 2132019582, 2131231490, "intent:#Intent;action=android.settings.SECURITY_SETTINGS;end", new String[0]), new StaticNav("settingsSound", 2132019583, 2131231500, "intent:#Intent;action=android.settings.SOUND_SETTINGS;end", new String[0]), new StaticNav("settingsTetheringAndHotspot", 2132019584, 2131231503, "intent:#Intent;component=com.android.settings/.TetherSettings;end", new String[]{"android.hardware.wifi"}), new StaticNav("settingsUsageAccess", 2132019585, 2131231463, "intent:#Intent;action=android.settings.USAGE_ACCESS_SETTINGS;end", new String[0]), new StaticNav("settingsVpn", 2132019586, 2131231501, "intent:#Intent;action=android.settings.VPN_SETTINGS;end", new String[]{"android.hardware.telephony", "android.hardware.wifi", "android.hardware.ethernet"}), new StaticNav("settingsWiFi", 2132019587, 2131231502, "intent:#Intent;action=android.settings.WIFI_SETTINGS;end", new String[]{"android.hardware.wifi"}));
            if (Build.VERSION.SDK_INT >= 29) {
                arrayListH.add(new StaticNav("settingsDataUsage", 2132019566, 2131231469, "intent:#Intent;action=android.settings.DATA_USAGE_SETTINGS;end", new String[0]));
            }
            State state = State.INSTANCE;
            l log = state.getLog();
            if (log.getLevel().ordinal() >= 3) {
                log.getWriter().debug(TAG, "Using Settings package com.android.settings for " + arrayListH.size() + " Settings shortcuts");
            }
            b70.d.E0(arrayListH, new Function1<StaticNav, Boolean>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters$pullStaticNavigations$1$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final Boolean invoke(@NotNull DataImporters.StaticNav datum) {
                    Intrinsics.g(datum, "datum");
                    boolean z12 = datum.getFeatureCheck().length == 0;
                    for (String str : datum.getFeatureCheck()) {
                        z12 = z12 || packageManager.hasSystemFeature(str);
                        if (z12) {
                            break;
                        }
                    }
                    if (!z12) {
                        l log2 = State.INSTANCE.getLog();
                        if (log2.getLevel().ordinal() >= 3) {
                            log2.getWriter().debug("SSML-Importer", "WARNING: Device does not match any features for Settings shortcut: features=" + kotlin.collections.c.O0(datum.getFeatureCheck(), null, null, null, null, 63) + ", intent=" + datum.getIntentUri());
                        }
                        return Boolean.TRUE;
                    }
                    try {
                        Intent intentFromIntentUri = Strs.INSTANCE.fromIntentUri(datum.getIntentUri());
                        Intrinsics.d(intentFromIntentUri);
                        if (packageManager.resolveActivity(intentFromIntentUri, 0) != null) {
                            return Boolean.FALSE;
                        }
                    } catch (Throwable th2) {
                        l log3 = State.INSTANCE.getLog();
                        if (log3.getLevel().ordinal() >= 2) {
                            log3.getWriter().warn("SSML-Importer", String.valueOf(th2.getMessage()));
                        }
                    }
                    l log4 = State.INSTANCE.getLog();
                    if (log4.getLevel().ordinal() >= 3) {
                        log4.getWriter().debug("SSML-Importer", "WARNING: Device does not resolve Intent for Settings shortcut: features=" + kotlin.collections.c.O0(datum.getFeatureCheck(), null, null, null, null, 63) + ", intent=" + datum.getIntentUri());
                    }
                    return Boolean.TRUE;
                }
            });
            final long currentUserId = this.userHandleDataSource.getCurrentUserId();
            this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters$pullStaticNavigations$1$3
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final WriteBack invoke(@NotNull DbView readView) {
                    String displayLabel;
                    Intrinsics.g(readView, "readView");
                    LinkStore linkStore = readView.getLinkStore();
                    LinkEntity first = linkStore.getFirst("com.android.settings", currentUserId, u40.a.f90553b);
                    if (first == null || (displayLabel = first.getDisplayLabel()) == null) {
                        return WriteBack.INSTANCE.getNO_OP();
                    }
                    ArrayList arrayList = new ArrayList();
                    for (Iterator<DataImporters.StaticNav> it = arrayListH.iterator(); it.hasNext(); it = it) {
                        DataImporters.StaticNav next = it.next();
                        String string = this.context.getString(next.getLabelRes());
                        Intrinsics.f(string, "context.getString(datum.labelRes)");
                        Strs strs = Strs.INSTANCE;
                        Intent intentFromIntentUri = strs.fromIntentUri(next.getIntentUri());
                        Intrinsics.d(intentFromIntentUri);
                        String intentUri = strs.toIntentUri(intentFromIntentUri.addFlags(268468224));
                        if (intentUri == null) {
                            intentUri = next.getIntentUri();
                        }
                        IdHash idHashM320ofKY3lZgs$default = IdHash.Companion.m320ofKY3lZgs$default(IdHash.INSTANCE, u40.a.f90556e, "com.android.settings", next.getIdTag(), currentUserId, (byte) 0, 16, null);
                        String idTag = next.getIdTag();
                        long j11 = currentUserId;
                        Utils utils = Utils.INSTANCE;
                        String packageName = this.context.getPackageName();
                        Intrinsics.f(packageName, "context.packageName");
                        arrayList.add(new LinkEntity(idHashM320ofKY3lZgs$default, "com.android.settings", idTag, j11, displayLabel, string, 0L, utils.makeResUri(packageName, next.getIconRes()).toString(), intentUri, 0L, (List) null, 1600, (DefaultConstructorMarker) null));
                    }
                    List<LinkEntity> list = linkStore.get("com.android.settings", currentUserId, EnumSet.of(u40.a.f90554c));
                    Set setU = e0.U("com.android.settings");
                    EnumSet enumSetOf = EnumSet.of(u40.a.f90556e);
                    Intrinsics.f(enumSetOf, "of(LinkType.STATIC_NAVIGATION)");
                    ArrayList arrayListT1 = g.t1(LinkStore.get$default(linkStore, (long[]) null, enumSetOf, setU, (Set) null, 9, (Object) null), list);
                    l log2 = State.INSTANCE.getLog();
                    if (log2.getLevel().ordinal() >= 3) {
                        log2.getWriter().debug("SSML-Importer", "Merging " + arrayList.size() + " new Settings links with " + arrayListT1.size() + " old Settings links");
                    }
                    linkStore.remove(arrayListT1);
                    linkStore.put(arrayList);
                    return new WriteBack(readView);
                }
            });
            if (z11) {
                Runtime.getRuntime().gc();
            }
            long jNanoTime2 = System.nanoTime() - jNanoTime;
            l log2 = state.getLog();
            if (log2.getLevel().ordinal() >= 3) {
                log2.getWriter().debug(TAG, "Finished building/merging " + ((Number) this.db.readTx(new Function1<DbView, Long>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters$pullStaticNavigations$2$staticNavCount$1
                    @Override // kotlin.jvm.functions.Function1
                    @NotNull
                    public final Long invoke(@NotNull DbView it) {
                        Intrinsics.g(it, "it");
                        return Long.valueOf(it.getLinkStore().count(new u40.a[]{u40.a.f90556e}));
                    }
                })).longValue() + " static navigations links: db.linkStore.count=" + this.db.count("links") + " (elapsed=" + Strs.INSTANCE.nanosToMillis(jNanoTime2) + ')');
            }
        } catch (Throwable th2) {
            l log3 = State.INSTANCE.getLog();
            if (log3.getLevel().ordinal() >= 1) {
                log3.getWriter().error(TAG, th2);
            }
        }
    }

    @Nullable
    public final Object refreshData(@NotNull Continuation<? super Unit> continuation) {
        a80.e eVar = y0.f88884a;
        Object objY = m0.y(a80.d.f488c, new C30332(null), continuation);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    public final boolean syncIgnoredPackages(@NotNull final Collection<String> ignoredList, @Nullable final long[] userSerials, final boolean overwrite) {
        Intrinsics.g(ignoredList, "ignoredList");
        if (!overwrite) {
            try {
                if (!((Boolean) this.db.readTx(new Function1<DbView, Boolean>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters$syncIgnoredPackages$needsUpdate$1
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    @NotNull
                    public final Boolean invoke(@NotNull DbView dbView) {
                        Intrinsics.g(dbView, "dbView");
                        Iterator<String> it = ignoredList.iterator();
                        while (it.hasNext()) {
                            IgnoreEntity ignoreEntity = dbView.getIgnoreStore().get((IgnoreStore) it.next());
                            if (ignoreEntity == null || !Arrays.equals(ignoreEntity.getSpecificUserId(), userSerials)) {
                                return Boolean.TRUE;
                            }
                        }
                        return Boolean.FALSE;
                    }
                })).booleanValue()) {
                    return true;
                }
            } catch (Throwable th2) {
                l log = State.INSTANCE.getLog();
                if (log.getLevel().ordinal() < 1) {
                    return false;
                }
                log.getWriter().error(TAG, th2, "Failed marking packages=" + ignoredList + " ignored");
                return false;
            }
        }
        this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.syncIgnoredPackages.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final WriteBack invoke(@NotNull DbView dbView) {
                Intrinsics.g(dbView, "dbView");
                if (overwrite) {
                    dbView.getIgnoreStore().removeAll();
                }
                Iterator<String> it = ignoredList.iterator();
                while (it.hasNext()) {
                    dbView.getIgnoreStore().put((IgnoreStore) new IgnoreEntity(it.next(), userSerials));
                }
                return new WriteBack(dbView);
            }
        });
        return true;
    }

    public final boolean unmarkPackageIgnored(@NotNull final String packageName) {
        Intrinsics.g(packageName, "packageName");
        try {
            this.db.writeTx(new Function1<DbView, WriteBack>() { // from class: io.branch.engage.sesame_lite.internal.DataImporters.unmarkPackageIgnored.1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final WriteBack invoke(@NotNull DbView dbView) {
                    Intrinsics.g(dbView, "dbView");
                    IgnoreEntity ignoreEntity = dbView.getIgnoreStore().get((IgnoreStore) packageName);
                    if (ignoreEntity == null) {
                        return WriteBack.INSTANCE.getNO_OP();
                    }
                    dbView.getIgnoreStore().remove((IgnoreStore) ignoreEntity);
                    return new WriteBack(dbView);
                }
            });
            return true;
        } catch (Throwable th2) {
            l log = State.INSTANCE.getLog();
            if (log.getLevel().ordinal() < 1) {
                return false;
            }
            log.getWriter().error(TAG, th2, c0.l("Failed unmarking package=", packageName, " ignored"));
            return false;
        }
    }
}
