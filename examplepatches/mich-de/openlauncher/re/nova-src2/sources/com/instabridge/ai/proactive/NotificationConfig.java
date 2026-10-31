package com.instabridge.ai.proactive;

import android.app.PendingIntent;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001BH\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012#\u0010\u0006\u001a\u001f\u0012\u0013\u0012\u00110\b¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0006\u0012\u0004\u0018\u00010\f0\u0007\u0012\b\b\u0002\u0010\r\u001a\u00020\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0005HÆ\u0003J&\u0010\u0019\u001a\u001f\u0012\u0013\u0012\u00110\b¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0006\u0012\u0004\u0018\u00010\f0\u0007HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003JN\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00052%\b\u0002\u0010\u0006\u001a\u001f\u0012\u0013\u0012\u00110\b¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0006\u0012\u0004\u0018\u00010\f0\u00072\b\b\u0002\u0010\r\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u001c\u001a\u00020\u001d2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001f\u001a\u00020\u0005HÖ\u0001J\t\u0010 \u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R.\u0010\u0006\u001a\u001f\u0012\u0013\u0012\u00110\b¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0006\u0012\u0004\u0018\u00010\f0\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\r\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0011¨\u0006!"}, d2 = {"Lcom/instabridge/ai/proactive/NotificationConfig;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "channelId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "smallIcon", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tapIntentFactory", "Lkotlin/Function1;", "Lcom/instabridge/ai/proactive/AiInsightData;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "insight", "Landroid/app/PendingIntent;", "channelName", "<init>", "(Ljava/lang/String;ILkotlin/jvm/functions/Function1;Ljava/lang/String;)V", "getChannelId", "()Ljava/lang/String;", "getSmallIcon", "()I", "getTapIntentFactory", "()Lkotlin/jvm/functions/Function1;", "getChannelName", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class NotificationConfig {
    public static final int $stable = 0;

    @NotNull
    private final String channelId;

    @NotNull
    private final String channelName;
    private final int smallIcon;

    @NotNull
    private final Function1<AiInsightData, PendingIntent> tapIntentFactory;

    /* JADX WARN: Multi-variable type inference failed */
    public NotificationConfig(@NotNull String channelId, int i5, @NotNull Function1<? super AiInsightData, PendingIntent> tapIntentFactory, @NotNull String channelName) {
        Intrinsics.g(channelId, "channelId");
        Intrinsics.g(tapIntentFactory, "tapIntentFactory");
        Intrinsics.g(channelName, "channelName");
        this.channelId = channelId;
        this.smallIcon = i5;
        this.tapIntentFactory = tapIntentFactory;
        this.channelName = channelName;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ NotificationConfig copy$default(NotificationConfig notificationConfig, String str, int i5, Function1 function1, String str2, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = notificationConfig.channelId;
        }
        if ((i11 & 2) != 0) {
            i5 = notificationConfig.smallIcon;
        }
        if ((i11 & 4) != 0) {
            function1 = notificationConfig.tapIntentFactory;
        }
        if ((i11 & 8) != 0) {
            str2 = notificationConfig.channelName;
        }
        return notificationConfig.copy(str, i5, function1, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getChannelId() {
        return this.channelId;
    }

    /* renamed from: component2, reason: from getter */
    public final int getSmallIcon() {
        return this.smallIcon;
    }

    @NotNull
    public final Function1<AiInsightData, PendingIntent> component3() {
        return this.tapIntentFactory;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getChannelName() {
        return this.channelName;
    }

    @NotNull
    public final NotificationConfig copy(@NotNull String channelId, int smallIcon, @NotNull Function1<? super AiInsightData, PendingIntent> tapIntentFactory, @NotNull String channelName) {
        Intrinsics.g(channelId, "channelId");
        Intrinsics.g(tapIntentFactory, "tapIntentFactory");
        Intrinsics.g(channelName, "channelName");
        return new NotificationConfig(channelId, smallIcon, tapIntentFactory, channelName);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof NotificationConfig)) {
            return false;
        }
        NotificationConfig notificationConfig = (NotificationConfig) other;
        return Intrinsics.b(this.channelId, notificationConfig.channelId) && this.smallIcon == notificationConfig.smallIcon && Intrinsics.b(this.tapIntentFactory, notificationConfig.tapIntentFactory) && Intrinsics.b(this.channelName, notificationConfig.channelName);
    }

    @NotNull
    public final String getChannelId() {
        return this.channelId;
    }

    @NotNull
    public final String getChannelName() {
        return this.channelName;
    }

    public final int getSmallIcon() {
        return this.smallIcon;
    }

    @NotNull
    public final Function1<AiInsightData, PendingIntent> getTapIntentFactory() {
        return this.tapIntentFactory;
    }

    public int hashCode() {
        return this.channelName.hashCode() + ((this.tapIntentFactory.hashCode() + u4.a(this.smallIcon, this.channelId.hashCode() * 31, 31)) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("NotificationConfig(channelId=");
        sb2.append(this.channelId);
        sb2.append(", smallIcon=");
        sb2.append(this.smallIcon);
        sb2.append(", tapIntentFactory=");
        sb2.append(this.tapIntentFactory);
        sb2.append(", channelName=");
        return c1.t(sb2, this.channelName, ')');
    }

    public /* synthetic */ NotificationConfig(String str, int i5, Function1 function1, String str2, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, i5, function1, (i11 & 8) != 0 ? "AI Insights" : str2);
    }
}
