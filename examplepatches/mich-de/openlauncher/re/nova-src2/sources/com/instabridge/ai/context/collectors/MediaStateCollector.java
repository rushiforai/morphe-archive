package com.instabridge.ai.context.collectors;

import android.content.Context;
import android.content.pm.PackageManager;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/context/collectors/MediaStateCollector;", b.f42142b, "<init>", "()V", "collect", b.f42142b, "context", "Landroid/content/Context;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class MediaStateCollector {
    public static final int $stable = 0;

    @NotNull
    public static final MediaStateCollector INSTANCE = new MediaStateCollector();

    private MediaStateCollector() {
    }

    @Nullable
    public final String collect(@NotNull Context context) {
        MediaSessionManager mediaSessionManager;
        MediaMetadata metadata;
        String string;
        String string2;
        Intrinsics.g(context, "context");
        try {
            Object systemService = context.getSystemService("media_session");
            mediaSessionManager = systemService instanceof MediaSessionManager ? (MediaSessionManager) systemService : null;
        } catch (SecurityException | Exception unused) {
        }
        if (mediaSessionManager == null) {
            return null;
        }
        List<MediaController> activeSessions = mediaSessionManager.getActiveSessions(null);
        Intrinsics.d(activeSessions);
        for (MediaController mediaController : activeSessions) {
            PlaybackState playbackState = mediaController.getPlaybackState();
            if (playbackState != null && playbackState.getState() == 3 && (metadata = mediaController.getMetadata()) != null && (string = metadata.getString("android.media.metadata.TITLE")) != null) {
                if (k.U0(string)) {
                    string = null;
                }
                if (string != null) {
                    String string3 = metadata.getString("android.media.metadata.ARTIST");
                    if (string3 == null || k.U0(string3)) {
                        string3 = null;
                    }
                    try {
                        PackageManager packageManager = context.getPackageManager();
                        string2 = packageManager.getApplicationLabel(packageManager.getApplicationInfo(mediaController.getPackageName(), 0)).toString();
                    } catch (Exception unused2) {
                        string2 = null;
                    }
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Now playing: " + string);
                    if (string3 != null) {
                        sb2.append(" by " + string3);
                    }
                    if (string2 != null) {
                        sb2.append(" on " + string2);
                    }
                    return sb2.toString();
                }
            }
        }
        return null;
    }
}
