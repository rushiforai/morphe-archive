package com.instabridge.ai.tools.standard;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import b70.h;
import com.instabridge.ai.tools.AiTool;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.ai.tools.ToolType;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J&\u0010\u0019\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001a\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000bH\u0016J4\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001a\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001d\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001eR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/tools/standard/ShowTimers;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", b.f42142b, b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", b.f42142b, "context", "Landroid/content/Context;", "canExecute", "args", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ShowTimers extends AiTool {

    @NotNull
    public static final ShowTimers INSTANCE = new ShowTimers();

    @NotNull
    private static final String name = "show_timers";

    @NotNull
    private static final String description = "View the list of running or saved timers in the clock app. Use when the user says 'show my timers', 'what timers are running', 'check my timer'. For setting a NEW timer, use `set_timer` instead. Requires Android 9+.";

    @NotNull
    private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

    @NotNull
    private static final ToolType toolType = ToolType.ACTION;

    @NotNull
    private static final String category = "clock";
    public static final int $stable = 8;

    private ShowTimers() {
    }

    @Override // com.instabridge.ai.tools.AiTool
    public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) {
        Intrinsics.g(context, "context");
        Intrinsics.g(args, "args");
        return Build.VERSION.SDK_INT >= 28;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @Nullable
    public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
        return Build.VERSION.SDK_INT < 28 ? new ToolResult.Error("Requires Android 9+", "api_level_too_low") : AiTool.launchIntent$default(this, context, new Intent("android.intent.action.SHOW_TIMERS"), "show_timers", null, 8, null);
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public String getCategory() {
        return category;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public String getDescription() {
        return description;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public String getName() {
        return name;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public Map<String, Object> getParameters() {
        return parameters;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public ToolType getToolType() {
        return toolType;
    }

    @Override // com.instabridge.ai.tools.AiTool
    public boolean isAvailableOnDevice(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return Build.VERSION.SDK_INT >= 28 && AiTool.INSTANCE.hasIntentHandler$instabridge_ai_sdk_release(context, new Intent("android.intent.action.SHOW_TIMERS"));
    }
}
