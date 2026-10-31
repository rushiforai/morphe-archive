package com.instabridge.ai.proactive;

import android.content.SharedPreferences;
import com.instabridge.ai.billing.AiTier;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.concurrent.TimeUnit;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0001\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u001a\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000eJ\u0010\u0010\u000f\u001a\u00020\u00102\b\u0010\r\u001a\u0004\u0018\u00010\u000eJ\u0006\u0010\u0011\u001a\u00020\u0006J\u0006\u0010\u0012\u001a\u00020\nR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/proactive/ProactiveQuotaPause;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "prefs", "Landroid/content/SharedPreferences;", "clock", "Lkotlin/Function0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Landroid/content/SharedPreferences;Lkotlin/jvm/functions/Function0;)V", "pause", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "resetIn", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "currentTier", "Lcom/instabridge/ai/billing/AiTier;", "isPaused", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "pausedUntilMs", "clear", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ProactiveQuotaPause {

    @NotNull
    private static final String KEY_TIER = "quota_paused_tier";

    @NotNull
    private static final String KEY_UNTIL_MS = "quota_paused_until_ms";

    @NotNull
    private final Function0<Long> clock;

    @NotNull
    private final SharedPreferences prefs;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @NotNull
    private static final Regex RESET_IN = new Regex("^\\s*(\\d+)h\\s*(\\d+)m\\s*$");
    private static final long DAY_MS = TimeUnit.DAYS.toMillis(1);

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* renamed from: com.instabridge.ai.proactive.ProactiveQuotaPause$1, reason: invalid class name */
    public /* synthetic */ class AnonymousClass1 extends FunctionReferenceImpl implements Function0<Long> {
        public static final AnonymousClass1 INSTANCE = new AnonymousClass1();

        public AnonymousClass1() {
            super(0, System.class, "currentTimeMillis", "currentTimeMillis()J", 0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Long invoke() {
            return Long.valueOf(System.currentTimeMillis());
        }
    }

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001f\u0010\u000b\u001a\u00020\n2\b\u0010\f\u001a\u0004\u0018\u00010\u00052\u0006\u0010\r\u001a\u00020\nH\u0000¢\u0006\u0002\b\u000eR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lcom/instabridge/ai/proactive/ProactiveQuotaPause$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "KEY_UNTIL_MS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "KEY_TIER", "RESET_IN", "Lkotlin/text/Regex;", "DAY_MS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "resetDelayMs", "resetIn", "nowMs", "resetDelayMs$instabridge_ai_sdk_release", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public final long resetDelayMs$instabridge_ai_sdk_release(@Nullable String resetIn, long nowMs) {
            long jLongValue;
            kotlin.text.b bVarE = resetIn != null ? ProactiveQuotaPause.RESET_IN.e(resetIn) : null;
            Long lValueOf = bVarE != null ? Long.valueOf(TimeUnit.MINUTES.toMillis(Long.parseLong((String) ((MatcherMatchResult$groupValues$1) bVarE.a()).get(2))) + TimeUnit.HOURS.toMillis(Long.parseLong((String) ((MatcherMatchResult$groupValues$1) bVarE.a()).get(1)))) : null;
            if (lValueOf != null) {
                jLongValue = lValueOf.longValue();
            } else {
                long j11 = ProactiveQuotaPause.DAY_MS;
                long j12 = ProactiveQuotaPause.DAY_MS;
                long j13 = nowMs % j12;
                jLongValue = j11 - (j13 + (j12 & (((j13 ^ j12) & ((-j13) | j13)) >> 63)));
            }
            return TimeUnit.MINUTES.toMillis(1L) + kotlin.ranges.a.g0(jLongValue, 0L, ProactiveQuotaPause.DAY_MS);
        }

        private Companion() {
        }
    }

    public ProactiveQuotaPause(@NotNull SharedPreferences prefs, @NotNull Function0<Long> clock) {
        Intrinsics.g(prefs, "prefs");
        Intrinsics.g(clock, "clock");
        this.prefs = prefs;
        this.clock = clock;
    }

    public final void clear() {
        this.prefs.edit().remove(KEY_UNTIL_MS).remove(KEY_TIER).apply();
    }

    public final boolean isPaused(@Nullable AiTier currentTier) {
        long j11 = this.prefs.getLong(KEY_UNTIL_MS, 0L);
        if (j11 == 0) {
            return false;
        }
        boolean zB = Intrinsics.b(this.prefs.getString(KEY_TIER, null), currentTier != null ? currentTier.name() : null);
        if (((Number) this.clock.invoke()).longValue() < j11 && zB) {
            return true;
        }
        clear();
        return false;
    }

    public final void pause(@Nullable String resetIn, @Nullable AiTier currentTier) {
        long jLongValue = ((Number) this.clock.invoke()).longValue();
        this.prefs.edit().putLong(KEY_UNTIL_MS, INSTANCE.resetDelayMs$instabridge_ai_sdk_release(resetIn, jLongValue) + jLongValue).putString(KEY_TIER, currentTier != null ? currentTier.name() : null).apply();
    }

    public final long pausedUntilMs() {
        return this.prefs.getLong(KEY_UNTIL_MS, 0L);
    }

    public /* synthetic */ ProactiveQuotaPause(SharedPreferences sharedPreferences, Function0 function0, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(sharedPreferences, (i5 & 2) != 0 ? AnonymousClass1.INSTANCE : function0);
    }
}
