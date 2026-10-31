package com.amplitude.android;

import a80.m;
import android.graphics.PointF;
import b.c0;
import b.u4;
import com.amplitude.android.InteractionType;
import com.amplitude.android.internal.ViewTarget;
import com.amplitude.android.internal.ViewTargetKt;
import com.amplitude.android.signals.UiChangeSignal;
import com.amplitude.common.Logger;
import com.amplitude.core.Constants;
import com.amplitude.core.events.EventOptions;
import com.amplitude.core.events.Plan;
import com.amplitude.core.platform.Signal;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import fq.c;
import h6.c1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.r1;
import w70.q1;
import w70.u1;

@Metadata(d1 = {"\u0000|\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010$\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\u0018\u0000 R2\u00020\u0001:\u0005SRTUVB-\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\b¢\u0006\u0004\b\u000b\u0010\fJ7\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u0015H\u0002¢\u0006\u0004\b\u0018\u0010\u0019J?\u0010\u001b\u001a\u00020\u00172\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u001a\u001a\u00020\u0013H\u0002¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0017H\u0002¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010 \u001a\u00020\u001fH\u0002¢\u0006\u0004\b \u0010!J/\u0010#\u001a\u00020\u00172\u0006\u0010\"\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0016\u001a\u00020\u0015H\u0002¢\u0006\u0004\b#\u0010$J'\u0010'\u001a\u00020\u00172\u0006\u0010&\u001a\u00020%2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013H\u0002¢\u0006\u0004\b'\u0010(J\u0017\u0010*\u001a\u00020\u00172\u0006\u0010&\u001a\u00020)H\u0002¢\u0006\u0004\b*\u0010+J\u001f\u0010,\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0002¢\u0006\u0004\b,\u0010-J\u001f\u0010.\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0002¢\u0006\u0004\b.\u0010-J/\u00103\u001a\u00020\u001f2\u0006\u0010/\u001a\u00020\u00062\u0006\u00100\u001a\u00020\u00062\u0006\u00101\u001a\u00020\u00062\u0006\u00102\u001a\u00020\u0006H\u0002¢\u0006\u0004\b3\u00104J%\u00106\u001a\u0010\u0012\u0004\u0012\u00020\u0013\u0012\u0006\u0012\u0004\u0018\u00010\u0001052\u0006\u0010&\u001a\u00020%H\u0002¢\u0006\u0004\b6\u00107J%\u00108\u001a\u0010\u0012\u0004\u0012\u00020\u0013\u0012\u0006\u0012\u0004\u0018\u00010\u0001052\u0006\u0010&\u001a\u00020)H\u0002¢\u0006\u0004\b8\u00109J\u0017\u0010:\u001a\u00020\u001f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002¢\u0006\u0004\b:\u0010;J\u0017\u0010<\u001a\u00020\u001f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002¢\u0006\u0004\b<\u0010;J\r\u0010=\u001a\u00020\u0017¢\u0006\u0004\b=\u0010\u001eJ\r\u0010>\u001a\u00020\u0017¢\u0006\u0004\b>\u0010\u001eJ-\u0010?\u001a\u00020\u00172\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b?\u0010@R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010AR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010BR\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010CR\u0014\u0010D\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bD\u0010ER\u0018\u0010G\u001a\u0004\u0018\u00010F8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bG\u0010HR \u0010J\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020%0I8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bJ\u0010KR \u0010L\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020)0I8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bL\u0010KR\u0016\u0010M\u001a\u00020\u00158\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bM\u0010NR\u0014\u0010Q\u001a\u00020\t8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bO\u0010P¨\u0006W"}, d2 = {"Lcom/amplitude/android/FrustrationInteractionsDetector;", b.f42142b, "Lcom/amplitude/core/Amplitude;", "amplitude", "Lcom/amplitude/common/Logger;", "logger", b.f42142b, "density", "Lkotlin/Function0;", "Lcom/amplitude/android/AutocaptureState;", "autocaptureStateProvider", "<init>", "(Lcom/amplitude/core/Amplitude;Lcom/amplitude/common/Logger;FLkotlin/jvm/functions/Function0;)V", "Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;", "clickInfo", "Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;", "targetInfo", "Lcom/amplitude/android/internal/ViewTarget;", "target", b.f42142b, "activityName", b.f42142b, "clickTime", b.f42142b, "processRageClick", "(Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;Lcom/amplitude/android/internal/ViewTarget;Ljava/lang/String;J)V", "clickId", "processDeadClick", "(Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;Lcom/amplitude/android/internal/ViewTarget;Ljava/lang/String;JLjava/lang/String;)V", "startUiChangeCollection", "()V", b.f42142b, "hasActiveSignalProvider", "()Z", "locationKey", "startNewRageClickSession", "(Ljava/lang/String;Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;J)V", "Lcom/amplitude/android/FrustrationInteractionsDetector$RageClickSession;", "session", "trackRageClick", "(Lcom/amplitude/android/FrustrationInteractionsDetector$RageClickSession;Lcom/amplitude/android/internal/ViewTarget;Ljava/lang/String;)V", "Lcom/amplitude/android/FrustrationInteractionsDetector$DeadClickSession;", "trackDeadClick", "(Lcom/amplitude/android/FrustrationInteractionsDetector$DeadClickSession;)V", "generateClickId", "(Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;)Ljava/lang/String;", "generateLocationKey", "x1", "y1", "x2", "y2", "isWithinDistanceThreshold", "(FFFF)Z", b.f42142b, "buildRageClickProperties", "(Lcom/amplitude/android/FrustrationInteractionsDetector$RageClickSession;)Ljava/util/Map;", "buildDeadClickProperties", "(Lcom/amplitude/android/FrustrationInteractionsDetector$DeadClickSession;)Ljava/util/Map;", "isRageClickIgnored", "(Lcom/amplitude/android/internal/ViewTarget;)Z", "isDeadClickIgnored", "start", "stop", "processClick", "(Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;Lcom/amplitude/android/internal/ViewTarget;Ljava/lang/String;)V", "Lcom/amplitude/core/Amplitude;", "Lcom/amplitude/common/Logger;", "Lkotlin/jvm/functions/Function0;", "rageClickDistanceThresholdPx", "F", "Lt70/r1;", "uiChangeCollectionJob", "Lt70/r1;", "Ljava/util/concurrent/ConcurrentHashMap;", "pendingRageClicks", "Ljava/util/concurrent/ConcurrentHashMap;", "pendingDeadClicks", "lastUiChangeTime", "J", "getAutocaptureState", "()Lcom/amplitude/android/AutocaptureState;", "autocaptureState", k.O, "ClickInfo", "DeadClickSession", "RageClickSession", "TargetInfo", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class FrustrationInteractionsDetector {
    private static final long DEAD_CLICK_TIMEOUT = 3000;
    private static final float RAGE_CLICK_DISTANCE_THRESHOLD = 50.0f;
    private static final int RAGE_CLICK_THRESHOLD = 4;
    private static final long RAGE_CLICK_TIME_WINDOW = 1000;

    @NotNull
    private final com.amplitude.core.Amplitude amplitude;

    @NotNull
    private final Function0<AutocaptureState> autocaptureStateProvider;
    private long lastUiChangeTime;

    @NotNull
    private final Logger logger;

    @NotNull
    private final ConcurrentHashMap<String, DeadClickSession> pendingDeadClicks;

    @NotNull
    private final ConcurrentHashMap<String, RageClickSession> pendingRageClicks;
    private final float rageClickDistanceThresholdPx;

    @Nullable
    private r1 uiChangeCollectionJob;

    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0080\b\u0018\u00002\u00020\u0001BC\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r¢\u0006\u0002\u0010\u000fJ\t\u0010 \u001a\u00020\u0003HÆ\u0003J\t\u0010!\u001a\u00020\u0003HÆ\u0003J\t\u0010\"\u001a\u00020\u0006HÆ\u0003J\t\u0010#\u001a\u00020\bHÆ\u0003J\t\u0010$\u001a\u00020\bHÆ\u0003J\t\u0010%\u001a\u00020\u000bHÆ\u0003J\u000f\u0010&\u001a\b\u0012\u0004\u0012\u00020\u000e0\rHÆ\u0003JU\u0010'\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\u000b2\u000e\b\u0002\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\rHÆ\u0001J\u0013\u0010(\u001a\u00020)2\b\u0010*\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010+\u001a\u00020\u0006HÖ\u0001J\t\u0010,\u001a\u00020-HÖ\u0001R\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u0017\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\t\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0019R\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u0017\"\u0004\b\u001c\u0010\u001dR\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001f¨\u0006."}, d2 = {"Lcom/amplitude/android/FrustrationInteractionsDetector$RageClickSession;", b.f42142b, "firstClickTime", b.f42142b, "lastClickTime", "clickCount", b.f42142b, "firstClickX", b.f42142b, "firstClickY", "targetInfo", "Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;", "clicks", b.f42142b, "Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;", "(JJIFFLcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;Ljava/util/List;)V", "getClickCount", "()I", "setClickCount", "(I)V", "getClicks", "()Ljava/util/List;", "getFirstClickTime", "()J", "getFirstClickX", "()F", "getFirstClickY", "getLastClickTime", "setLastClickTime", "(J)V", "getTargetInfo", "()Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class RageClickSession {
        private int clickCount;

        @NotNull
        private final List<ClickInfo> clicks;
        private final long firstClickTime;
        private final float firstClickX;
        private final float firstClickY;
        private long lastClickTime;

        @NotNull
        private final TargetInfo targetInfo;

        public RageClickSession(long j11, long j12, int i5, float f11, float f12, @NotNull TargetInfo targetInfo, @NotNull List<ClickInfo> clicks) {
            Intrinsics.g(targetInfo, "targetInfo");
            Intrinsics.g(clicks, "clicks");
            this.firstClickTime = j11;
            this.lastClickTime = j12;
            this.clickCount = i5;
            this.firstClickX = f11;
            this.firstClickY = f12;
            this.targetInfo = targetInfo;
            this.clicks = clicks;
        }

        public static /* synthetic */ RageClickSession copy$default(RageClickSession rageClickSession, long j11, long j12, int i5, float f11, float f12, TargetInfo targetInfo, List list, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                j11 = rageClickSession.firstClickTime;
            }
            long j13 = j11;
            if ((i11 & 2) != 0) {
                j12 = rageClickSession.lastClickTime;
            }
            long j14 = j12;
            if ((i11 & 4) != 0) {
                i5 = rageClickSession.clickCount;
            }
            return rageClickSession.copy(j13, j14, i5, (i11 & 8) != 0 ? rageClickSession.firstClickX : f11, (i11 & 16) != 0 ? rageClickSession.firstClickY : f12, (i11 & 32) != 0 ? rageClickSession.targetInfo : targetInfo, (i11 & 64) != 0 ? rageClickSession.clicks : list);
        }

        /* renamed from: component1, reason: from getter */
        public final long getFirstClickTime() {
            return this.firstClickTime;
        }

        /* renamed from: component2, reason: from getter */
        public final long getLastClickTime() {
            return this.lastClickTime;
        }

        /* renamed from: component3, reason: from getter */
        public final int getClickCount() {
            return this.clickCount;
        }

        /* renamed from: component4, reason: from getter */
        public final float getFirstClickX() {
            return this.firstClickX;
        }

        /* renamed from: component5, reason: from getter */
        public final float getFirstClickY() {
            return this.firstClickY;
        }

        @NotNull
        /* renamed from: component6, reason: from getter */
        public final TargetInfo getTargetInfo() {
            return this.targetInfo;
        }

        @NotNull
        public final List<ClickInfo> component7() {
            return this.clicks;
        }

        @NotNull
        public final RageClickSession copy(long firstClickTime, long lastClickTime, int clickCount, float firstClickX, float firstClickY, @NotNull TargetInfo targetInfo, @NotNull List<ClickInfo> clicks) {
            Intrinsics.g(targetInfo, "targetInfo");
            Intrinsics.g(clicks, "clicks");
            return new RageClickSession(firstClickTime, lastClickTime, clickCount, firstClickX, firstClickY, targetInfo, clicks);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RageClickSession)) {
                return false;
            }
            RageClickSession rageClickSession = (RageClickSession) other;
            return this.firstClickTime == rageClickSession.firstClickTime && this.lastClickTime == rageClickSession.lastClickTime && this.clickCount == rageClickSession.clickCount && Float.compare(this.firstClickX, rageClickSession.firstClickX) == 0 && Float.compare(this.firstClickY, rageClickSession.firstClickY) == 0 && Intrinsics.b(this.targetInfo, rageClickSession.targetInfo) && Intrinsics.b(this.clicks, rageClickSession.clicks);
        }

        public final int getClickCount() {
            return this.clickCount;
        }

        @NotNull
        public final List<ClickInfo> getClicks() {
            return this.clicks;
        }

        public final long getFirstClickTime() {
            return this.firstClickTime;
        }

        public final float getFirstClickX() {
            return this.firstClickX;
        }

        public final float getFirstClickY() {
            return this.firstClickY;
        }

        public final long getLastClickTime() {
            return this.lastClickTime;
        }

        @NotNull
        public final TargetInfo getTargetInfo() {
            return this.targetInfo;
        }

        public int hashCode() {
            return this.clicks.hashCode() + ((this.targetInfo.hashCode() + m.d(this.firstClickY, m.d(this.firstClickX, u4.a(this.clickCount, c0.d(Long.hashCode(this.firstClickTime) * 31, 31, this.lastClickTime), 31), 31), 31)) * 31);
        }

        public final void setClickCount(int i5) {
            this.clickCount = i5;
        }

        public final void setLastClickTime(long j11) {
            this.lastClickTime = j11;
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("RageClickSession(firstClickTime=");
            sb2.append(this.firstClickTime);
            sb2.append(", lastClickTime=");
            sb2.append(this.lastClickTime);
            sb2.append(", clickCount=");
            sb2.append(this.clickCount);
            sb2.append(", firstClickX=");
            sb2.append(this.firstClickX);
            sb2.append(", firstClickY=");
            sb2.append(this.firstClickY);
            sb2.append(", targetInfo=");
            sb2.append(this.targetInfo);
            sb2.append(", clicks=");
            return c.e(sb2, this.clicks, ')');
        }
    }

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BA\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\tJ\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003JQ\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000bR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000b¨\u0006\u001e"}, d2 = {"Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;", b.f42142b, "className", b.f42142b, "resourceName", "tag", "text", Plan.AMP_PLAN_SOURCE, "hierarchy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getClassName", "()Ljava/lang/String;", "getHierarchy", "getResourceName", "getSource", "getTag", "getText", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class TargetInfo {

        @Nullable
        private final String className;

        @Nullable
        private final String hierarchy;

        @Nullable
        private final String resourceName;

        @Nullable
        private final String source;

        @Nullable
        private final String tag;

        @Nullable
        private final String text;

        public TargetInfo(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable String str6) {
            this.className = str;
            this.resourceName = str2;
            this.tag = str3;
            this.text = str4;
            this.source = str5;
            this.hierarchy = str6;
        }

        public static /* synthetic */ TargetInfo copy$default(TargetInfo targetInfo, String str, String str2, String str3, String str4, String str5, String str6, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = targetInfo.className;
            }
            if ((i5 & 2) != 0) {
                str2 = targetInfo.resourceName;
            }
            if ((i5 & 4) != 0) {
                str3 = targetInfo.tag;
            }
            if ((i5 & 8) != 0) {
                str4 = targetInfo.text;
            }
            if ((i5 & 16) != 0) {
                str5 = targetInfo.source;
            }
            if ((i5 & 32) != 0) {
                str6 = targetInfo.hierarchy;
            }
            String str7 = str5;
            String str8 = str6;
            return targetInfo.copy(str, str2, str3, str4, str7, str8);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final String getClassName() {
            return this.className;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getResourceName() {
            return this.resourceName;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final String getTag() {
            return this.tag;
        }

        @Nullable
        /* renamed from: component4, reason: from getter */
        public final String getText() {
            return this.text;
        }

        @Nullable
        /* renamed from: component5, reason: from getter */
        public final String getSource() {
            return this.source;
        }

        @Nullable
        /* renamed from: component6, reason: from getter */
        public final String getHierarchy() {
            return this.hierarchy;
        }

        @NotNull
        public final TargetInfo copy(@Nullable String className, @Nullable String resourceName, @Nullable String tag, @Nullable String text, @Nullable String source, @Nullable String hierarchy) {
            return new TargetInfo(className, resourceName, tag, text, source, hierarchy);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TargetInfo)) {
                return false;
            }
            TargetInfo targetInfo = (TargetInfo) other;
            return Intrinsics.b(this.className, targetInfo.className) && Intrinsics.b(this.resourceName, targetInfo.resourceName) && Intrinsics.b(this.tag, targetInfo.tag) && Intrinsics.b(this.text, targetInfo.text) && Intrinsics.b(this.source, targetInfo.source) && Intrinsics.b(this.hierarchy, targetInfo.hierarchy);
        }

        @Nullable
        public final String getClassName() {
            return this.className;
        }

        @Nullable
        public final String getHierarchy() {
            return this.hierarchy;
        }

        @Nullable
        public final String getResourceName() {
            return this.resourceName;
        }

        @Nullable
        public final String getSource() {
            return this.source;
        }

        @Nullable
        public final String getTag() {
            return this.tag;
        }

        @Nullable
        public final String getText() {
            return this.text;
        }

        public int hashCode() {
            String str = this.className;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.resourceName;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.tag;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.text;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.source;
            int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
            String str6 = this.hierarchy;
            return iHashCode5 + (str6 != null ? str6.hashCode() : 0);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("TargetInfo(className=");
            sb2.append(this.className);
            sb2.append(", resourceName=");
            sb2.append(this.resourceName);
            sb2.append(", tag=");
            sb2.append(this.tag);
            sb2.append(", text=");
            sb2.append(this.text);
            sb2.append(", source=");
            sb2.append(this.source);
            sb2.append(", hierarchy=");
            return c1.t(sb2, this.hierarchy, ')');
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.android.FrustrationInteractionsDetector$startUiChangeCollection$1", f = "FrustrationInteractionsDetector.kt", l = {Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE}, m = "invokeSuspend")
    /* renamed from: com.amplitude.android.FrustrationInteractionsDetector$startUiChangeCollection$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        @Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u008a@"}, d2 = {"<anonymous>", b.f42142b, "signal", "Lcom/amplitude/core/platform/Signal;"}, k = 3, mv = {1, 9, 0}, xi = 48)
        @DebugMetadata(c = "com.amplitude.android.FrustrationInteractionsDetector$startUiChangeCollection$1$1", f = "FrustrationInteractionsDetector.kt", l = {}, m = "invokeSuspend")
        /* renamed from: com.amplitude.android.FrustrationInteractionsDetector$startUiChangeCollection$1$1, reason: invalid class name and collision with other inner class name */
        public static final class C00001 extends SuspendLambda implements Function2<Signal, Continuation<? super Unit>, Object> {
            /* synthetic */ Object L$0;
            int label;
            final /* synthetic */ FrustrationInteractionsDetector this$0;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C00001(FrustrationInteractionsDetector frustrationInteractionsDetector, Continuation<? super C00001> continuation) {
                super(2, continuation);
                this.this$0 = frustrationInteractionsDetector;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                C00001 c00001 = new C00001(this.this$0, continuation);
                c00001.L$0 = obj;
                return c00001;
            }

            @Override // kotlin.jvm.functions.Function2
            @Nullable
            public final Object invoke(@NotNull Signal signal, @Nullable Continuation<? super Unit> continuation) {
                return ((C00001) create(signal, continuation)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                if (this.label != 0) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                Signal signal = (Signal) this.L$0;
                if (signal instanceof UiChangeSignal) {
                    this.this$0.lastUiChangeTime = ((UiChangeSignal) signal).getTimestamp().getTime();
                    this.this$0.logger.debug("UI change detected at " + this.this$0.lastUiChangeTime);
                }
                return Unit.f71706a;
            }
        }

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FrustrationInteractionsDetector.this.new AnonymousClass1(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                FrustrationInteractionsDetector.this.logger.debug("Starting UI change signal collection for dead click detection");
                q1 signalFlow = FrustrationInteractionsDetector.this.amplitude.getSignalFlow();
                C00001 c00001 = new C00001(FrustrationInteractionsDetector.this, null);
                this.label = 1;
                if (u1.i(signalFlow, c00001, this) == coroutineSingletons) {
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

    public FrustrationInteractionsDetector(@NotNull com.amplitude.core.Amplitude amplitude, @NotNull Logger logger, float f11, @NotNull Function0<AutocaptureState> autocaptureStateProvider) {
        Intrinsics.g(amplitude, "amplitude");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(autocaptureStateProvider, "autocaptureStateProvider");
        this.amplitude = amplitude;
        this.logger = logger;
        this.autocaptureStateProvider = autocaptureStateProvider;
        this.rageClickDistanceThresholdPx = f11 * RAGE_CLICK_DISTANCE_THRESHOLD;
        this.pendingRageClicks = new ConcurrentHashMap<>();
        this.pendingDeadClicks = new ConcurrentHashMap<>();
    }

    private final Map<String, Object> buildDeadClickProperties(DeadClickSession session) {
        return MapsKt.j0(new Pair(Constants.EventProperties.BEGIN_TIME, Long.valueOf(session.getClickInfo().getTimestamp())), new Pair(Constants.EventProperties.END_TIME, Long.valueOf(session.getClickInfo().getTimestamp() + 3000)), new Pair("[Amplitude] Duration", 3000L), new Pair(Constants.EventProperties.COORDINATE_X, Integer.valueOf((int) session.getClickInfo().getX())), new Pair(Constants.EventProperties.COORDINATE_Y, Integer.valueOf((int) session.getClickInfo().getY())), new Pair(Constants.EventProperties.CLICK_COUNT, 1));
    }

    private final Map<String, Object> buildRageClickProperties(RageClickSession session) {
        Pair pair = new Pair(Constants.EventProperties.BEGIN_TIME, Long.valueOf(session.getFirstClickTime()));
        Pair pair2 = new Pair(Constants.EventProperties.END_TIME, Long.valueOf(session.getLastClickTime()));
        Pair pair3 = new Pair("[Amplitude] Duration", Long.valueOf(session.getLastClickTime() - session.getFirstClickTime()));
        Pair pair4 = new Pair(Constants.EventProperties.COORDINATE_X, Integer.valueOf((int) session.getFirstClickX()));
        Pair pair5 = new Pair(Constants.EventProperties.COORDINATE_Y, Integer.valueOf((int) session.getFirstClickY()));
        Pair pair6 = new Pair(Constants.EventProperties.CLICK_COUNT, Integer.valueOf(session.getClickCount()));
        List<ClickInfo> clicks = session.getClicks();
        ArrayList arrayList = new ArrayList(b70.c.u0(clicks, 10));
        for (ClickInfo clickInfo : clicks) {
            arrayList.add(MapsKt.j0(new Pair(Constants.EventProperties.COORDINATE_X, Integer.valueOf((int) clickInfo.getX())), new Pair(Constants.EventProperties.COORDINATE_Y, Integer.valueOf((int) clickInfo.getY())), new Pair("timestamp", Long.valueOf(clickInfo.getTimestamp()))));
        }
        return MapsKt.j0(pair, pair2, pair3, pair4, pair5, pair6, new Pair(Constants.EventProperties.CLICKS, arrayList));
    }

    private final String generateClickId(ClickInfo clickInfo, TargetInfo targetInfo) {
        StringBuilder sb2 = new StringBuilder();
        String className = targetInfo.getClassName();
        if (className == null) {
            className = AbstractJsonLexerKt.NULL;
        }
        sb2.append(className);
        sb2.append('_');
        sb2.append((int) clickInfo.getX());
        sb2.append('_');
        sb2.append((int) clickInfo.getY());
        sb2.append('_');
        sb2.append(System.currentTimeMillis());
        return sb2.toString();
    }

    private final String generateLocationKey(ClickInfo clickInfo, TargetInfo targetInfo) {
        return targetInfo.getClassName() + '_' + ((int) (clickInfo.getX() / this.rageClickDistanceThresholdPx)) + '_' + ((int) (clickInfo.getY() / this.rageClickDistanceThresholdPx));
    }

    private final AutocaptureState getAutocaptureState() {
        return (AutocaptureState) this.autocaptureStateProvider.invoke();
    }

    private final boolean hasActiveSignalProvider() {
        return this.lastUiChangeTime > 0;
    }

    private final boolean isDeadClickIgnored(ViewTarget target) {
        return target.getAmpIgnoreDeadClick$android_release();
    }

    private final boolean isRageClickIgnored(ViewTarget target) {
        return target.getAmpIgnoreRageClick$android_release();
    }

    private final boolean isWithinDistanceThreshold(float x12, float y12, float x22, float y22) {
        PointF pointF = new PointF(x12, y12);
        PointF pointF2 = new PointF(x22, y22);
        return PointF.length(pointF.x - pointF2.x, pointF.y - pointF2.y) <= this.rageClickDistanceThresholdPx;
    }

    private final void processDeadClick(ClickInfo clickInfo, TargetInfo targetInfo, ViewTarget target, String activityName, long clickTime, String clickId) {
        r1 job;
        r1 r1Var = this.uiChangeCollectionJob;
        if (r1Var == null || !r1Var.b()) {
            this.logger.error("Dead click detection is disabled - call start() to enable.");
            return;
        }
        if (!hasActiveSignalProvider()) {
            this.logger.error("Dead click detection is disabled - no UI change signals observed yet. Ensure SessionReplay plugin is active.");
            return;
        }
        DeadClickSession deadClickSession = this.pendingDeadClicks.get(clickId);
        if (deadClickSession != null && (job = deadClickSession.getJob()) != null) {
            job.c(null);
        }
        DeadClickSession deadClickSession2 = new DeadClickSession(target, activityName, ClickInfo.copy$default(clickInfo, 0.0f, 0.0f, clickTime, 3, null), targetInfo, this.lastUiChangeTime, null, 32, null);
        this.pendingDeadClicks.put(clickId, deadClickSession2);
        deadClickSession2.setJob(m0.t(this.amplitude.getAmplitudeScope(), this.amplitude.getAmplitudeDispatcher(), null, new FrustrationInteractionsDetector$processDeadClick$job$1(this, deadClickSession2, clickId, null), 2));
    }

    private final void processRageClick(ClickInfo clickInfo, TargetInfo targetInfo, ViewTarget target, String activityName, long clickTime) {
        String strGenerateLocationKey = generateLocationKey(clickInfo, targetInfo);
        RageClickSession rageClickSession = this.pendingRageClicks.get(strGenerateLocationKey);
        if (rageClickSession == null) {
            startNewRageClickSession(strGenerateLocationKey, clickInfo, targetInfo, clickTime);
            return;
        }
        if (clickTime - rageClickSession.getFirstClickTime() > 1000) {
            startNewRageClickSession(strGenerateLocationKey, clickInfo, targetInfo, clickTime);
            return;
        }
        if (!isWithinDistanceThreshold(clickInfo.getX(), clickInfo.getY(), rageClickSession.getFirstClickX(), rageClickSession.getFirstClickY())) {
            startNewRageClickSession(strGenerateLocationKey, clickInfo, targetInfo, clickTime);
            return;
        }
        rageClickSession.setClickCount(rageClickSession.getClickCount() + 1);
        rageClickSession.setLastClickTime(clickTime);
        rageClickSession.getClicks().add(ClickInfo.copy$default(clickInfo, 0.0f, 0.0f, clickTime, 3, null));
        if (rageClickSession.getClickCount() >= 4) {
            trackRageClick(rageClickSession, target, activityName);
            this.pendingRageClicks.remove(strGenerateLocationKey);
        }
    }

    private final void startNewRageClickSession(String locationKey, ClickInfo clickInfo, TargetInfo targetInfo, long clickTime) {
        this.pendingRageClicks.put(locationKey, new RageClickSession(clickTime, clickTime, 1, clickInfo.getX(), clickInfo.getY(), targetInfo, ul.b.T(ClickInfo.copy$default(clickInfo, 0.0f, 0.0f, clickTime, 3, null))));
    }

    private final void startUiChangeCollection() {
        this.uiChangeCollectionJob = m0.t(this.amplitude.getAmplitudeScope(), this.amplitude.getAmplitudeDispatcher(), null, new AnonymousClass1(null), 2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void trackDeadClick(DeadClickSession session) {
        com.amplitude.core.Amplitude.track$default(this.amplitude, Constants.EventTypes.DEAD_CLICK, MapsKt.m0(ViewTargetKt.buildElementInteractedProperties(session.getTarget(), session.getActivityName()), buildDeadClickProperties(session)), (EventOptions) null, 4, (Object) null);
        this.logger.debug("Dead click detected");
    }

    private final void trackRageClick(RageClickSession session, ViewTarget target, String activityName) {
        com.amplitude.core.Amplitude.track$default(this.amplitude, Constants.EventTypes.RAGE_CLICK, MapsKt.m0(ViewTargetKt.buildElementInteractedProperties(target, activityName), buildRageClickProperties(session)), (EventOptions) null, 4, (Object) null);
        this.logger.debug("Rage click detected with " + session.getClickCount() + " clicks");
    }

    public final void processClick(@NotNull ClickInfo clickInfo, @NotNull TargetInfo targetInfo, @NotNull ViewTarget target, @NotNull String activityName) {
        FrustrationInteractionsDetector frustrationInteractionsDetector;
        ClickInfo clickInfo2;
        TargetInfo targetInfo2;
        ViewTarget viewTarget;
        String str;
        Intrinsics.g(clickInfo, "clickInfo");
        Intrinsics.g(targetInfo, "targetInfo");
        Intrinsics.g(target, "target");
        Intrinsics.g(activityName, "activityName");
        long jCurrentTimeMillis = System.currentTimeMillis();
        String strGenerateClickId = generateClickId(clickInfo, targetInfo);
        if (!getAutocaptureState().getInteractions().contains(InteractionType.RageClick.INSTANCE)) {
            frustrationInteractionsDetector = this;
            clickInfo2 = clickInfo;
            targetInfo2 = targetInfo;
            viewTarget = target;
            str = activityName;
        } else if (isRageClickIgnored(target)) {
            frustrationInteractionsDetector = this;
            clickInfo2 = clickInfo;
            targetInfo2 = targetInfo;
            viewTarget = target;
            str = activityName;
            frustrationInteractionsDetector.logger.debug("Skipping rage click processing for ignored target: " + targetInfo2.getClassName());
        } else {
            frustrationInteractionsDetector = this;
            clickInfo2 = clickInfo;
            targetInfo2 = targetInfo;
            viewTarget = target;
            str = activityName;
            frustrationInteractionsDetector.processRageClick(clickInfo2, targetInfo2, viewTarget, str, jCurrentTimeMillis);
        }
        if (getAutocaptureState().getInteractions().contains(InteractionType.DeadClick.INSTANCE)) {
            if (!isDeadClickIgnored(viewTarget)) {
                frustrationInteractionsDetector.processDeadClick(clickInfo2, targetInfo2, viewTarget, str, jCurrentTimeMillis, strGenerateClickId);
                return;
            }
            frustrationInteractionsDetector.logger.debug("Skipping dead click processing for ignored target: " + targetInfo2.getClassName());
        }
    }

    public final void start() {
        startUiChangeCollection();
        this.logger.debug("FrustrationInteractionsDetector started - UI change collection is now active");
    }

    public final void stop() {
        this.lastUiChangeTime = 0L;
        r1 r1Var = this.uiChangeCollectionJob;
        if (r1Var != null) {
            r1Var.c(null);
        }
        Collection<DeadClickSession> collectionValues = this.pendingDeadClicks.values();
        Intrinsics.f(collectionValues, "<get-values>(...)");
        Iterator<T> it = collectionValues.iterator();
        while (it.hasNext()) {
            r1 job = ((DeadClickSession) it.next()).getJob();
            if (job != null) {
                job.c(null);
            }
        }
        this.pendingDeadClicks.clear();
        this.pendingRageClicks.clear();
        this.logger.debug("FrustrationInteractionsDetector stopped - UI change collection is now inactive");
    }

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0006HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000b¨\u0006\u0018"}, d2 = {"Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;", b.f42142b, "x", b.f42142b, "y", "timestamp", b.f42142b, "(FFJ)V", "getTimestamp", "()J", "getX", "()F", "getY", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class ClickInfo {
        private final long timestamp;
        private final float x;
        private final float y;

        public ClickInfo(float f11, float f12, long j11) {
            this.x = f11;
            this.y = f12;
            this.timestamp = j11;
        }

        public static /* synthetic */ ClickInfo copy$default(ClickInfo clickInfo, float f11, float f12, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                f11 = clickInfo.x;
            }
            if ((i5 & 2) != 0) {
                f12 = clickInfo.y;
            }
            if ((i5 & 4) != 0) {
                j11 = clickInfo.timestamp;
            }
            return clickInfo.copy(f11, f12, j11);
        }

        /* renamed from: component1, reason: from getter */
        public final float getX() {
            return this.x;
        }

        /* renamed from: component2, reason: from getter */
        public final float getY() {
            return this.y;
        }

        /* renamed from: component3, reason: from getter */
        public final long getTimestamp() {
            return this.timestamp;
        }

        @NotNull
        public final ClickInfo copy(float x11, float y11, long timestamp) {
            return new ClickInfo(x11, y11, timestamp);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ClickInfo)) {
                return false;
            }
            ClickInfo clickInfo = (ClickInfo) other;
            return Float.compare(this.x, clickInfo.x) == 0 && Float.compare(this.y, clickInfo.y) == 0 && this.timestamp == clickInfo.timestamp;
        }

        public final long getTimestamp() {
            return this.timestamp;
        }

        public final float getX() {
            return this.x;
        }

        public final float getY() {
            return this.y;
        }

        public int hashCode() {
            return Long.hashCode(this.timestamp) + m.d(this.y, Float.hashCode(this.x) * 31, 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ClickInfo(x=");
            sb2.append(this.x);
            sb2.append(", y=");
            sb2.append(this.y);
            sb2.append(", timestamp=");
            return a2.c.n(sb2, this.timestamp, ')');
        }

        public /* synthetic */ ClickInfo(float f11, float f12, long j11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(f11, f12, (i5 & 4) != 0 ? System.currentTimeMillis() : j11);
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0011\b\u0080\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0018\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0019J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJN\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\u000b\u001a\u00020\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\fHÆ\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u001e\u0010\u0013J\u0010\u0010 \u001a\u00020\u001fHÖ\u0001¢\u0006\u0004\b \u0010!J\u001a\u0010$\u001a\u00020#2\b\u0010\"\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b$\u0010%R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010&\u001a\u0004\b'\u0010\u0011R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010(\u001a\u0004\b)\u0010\u0013R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010*\u001a\u0004\b+\u0010\u0015R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010,\u001a\u0004\b-\u0010\u0017R\u0017\u0010\u000b\u001a\u00020\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010.\u001a\u0004\b/\u0010\u0019R$\u0010\r\u001a\u0004\u0018\u00010\f8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\r\u00100\u001a\u0004\b1\u0010\u001b\"\u0004\b2\u00103¨\u00064"}, d2 = {"Lcom/amplitude/android/FrustrationInteractionsDetector$DeadClickSession;", b.f42142b, "Lcom/amplitude/android/internal/ViewTarget;", "target", b.f42142b, "activityName", "Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;", "clickInfo", "Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;", "targetInfo", b.f42142b, "preClickUiChangeTime", "Lt70/r1;", "job", "<init>", "(Lcom/amplitude/android/internal/ViewTarget;Ljava/lang/String;Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;JLt70/r1;)V", "component1", "()Lcom/amplitude/android/internal/ViewTarget;", "component2", "()Ljava/lang/String;", "component3", "()Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;", "component4", "()Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;", "component5", "()J", "component6", "()Lt70/r1;", "copy", "(Lcom/amplitude/android/internal/ViewTarget;Ljava/lang/String;Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;JLt70/r1;)Lcom/amplitude/android/FrustrationInteractionsDetector$DeadClickSession;", "toString", b.f42142b, "hashCode", "()I", InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", "(Ljava/lang/Object;)Z", "Lcom/amplitude/android/internal/ViewTarget;", "getTarget", "Ljava/lang/String;", "getActivityName", "Lcom/amplitude/android/FrustrationInteractionsDetector$ClickInfo;", "getClickInfo", "Lcom/amplitude/android/FrustrationInteractionsDetector$TargetInfo;", "getTargetInfo", "J", "getPreClickUiChangeTime", "Lt70/r1;", "getJob", "setJob", "(Lt70/r1;)V", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class DeadClickSession {

        @NotNull
        private final String activityName;

        @NotNull
        private final ClickInfo clickInfo;

        @Nullable
        private r1 job;
        private final long preClickUiChangeTime;

        @NotNull
        private final ViewTarget target;

        @NotNull
        private final TargetInfo targetInfo;

        public DeadClickSession(@NotNull ViewTarget target, @NotNull String activityName, @NotNull ClickInfo clickInfo, @NotNull TargetInfo targetInfo, long j11, @Nullable r1 r1Var) {
            Intrinsics.g(target, "target");
            Intrinsics.g(activityName, "activityName");
            Intrinsics.g(clickInfo, "clickInfo");
            Intrinsics.g(targetInfo, "targetInfo");
            this.target = target;
            this.activityName = activityName;
            this.clickInfo = clickInfo;
            this.targetInfo = targetInfo;
            this.preClickUiChangeTime = j11;
            this.job = r1Var;
        }

        public static /* synthetic */ DeadClickSession copy$default(DeadClickSession deadClickSession, ViewTarget viewTarget, String str, ClickInfo clickInfo, TargetInfo targetInfo, long j11, r1 r1Var, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                viewTarget = deadClickSession.target;
            }
            if ((i5 & 2) != 0) {
                str = deadClickSession.activityName;
            }
            if ((i5 & 4) != 0) {
                clickInfo = deadClickSession.clickInfo;
            }
            if ((i5 & 8) != 0) {
                targetInfo = deadClickSession.targetInfo;
            }
            if ((i5 & 16) != 0) {
                j11 = deadClickSession.preClickUiChangeTime;
            }
            if ((i5 & 32) != 0) {
                r1Var = deadClickSession.job;
            }
            r1 r1Var2 = r1Var;
            long j12 = j11;
            return deadClickSession.copy(viewTarget, str, clickInfo, targetInfo, j12, r1Var2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final ViewTarget getTarget() {
            return this.target;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getActivityName() {
            return this.activityName;
        }

        @NotNull
        /* renamed from: component3, reason: from getter */
        public final ClickInfo getClickInfo() {
            return this.clickInfo;
        }

        @NotNull
        /* renamed from: component4, reason: from getter */
        public final TargetInfo getTargetInfo() {
            return this.targetInfo;
        }

        /* renamed from: component5, reason: from getter */
        public final long getPreClickUiChangeTime() {
            return this.preClickUiChangeTime;
        }

        @Nullable
        /* renamed from: component6, reason: from getter */
        public final r1 getJob() {
            return this.job;
        }

        @NotNull
        public final DeadClickSession copy(@NotNull ViewTarget target, @NotNull String activityName, @NotNull ClickInfo clickInfo, @NotNull TargetInfo targetInfo, long preClickUiChangeTime, @Nullable r1 job) {
            Intrinsics.g(target, "target");
            Intrinsics.g(activityName, "activityName");
            Intrinsics.g(clickInfo, "clickInfo");
            Intrinsics.g(targetInfo, "targetInfo");
            return new DeadClickSession(target, activityName, clickInfo, targetInfo, preClickUiChangeTime, job);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof DeadClickSession)) {
                return false;
            }
            DeadClickSession deadClickSession = (DeadClickSession) other;
            return Intrinsics.b(this.target, deadClickSession.target) && Intrinsics.b(this.activityName, deadClickSession.activityName) && Intrinsics.b(this.clickInfo, deadClickSession.clickInfo) && Intrinsics.b(this.targetInfo, deadClickSession.targetInfo) && this.preClickUiChangeTime == deadClickSession.preClickUiChangeTime && Intrinsics.b(this.job, deadClickSession.job);
        }

        @NotNull
        public final String getActivityName() {
            return this.activityName;
        }

        @NotNull
        public final ClickInfo getClickInfo() {
            return this.clickInfo;
        }

        @Nullable
        public final r1 getJob() {
            return this.job;
        }

        public final long getPreClickUiChangeTime() {
            return this.preClickUiChangeTime;
        }

        @NotNull
        public final ViewTarget getTarget() {
            return this.target;
        }

        @NotNull
        public final TargetInfo getTargetInfo() {
            return this.targetInfo;
        }

        public int hashCode() {
            int iD = c0.d((this.targetInfo.hashCode() + ((this.clickInfo.hashCode() + c0.e(this.target.hashCode() * 31, 31, this.activityName)) * 31)) * 31, 31, this.preClickUiChangeTime);
            r1 r1Var = this.job;
            return iD + (r1Var == null ? 0 : r1Var.hashCode());
        }

        public final void setJob(@Nullable r1 r1Var) {
            this.job = r1Var;
        }

        @NotNull
        public String toString() {
            return "DeadClickSession(target=" + this.target + ", activityName=" + this.activityName + ", clickInfo=" + this.clickInfo + ", targetInfo=" + this.targetInfo + ", preClickUiChangeTime=" + this.preClickUiChangeTime + ", job=" + this.job + ')';
        }

        public /* synthetic */ DeadClickSession(ViewTarget viewTarget, String str, ClickInfo clickInfo, TargetInfo targetInfo, long j11, r1 r1Var, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(viewTarget, str, clickInfo, targetInfo, j11, (i5 & 32) != 0 ? null : r1Var);
        }
    }
}
