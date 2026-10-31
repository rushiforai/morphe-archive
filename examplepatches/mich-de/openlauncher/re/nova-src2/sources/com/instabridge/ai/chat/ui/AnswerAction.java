package com.instabridge.ai.chat.ui;

import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\n\b\u0007\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u0007¢\u0006\u0004\b\n\u0010\u000bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u0010\u001a\u0004\b\u000e\u0010\u000fR\u001d\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/chat/ui/AnswerAction;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "label", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "icon", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onClick", "Lkotlin/Function1;", "Lcom/instabridge/ai/chat/ui/AnswerRef;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Lkotlin/jvm/functions/Function1;)V", "getLabel", "()Ljava/lang/String;", "getIcon", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getOnClick", "()Lkotlin/jvm/functions/Function1;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AnswerAction {
    public static final int $stable = 0;

    @Nullable
    private final Integer icon;

    @NotNull
    private final String label;

    @NotNull
    private final Function1<AnswerRef, Unit> onClick;

    /* JADX WARN: Multi-variable type inference failed */
    public AnswerAction(@NotNull String label, @Nullable Integer num, @NotNull Function1<? super AnswerRef, Unit> onClick) {
        Intrinsics.g(label, "label");
        Intrinsics.g(onClick, "onClick");
        this.label = label;
        this.icon = num;
        this.onClick = onClick;
    }

    @Nullable
    public final Integer getIcon() {
        return this.icon;
    }

    @NotNull
    public final String getLabel() {
        return this.label;
    }

    @NotNull
    public final Function1<AnswerRef, Unit> getOnClick() {
        return this.onClick;
    }

    public /* synthetic */ AnswerAction(String str, Integer num, Function1 function1, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : num, function1);
    }
}
