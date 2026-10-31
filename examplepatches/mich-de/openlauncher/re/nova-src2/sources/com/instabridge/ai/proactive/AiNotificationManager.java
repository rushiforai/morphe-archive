package com.instabridge.ai.proactive;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Build;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import n4.n0;
import n4.p;
import n4.r;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0001\u0018\u0000 \u000f2\u00020\u0001:\u0001\u000fB\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0007J\b\u0010\f\u001a\u00020\rH\u0002J\b\u0010\u000e\u001a\u00020\tH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/proactive/AiNotificationManager;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "config", "Lcom/instabridge/ai/proactive/NotificationConfig;", "<init>", "(Landroid/content/Context;Lcom/instabridge/ai/proactive/NotificationConfig;)V", "post", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "insight", "Lcom/instabridge/ai/proactive/AiInsightData;", "hasNotificationPermission", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ensureChannel", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiNotificationManager {
    private static final int NOTIFICATION_ID = 8472;

    @NotNull
    private final NotificationConfig config;

    @NotNull
    private final Context context;
    public static final int $stable = 8;

    public AiNotificationManager(@NotNull Context context, @NotNull NotificationConfig config) {
        Intrinsics.g(context, "context");
        Intrinsics.g(config, "config");
        this.context = context;
        this.config = config;
    }

    private final void ensureChannel() {
        Object systemService = this.context.getSystemService("notification");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.app.NotificationManager");
        NotificationManager notificationManager = (NotificationManager) systemService;
        if (notificationManager.getNotificationChannel(this.config.getChannelId()) != null) {
            return;
        }
        notificationManager.createNotificationChannel(new NotificationChannel(this.config.getChannelId(), this.config.getChannelName(), 3));
    }

    private final boolean hasNotificationPermission() {
        return Build.VERSION.SDK_INT < 33 || o4.a.a(this.context, "android.permission.POST_NOTIFICATIONS") == 0;
    }

    @SuppressLint({"MissingPermission"})
    public final void post(@NotNull AiInsightData insight) {
        Intrinsics.g(insight, "insight");
        if (hasNotificationPermission()) {
            ensureChannel();
            r rVar = new r(this.context, this.config.getChannelId());
            rVar.f77870s.icon = this.config.getSmallIcon();
            String chipText = insight.getChipText();
            if (r70.k.U0(chipText)) {
                chipText = insight.getText();
            }
            rVar.f77858e = r.c(chipText);
            rVar.f77859f = r.c(insight.getText());
            p pVar = new p(false);
            pVar.f77847f = r.c(insight.getText());
            rVar.m(pVar);
            rVar.d(true);
            PendingIntent pendingIntent = (PendingIntent) this.config.getTapIntentFactory().invoke(insight);
            if (pendingIntent != null) {
                rVar.f77860g = pendingIntent;
            }
            Notification notificationB = rVar.b();
            Intrinsics.f(notificationB, "build(...)");
            new n0(this.context).e(NOTIFICATION_ID, notificationB);
        }
    }
}
