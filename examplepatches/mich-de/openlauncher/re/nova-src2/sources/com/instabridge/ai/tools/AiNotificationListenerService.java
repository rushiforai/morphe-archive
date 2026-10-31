package com.instabridge.ai.tools;

import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00072\u00020\u0001:\u0001\u0007B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u0004\u001a\u00020\u0005H\u0016J\b\u0010\u0006\u001a\u00020\u0005H\u0016¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/tools/AiNotificationListenerService;", "Landroid/service/notification/NotificationListenerService;", "<init>", "()V", "onListenerConnected", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onListenerDisconnected", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiNotificationListenerService extends NotificationListenerService {

    @Nullable
    private static volatile AiNotificationListenerService instance;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005J\u0013\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\b¢\u0006\u0002\u0010\nR\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/tools/AiNotificationListenerService$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "instance", "Lcom/instabridge/ai/tools/AiNotificationListenerService;", "getInstanceIfConnected", "getActiveNotificationsSafe", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/service/notification/StatusBarNotification;", "()[Landroid/service/notification/StatusBarNotification;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @Nullable
        public final StatusBarNotification[] getActiveNotificationsSafe() {
            try {
                AiNotificationListenerService aiNotificationListenerService = AiNotificationListenerService.instance;
                if (aiNotificationListenerService != null) {
                    return aiNotificationListenerService.getActiveNotifications();
                }
                return null;
            } catch (Exception unused) {
                return null;
            }
        }

        @Nullable
        public final AiNotificationListenerService getInstanceIfConnected() {
            return AiNotificationListenerService.instance;
        }

        private Companion() {
        }
    }

    @Override // android.service.notification.NotificationListenerService
    public void onListenerConnected() {
        instance = this;
    }

    @Override // android.service.notification.NotificationListenerService
    public void onListenerDisconnected() {
        instance = null;
    }
}
