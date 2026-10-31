package io.branch.engage.sesame_lite.internal;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u001c2\u00020\u0001:\u0002\u001b\u001cB5\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\u0002\u0010\u000bB!\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\fJ\u0013\u0010\u0012\u001a\u00020\b2\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J!\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001aHÇ\u0001R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000e¨\u0006\u001d"}, d2 = {"Lio/branch/engage/sesame_lite/internal/SearchAlias;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen1", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "matchDisplay", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "displayOverride", "fromPersistable", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;ZLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "(Ljava/lang/String;Ljava/lang/String;Z)V", "getDisplayOverride", "()Ljava/lang/String;", "getFromPersistable", "()Z", "getMatchDisplay", "equals", InneractiveMediationNameConsts.OTHER, "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "$serializer", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final class SearchAlias {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String displayOverride;
    private final boolean fromPersistable;

    @NotNull
    private final String matchDisplay;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/engage/sesame_lite/internal/SearchAlias$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/engage/sesame_lite/internal/SearchAlias;", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<SearchAlias> serializer() {
            return SearchAlias$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    @Deprecated
    public /* synthetic */ SearchAlias(int i5, String str, String str2, boolean z11, SerializationConstructorMarker serializationConstructorMarker) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, SearchAlias$$serializer.INSTANCE.getDescriptor());
        }
        this.matchDisplay = str;
        this.displayOverride = str2;
        if ((i5 & 4) == 0) {
            this.fromPersistable = false;
        } else {
            this.fromPersistable = z11;
        }
    }

    @JvmStatic
    public static final void write$Self(@NotNull SearchAlias self, @NotNull CompositeEncoder output, @NotNull SerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeStringElement(serialDesc, 0, self.matchDisplay);
        output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.displayOverride);
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.fromPersistable) {
            output.encodeBooleanElement(serialDesc, 2, self.fromPersistable);
        }
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SearchAlias)) {
            return false;
        }
        SearchAlias searchAlias = (SearchAlias) other;
        return Intrinsics.b(this.matchDisplay, searchAlias.matchDisplay) && Intrinsics.b(this.displayOverride, searchAlias.displayOverride);
    }

    @Nullable
    public final String getDisplayOverride() {
        return this.displayOverride;
    }

    public final boolean getFromPersistable() {
        return this.fromPersistable;
    }

    @NotNull
    public final String getMatchDisplay() {
        return this.matchDisplay;
    }

    public SearchAlias(@NotNull String matchDisplay, @Nullable String str, boolean z11) {
        Intrinsics.g(matchDisplay, "matchDisplay");
        this.matchDisplay = matchDisplay;
        this.displayOverride = str;
        this.fromPersistable = z11;
    }

    public /* synthetic */ SearchAlias(String str, String str2, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? false : z11);
    }
}
