package nova.branch.engage.sesame_lite.internal.stores;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.collections.c;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.LongArraySerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0016\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 (2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0002'(B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007B/\b\u0010\u0012\u0006\u0010\b\u001a\u00020\t\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u0006\u0010\fJ\u000e\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016J\t\u0010\u0017\u001a\u00020\u0002HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u00142\b\u0010\u001b\u001a\u0004\u0018\u00010\u001cHÖ\u0003J\t\u0010\u001d\u001a\u00020\tHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0002HÖ\u0001J%\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\u00002\u0006\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020%H\u0001¢\u0006\u0002\b&R\u0011\u0010\u0003\u001a\u00020\u0002¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u00028VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u000e¨\u0006)"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/stores/IgnoreEntity;", "Lnova/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", b.f42142b, "packageName", "specificUserId", b.f42142b, "<init>", "(Ljava/lang/String;[J)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;[JLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPackageName", "()Ljava/lang/String;", "getSpecificUserId", "()[J", "dbId", "getDbId", "matchesUser", b.f42142b, "userId", b.f42142b, "component1", "component2", "copy", "equals", InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$sesame_lite_release", "$serializer", k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public final /* data */ class IgnoreEntity implements InMemoryEntity<String> {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final String packageName;

    @Nullable
    private final long[] specificUserId;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/stores/IgnoreEntity$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lnova/branch/engage/sesame_lite/internal/stores/IgnoreEntity;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<IgnoreEntity> serializer() {
            return IgnoreEntity$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ IgnoreEntity(int i5, String str, long[] jArr, SerializationConstructorMarker serializationConstructorMarker) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, IgnoreEntity$$serializer.INSTANCE.getDescriptor());
        }
        this.packageName = str;
        if ((i5 & 2) == 0) {
            this.specificUserId = null;
        } else {
            this.specificUserId = jArr;
        }
    }

    public static /* synthetic */ IgnoreEntity copy$default(IgnoreEntity ignoreEntity, String str, long[] jArr, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = ignoreEntity.packageName;
        }
        if ((i5 & 2) != 0) {
            jArr = ignoreEntity.specificUserId;
        }
        return ignoreEntity.copy(str, jArr);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$sesame_lite_release(IgnoreEntity self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.packageName);
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && self.specificUserId == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 1, LongArraySerializer.INSTANCE, self.specificUserId);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final long[] getSpecificUserId() {
        return this.specificUserId;
    }

    @NotNull
    public final IgnoreEntity copy(@NotNull String packageName, @Nullable long[] specificUserId) {
        Intrinsics.g(packageName, "packageName");
        return new IgnoreEntity(packageName, specificUserId);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof IgnoreEntity)) {
            return false;
        }
        IgnoreEntity ignoreEntity = (IgnoreEntity) other;
        return Intrinsics.b(this.packageName, ignoreEntity.packageName) && Intrinsics.b(this.specificUserId, ignoreEntity.specificUserId);
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    @Nullable
    public final long[] getSpecificUserId() {
        return this.specificUserId;
    }

    public int hashCode() {
        int iHashCode = this.packageName.hashCode() * 31;
        long[] jArr = this.specificUserId;
        return iHashCode + (jArr == null ? 0 : Arrays.hashCode(jArr));
    }

    public final boolean matchesUser(long userId) {
        long[] jArr = this.specificUserId;
        return jArr == null || userId == -1 || c.s0(jArr, userId);
    }

    @NotNull
    public String toString() {
        return c0.n("IgnoreEntity(packageName=", this.packageName, ", specificUserId=", Arrays.toString(this.specificUserId), ")");
    }

    @Override // nova.branch.engage.sesame_lite.internal.stores.InMemoryEntity
    @NotNull
    public String getDbId() {
        return this.packageName;
    }

    public IgnoreEntity(@NotNull String packageName, @Nullable long[] jArr) {
        Intrinsics.g(packageName, "packageName");
        this.packageName = packageName;
        this.specificUserId = jArr;
    }

    public /* synthetic */ IgnoreEntity(String str, long[] jArr, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : jArr);
    }
}
