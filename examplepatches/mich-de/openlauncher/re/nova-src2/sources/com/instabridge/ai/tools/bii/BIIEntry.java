package com.instabridge.ai.tools.bii;

import b.c0;
import b.c9;
import b.u4;
import b70.c;
import b70.k;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010$\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BG\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u000e\u0010\u000fJ\u0012\u0010\u001b\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u001cJ\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0003HÆ\u0003J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\u000f\u0010!\u001a\b\u0012\u0004\u0012\u00020\t0\bHÆ\u0003J\t\u0010\"\u001a\u00020\u000bHÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\rHÆ\u0003JW\u0010$\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b2\b\b\u0002\u0010\n\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\rHÆ\u0001J\u0013\u0010%\u001a\u00020\u000b2\b\u0010&\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010'\u001a\u00020(HÖ\u0001J\t\u0010)\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0017\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001a¨\u0006*"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIEntry;", b.f42142b, "biiName", b.f42142b, "toolName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "category", "parameters", b.f42142b, "Lcom/instabridge/ai/tools/bii/BIIParameter;", "backgroundSafe", b.f42142b, "standardIntentFallback", "Lcom/instabridge/ai/tools/bii/IntentTemplate;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ZLcom/instabridge/ai/tools/bii/IntentTemplate;)V", "getBiiName", "()Ljava/lang/String;", "getToolName", "getDescription", "getCategory", "getParameters", "()Ljava/util/List;", "getBackgroundSafe", "()Z", "getStandardIntentFallback", "()Lcom/instabridge/ai/tools/bii/IntentTemplate;", "parametersJsonSchema", b.f42142b, "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final /* data */ class BIIEntry {
    public static final int $stable = 8;
    private final boolean backgroundSafe;

    @NotNull
    private final String biiName;

    @NotNull
    private final String category;

    @NotNull
    private final String description;

    @NotNull
    private final List<BIIParameter> parameters;

    @Nullable
    private final IntentTemplate standardIntentFallback;

    @NotNull
    private final String toolName;

    public BIIEntry(@NotNull String biiName, @NotNull String toolName, @NotNull String description, @NotNull String category, @NotNull List<BIIParameter> parameters, boolean z11, @Nullable IntentTemplate intentTemplate) {
        Intrinsics.g(biiName, "biiName");
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(description, "description");
        Intrinsics.g(category, "category");
        Intrinsics.g(parameters, "parameters");
        this.biiName = biiName;
        this.toolName = toolName;
        this.description = description;
        this.category = category;
        this.parameters = parameters;
        this.backgroundSafe = z11;
        this.standardIntentFallback = intentTemplate;
    }

    public static /* synthetic */ BIIEntry copy$default(BIIEntry bIIEntry, String str, String str2, String str3, String str4, List list, boolean z11, IntentTemplate intentTemplate, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = bIIEntry.biiName;
        }
        if ((i5 & 2) != 0) {
            str2 = bIIEntry.toolName;
        }
        if ((i5 & 4) != 0) {
            str3 = bIIEntry.description;
        }
        if ((i5 & 8) != 0) {
            str4 = bIIEntry.category;
        }
        if ((i5 & 16) != 0) {
            list = bIIEntry.parameters;
        }
        if ((i5 & 32) != 0) {
            z11 = bIIEntry.backgroundSafe;
        }
        if ((i5 & 64) != 0) {
            intentTemplate = bIIEntry.standardIntentFallback;
        }
        boolean z12 = z11;
        IntentTemplate intentTemplate2 = intentTemplate;
        List list2 = list;
        String str5 = str3;
        return bIIEntry.copy(str, str2, str5, str4, list2, z12, intentTemplate2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getBiiName() {
        return this.biiName;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getToolName() {
        return this.toolName;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getDescription() {
        return this.description;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getCategory() {
        return this.category;
    }

    @NotNull
    public final List<BIIParameter> component5() {
        return this.parameters;
    }

    /* renamed from: component6, reason: from getter */
    public final boolean getBackgroundSafe() {
        return this.backgroundSafe;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final IntentTemplate getStandardIntentFallback() {
        return this.standardIntentFallback;
    }

    @NotNull
    public final BIIEntry copy(@NotNull String biiName, @NotNull String toolName, @NotNull String description, @NotNull String category, @NotNull List<BIIParameter> parameters, boolean backgroundSafe, @Nullable IntentTemplate standardIntentFallback) {
        Intrinsics.g(biiName, "biiName");
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(description, "description");
        Intrinsics.g(category, "category");
        Intrinsics.g(parameters, "parameters");
        return new BIIEntry(biiName, toolName, description, category, parameters, backgroundSafe, standardIntentFallback);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BIIEntry)) {
            return false;
        }
        BIIEntry bIIEntry = (BIIEntry) other;
        return Intrinsics.b(this.biiName, bIIEntry.biiName) && Intrinsics.b(this.toolName, bIIEntry.toolName) && Intrinsics.b(this.description, bIIEntry.description) && Intrinsics.b(this.category, bIIEntry.category) && Intrinsics.b(this.parameters, bIIEntry.parameters) && this.backgroundSafe == bIIEntry.backgroundSafe && Intrinsics.b(this.standardIntentFallback, bIIEntry.standardIntentFallback);
    }

    public final boolean getBackgroundSafe() {
        return this.backgroundSafe;
    }

    @NotNull
    public final String getBiiName() {
        return this.biiName;
    }

    @NotNull
    public final String getCategory() {
        return this.category;
    }

    @NotNull
    public final String getDescription() {
        return this.description;
    }

    @NotNull
    public final List<BIIParameter> getParameters() {
        return this.parameters;
    }

    @Nullable
    public final IntentTemplate getStandardIntentFallback() {
        return this.standardIntentFallback;
    }

    @NotNull
    public final String getToolName() {
        return this.toolName;
    }

    public int hashCode() {
        int iF = c9.f(u4.c(c0.e(c0.e(c0.e(this.biiName.hashCode() * 31, 31, this.toolName), 31, this.description), 31, this.category), 31, this.parameters), 31, this.backgroundSafe);
        IntentTemplate intentTemplate = this.standardIntentFallback;
        return iF + (intentTemplate == null ? 0 : intentTemplate.hashCode());
    }

    @NotNull
    public final Map<String, Object> parametersJsonSchema() {
        List<BIIParameter> list = this.parameters;
        int iD0 = k.d0(c.u0(list, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        for (BIIParameter bIIParameter : list) {
            linkedHashMap.put(bIIParameter.getName(), bIIParameter.toJsonSchema());
        }
        List<BIIParameter> list2 = this.parameters;
        ArrayList arrayList = new ArrayList();
        for (Object obj : list2) {
            if (((BIIParameter) obj).getRequired()) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(((BIIParameter) it.next()).getName());
        }
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put(TTConst.TRACK_TYPE, "object");
        mapBuilder.put("properties", linkedHashMap);
        if (!arrayList2.isEmpty()) {
            mapBuilder.put("required", arrayList2);
        }
        return mapBuilder.b();
    }

    @NotNull
    public String toString() {
        return "BIIEntry(biiName=" + this.biiName + ", toolName=" + this.toolName + ", description=" + this.description + ", category=" + this.category + ", parameters=" + this.parameters + ", backgroundSafe=" + this.backgroundSafe + ", standardIntentFallback=" + this.standardIntentFallback + ')';
    }
}
