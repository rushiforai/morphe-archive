package com.instabridge.ai.tools.perapp;

import android.content.Context;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.os.Process;
import android.util.Log;
import b70.h;
import com.instabridge.ai.tools.AiTool;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.ai.tools.ToolType;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import h6.c1;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 \"2\u00020\u0001:\u0001\"B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J&\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\rH\u0016J4\u0010\u001e\u001a\u00020\u001f2\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010 \u001a\u00020\u001cH\u0096@¢\u0006\u0002\u0010!R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0014\u0010\n\u001a\u00020\u0007X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\tR \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0007X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\t¨\u0006#"}, d2 = {"Lcom/instabridge/ai/tools/perapp/PerAppFeatureTool;", "Lcom/instabridge/ai/tools/AiTool;", "feature", "Lcom/instabridge/ai/tools/perapp/PerAppFeatureCatalog$Feature;", "<init>", "(Lcom/instabridge/ai/tools/perapp/PerAppFeatureCatalog$Feature;)V", PendingUpgradeStore.KEY_NAME, b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", b.f42142b, b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "preflight", "Lcom/instabridge/ai/tools/ToolResult$Error;", "context", "Landroid/content/Context;", "canExecute", b.f42142b, "args", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class PerAppFeatureTool extends AiTool {

    @NotNull
    private static final String TAG = "PerAppFeatureTool";

    @NotNull
    private final String category;

    @NotNull
    private final String description;

    @NotNull
    private final PerAppFeatureCatalog.Feature feature;

    @NotNull
    private final String name;

    @NotNull
    private final Map<String, Object> parameters;

    @NotNull
    private final ToolType toolType;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;
    private static final Map<String, PerAppFeatureTool> cache = Collections.synchronizedMap(new LinkedHashMap());

    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u000b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\rJ\u0006\u0010\u000e\u001a\u00020\u000fR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000RN\u0010\u0006\u001aB\u0012\f\u0012\n \b*\u0004\u0018\u00010\u00050\u0005\u0012\f\u0012\n \b*\u0004\u0018\u00010\t0\t \b* \u0012\f\u0012\n \b*\u0004\u0018\u00010\u00050\u0005\u0012\f\u0012\n \b*\u0004\u0018\u00010\t0\t\u0018\u00010\n0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/tools/perapp/PerAppFeatureTool$Companion;", b.f42142b, "<init>", "()V", "TAG", b.f42142b, "cache", b.f42142b, "kotlin.jvm.PlatformType", "Lcom/instabridge/ai/tools/perapp/PerAppFeatureTool;", b.f42142b, "forFeature", "feature", "Lcom/instabridge/ai/tools/perapp/PerAppFeatureCatalog$Feature;", "invalidateCache", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final PerAppFeatureTool forFeature(@NotNull PerAppFeatureCatalog.Feature feature) {
            Intrinsics.g(feature, "feature");
            PerAppFeatureTool perAppFeatureTool = (PerAppFeatureTool) PerAppFeatureTool.cache.get(feature.getToolName());
            if (perAppFeatureTool != null && Intrinsics.b(perAppFeatureTool.feature.getPackageName(), feature.getPackageName()) && Intrinsics.b(perAppFeatureTool.feature.getShortcutId(), feature.getShortcutId())) {
                return perAppFeatureTool;
            }
            PerAppFeatureTool perAppFeatureTool2 = new PerAppFeatureTool(feature, null);
            Map map = PerAppFeatureTool.cache;
            Intrinsics.f(map, "access$getCache$cp(...)");
            map.put(feature.getToolName(), perAppFeatureTool2);
            return perAppFeatureTool2;
        }

        public final void invalidateCache() {
            PerAppFeatureTool.cache.clear();
        }

        private Companion() {
        }
    }

    public /* synthetic */ PerAppFeatureTool(PerAppFeatureCatalog.Feature feature, DefaultConstructorMarker defaultConstructorMarker) {
        this(feature);
    }

    private final ToolResult.Error preflight(Context context) {
        Object systemService = context.getSystemService("launcherapps");
        LauncherApps launcherApps = systemService instanceof LauncherApps ? (LauncherApps) systemService : null;
        if (launcherApps == null) {
            return new ToolResult.Error("LauncherApps unavailable", "no_launcher_service");
        }
        if (!launcherApps.hasShortcutHostPermission()) {
            return new ToolResult.Error("Not the default launcher", "no_shortcut_host");
        }
        try {
            List<ShortcutInfo> shortcuts = launcherApps.getShortcuts(new LauncherApps.ShortcutQuery().setPackage(this.feature.getPackageName()).setShortcutIds(ul.b.P(this.feature.getShortcutId())).setQueryFlags(11), Process.myUserHandle());
            if (shortcuts != null && !shortcuts.isEmpty()) {
                return null;
            }
            return new ToolResult.Error("Shortcut '" + this.feature.getShortcutId() + "' no longer published by " + this.feature.getPackageName(), "shortcut_not_found");
        } catch (SecurityException e3) {
            return new ToolResult.Error("LauncherApps query denied: " + e3.getMessage(), "no_shortcut_host");
        } catch (Exception e11) {
            return new ToolResult.Error(c1.s(e11, new StringBuilder("Shortcut probe failed: ")), "preflight_failed");
        }
    }

    @Override // com.instabridge.ai.tools.AiTool
    public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) {
        Intrinsics.g(context, "context");
        Intrinsics.g(args, "args");
        return preflight(context) == null;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @Nullable
    public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
        ToolResult.Error errorPreflight = preflight(context);
        if (errorPreflight != null) {
            return errorPreflight;
        }
        Object systemService = context.getSystemService("launcherapps");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.content.pm.LauncherApps");
        LauncherApps launcherApps = (LauncherApps) systemService;
        try {
            Log.i(TAG, "Launching " + this.feature.getToolName() + " → " + this.feature.getPackageName() + '/' + this.feature.getShortcutId());
            launcherApps.startShortcut(this.feature.getPackageName(), this.feature.getShortcutId(), null, null, Process.myUserHandle());
            return new ToolResult.Success(MapsKt.j0(new Pair("action", "open_app_feature"), new Pair("app", this.feature.getAppLabel()), new Pair("feature", this.feature.getFeatureLabel()), new Pair("package", this.feature.getPackageName())), null, 2, null);
        } catch (Exception e3) {
            Log.w(TAG, "startShortcut failed for " + this.feature.getToolName(), e3);
            return new ToolResult.Error("Failed to launch " + this.feature.getFeatureLabel() + ": " + e3.getMessage(), "shortcut_failed");
        }
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public String getCategory() {
        return this.category;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public String getDescription() {
        return this.description;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public String getName() {
        return this.name;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public Map<String, Object> getParameters() {
        return this.parameters;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public ToolType getToolType() {
        return this.toolType;
    }

    private PerAppFeatureTool(PerAppFeatureCatalog.Feature feature) {
        this.feature = feature;
        this.name = feature.getToolName();
        StringBuilder sb2 = new StringBuilder("Open ");
        sb2.append(feature.getFeatureLabel());
        sb2.append(" in ");
        sb2.append(feature.getAppLabel());
        sb2.append(". Fastest way to reach this specific feature — bypasses in-app navigation. Use when the user asks for ");
        sb2.append(feature.getFeatureLabel());
        sb2.append(" in ");
        sb2.append(feature.getAppLabel());
        sb2.append(" (e.g., 'open ");
        String featureLabel = feature.getFeatureLabel();
        Locale locale = Locale.ROOT;
        String lowerCase = featureLabel.toLowerCase(locale);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        sb2.append(lowerCase);
        sb2.append(" in ");
        String lowerCase2 = feature.getAppLabel().toLowerCase(locale);
        Intrinsics.f(lowerCase2, "toLowerCase(...)");
        sb2.append(lowerCase2);
        sb2.append("', '");
        String lowerCase3 = feature.getFeatureLabel().toLowerCase(locale);
        Intrinsics.f(lowerCase3, "toLowerCase(...)");
        sb2.append(lowerCase3);
        sb2.append(" in ");
        String lowerCase4 = feature.getAppLabel().toLowerCase(locale);
        Intrinsics.f(lowerCase4, "toLowerCase(...)");
        sb2.append(lowerCase4);
        sb2.append("'). No parameters needed. Only registered when ");
        sb2.append(feature.getAppLabel());
        sb2.append(" is installed.");
        this.description = sb2.toString();
        this.parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));
        this.toolType = ToolType.ACTION;
        this.category = "app_feature";
    }
}
