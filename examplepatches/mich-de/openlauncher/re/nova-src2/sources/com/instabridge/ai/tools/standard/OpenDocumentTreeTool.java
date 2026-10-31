package com.instabridge.ai.tools.standard;

import android.content.Context;
import android.content.Intent;
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
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0006\u0010\u0015\u001a\u00020\u0016J4\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u001dH\u0096@¢\u0006\u0002\u0010\u001eR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/tools/standard/OpenDocumentTreeTool;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", b.f42142b, b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "treeIntent", "Landroid/content/Intent;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class OpenDocumentTreeTool extends AiTool {

    @NotNull
    public static final OpenDocumentTreeTool INSTANCE = new OpenDocumentTreeTool();

    @NotNull
    private static final String name = "open_document_tree";

    @NotNull
    private static final String description = "Ask the user to grant persistent access to an entire folder (for bulk operations like backup, import, or syncing many files at once). Different from `pick_file` which selects individual files. Use when the user says 'give access to a folder', 'pick a folder to back up', 'select a directory'.";

    @NotNull
    private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

    @NotNull
    private static final ToolType toolType = ToolType.ACTION;

    @NotNull
    private static final String category = "files";
    public static final int $stable = 8;

    private OpenDocumentTreeTool() {
    }

    @Override // com.instabridge.ai.tools.AiTool
    @Nullable
    public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
        return AiTool.launchIntent$default(this, context, treeIntent(), "open_document_tree", null, 8, null);
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

    @NotNull
    public final Intent treeIntent() {
        return new Intent("android.intent.action.OPEN_DOCUMENT_TREE");
    }
}
