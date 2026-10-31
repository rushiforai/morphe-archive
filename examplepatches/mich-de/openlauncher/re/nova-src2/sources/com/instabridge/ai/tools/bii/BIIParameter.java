package com.instabridge.ai.tools.bii;

import b.c0;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import h6.c1;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\b\u000e\n\u0002\u0010$\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BG\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\n\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\f\u0010\rJ\u0012\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0019J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\bHÆ\u0003J\u0011\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\nHÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003JO\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\b2\u0010\b\u0002\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010!\u001a\u00020\b2\b\u0010\"\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010#\u001a\u00020$HÖ\u0001J\t\u0010%\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0019\u0010\t\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u000f¨\u0006&"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIParameter;", b.f42142b, PendingUpgradeStore.KEY_NAME, b.f42142b, TTConst.TRACK_TYPE, "Lcom/instabridge/ai/tools/bii/BIIParameterType;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "required", b.f42142b, "enumValues", b.f42142b, "disambiguationPrompt", "<init>", "(Ljava/lang/String;Lcom/instabridge/ai/tools/bii/BIIParameterType;Ljava/lang/String;ZLjava/util/List;Ljava/lang/String;)V", "getName", "()Ljava/lang/String;", "getType", "()Lcom/instabridge/ai/tools/bii/BIIParameterType;", "getDescription", "getRequired", "()Z", "getEnumValues", "()Ljava/util/List;", "getDisambiguationPrompt", "toJsonSchema", b.f42142b, "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final /* data */ class BIIParameter {
    public static final int $stable = 8;

    @NotNull
    private final String description;

    @Nullable
    private final String disambiguationPrompt;

    @Nullable
    private final List<String> enumValues;

    @NotNull
    private final String name;
    private final boolean required;

    @NotNull
    private final BIIParameterType type;

    public BIIParameter(@NotNull String name, @NotNull BIIParameterType type, @NotNull String description, boolean z11, @Nullable List<String> list, @Nullable String str) {
        Intrinsics.g(name, "name");
        Intrinsics.g(type, "type");
        Intrinsics.g(description, "description");
        this.name = name;
        this.type = type;
        this.description = description;
        this.required = z11;
        this.enumValues = list;
        this.disambiguationPrompt = str;
    }

    public static /* synthetic */ BIIParameter copy$default(BIIParameter bIIParameter, String str, BIIParameterType bIIParameterType, String str2, boolean z11, List list, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = bIIParameter.name;
        }
        if ((i5 & 2) != 0) {
            bIIParameterType = bIIParameter.type;
        }
        if ((i5 & 4) != 0) {
            str2 = bIIParameter.description;
        }
        if ((i5 & 8) != 0) {
            z11 = bIIParameter.required;
        }
        if ((i5 & 16) != 0) {
            list = bIIParameter.enumValues;
        }
        if ((i5 & 32) != 0) {
            str3 = bIIParameter.disambiguationPrompt;
        }
        List list2 = list;
        String str4 = str3;
        return bIIParameter.copy(str, bIIParameterType, str2, z11, list2, str4);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final BIIParameterType getType() {
        return this.type;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getDescription() {
        return this.description;
    }

    /* renamed from: component4, reason: from getter */
    public final boolean getRequired() {
        return this.required;
    }

    @Nullable
    public final List<String> component5() {
        return this.enumValues;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getDisambiguationPrompt() {
        return this.disambiguationPrompt;
    }

    @NotNull
    public final BIIParameter copy(@NotNull String name, @NotNull BIIParameterType type, @NotNull String description, boolean required, @Nullable List<String> enumValues, @Nullable String disambiguationPrompt) {
        Intrinsics.g(name, "name");
        Intrinsics.g(type, "type");
        Intrinsics.g(description, "description");
        return new BIIParameter(name, type, description, required, enumValues, disambiguationPrompt);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BIIParameter)) {
            return false;
        }
        BIIParameter bIIParameter = (BIIParameter) other;
        return Intrinsics.b(this.name, bIIParameter.name) && this.type == bIIParameter.type && Intrinsics.b(this.description, bIIParameter.description) && this.required == bIIParameter.required && Intrinsics.b(this.enumValues, bIIParameter.enumValues) && Intrinsics.b(this.disambiguationPrompt, bIIParameter.disambiguationPrompt);
    }

    @NotNull
    public final String getDescription() {
        return this.description;
    }

    @Nullable
    public final String getDisambiguationPrompt() {
        return this.disambiguationPrompt;
    }

    @Nullable
    public final List<String> getEnumValues() {
        return this.enumValues;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    public final boolean getRequired() {
        return this.required;
    }

    @NotNull
    public final BIIParameterType getType() {
        return this.type;
    }

    public int hashCode() {
        int iF = c9.f(c0.e((this.type.hashCode() + (this.name.hashCode() * 31)) * 31, 31, this.description), 31, this.required);
        List<String> list = this.enumValues;
        int iHashCode = (iF + (list == null ? 0 : list.hashCode())) * 31;
        String str = this.disambiguationPrompt;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }

    @NotNull
    public final Map<String, Object> toJsonSchema() {
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put(TTConst.TRACK_TYPE, this.type.getJsonType());
        mapBuilder.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, this.description);
        List<String> list = this.enumValues;
        if (list != null) {
            mapBuilder.put("enum", list);
        }
        return mapBuilder.b();
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BIIParameter(name=");
        sb2.append(this.name);
        sb2.append(", type=");
        sb2.append(this.type);
        sb2.append(", description=");
        sb2.append(this.description);
        sb2.append(", required=");
        sb2.append(this.required);
        sb2.append(", enumValues=");
        sb2.append(this.enumValues);
        sb2.append(", disambiguationPrompt=");
        return c1.t(sb2, this.disambiguationPrompt, ')');
    }

    public /* synthetic */ BIIParameter(String str, BIIParameterType bIIParameterType, String str2, boolean z11, List list, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, bIIParameterType, str2, (i5 & 8) != 0 ? false : z11, (i5 & 16) != 0 ? null : list, (i5 & 32) != 0 ? null : str3);
    }
}
