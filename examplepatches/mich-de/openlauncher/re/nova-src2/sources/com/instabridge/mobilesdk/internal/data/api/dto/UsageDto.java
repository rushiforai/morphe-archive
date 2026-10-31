package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 $2\u00020\u0001:\u0002#$B%\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007B3\b\u0010\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u0006\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J'\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\tHÖ\u0001J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001J%\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u00002\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0001¢\u0006\u0002\b\"R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000e¨\u0006%"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;", b.f42142b, "all", b.f42142b, "consumed", "available", "<init>", "(JJJ)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IJJJLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getAll", "()J", "getConsumed", "getAvailable", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class UsageDto {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long all;
    private final long available;
    private final long consumed;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<UsageDto> serializer() {
            return UsageDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public UsageDto() {
        this(0L, 0L, 0L, 7, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ UsageDto copy$default(UsageDto usageDto, long j11, long j12, long j13, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = usageDto.all;
        }
        long j14 = j11;
        if ((i5 & 2) != 0) {
            j12 = usageDto.consumed;
        }
        long j15 = j12;
        if ((i5 & 4) != 0) {
            j13 = usageDto.available;
        }
        return usageDto.copy(j14, j15, j13);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(UsageDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.all != 0) {
            output.encodeLongElement(serialDesc, 0, self.all);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.consumed != 0) {
            output.encodeLongElement(serialDesc, 1, self.consumed);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.available == 0) {
            return;
        }
        output.encodeLongElement(serialDesc, 2, self.available);
    }

    /* renamed from: component1, reason: from getter */
    public final long getAll() {
        return this.all;
    }

    /* renamed from: component2, reason: from getter */
    public final long getConsumed() {
        return this.consumed;
    }

    /* renamed from: component3, reason: from getter */
    public final long getAvailable() {
        return this.available;
    }

    @NotNull
    public final UsageDto copy(long all, long consumed, long available) {
        return new UsageDto(all, consumed, available);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UsageDto)) {
            return false;
        }
        UsageDto usageDto = (UsageDto) other;
        return this.all == usageDto.all && this.consumed == usageDto.consumed && this.available == usageDto.available;
    }

    public final long getAll() {
        return this.all;
    }

    public final long getAvailable() {
        return this.available;
    }

    public final long getConsumed() {
        return this.consumed;
    }

    public int hashCode() {
        return Long.hashCode(this.available) + c0.d(Long.hashCode(this.all) * 31, 31, this.consumed);
    }

    @NotNull
    public String toString() {
        long j11 = this.all;
        long j12 = this.consumed;
        long j13 = this.available;
        StringBuilder sbU = c0.u(j11, "UsageDto(all=", ", consumed=");
        sbU.append(j12);
        sbU.append(", available=");
        sbU.append(j13);
        sbU.append(")");
        return sbU.toString();
    }

    public /* synthetic */ UsageDto(int i5, long j11, long j12, long j13, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.all = 0L;
        } else {
            this.all = j11;
        }
        if ((i5 & 2) == 0) {
            this.consumed = 0L;
        } else {
            this.consumed = j12;
        }
        if ((i5 & 4) == 0) {
            this.available = 0L;
        } else {
            this.available = j13;
        }
    }

    public UsageDto(long j11, long j12, long j13) {
        this.all = j11;
        this.consumed = j12;
        this.available = j13;
    }

    public /* synthetic */ UsageDto(long j11, long j12, long j13, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? 0L : j11, (i5 & 2) != 0 ? 0L : j12, (i5 & 4) != 0 ? 0L : j13);
    }
}
