package com.instabridge.ai.tools;

import android.content.Context;
import android.content.SharedPreferences;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\b\u0001\u0018\u0000 \u000f2\u00020\u0001:\u0001\u000fB\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\n\u0010\t\u001a\u0004\u0018\u00010\nH\u0016J\u0010\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\nH\u0016J\b\u0010\u000e\u001a\u00020\fH\u0016R\u0016\u0010\u0006\u001a\n \b*\u0004\u0018\u00010\u00070\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/tools/SharedPreferencesToolRegistrationStateStore;", "Lcom/instabridge/ai/tools/ToolRegistrationStateStore;", "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "prefs", "Landroid/content/SharedPreferences;", "kotlin.jvm.PlatformType", "load", "Lcom/instabridge/ai/tools/ToolRegistrationSnapshot;", ActionCategory.SAVE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "snapshot", "clear", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class SharedPreferencesToolRegistrationStateStore implements ToolRegistrationStateStore {

    @Deprecated
    @NotNull
    public static final String KEY_SESSION_ID = "session_id";

    @Deprecated
    @NotNull
    public static final String KEY_TOOL_IDS = "tool_ids";

    @Deprecated
    @NotNull
    public static final String KEY_VERSION = "version";

    @Deprecated
    @NotNull
    public static final String PREFS_NAME = "instabridge_ai_tool_registration";

    @Deprecated
    @NotNull
    public static final String TOOL_ID_SEPARATOR = "\u001f";
    private final SharedPreferences prefs;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/tools/SharedPreferencesToolRegistrationStateStore$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "PREFS_NAME", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "KEY_VERSION", "KEY_SESSION_ID", "KEY_TOOL_IDS", "TOOL_ID_SEPARATOR", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public SharedPreferencesToolRegistrationStateStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.prefs = context.getApplicationContext().getSharedPreferences(PREFS_NAME, 0);
    }

    @Override // com.instabridge.ai.tools.ToolRegistrationStateStore
    public void clear() {
        this.prefs.edit().clear().apply();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v11, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r1v6 */
    /* JADX WARN: Type inference failed for: r1v7 */
    /* JADX WARN: Type inference failed for: r1v8, types: [kotlin.collections.EmptyList] */
    @Override // com.instabridge.ai.tools.ToolRegistrationStateStore
    @Nullable
    public ToolRegistrationSnapshot load() {
        String string;
        ?? arrayList;
        if (this.prefs.getInt("version", 0) == 1 && (string = this.prefs.getString(KEY_SESSION_ID, null)) != null) {
            String str = !r70.k.U0(string) ? string : null;
            if (str != null) {
                String string2 = this.prefs.getString(KEY_TOOL_IDS, null);
                if (string2 != null) {
                    List listI1 = r70.k.i1(string2, new String[]{TOOL_ID_SEPARATOR}, 6);
                    arrayList = new ArrayList();
                    for (Object obj : listI1) {
                        if (!r70.k.U0((String) obj)) {
                            arrayList.add(obj);
                        }
                    }
                } else {
                    arrayList = 0;
                }
                if (arrayList == 0) {
                    arrayList = EmptyList.f71733a;
                }
                List list = arrayList;
                if (!list.isEmpty()) {
                    return new ToolRegistrationSnapshot(str, list, 0, 4, null);
                }
            }
        }
        return null;
    }

    @Override // com.instabridge.ai.tools.ToolRegistrationStateStore
    public void save(@NotNull ToolRegistrationSnapshot snapshot) {
        Intrinsics.g(snapshot, "snapshot");
        this.prefs.edit().putInt("version", snapshot.getVersion()).putString(KEY_SESSION_ID, snapshot.getSessionId()).putString(KEY_TOOL_IDS, g.f1(snapshot.getToolIds(), TOOL_ID_SEPARATOR, null, null, 0, null, 62)).apply();
    }
}
