package com.instabridge.ai.chat.model;

import a2.c;
import aq.o;
import b.c0;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0015\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\bHÆ\u0003J\t\u0010\u0019\u001a\u00020\bHÆ\u0003JE\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0003\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\bHÆ\u0001J\u0013\u0010\u001b\u001a\u00020\b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\rR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0011\u0010\t\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0012¨\u0006 "}, d2 = {"Lcom/instabridge/ai/chat/model/SelectableModel;", b.f42142b, "id", b.f42142b, "displayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "icon", "proOnly", b.f42142b, "available", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V", "getId", "()Ljava/lang/String;", "getDisplayName", "getDescription", "getIcon", "getProOnly", "()Z", "getAvailable", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class SelectableModel {
    public static final int $stable = 0;
    private final boolean available;

    @NotNull
    private final String description;

    @NotNull
    private final String displayName;

    @NotNull
    private final String icon;

    @NotNull
    private final String id;
    private final boolean proOnly;

    public SelectableModel(@NotNull String id2, @o(name = "display_name") @NotNull String displayName, @NotNull String description, @NotNull String icon, @o(name = "pro_only") boolean z11, boolean z12) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(displayName, "displayName");
        Intrinsics.g(description, "description");
        Intrinsics.g(icon, "icon");
        this.id = id2;
        this.displayName = displayName;
        this.description = description;
        this.icon = icon;
        this.proOnly = z11;
        this.available = z12;
    }

    public static /* synthetic */ SelectableModel copy$default(SelectableModel selectableModel, String str, String str2, String str3, String str4, boolean z11, boolean z12, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = selectableModel.id;
        }
        if ((i5 & 2) != 0) {
            str2 = selectableModel.displayName;
        }
        if ((i5 & 4) != 0) {
            str3 = selectableModel.description;
        }
        if ((i5 & 8) != 0) {
            str4 = selectableModel.icon;
        }
        if ((i5 & 16) != 0) {
            z11 = selectableModel.proOnly;
        }
        if ((i5 & 32) != 0) {
            z12 = selectableModel.available;
        }
        boolean z13 = z11;
        boolean z14 = z12;
        return selectableModel.copy(str, str2, str3, str4, z13, z14);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getDisplayName() {
        return this.displayName;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getDescription() {
        return this.description;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getIcon() {
        return this.icon;
    }

    /* renamed from: component5, reason: from getter */
    public final boolean getProOnly() {
        return this.proOnly;
    }

    /* renamed from: component6, reason: from getter */
    public final boolean getAvailable() {
        return this.available;
    }

    @NotNull
    public final SelectableModel copy(@NotNull String id2, @o(name = "display_name") @NotNull String displayName, @NotNull String description, @NotNull String icon, @o(name = "pro_only") boolean proOnly, boolean available) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(displayName, "displayName");
        Intrinsics.g(description, "description");
        Intrinsics.g(icon, "icon");
        return new SelectableModel(id2, displayName, description, icon, proOnly, available);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SelectableModel)) {
            return false;
        }
        SelectableModel selectableModel = (SelectableModel) other;
        return Intrinsics.b(this.id, selectableModel.id) && Intrinsics.b(this.displayName, selectableModel.displayName) && Intrinsics.b(this.description, selectableModel.description) && Intrinsics.b(this.icon, selectableModel.icon) && this.proOnly == selectableModel.proOnly && this.available == selectableModel.available;
    }

    public final boolean getAvailable() {
        return this.available;
    }

    @NotNull
    public final String getDescription() {
        return this.description;
    }

    @NotNull
    public final String getDisplayName() {
        return this.displayName;
    }

    @NotNull
    public final String getIcon() {
        return this.icon;
    }

    @NotNull
    public final String getId() {
        return this.id;
    }

    public final boolean getProOnly() {
        return this.proOnly;
    }

    public int hashCode() {
        return Boolean.hashCode(this.available) + c9.f(c0.e(c0.e(c0.e(this.id.hashCode() * 31, 31, this.displayName), 31, this.description), 31, this.icon), 31, this.proOnly);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("SelectableModel(id=");
        sb2.append(this.id);
        sb2.append(", displayName=");
        sb2.append(this.displayName);
        sb2.append(", description=");
        sb2.append(this.description);
        sb2.append(", icon=");
        sb2.append(this.icon);
        sb2.append(", proOnly=");
        sb2.append(this.proOnly);
        sb2.append(", available=");
        return c.p(sb2, this.available, ')');
    }
}
