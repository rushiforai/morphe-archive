package com.instabridge.ai.tools.standard;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.c;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/tools/standard/StandardToolsProbedActions;", b.f42142b, "<init>", "()V", "all", b.f42142b, b.f42142b, "getAll", "()Ljava/util/Set;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class StandardToolsProbedActions {

    @NotNull
    public static final StandardToolsProbedActions INSTANCE = new StandardToolsProbedActions();

    @NotNull
    private static final Set<String> all = c.f1(new String[]{"android.media.action.IMAGE_CAPTURE", "android.media.action.VIDEO_CAPTURE", "android.media.action.STILL_IMAGE_CAMERA", "android.media.action.VIDEO_CAMERA", "android.media.action.MEDIA_PLAY_FROM_SEARCH", "android.intent.action.GET_CONTENT", "android.intent.action.OPEN_DOCUMENT", "android.intent.action.CREATE_DOCUMENT", "android.intent.action.OPEN_DOCUMENT_TREE", "android.intent.action.SHOW_ALARMS", "android.intent.action.SHOW_TIMERS", "android.intent.action.DISMISS_ALARM", "android.intent.action.DISMISS_TIMER", "android.intent.action.SNOOZE_ALARM", "android.intent.action.SET_ALARM", "android.intent.action.SET_TIMER", "android.intent.action.POWER_USAGE_SUMMARY"});
    public static final int $stable = 8;

    private StandardToolsProbedActions() {
    }

    @NotNull
    public final Set<String> getAll() {
        return all;
    }
}
