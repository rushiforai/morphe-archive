package com.instabridge.ai.context;

import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import fq.c;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B!\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\u000e\b\u0001\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\u000e\b\u0003\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/context/AddContextRequest;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "contextType", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "contextItems", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/context/ContextItem;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "getContextType", "()Ljava/lang/String;", "getContextItems", "()Ljava/util/List;", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class AddContextRequest {
    public static final int $stable = 8;

    @NotNull
    private final List<ContextItem> contextItems;

    @NotNull
    private final String contextType;

    public AddContextRequest(@o(name = "context_type") @NotNull String contextType, @o(name = "context_items") @NotNull List<ContextItem> contextItems) {
        Intrinsics.g(contextType, "contextType");
        Intrinsics.g(contextItems, "contextItems");
        this.contextType = contextType;
        this.contextItems = contextItems;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ AddContextRequest copy$default(AddContextRequest addContextRequest, String str, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = addContextRequest.contextType;
        }
        if ((i5 & 2) != 0) {
            list = addContextRequest.contextItems;
        }
        return addContextRequest.copy(str, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getContextType() {
        return this.contextType;
    }

    @NotNull
    public final List<ContextItem> component2() {
        return this.contextItems;
    }

    @NotNull
    public final AddContextRequest copy(@o(name = "context_type") @NotNull String contextType, @o(name = "context_items") @NotNull List<ContextItem> contextItems) {
        Intrinsics.g(contextType, "contextType");
        Intrinsics.g(contextItems, "contextItems");
        return new AddContextRequest(contextType, contextItems);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AddContextRequest)) {
            return false;
        }
        AddContextRequest addContextRequest = (AddContextRequest) other;
        return Intrinsics.b(this.contextType, addContextRequest.contextType) && Intrinsics.b(this.contextItems, addContextRequest.contextItems);
    }

    @NotNull
    public final List<ContextItem> getContextItems() {
        return this.contextItems;
    }

    @NotNull
    public final String getContextType() {
        return this.contextType;
    }

    public int hashCode() {
        return this.contextItems.hashCode() + (this.contextType.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AddContextRequest(contextType=");
        sb2.append(this.contextType);
        sb2.append(", contextItems=");
        return c.e(sb2, this.contextItems, ')');
    }
}
