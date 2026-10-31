package com.instabridge.ai.auth;

import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import io.p;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0006\u0004\u0005\u0006\u0007\b\tB\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0006\n\u000b\f\r\u000e\u000f¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentMutation;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Enable", "NotNow", "SetGlobal", "SetCategory", "SetCategories", "GrantAll", "Lcom/instabridge/ai/auth/AiConsentMutation$Enable;", "Lcom/instabridge/ai/auth/AiConsentMutation$GrantAll;", "Lcom/instabridge/ai/auth/AiConsentMutation$NotNow;", "Lcom/instabridge/ai/auth/AiConsentMutation$SetCategories;", "Lcom/instabridge/ai/auth/AiConsentMutation$SetCategory;", "Lcom/instabridge/ai/auth/AiConsentMutation$SetGlobal;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class AiConsentMutation {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentMutation$Enable;", "Lcom/instabridge/ai/auth/AiConsentMutation;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Enable extends AiConsentMutation {
        public static final int $stable = 0;

        @NotNull
        public static final Enable INSTANCE = new Enable();

        private Enable() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof Enable);
        }

        public int hashCode() {
            return 661224333;
        }

        @NotNull
        public String toString() {
            return "Enable";
        }
    }

    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u0016\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u0007\u0010\bJ \u0010\t\u001a\u00020\u00002\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002HÆ\u0001¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\f\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015R\u001d\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0016\u001a\u0004\b\u0017\u0010\b¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentMutation$GrantAll;", "Lcom/instabridge/ai/auth/AiConsentMutation;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/p;", "categories", "<init>", "(Ljava/util/List;)V", "component1", "()Ljava/util/List;", "copy", "(Ljava/util/List;)Lcom/instabridge/ai/auth/AiConsentMutation$GrantAll;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "()I", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "equals", "(Ljava/lang/Object;)Z", "Ljava/util/List;", "getCategories", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class GrantAll extends AiConsentMutation {
        public static final int $stable = 8;

        @NotNull
        private final List<p> categories;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public GrantAll(@NotNull List<? extends p> categories) {
            super(null);
            Intrinsics.g(categories, "categories");
            this.categories = categories;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ GrantAll copy$default(GrantAll grantAll, List list, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                list = grantAll.categories;
            }
            return grantAll.copy(list);
        }

        @NotNull
        public final List<p> component1() {
            return this.categories;
        }

        @NotNull
        public final GrantAll copy(@NotNull List<? extends p> categories) {
            Intrinsics.g(categories, "categories");
            return new GrantAll(categories);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof GrantAll) && Intrinsics.b(this.categories, ((GrantAll) other).categories);
        }

        @NotNull
        public final List<p> getCategories() {
            return this.categories;
        }

        public int hashCode() {
            return this.categories.hashCode();
        }

        @NotNull
        public String toString() {
            return fq.c.e(new StringBuilder("GrantAll(categories="), this.categories, ')');
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentMutation$NotNow;", "Lcom/instabridge/ai/auth/AiConsentMutation;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class NotNow extends AiConsentMutation {
        public static final int $stable = 0;

        @NotNull
        public static final NotNow INSTANCE = new NotNow();

        private NotNow() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof NotNow);
        }

        public int hashCode() {
            return 920357133;
        }

        @NotNull
        public String toString() {
            return "NotNow";
        }
    }

    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\b\u0087\b\u0018\u00002\u00020\u0001B\u001b\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ&\u0010\n\u001a\u00020\u00002\u0014\b\u0002\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002HÆ\u0001¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\r\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u0010\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0014\u001a\u00020\u00042\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015R#\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0016\u001a\u0004\b\u0017\u0010\t¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentMutation$SetCategories;", "Lcom/instabridge/ai/auth/AiConsentMutation;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/p;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "categories", "<init>", "(Ljava/util/Map;)V", "component1", "()Ljava/util/Map;", "copy", "(Ljava/util/Map;)Lcom/instabridge/ai/auth/AiConsentMutation$SetCategories;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "()I", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "Ljava/util/Map;", "getCategories", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetCategories extends AiConsentMutation {
        public static final int $stable = 8;

        @NotNull
        private final Map<p, Boolean> categories;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public SetCategories(@NotNull Map<p, Boolean> categories) {
            super(null);
            Intrinsics.g(categories, "categories");
            this.categories = categories;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ SetCategories copy$default(SetCategories setCategories, Map map, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                map = setCategories.categories;
            }
            return setCategories.copy(map);
        }

        @NotNull
        public final Map<p, Boolean> component1() {
            return this.categories;
        }

        @NotNull
        public final SetCategories copy(@NotNull Map<p, Boolean> categories) {
            Intrinsics.g(categories, "categories");
            return new SetCategories(categories);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof SetCategories) && Intrinsics.b(this.categories, ((SetCategories) other).categories);
        }

        @NotNull
        public final Map<p, Boolean> getCategories() {
            return this.categories;
        }

        public int hashCode() {
            return this.categories.hashCode();
        }

        @NotNull
        public String toString() {
            return c9.l(new StringBuilder("SetCategories(categories="), this.categories, ')');
        }
    }

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ$\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00042\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0018\u001a\u0004\b\u0019\u0010\tR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001a\u001a\u0004\b\u001b\u0010\u000b¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentMutation$SetCategory;", "Lcom/instabridge/ai/auth/AiConsentMutation;", "Lio/p;", "category", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "enabled", "<init>", "(Lio/p;Z)V", "component1", "()Lio/p;", "component2", "()Z", "copy", "(Lio/p;Z)Lcom/instabridge/ai/auth/AiConsentMutation$SetCategory;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "()I", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "Lio/p;", "getCategory", "Z", "getEnabled", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetCategory extends AiConsentMutation {
        public static final int $stable = 0;

        @NotNull
        private final p category;
        private final boolean enabled;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public SetCategory(@NotNull p category, boolean z11) {
            super(null);
            Intrinsics.g(category, "category");
            this.category = category;
            this.enabled = z11;
        }

        public static /* synthetic */ SetCategory copy$default(SetCategory setCategory, p pVar, boolean z11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                pVar = setCategory.category;
            }
            if ((i5 & 2) != 0) {
                z11 = setCategory.enabled;
            }
            return setCategory.copy(pVar, z11);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final p getCategory() {
            return this.category;
        }

        /* renamed from: component2, reason: from getter */
        public final boolean getEnabled() {
            return this.enabled;
        }

        @NotNull
        public final SetCategory copy(@NotNull p category, boolean enabled) {
            Intrinsics.g(category, "category");
            return new SetCategory(category, enabled);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetCategory)) {
                return false;
            }
            SetCategory setCategory = (SetCategory) other;
            return this.category == setCategory.category && this.enabled == setCategory.enabled;
        }

        @NotNull
        public final p getCategory() {
            return this.category;
        }

        public final boolean getEnabled() {
            return this.enabled;
        }

        public int hashCode() {
            return Boolean.hashCode(this.enabled) + (this.category.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("SetCategory(category=");
            sb2.append(this.category);
            sb2.append(", enabled=");
            return a2.c.p(sb2, this.enabled, ')');
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u00032\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/auth/AiConsentMutation$SetGlobal;", "Lcom/instabridge/ai/auth/AiConsentMutation;", "enabled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Z)V", "getEnabled", "()Z", "component1", "copy", "equals", InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetGlobal extends AiConsentMutation {
        public static final int $stable = 0;
        private final boolean enabled;

        public SetGlobal(boolean z11) {
            super(null);
            this.enabled = z11;
        }

        public static /* synthetic */ SetGlobal copy$default(SetGlobal setGlobal, boolean z11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                z11 = setGlobal.enabled;
            }
            return setGlobal.copy(z11);
        }

        /* renamed from: component1, reason: from getter */
        public final boolean getEnabled() {
            return this.enabled;
        }

        @NotNull
        public final SetGlobal copy(boolean enabled) {
            return new SetGlobal(enabled);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof SetGlobal) && this.enabled == ((SetGlobal) other).enabled;
        }

        public final boolean getEnabled() {
            return this.enabled;
        }

        public int hashCode() {
            return Boolean.hashCode(this.enabled);
        }

        @NotNull
        public String toString() {
            return a2.c.p(new StringBuilder("SetGlobal(enabled="), this.enabled, ')');
        }
    }

    public /* synthetic */ AiConsentMutation(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private AiConsentMutation() {
    }
}
