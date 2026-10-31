package com.instabridge.ai.chat.model;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\"B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0006HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u0019\u001a\u0004\u0018\u00010\tHÆ\u0003¢\u0006\u0002\u0010\u0013JD\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001¢\u0006\u0002\u0010\u001bJ\u0013\u0010\u001c\u001a\u00020\u001d2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001f\u001a\u00020 HÖ\u0001J\t\u0010!\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\rR\u0015\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0012\u0010\u0013¨\u0006#"}, d2 = {"Lcom/instabridge/ai/chat/model/ToolCallStatus;", b.f42142b, "toolCallId", b.f42142b, "toolName", "state", "Lcom/instabridge/ai/chat/model/ToolCallStatus$State;", "statusText", "completedAtMs", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/ai/chat/model/ToolCallStatus$State;Ljava/lang/String;Ljava/lang/Long;)V", "getToolCallId", "()Ljava/lang/String;", "getToolName", "getState", "()Lcom/instabridge/ai/chat/model/ToolCallStatus$State;", "getStatusText", "getCompletedAtMs", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/ai/chat/model/ToolCallStatus$State;Ljava/lang/String;Ljava/lang/Long;)Lcom/instabridge/ai/chat/model/ToolCallStatus;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "State", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ToolCallStatus {
    public static final int $stable = 0;

    @Nullable
    private final Long completedAtMs;

    @NotNull
    private final State state;

    @Nullable
    private final String statusText;

    @NotNull
    private final String toolCallId;

    @NotNull
    private final String toolName;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/instabridge/ai/chat/model/ToolCallStatus$State;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "RUNNING", "COMPLETED", "FAILED", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class State {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ State[] $VALUES;
        public static final State RUNNING = new State("RUNNING", 0);
        public static final State COMPLETED = new State("COMPLETED", 1);
        public static final State FAILED = new State("FAILED", 2);

        private static final /* synthetic */ State[] $values() {
            return new State[]{RUNNING, COMPLETED, FAILED};
        }

        static {
            State[] stateArr$values = $values();
            $VALUES = stateArr$values;
            $ENTRIES = EnumEntriesKt.a(stateArr$values);
        }

        private State(String str, int i5) {
        }

        @NotNull
        public static EnumEntries<State> getEntries() {
            return $ENTRIES;
        }

        public static State valueOf(String str) {
            return (State) Enum.valueOf(State.class, str);
        }

        public static State[] values() {
            return (State[]) $VALUES.clone();
        }
    }

    public ToolCallStatus(@NotNull String toolCallId, @NotNull String toolName, @NotNull State state, @Nullable String str, @Nullable Long l9) {
        Intrinsics.g(toolCallId, "toolCallId");
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(state, "state");
        this.toolCallId = toolCallId;
        this.toolName = toolName;
        this.state = state;
        this.statusText = str;
        this.completedAtMs = l9;
    }

    public static /* synthetic */ ToolCallStatus copy$default(ToolCallStatus toolCallStatus, String str, String str2, State state, String str3, Long l9, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = toolCallStatus.toolCallId;
        }
        if ((i5 & 2) != 0) {
            str2 = toolCallStatus.toolName;
        }
        if ((i5 & 4) != 0) {
            state = toolCallStatus.state;
        }
        if ((i5 & 8) != 0) {
            str3 = toolCallStatus.statusText;
        }
        if ((i5 & 16) != 0) {
            l9 = toolCallStatus.completedAtMs;
        }
        Long l11 = l9;
        State state2 = state;
        return toolCallStatus.copy(str, str2, state2, str3, l11);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getToolName() {
        return this.toolName;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final State getState() {
        return this.state;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getStatusText() {
        return this.statusText;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final Long getCompletedAtMs() {
        return this.completedAtMs;
    }

    @NotNull
    public final ToolCallStatus copy(@NotNull String toolCallId, @NotNull String toolName, @NotNull State state, @Nullable String statusText, @Nullable Long completedAtMs) {
        Intrinsics.g(toolCallId, "toolCallId");
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(state, "state");
        return new ToolCallStatus(toolCallId, toolName, state, statusText, completedAtMs);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolCallStatus)) {
            return false;
        }
        ToolCallStatus toolCallStatus = (ToolCallStatus) other;
        return Intrinsics.b(this.toolCallId, toolCallStatus.toolCallId) && Intrinsics.b(this.toolName, toolCallStatus.toolName) && this.state == toolCallStatus.state && Intrinsics.b(this.statusText, toolCallStatus.statusText) && Intrinsics.b(this.completedAtMs, toolCallStatus.completedAtMs);
    }

    @Nullable
    public final Long getCompletedAtMs() {
        return this.completedAtMs;
    }

    @NotNull
    public final State getState() {
        return this.state;
    }

    @Nullable
    public final String getStatusText() {
        return this.statusText;
    }

    @NotNull
    public final String getToolCallId() {
        return this.toolCallId;
    }

    @NotNull
    public final String getToolName() {
        return this.toolName;
    }

    public int hashCode() {
        int iHashCode = (this.state.hashCode() + c0.e(this.toolCallId.hashCode() * 31, 31, this.toolName)) * 31;
        String str = this.statusText;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Long l9 = this.completedAtMs;
        return iHashCode2 + (l9 != null ? l9.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "ToolCallStatus(toolCallId=" + this.toolCallId + ", toolName=" + this.toolName + ", state=" + this.state + ", statusText=" + this.statusText + ", completedAtMs=" + this.completedAtMs + ')';
    }

    public /* synthetic */ ToolCallStatus(String str, String str2, State state, String str3, Long l9, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, state, (i5 & 8) != 0 ? null : str3, (i5 & 16) != 0 ? null : l9);
    }
}
