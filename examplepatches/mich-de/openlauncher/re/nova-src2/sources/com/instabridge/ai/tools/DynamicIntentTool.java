package com.instabridge.ai.tools;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import b.c0;
import com.google.android.gms.internal.measurement.k2;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0007\u0018\u0000 ,2\u00020\u0001:\u0001,BM\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u0012\b\b\u0002\u0010\n\u001a\u00020\u000b¢\u0006\u0004\b\f\u0010\rJ \u0010 \u001a\u0004\u0018\u00010!2\u0014\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00150\u0014H\u0002J&\u0010#\u001a\u00020\u000b2\u0006\u0010$\u001a\u00020%2\u0014\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00150\u0014H\u0016J4\u0010&\u001a\u00020'2\u0006\u0010$\u001a\u00020%2\u0014\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00150\u00142\u0006\u0010(\u001a\u00020\u000bH\u0096@¢\u0006\u0002\u0010)J\u000e\u0010*\u001a\u00020!2\u0006\u0010+\u001a\u00020\u0003R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u000e\u0010\u0004\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u000e\u0010\u0006\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\b\u001a\u0004\u0018\u00010\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\t\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u0012R \u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00150\u0014X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0014\u0010\u0018\u001a\u00020\u0019X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0014\u0010\u001c\u001a\u00020\u0003X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u000fR\u0014\u0010\u001e\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010\u000f¨\u0006-"}, d2 = {"Lcom/instabridge/ai/tools/DynamicIntentTool;", "Lcom/instabridge/ai/tools/AiTool;", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appLabel", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "action", "scheme", "mimeType", "packageName", "isSearchAction", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V", "getName", "()Ljava/lang/String;", "getDescription", "getPackageName", "()Z", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "displayName", "getDisplayName", "buildLaunchIntent", "Landroid/content/Intent;", "args", "canExecute", "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "buildIntent", "query", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class DynamicIntentTool extends AiTool {

    @NotNull
    private final String action;

    @NotNull
    private final String appLabel;

    @NotNull
    private final String category;

    @NotNull
    private final String description;

    @NotNull
    private final String displayName;
    private final boolean isSearchAction;

    @Nullable
    private final String mimeType;

    @NotNull
    private final String name;

    @NotNull
    private final String packageName;

    @NotNull
    private final Map<String, Object> parameters;

    @Nullable
    private final String scheme;

    @NotNull
    private final ToolType toolType;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @NotNull
    private static final Map<String, Function1<String, String>> SCHEME_SEARCH_PATTERNS = MapsKt.j0(new Pair("spotify", new a00.a(28)), new Pair("youtube", new b(1)), new Pair("vnd.youtube", new b(2)), new Pair("geo", new b(3)), new Pair("google.navigation", new b(4)), new Pair("market", new b(5)), new Pair("mailto", new b(6)), new Pair("http", new b(7)), new Pair("https", new b(8)), new Pair("amazon", new a00.a(29)), new Pair("reddit", new b(0)));

    @NotNull
    private static final Map<String, String> SCHEME_URI_HINTS = MapsKt.j0(new Pair("spotify", "spotify:search:Coldplay, spotify:artist:abc123, spotify:track:xyz"), new Pair("youtube", "https://www.youtube.com/results?search_query=cats, https://youtu.be/VIDEO_ID"), new Pair("geo", "geo:37.7749,-122.4194, geo:0,0?q=restaurants+nearby"), new Pair("google.navigation", "google.navigation:q=Paris+France"), new Pair("market", "market://details?id=com.example.app, market://search?q=games"), new Pair("tel", "tel:+1234567890"), new Pair("mailto", "mailto:user@example.com?subject=Hello"));

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0018\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\u0006H\u0002R&\u0010\u0004\u001a\u001a\u0012\u0004\u0012\u00020\u0006\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u00070\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/tools/DynamicIntentTool$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "SCHEME_SEARCH_PATTERNS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/Function1;", "SCHEME_URI_HINTS", "buildSearchUri", "scheme", "query", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String buildSearchUri(String scheme, String query) {
            String str;
            Function1 function1 = (Function1) DynamicIntentTool.SCHEME_SEARCH_PATTERNS.get(scheme);
            if (function1 != null && (str = (String) function1.invoke(query)) != null) {
                return str;
            }
            StringBuilder sbK = k2.k(scheme, "://search?q=");
            sbK.append(Uri.encode(query));
            return sbK.toString();
        }

        private Companion() {
        }
    }

    public /* synthetic */ DynamicIntentTool(String str, String str2, String str3, String str4, String str5, String str6, String str7, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3, str4, str5, str6, str7, (i5 & 128) != 0 ? false : z11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$10(String q5) {
        Intrinsics.g(q5, "q");
        return "vnd.youtube://results?search_query=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$11(String q5) {
        Intrinsics.g(q5, "q");
        return "geo:0,0?q=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$12(String q5) {
        Intrinsics.g(q5, "q");
        return "google.navigation:q=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$13(String q5) {
        Intrinsics.g(q5, "q");
        return "market://search?q=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$14(String q5) {
        Intrinsics.g(q5, "q");
        return "mailto:?subject=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$15(String q5) {
        Intrinsics.g(q5, "q");
        return "http://www.google.com/search?q=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$16(String q5) {
        Intrinsics.g(q5, "q");
        return "https://www.google.com/search?q=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$17(String q5) {
        Intrinsics.g(q5, "q");
        return "amazon://search?query=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$18(String q5) {
        Intrinsics.g(q5, "q");
        return "reddit://search?q=" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$8(String q5) {
        Intrinsics.g(q5, "q");
        return "spotify:search:" + Uri.encode(q5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SCHEME_SEARCH_PATTERNS$lambda$9(String q5) {
        Intrinsics.g(q5, "q");
        return "https://www.youtube.com/results?search_query=" + Uri.encode(q5);
    }

    private final Intent buildLaunchIntent(Map<String, ? extends Object> args) {
        String string;
        String string2;
        String str;
        Object obj = args.get("query");
        String strQ = null;
        if (obj == null || (string = obj.toString()) == null || r70.k.U0(string)) {
            string = null;
        }
        if (this.isSearchAction) {
            if (string == null) {
                return null;
            }
            Intent intent = new Intent(this.action);
            intent.addFlags(268435456);
            intent.setPackage(this.packageName);
            intent.putExtra("query", string);
            if (Intrinsics.b(intent.getAction(), "android.intent.action.MEDIA_SEARCH")) {
                intent.putExtra("android.intent.extra.focus", "vnd.android.cursor.item/*");
            }
            return intent;
        }
        Object obj2 = args.get("uri");
        String string3 = obj2 != null ? obj2.toString() : null;
        if (string3 != null) {
            strQ = string3;
        } else if (string != null && (str = this.scheme) != null) {
            strQ = INSTANCE.buildSearchUri(str, string);
        } else if (this.scheme != null) {
            strQ = c0.q(new StringBuilder(), this.scheme, "://");
        }
        Intent intent2 = new Intent(this.action);
        intent2.addFlags(268435456);
        intent2.setPackage(this.packageName);
        if (strQ != null) {
            intent2.setData(Uri.parse(strQ));
        }
        if (Intrinsics.b(intent2.getAction(), "android.intent.action.SEND") || Intrinsics.b(intent2.getAction(), "android.intent.action.SEND_MULTIPLE")) {
            String str2 = this.mimeType;
            if (str2 != null) {
                intent2.setType(str2);
            }
            Object obj3 = args.get("text");
            if (obj3 != null && (string2 = obj3.toString()) != null) {
                intent2.putExtra("android.intent.extra.TEXT", string2);
            }
        }
        return intent2;
    }

    @NotNull
    public final Intent buildIntent(@NotNull String query) {
        Intrinsics.g(query, "query");
        Intent intent = new Intent(this.action);
        intent.addFlags(268435456);
        intent.setPackage(this.packageName);
        intent.putExtra("query", query);
        if (Intrinsics.b(intent.getAction(), "android.intent.action.MEDIA_SEARCH")) {
            intent.putExtra("android.intent.extra.focus", "vnd.android.cursor.item/*");
        }
        return intent;
    }

    @Override // com.instabridge.ai.tools.AiTool
    public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) {
        Intrinsics.g(context, "context");
        Intrinsics.g(args, "args");
        Intent intentBuildLaunchIntent = buildLaunchIntent(args);
        if (intentBuildLaunchIntent == null || intentBuildLaunchIntent.getPackage() == null) {
            return false;
        }
        try {
            Intrinsics.f(context.getPackageManager().queryIntentActivities(intentBuildLaunchIntent, 0), "queryIntentActivities(...)");
            return !r3.isEmpty();
        } catch (Exception unused) {
            return false;
        }
    }

    @Override // com.instabridge.ai.tools.AiTool
    @Nullable
    public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
        String string;
        Object obj = map.get("query");
        String str = null;
        if (obj != null && (string = obj.toString()) != null && !r70.k.U0(string)) {
            str = string;
        }
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("app", this.appLabel);
        mapBuilder.put("package", this.packageName);
        if (str != null) {
            mapBuilder.put("query", str);
        }
        MapBuilder mapBuilderB = mapBuilder.b();
        if (this.isSearchAction && (str == null || r70.k.U0(str))) {
            return new ToolResult.Error("Search query is required", "missing_parameter");
        }
        Intent intentBuildLaunchIntent = buildLaunchIntent(map);
        if (intentBuildLaunchIntent == null) {
            return new ToolResult.Error("Insufficient args to build intent", "missing_parameter");
        }
        StringBuilder sb2 = this.isSearchAction ? new StringBuilder("searched_") : new StringBuilder("opened_");
        sb2.append(getName());
        ToolResult toolResultLaunchIntent = launchIntent(context, intentBuildLaunchIntent, sb2.toString(), mapBuilderB);
        if ((toolResultLaunchIntent instanceof ToolResult.Error) && Intrinsics.b(((ToolResult.Error) toolResultLaunchIntent).getCode(), "no_handler")) {
            int i5 = jo.a.f69615a;
            Log.w(jo.a.b(), "DynamicIntentTool: marking '" + getName() + "' as broken (no_handler)");
            IntentToolDiscovery.INSTANCE.markBroken(getName());
        }
        return toolResultLaunchIntent;
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
    public String getDisplayName() {
        return this.displayName;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public String getName() {
        return this.name;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
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

    /* renamed from: isSearchAction, reason: from getter */
    public final boolean getIsSearchAction() {
        return this.isSearchAction;
    }

    public DynamicIntentTool(@NotNull String name, @NotNull String appLabel, @NotNull String description, @NotNull String action, @Nullable String str, @Nullable String str2, @NotNull String packageName, boolean z11) {
        Intrinsics.g(name, "name");
        Intrinsics.g(appLabel, "appLabel");
        Intrinsics.g(description, "description");
        Intrinsics.g(action, "action");
        Intrinsics.g(packageName, "packageName");
        this.name = name;
        this.appLabel = appLabel;
        this.description = description;
        this.action = action;
        this.scheme = str;
        this.mimeType = str2;
        this.packageName = packageName;
        this.isSearchAction = z11;
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put(TTConst.TRACK_TYPE, "object");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        if (z11) {
            linkedHashMap.put("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "What to search for in ".concat(appLabel))));
            mapBuilder.put("required", ul.b.P("query"));
        } else if (str != null) {
            String str3 = SCHEME_URI_HINTS.get(str);
            linkedHashMap.put("uri", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, str3 != null ? "Full URI to open. Examples: ".concat(str3) : c0.l("Full URI to open (scheme: ", str, "://)"))));
            linkedHashMap.put("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, c0.l("Search query or content to find in ", appLabel, " (alternative to full URI)"))));
        }
        if (str2 != null && action.equals("android.intent.action.SEND")) {
            linkedHashMap.put("text", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Text content to share")));
        }
        mapBuilder.put("properties", linkedHashMap);
        this.parameters = mapBuilder.b();
        this.toolType = ToolType.ACTION;
        this.category = "apps";
        this.displayName = appLabel;
    }
}
