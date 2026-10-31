package nova.branch.engage.sesame_lite.internal.stores;

import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.engage.sesame_lite.internal.a;
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

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0002()B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0007\u0010\bBC\b\u0010\u0012\u0006\u0010\t\u001a\u00020\n\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\u0007\u0010\rJ\t\u0010\u0015\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0002HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0002HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0002HÆ\u0003J5\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001dHÖ\u0003J\t\u0010\u001e\u001a\u00020\nHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0002HÖ\u0001J%\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020\u00002\u0006\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020&H\u0001¢\u0006\u0002\b'R\u0011\u0010\u0003\u001a\u00020\u0002¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0002¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0002¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0002¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000fR\u0014\u0010\u0013\u001a\u00020\u00028VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0014\u0010\u000f¨\u0006*"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/stores/AliasEntity;", "Lnova/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", b.f42142b, "packageName", "match", "component", "displayOverride", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPackageName", "()Ljava/lang/String;", "getMatch", "getComponent", "getDisplayOverride", "dbId", "getDbId", "component1", "component2", "component3", "component4", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$sesame_lite_release", "$serializer", k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public final /* data */ class AliasEntity implements InMemoryEntity<String> {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String component;

    @Nullable
    private final String displayOverride;

    @NotNull
    private final String match;

    @NotNull
    private final String packageName;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/stores/AliasEntity$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lnova/branch/engage/sesame_lite/internal/stores/AliasEntity;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<AliasEntity> serializer() {
            return AliasEntity$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ AliasEntity(int i5, String str, String str2, String str3, String str4, SerializationConstructorMarker serializationConstructorMarker) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, AliasEntity$$serializer.INSTANCE.getDescriptor());
        }
        this.packageName = str;
        this.match = str2;
        if ((i5 & 4) == 0) {
            this.component = null;
        } else {
            this.component = str3;
        }
        if ((i5 & 8) == 0) {
            this.displayOverride = null;
        } else {
            this.displayOverride = str4;
        }
    }

    public static /* synthetic */ AliasEntity copy$default(AliasEntity aliasEntity, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = aliasEntity.packageName;
        }
        if ((i5 & 2) != 0) {
            str2 = aliasEntity.match;
        }
        if ((i5 & 4) != 0) {
            str3 = aliasEntity.component;
        }
        if ((i5 & 8) != 0) {
            str4 = aliasEntity.displayOverride;
        }
        return aliasEntity.copy(str, str2, str3, str4);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$sesame_lite_release(AliasEntity self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.packageName);
        output.encodeStringElement(serialDesc, 1, self.match);
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.component != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.component);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 3) && self.displayOverride == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.displayOverride);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getMatch() {
        return this.match;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getComponent() {
        return this.component;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getDisplayOverride() {
        return this.displayOverride;
    }

    @NotNull
    public final AliasEntity copy(@NotNull String packageName, @NotNull String match, @Nullable String component, @Nullable String displayOverride) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(match, "match");
        return new AliasEntity(packageName, match, component, displayOverride);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AliasEntity)) {
            return false;
        }
        AliasEntity aliasEntity = (AliasEntity) other;
        return Intrinsics.b(this.packageName, aliasEntity.packageName) && Intrinsics.b(this.match, aliasEntity.match) && Intrinsics.b(this.component, aliasEntity.component) && Intrinsics.b(this.displayOverride, aliasEntity.displayOverride);
    }

    @Nullable
    public final String getComponent() {
        return this.component;
    }

    @Nullable
    public final String getDisplayOverride() {
        return this.displayOverride;
    }

    @NotNull
    public final String getMatch() {
        return this.match;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    public int hashCode() {
        int iA = a.a(this.match, this.packageName.hashCode() * 31, 31);
        String str = this.component;
        int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.displayOverride;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.packageName;
        String str2 = this.match;
        return c0.s(c0.w("AliasEntity(packageName=", str, ", match=", str2, ", component="), this.component, ", displayOverride=", this.displayOverride, ")");
    }

    @Override // nova.branch.engage.sesame_lite.internal.stores.InMemoryEntity
    @NotNull
    public String getDbId() {
        return u4.m(this.packageName, ":", this.match);
    }

    public AliasEntity(@NotNull String packageName, @NotNull String match, @Nullable String str, @Nullable String str2) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(match, "match");
        this.packageName = packageName;
        this.match = match;
        this.component = str;
        this.displayOverride = str2;
    }

    public /* synthetic */ AliasEntity(String str, String str2, String str3, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : str4);
    }
}
