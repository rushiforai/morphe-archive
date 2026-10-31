package com.instabridge.ai.protocol;

import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import fq.c;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001Bu\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\u0018\b\u0003\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\u001e\b\u0003\u0010\n\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0007\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0019\u0010\u001b\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\u001e\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0007\u0018\u00010\u000bHÆ\u0003J{\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u00032\u0018\b\u0003\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\u001e\b\u0003\u0010\n\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0007\u0018\u00010\u000bHÆ\u0001J\u0013\u0010 \u001a\u00020!2\b\u0010\"\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010#\u001a\u00020$HÖ\u0001J\t\u0010%\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR!\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u000fR\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u000fR'\u0010\n\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0007\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006&"}, d2 = {"Lcom/instabridge/ai/protocol/Suggestion;", b.f42142b, TTConst.TRACK_TYPE, b.f42142b, "label", "toolName", "toolArgs", b.f42142b, "query", "text", "optimisticTools", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "getType", "()Ljava/lang/String;", "getLabel", "getToolName", "getToolArgs", "()Ljava/util/Map;", "getQuery", "getText", "getOptimisticTools", "()Ljava/util/List;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class Suggestion {
    public static final int $stable = 8;

    @NotNull
    private final String label;

    @Nullable
    private final List<Map<String, Object>> optimisticTools;

    @Nullable
    private final String query;

    @Nullable
    private final String text;

    @Nullable
    private final Map<String, Object> toolArgs;

    @Nullable
    private final String toolName;

    @NotNull
    private final String type;

    /* JADX WARN: Multi-variable type inference failed */
    public Suggestion(@NotNull String type, @NotNull String label, @o(name = "tool_name") @Nullable String str, @o(name = "tool_args") @Nullable Map<String, ? extends Object> map, @Nullable String str2, @Nullable String str3, @o(name = "optimistic_tools") @Nullable List<? extends Map<String, ? extends Object>> list) {
        Intrinsics.g(type, "type");
        Intrinsics.g(label, "label");
        this.type = type;
        this.label = label;
        this.toolName = str;
        this.toolArgs = map;
        this.query = str2;
        this.text = str3;
        this.optimisticTools = list;
    }

    public static /* synthetic */ Suggestion copy$default(Suggestion suggestion, String str, String str2, String str3, Map map, String str4, String str5, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = suggestion.type;
        }
        if ((i5 & 2) != 0) {
            str2 = suggestion.label;
        }
        if ((i5 & 4) != 0) {
            str3 = suggestion.toolName;
        }
        if ((i5 & 8) != 0) {
            map = suggestion.toolArgs;
        }
        if ((i5 & 16) != 0) {
            str4 = suggestion.query;
        }
        if ((i5 & 32) != 0) {
            str5 = suggestion.text;
        }
        if ((i5 & 64) != 0) {
            list = suggestion.optimisticTools;
        }
        String str6 = str5;
        List list2 = list;
        String str7 = str4;
        String str8 = str3;
        return suggestion.copy(str, str2, str8, map, str7, str6, list2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getLabel() {
        return this.label;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getToolName() {
        return this.toolName;
    }

    @Nullable
    public final Map<String, Object> component4() {
        return this.toolArgs;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getQuery() {
        return this.query;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getText() {
        return this.text;
    }

    @Nullable
    public final List<Map<String, Object>> component7() {
        return this.optimisticTools;
    }

    @NotNull
    public final Suggestion copy(@NotNull String type, @NotNull String label, @o(name = "tool_name") @Nullable String toolName, @o(name = "tool_args") @Nullable Map<String, ? extends Object> toolArgs, @Nullable String query, @Nullable String text, @o(name = "optimistic_tools") @Nullable List<? extends Map<String, ? extends Object>> optimisticTools) {
        Intrinsics.g(type, "type");
        Intrinsics.g(label, "label");
        return new Suggestion(type, label, toolName, toolArgs, query, text, optimisticTools);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Suggestion)) {
            return false;
        }
        Suggestion suggestion = (Suggestion) other;
        return Intrinsics.b(this.type, suggestion.type) && Intrinsics.b(this.label, suggestion.label) && Intrinsics.b(this.toolName, suggestion.toolName) && Intrinsics.b(this.toolArgs, suggestion.toolArgs) && Intrinsics.b(this.query, suggestion.query) && Intrinsics.b(this.text, suggestion.text) && Intrinsics.b(this.optimisticTools, suggestion.optimisticTools);
    }

    @NotNull
    public final String getLabel() {
        return this.label;
    }

    @Nullable
    public final List<Map<String, Object>> getOptimisticTools() {
        return this.optimisticTools;
    }

    @Nullable
    public final String getQuery() {
        return this.query;
    }

    @Nullable
    public final String getText() {
        return this.text;
    }

    @Nullable
    public final Map<String, Object> getToolArgs() {
        return this.toolArgs;
    }

    @Nullable
    public final String getToolName() {
        return this.toolName;
    }

    @NotNull
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        int iE = c0.e(this.type.hashCode() * 31, 31, this.label);
        String str = this.toolName;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        Map<String, Object> map = this.toolArgs;
        int iHashCode2 = (iHashCode + (map == null ? 0 : map.hashCode())) * 31;
        String str2 = this.query;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.text;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        List<Map<String, Object>> list = this.optimisticTools;
        return iHashCode4 + (list != null ? list.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("Suggestion(type=");
        sb2.append(this.type);
        sb2.append(", label=");
        sb2.append(this.label);
        sb2.append(", toolName=");
        sb2.append(this.toolName);
        sb2.append(", toolArgs=");
        sb2.append(this.toolArgs);
        sb2.append(", query=");
        sb2.append(this.query);
        sb2.append(", text=");
        sb2.append(this.text);
        sb2.append(", optimisticTools=");
        return c.e(sb2, this.optimisticTools, ')');
    }

    public /* synthetic */ Suggestion(String str, String str2, String str3, Map map, String str4, String str5, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : map, (i5 & 16) != 0 ? null : str4, (i5 & 32) != 0 ? null : str5, (i5 & 64) != 0 ? null : list);
    }
}
