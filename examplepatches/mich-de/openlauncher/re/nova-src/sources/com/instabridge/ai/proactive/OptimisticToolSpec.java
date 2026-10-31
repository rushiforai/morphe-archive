package com.instabridge.ai.proactive;

import b.c9;
import b70.h;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0016\b\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u0017\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005HÆ\u0003J+\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0016\b\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u001f\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/instabridge/ai/proactive/OptimisticToolSpec;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "args", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/util/Map;)V", "getName", "()Ljava/lang/String;", "getArgs", "()Ljava/util/Map;", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class OptimisticToolSpec {
    public static final int $stable = 8;

    @NotNull
    private final Map<String, Object> args;

    @NotNull
    private final String name;

    public OptimisticToolSpec(@NotNull String name, @NotNull Map<String, ? extends Object> args) {
        Intrinsics.g(name, "name");
        Intrinsics.g(args, "args");
        this.name = name;
        this.args = args;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ OptimisticToolSpec copy$default(OptimisticToolSpec optimisticToolSpec, String str, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = optimisticToolSpec.name;
        }
        if ((i5 & 2) != 0) {
            map = optimisticToolSpec.args;
        }
        return optimisticToolSpec.copy(str, map);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final Map<String, Object> component2() {
        return this.args;
    }

    @NotNull
    public final OptimisticToolSpec copy(@NotNull String name, @NotNull Map<String, ? extends Object> args) {
        Intrinsics.g(name, "name");
        Intrinsics.g(args, "args");
        return new OptimisticToolSpec(name, args);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof OptimisticToolSpec)) {
            return false;
        }
        OptimisticToolSpec optimisticToolSpec = (OptimisticToolSpec) other;
        return Intrinsics.b(this.name, optimisticToolSpec.name) && Intrinsics.b(this.args, optimisticToolSpec.args);
    }

    @NotNull
    public final Map<String, Object> getArgs() {
        return this.args;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    public int hashCode() {
        return this.args.hashCode() + (this.name.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("OptimisticToolSpec(name=");
        sb2.append(this.name);
        sb2.append(", args=");
        return c9.l(sb2, this.args, ')');
    }

    public /* synthetic */ OptimisticToolSpec(String str, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? h.f17594a : map);
    }
}
