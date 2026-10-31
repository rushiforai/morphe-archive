package com.moloco.sdk.acm;

import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.acm.services.h;
import com.moloco.sdk.acm.services.j;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\n\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\f\u0018\u0000 #2\u00020\u0001:\u0001#B\u0019\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\r\u0010\u000b\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\nJ\u0015\u0010\u000e\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u001f\u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0014R\u0016\u0010\u0015\u001a\u00020\f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0015\u0010\u0016R \u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00180\u00178\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0019\u0010\u001a\u001a\u0004\b\u001b\u0010\u001cR\u001a\u0010\u001d\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u001d\u0010\u001e\u001a\u0004\b\u001f\u0010 R\u0011\u0010\r\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b!\u0010\"¨\u0006$"}, d2 = {"Lcom/moloco/sdk/acm/TimerEvent;", "Lcom/moloco/sdk/acm/c;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "eventName", "Lcom/moloco/sdk/acm/services/h;", "stopwatch", "<init>", "(Ljava/lang/String;Lcom/moloco/sdk/acm/services/h;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "startTimer", "()V", "stopTimer", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "time", "withTime", "(J)Lcom/moloco/sdk/acm/TimerEvent;", DatabaseConstants.KEY_FIELD, "value", "withTag", "(Ljava/lang/String;Ljava/lang/String;)Lcom/moloco/sdk/acm/TimerEvent;", "Lcom/moloco/sdk/acm/services/h;", "timeInMillis", "J", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/moloco/sdk/acm/EventTag;", "eventTags", "Ljava/util/List;", "getEventTags", "()Ljava/util/List;", PendingUpgradeStore.KEY_NAME, "Ljava/lang/String;", "getName", "()Ljava/lang/String;", "getTime", "()J", k.O, "moloco-android-client-metrics_release"}, k = 1, mv = {2, 0, 0})
@SourceDebugExtension
/* loaded from: classes.dex */
public final class TimerEvent implements c {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private static final int MAX_TAGS_PER_EVENT = 10;
    private static final int MAX_TAG_CHAR_LEN = 100;

    @NotNull
    private final List<EventTag> eventTags;

    @NotNull
    private final String name;

    @NotNull
    private final h stopwatch;
    private long timeInMillis;

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Lcom/moloco/sdk/acm/TimerEvent$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "MAX_TAGS_PER_EVENT", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "MAX_TAG_CHAR_LEN", "create", "Lcom/moloco/sdk/acm/TimerEvent;", "eventName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "moloco-android-client-metrics_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final TimerEvent create(@NotNull String eventName) {
            Intrinsics.g(eventName, "eventName");
            return new TimerEvent(eventName, new h(new j()), null);
        }

        private Companion() {
        }
    }

    public /* synthetic */ TimerEvent(String str, h hVar, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, hVar);
    }

    @Override // com.moloco.sdk.acm.c
    @NotNull
    public List<EventTag> getEventTags() {
        return this.eventTags;
    }

    @Override // com.moloco.sdk.acm.c
    @NotNull
    public String getName() {
        return this.name;
    }

    /* renamed from: getTime, reason: from getter */
    public final long getTimeInMillis() {
        return this.timeInMillis;
    }

    public final void startTimer() {
        this.stopwatch.c();
    }

    public final void stopTimer() {
        if (this.timeInMillis == 0) {
            this.timeInMillis = this.stopwatch.a();
        }
    }

    @NotNull
    public final TimerEvent withTime(long time) {
        if (time < 0) {
            throw new IllegalArgumentException("Count cannot be negative");
        }
        this.timeInMillis = time;
        return this;
    }

    private TimerEvent(String str, h hVar) {
        this.stopwatch = hVar;
        this.eventTags = new ArrayList();
        this.name = str;
    }

    @Override // com.moloco.sdk.acm.c
    @NotNull
    public TimerEvent withTag(@NotNull String key, @NotNull String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        if (getEventTags().size() < 10 && key.length() <= 100 && value.length() <= 100) {
            getEventTags().add(new EventTag(key, value));
        }
        return this;
    }
}
