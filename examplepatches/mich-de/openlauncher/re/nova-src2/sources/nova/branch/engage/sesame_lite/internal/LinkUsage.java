package nova.branch.engage.sesame_lite.internal;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.Arrays;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.LongArraySerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.protobuf.ProtoNumber;
import nova.branch.engage.sesame_lite.internal.stores.IdHashInMemoryEntity;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0016\n\u0002\b\b\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b6\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 W2\u00020\u0001:\u0002WXBU\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\t\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\u0007\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\f\u001a\u00020\u0007¢\u0006\u0004\b\r\u0010\u000eBi\b\u0010\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0012¢\u0006\u0004\b\r\u0010\u0013J\u000e\u00105\u001a\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u0003Ji\u00106\u001a\u00020\u00002\b\b\u0002\u00107\u001a\u00020\u00052\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u00109\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010:\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010;\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010<\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010=\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010>\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010?J\t\u0010@\u001a\u00020\u0003HÆ\u0003J\t\u0010A\u001a\u00020\u0005HÆ\u0003J\t\u0010B\u001a\u00020\u0007HÆ\u0003J\t\u0010C\u001a\u00020\u0007HÆ\u0003J\t\u0010D\u001a\u00020\u0007HÆ\u0003J\t\u0010E\u001a\u00020\u0007HÆ\u0003J\t\u0010F\u001a\u00020\u0007HÆ\u0003J\t\u0010G\u001a\u00020\u0007HÆ\u0003JY\u00105\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\t\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\u00072\b\b\u0002\u0010\u000b\u001a\u00020\u00072\b\b\u0002\u0010\f\u001a\u00020\u0007HÆ\u0001J\u0013\u0010H\u001a\u00020I2\b\u0010J\u001a\u0004\u0018\u00010KHÖ\u0003J\t\u0010L\u001a\u00020\u0010HÖ\u0001J\t\u0010M\u001a\u00020NHÖ\u0001J%\u0010O\u001a\u00020P2\u0006\u0010Q\u001a\u00020\u00002\u0006\u0010R\u001a\u00020S2\u0006\u0010T\u001a\u00020UH\u0001¢\u0006\u0002\bVR\u001c\u0010\u0002\u001a\u00020\u00038\u0016X\u0097\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0016\u0010\u0017R\u001c\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0018\u0010\u0015\u001a\u0004\b\u0019\u0010\u001aR\u001c\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u001b\u0010\u0015\u001a\u0004\b\u001c\u0010\u001dR\u001c\u0010\b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u001e\u0010\u0015\u001a\u0004\b\u001f\u0010\u001dR\u001c\u0010\t\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b \u0010\u0015\u001a\u0004\b!\u0010\u001dR\u001c\u0010\n\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\"\u0010\u0015\u001a\u0004\b#\u0010\u001dR\u001c\u0010\u000b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b$\u0010\u0015\u001a\u0004\b%\u0010\u001dR\u001c\u0010\f\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b&\u0010\u0015\u001a\u0004\b'\u0010\u001dR\u001b\u0010(\u001a\u00020\u00078FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b*\u0010+\u001a\u0004\b)\u0010\u001dR\u001b\u0010,\u001a\u00020\u00078FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b.\u0010+\u001a\u0004\b-\u0010\u001dR\u0011\u0010/\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b0\u0010\u001aR\u0011\u00101\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b2\u0010\u001aR\u0011\u00103\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b4\u0010\u001a¨\u0006Y"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "Lnova/branch/engage/sesame_lite/internal/stores/IdHashInMemoryEntity;", "idHash", "Lnova/branch/engage/sesame_lite/internal/IdHash;", "viewedCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "usageStatsTimes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "otherClicks", "searchClicks", "zeroStateClicks", "feedClicks", "conduitUsageTimes", "<init>", "(Lnova/branch/engage/sesame_lite/internal/IdHash;J[J[J[J[J[J[J)V", "seen0", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILnova/branch/engage/sesame_lite/internal/IdHash;J[J[J[J[J[J[JLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getIdHash$annotations", "()V", "getIdHash", "()Lnova/branch/engage/sesame_lite/internal/IdHash;", "getViewedCount$annotations", "getViewedCount", "()J", "getUsageStatsTimes$annotations", "getUsageStatsTimes", "()[J", "getOtherClicks$annotations", "getOtherClicks", "getSearchClicks$annotations", "getSearchClicks", "getZeroStateClicks$annotations", "getZeroStateClicks", "getFeedClicks$annotations", "getFeedClicks", "getConduitUsageTimes$annotations", "getConduitUsageTimes", "clickTimes", "getClickTimes", "clickTimes$delegate", "Lkotlin/Lazy;", "usageTimes", "getUsageTimes", "usageTimes$delegate", "maxUsageTime", "getMaxUsageTime", "maxClickTime", "getMaxClickTime", "maxEngagementTime", "getMaxEngagementTime", "copy", "withTrimmedTimes", "now", "usageStatsTime", "searchOpenTime", "zsOpenTime", "feedOpenTime", "otherOpenTime", "newViewedCount", "conduitUsageTime", "(JLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$sesame_lite_release", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "$serializer", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public final /* data */ class LinkUsage implements IdHashInMemoryEntity {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: clickTimes$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy clickTimes;

    @NotNull
    private final long[] conduitUsageTimes;

    @NotNull
    private final long[] feedClicks;

    @NotNull
    private final IdHash idHash;

    @NotNull
    private final long[] otherClicks;

    @NotNull
    private final long[] searchClicks;

    @NotNull
    private final long[] usageStatsTimes;

    /* renamed from: usageTimes$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy usageTimes;
    private final long viewedCount;

    @NotNull
    private final long[] zeroStateClicks;

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0016\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J9\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00052\b\u0010\u0007\u001a\u0004\u0018\u00010\b2\u0006\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\b2\b\b\u0002\u0010\u000b\u001a\u00020\f¢\u0006\u0002\u0010\rJ\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000f¨\u0006\u0011"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/LinkUsage$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "trimUsageTimes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "times", "possibleNewTime", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "now", "maxAge", "limit", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "([JLjava/lang/Long;JJI)[J", "serializer", "Lkotlinx/serialization/KSerializer;", "Lnova/branch/engage/sesame_lite/internal/LinkUsage;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public static /* synthetic */ long[] trimUsageTimes$default(Companion companion, long[] jArr, Long l9, long j11, long j12, int i5, int i11, Object obj) {
            return companion.trimUsageTimes(jArr, l9, j11, (i11 & 8) != 0 ? 15552000000L : j12, (i11 & 16) != 0 ? 100 : i5);
        }

        @NotNull
        public final KSerializer<LinkUsage> serializer() {
            return LinkUsage$$serializer.INSTANCE;
        }

        @NotNull
        public final long[] trimUsageTimes(@NotNull long[] times, @Nullable Long possibleNewTime, long now, long maxAge, int limit) {
            Intrinsics.g(times, "times");
            if (possibleNewTime != null) {
                times = u90.b.W(times, possibleNewTime.longValue());
            }
            if (times.length > 1) {
                Arrays.sort(times);
            }
            long j11 = now - maxAge;
            int length = times.length - limit;
            if (length < 0) {
                length = 0;
            }
            while (length < times.length && times[length] < j11) {
                length++;
            }
            if (length == 0) {
                return times;
            }
            int length2 = times.length - length;
            long[] jArr = new long[length2];
            for (int i5 = 0; i5 < length2; i5++) {
                jArr[i5] = times[i5 + length];
            }
            return jArr;
        }

        private Companion() {
        }
    }

    public /* synthetic */ LinkUsage(int i5, IdHash idHash, long j11, long[] jArr, long[] jArr2, long[] jArr3, long[] jArr4, long[] jArr5, long[] jArr6, SerializationConstructorMarker serializationConstructorMarker) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, LinkUsage$$serializer.INSTANCE.getDescriptor());
        }
        this.idHash = idHash;
        if ((i5 & 2) == 0) {
            this.viewedCount = 0L;
        } else {
            this.viewedCount = j11;
        }
        if ((i5 & 4) == 0) {
            this.usageStatsTimes = new long[0];
        } else {
            this.usageStatsTimes = jArr;
        }
        if ((i5 & 8) == 0) {
            this.otherClicks = new long[0];
        } else {
            this.otherClicks = jArr2;
        }
        if ((i5 & 16) == 0) {
            this.searchClicks = new long[0];
        } else {
            this.searchClicks = jArr3;
        }
        if ((i5 & 32) == 0) {
            this.zeroStateClicks = new long[0];
        } else {
            this.zeroStateClicks = jArr4;
        }
        if ((i5 & 64) == 0) {
            this.feedClicks = new long[0];
        } else {
            this.feedClicks = jArr5;
        }
        if ((i5 & 128) == 0) {
            this.conduitUsageTimes = new long[0];
        } else {
            this.conduitUsageTimes = jArr6;
        }
        final int i11 = 0;
        this.clickTimes = LazyKt.a(new Function0(this) { // from class: nova.branch.engage.sesame_lite.internal.j

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ LinkUsage f78423b;

            {
                this.f78423b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return LinkUsage._init_$lambda$2(this.f78423b);
                    case 1:
                        return LinkUsage._init_$lambda$3(this.f78423b);
                    case 2:
                        return LinkUsage.clickTimes_delegate$lambda$0(this.f78423b);
                    default:
                        return LinkUsage.usageTimes_delegate$lambda$1(this.f78423b);
                }
            }
        });
        final int i12 = 1;
        this.usageTimes = LazyKt.a(new Function0(this) { // from class: nova.branch.engage.sesame_lite.internal.j

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ LinkUsage f78423b;

            {
                this.f78423b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i12) {
                    case 0:
                        return LinkUsage._init_$lambda$2(this.f78423b);
                    case 1:
                        return LinkUsage._init_$lambda$3(this.f78423b);
                    case 2:
                        return LinkUsage.clickTimes_delegate$lambda$0(this.f78423b);
                    default:
                        return LinkUsage.usageTimes_delegate$lambda$1(this.f78423b);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long[] _init_$lambda$2(LinkUsage linkUsage) {
        return b70.g.J1(kotlin.collections.c.V0(u90.b.X(u90.b.X(u90.b.X(linkUsage.searchClicks, linkUsage.zeroStateClicks), linkUsage.feedClicks), linkUsage.otherClicks)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long[] _init_$lambda$3(LinkUsage linkUsage) {
        return b70.g.J1(kotlin.collections.c.V0(u90.b.X(linkUsage.usageStatsTimes, linkUsage.conduitUsageTimes)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long[] clickTimes_delegate$lambda$0(LinkUsage linkUsage) {
        return b70.g.J1(kotlin.collections.c.V0(u90.b.X(u90.b.X(u90.b.X(linkUsage.searchClicks, linkUsage.zeroStateClicks), linkUsage.feedClicks), linkUsage.otherClicks)));
    }

    public static /* synthetic */ LinkUsage copy$default(LinkUsage linkUsage, IdHash idHash, long j11, long[] jArr, long[] jArr2, long[] jArr3, long[] jArr4, long[] jArr5, long[] jArr6, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            idHash = linkUsage.idHash;
        }
        if ((i5 & 2) != 0) {
            j11 = linkUsage.viewedCount;
        }
        if ((i5 & 4) != 0) {
            jArr = linkUsage.usageStatsTimes;
        }
        if ((i5 & 8) != 0) {
            jArr2 = linkUsage.otherClicks;
        }
        if ((i5 & 16) != 0) {
            jArr3 = linkUsage.searchClicks;
        }
        if ((i5 & 32) != 0) {
            jArr4 = linkUsage.zeroStateClicks;
        }
        if ((i5 & 64) != 0) {
            jArr5 = linkUsage.feedClicks;
        }
        if ((i5 & 128) != 0) {
            jArr6 = linkUsage.conduitUsageTimes;
        }
        long[] jArr7 = jArr5;
        long[] jArr8 = jArr6;
        return linkUsage.copy(idHash, j11, jArr, jArr2, jArr3, jArr4, jArr7, jArr8);
    }

    @ProtoNumber(number = 8)
    public static /* synthetic */ void getConduitUsageTimes$annotations() {
    }

    @ProtoNumber(number = 7)
    public static /* synthetic */ void getFeedClicks$annotations() {
    }

    @ProtoNumber(number = 1)
    public static /* synthetic */ void getIdHash$annotations() {
    }

    @ProtoNumber(number = 4)
    public static /* synthetic */ void getOtherClicks$annotations() {
    }

    @ProtoNumber(number = 5)
    public static /* synthetic */ void getSearchClicks$annotations() {
    }

    @ProtoNumber(number = 3)
    public static /* synthetic */ void getUsageStatsTimes$annotations() {
    }

    @ProtoNumber(number = 2)
    public static /* synthetic */ void getViewedCount$annotations() {
    }

    @ProtoNumber(number = 6)
    public static /* synthetic */ void getZeroStateClicks$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long[] usageTimes_delegate$lambda$1(LinkUsage linkUsage) {
        return b70.g.J1(kotlin.collections.c.V0(u90.b.X(linkUsage.usageStatsTimes, linkUsage.conduitUsageTimes)));
    }

    public static /* synthetic */ LinkUsage withTrimmedTimes$default(LinkUsage linkUsage, long j11, Long l9, Long l11, Long l12, Long l13, Long l14, Long l15, Long l16, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = System.currentTimeMillis();
        }
        return linkUsage.withTrimmedTimes(j11, (i5 & 2) != 0 ? null : l9, (i5 & 4) != 0 ? null : l11, (i5 & 8) != 0 ? null : l12, (i5 & 16) != 0 ? null : l13, (i5 & 32) != 0 ? null : l14, (i5 & 64) != 0 ? null : l15, (i5 & 128) != 0 ? null : l16);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$sesame_lite_release(LinkUsage self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeSerializableElement(serialDesc, 0, IdHash$$serializer.INSTANCE, self.getIdHash());
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.viewedCount != 0) {
            output.encodeLongElement(serialDesc, 1, self.viewedCount);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || !Intrinsics.b(self.usageStatsTimes, new long[0])) {
            output.encodeSerializableElement(serialDesc, 2, LongArraySerializer.INSTANCE, self.usageStatsTimes);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || !Intrinsics.b(self.otherClicks, new long[0])) {
            output.encodeSerializableElement(serialDesc, 3, LongArraySerializer.INSTANCE, self.otherClicks);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || !Intrinsics.b(self.searchClicks, new long[0])) {
            output.encodeSerializableElement(serialDesc, 4, LongArraySerializer.INSTANCE, self.searchClicks);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || !Intrinsics.b(self.zeroStateClicks, new long[0])) {
            output.encodeSerializableElement(serialDesc, 5, LongArraySerializer.INSTANCE, self.zeroStateClicks);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || !Intrinsics.b(self.feedClicks, new long[0])) {
            output.encodeSerializableElement(serialDesc, 6, LongArraySerializer.INSTANCE, self.feedClicks);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 7) && Intrinsics.b(self.conduitUsageTimes, new long[0])) {
            return;
        }
        output.encodeSerializableElement(serialDesc, 7, LongArraySerializer.INSTANCE, self.conduitUsageTimes);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final IdHash getIdHash() {
        return this.idHash;
    }

    /* renamed from: component2, reason: from getter */
    public final long getViewedCount() {
        return this.viewedCount;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final long[] getUsageStatsTimes() {
        return this.usageStatsTimes;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final long[] getOtherClicks() {
        return this.otherClicks;
    }

    @NotNull
    /* renamed from: component5, reason: from getter */
    public final long[] getSearchClicks() {
        return this.searchClicks;
    }

    @NotNull
    /* renamed from: component6, reason: from getter */
    public final long[] getZeroStateClicks() {
        return this.zeroStateClicks;
    }

    @NotNull
    /* renamed from: component7, reason: from getter */
    public final long[] getFeedClicks() {
        return this.feedClicks;
    }

    @NotNull
    /* renamed from: component8, reason: from getter */
    public final long[] getConduitUsageTimes() {
        return this.conduitUsageTimes;
    }

    @NotNull
    public final LinkUsage copy(@NotNull IdHash idHash, long viewedCount, @NotNull long[] usageStatsTimes, @NotNull long[] otherClicks, @NotNull long[] searchClicks, @NotNull long[] zeroStateClicks, @NotNull long[] feedClicks, @NotNull long[] conduitUsageTimes) {
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(usageStatsTimes, "usageStatsTimes");
        Intrinsics.g(otherClicks, "otherClicks");
        Intrinsics.g(searchClicks, "searchClicks");
        Intrinsics.g(zeroStateClicks, "zeroStateClicks");
        Intrinsics.g(feedClicks, "feedClicks");
        Intrinsics.g(conduitUsageTimes, "conduitUsageTimes");
        return new LinkUsage(idHash, viewedCount, usageStatsTimes, otherClicks, searchClicks, zeroStateClicks, feedClicks, conduitUsageTimes);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LinkUsage)) {
            return false;
        }
        LinkUsage linkUsage = (LinkUsage) other;
        return Intrinsics.b(this.idHash, linkUsage.idHash) && this.viewedCount == linkUsage.viewedCount && Intrinsics.b(this.usageStatsTimes, linkUsage.usageStatsTimes) && Intrinsics.b(this.otherClicks, linkUsage.otherClicks) && Intrinsics.b(this.searchClicks, linkUsage.searchClicks) && Intrinsics.b(this.zeroStateClicks, linkUsage.zeroStateClicks) && Intrinsics.b(this.feedClicks, linkUsage.feedClicks) && Intrinsics.b(this.conduitUsageTimes, linkUsage.conduitUsageTimes);
    }

    @NotNull
    public final long[] getClickTimes() {
        return (long[]) this.clickTimes.getValue();
    }

    @NotNull
    public final long[] getConduitUsageTimes() {
        return this.conduitUsageTimes;
    }

    @NotNull
    public final long[] getFeedClicks() {
        return this.feedClicks;
    }

    @Override // nova.branch.engage.sesame_lite.internal.stores.IdHashInMemoryEntity
    @NotNull
    public IdHash getIdHash() {
        return this.idHash;
    }

    public final long getMaxClickTime() {
        Long lR0 = kotlin.collections.c.R0(getClickTimes());
        if (lR0 != null) {
            return lR0.longValue();
        }
        return -1L;
    }

    public final long getMaxEngagementTime() {
        return Math.max(getMaxClickTime(), getMaxUsageTime());
    }

    public final long getMaxUsageTime() {
        Long lR0 = kotlin.collections.c.R0(getUsageTimes());
        if (lR0 != null) {
            return lR0.longValue();
        }
        return -1L;
    }

    @NotNull
    public final long[] getOtherClicks() {
        return this.otherClicks;
    }

    @NotNull
    public final long[] getSearchClicks() {
        return this.searchClicks;
    }

    @NotNull
    public final long[] getUsageStatsTimes() {
        return this.usageStatsTimes;
    }

    @NotNull
    public final long[] getUsageTimes() {
        return (long[]) this.usageTimes.getValue();
    }

    public final long getViewedCount() {
        return this.viewedCount;
    }

    @NotNull
    public final long[] getZeroStateClicks() {
        return this.zeroStateClicks;
    }

    public int hashCode() {
        return Arrays.hashCode(this.conduitUsageTimes) + ((Arrays.hashCode(this.feedClicks) + ((Arrays.hashCode(this.zeroStateClicks) + ((Arrays.hashCode(this.searchClicks) + ((Arrays.hashCode(this.otherClicks) + ((Arrays.hashCode(this.usageStatsTimes) + c0.d(this.idHash.hashCode() * 31, 31, this.viewedCount)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    @NotNull
    public String toString() {
        IdHash idHash = this.idHash;
        long j11 = this.viewedCount;
        String string = Arrays.toString(this.usageStatsTimes);
        String string2 = Arrays.toString(this.otherClicks);
        String string3 = Arrays.toString(this.searchClicks);
        String string4 = Arrays.toString(this.zeroStateClicks);
        String string5 = Arrays.toString(this.feedClicks);
        String string6 = Arrays.toString(this.conduitUsageTimes);
        StringBuilder sb2 = new StringBuilder("LinkUsage(idHash=");
        sb2.append(idHash);
        sb2.append(", viewedCount=");
        sb2.append(j11);
        c0.D(sb2, ", usageStatsTimes=", string, ", otherClicks=", string2);
        c0.D(sb2, ", searchClicks=", string3, ", zeroStateClicks=", string4);
        c0.D(sb2, ", feedClicks=", string5, ", conduitUsageTimes=", string6);
        sb2.append(")");
        return sb2.toString();
    }

    @NotNull
    public final LinkUsage withTrimmedTimes(long now, @Nullable Long usageStatsTime, @Nullable Long searchOpenTime, @Nullable Long zsOpenTime, @Nullable Long feedOpenTime, @Nullable Long otherOpenTime, @Nullable Long newViewedCount, @Nullable Long conduitUsageTime) {
        IdHash idHash = getIdHash();
        long jLongValue = newViewedCount != null ? newViewedCount.longValue() : this.viewedCount;
        Companion companion = INSTANCE;
        return new LinkUsage(idHash, jLongValue, Companion.trimUsageTimes$default(companion, this.usageStatsTimes, usageStatsTime, now, 0L, 0, 24, null), Companion.trimUsageTimes$default(companion, this.otherClicks, otherOpenTime, now, 0L, 0, 24, null), Companion.trimUsageTimes$default(companion, this.searchClicks, searchOpenTime, now, 0L, 0, 24, null), Companion.trimUsageTimes$default(companion, this.zeroStateClicks, zsOpenTime, now, 0L, 0, 24, null), Companion.trimUsageTimes$default(companion, this.feedClicks, feedOpenTime, now, 0L, 0, 24, null), Companion.trimUsageTimes$default(companion, this.conduitUsageTimes, conduitUsageTime, now, 0L, 0, 24, null));
    }

    @NotNull
    public final LinkUsage copy(@NotNull IdHash idHash) {
        Intrinsics.g(idHash, "idHash");
        return new LinkUsage(idHash, this.viewedCount, this.usageStatsTimes, this.otherClicks, this.searchClicks, this.zeroStateClicks, this.feedClicks, this.conduitUsageTimes);
    }

    @Override // nova.branch.engage.sesame_lite.internal.stores.InMemoryEntity
    @NotNull
    public IdHash getDbId() {
        return IdHashInMemoryEntity.DefaultImpls.getDbId(this);
    }

    public LinkUsage(@NotNull IdHash idHash, long j11, @NotNull long[] usageStatsTimes, @NotNull long[] otherClicks, @NotNull long[] searchClicks, @NotNull long[] zeroStateClicks, @NotNull long[] feedClicks, @NotNull long[] conduitUsageTimes) {
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(usageStatsTimes, "usageStatsTimes");
        Intrinsics.g(otherClicks, "otherClicks");
        Intrinsics.g(searchClicks, "searchClicks");
        Intrinsics.g(zeroStateClicks, "zeroStateClicks");
        Intrinsics.g(feedClicks, "feedClicks");
        Intrinsics.g(conduitUsageTimes, "conduitUsageTimes");
        this.idHash = idHash;
        this.viewedCount = j11;
        this.usageStatsTimes = usageStatsTimes;
        this.otherClicks = otherClicks;
        this.searchClicks = searchClicks;
        this.zeroStateClicks = zeroStateClicks;
        this.feedClicks = feedClicks;
        this.conduitUsageTimes = conduitUsageTimes;
        final int i5 = 2;
        this.clickTimes = LazyKt.a(new Function0(this) { // from class: nova.branch.engage.sesame_lite.internal.j

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ LinkUsage f78423b;

            {
                this.f78423b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        return LinkUsage._init_$lambda$2(this.f78423b);
                    case 1:
                        return LinkUsage._init_$lambda$3(this.f78423b);
                    case 2:
                        return LinkUsage.clickTimes_delegate$lambda$0(this.f78423b);
                    default:
                        return LinkUsage.usageTimes_delegate$lambda$1(this.f78423b);
                }
            }
        });
        final int i11 = 3;
        this.usageTimes = LazyKt.a(new Function0(this) { // from class: nova.branch.engage.sesame_lite.internal.j

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ LinkUsage f78423b;

            {
                this.f78423b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return LinkUsage._init_$lambda$2(this.f78423b);
                    case 1:
                        return LinkUsage._init_$lambda$3(this.f78423b);
                    case 2:
                        return LinkUsage.clickTimes_delegate$lambda$0(this.f78423b);
                    default:
                        return LinkUsage.usageTimes_delegate$lambda$1(this.f78423b);
                }
            }
        });
    }

    public /* synthetic */ LinkUsage(IdHash idHash, long j11, long[] jArr, long[] jArr2, long[] jArr3, long[] jArr4, long[] jArr5, long[] jArr6, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(idHash, (i5 & 2) != 0 ? 0L : j11, (i5 & 4) != 0 ? new long[0] : jArr, (i5 & 8) != 0 ? new long[0] : jArr2, (i5 & 16) != 0 ? new long[0] : jArr3, (i5 & 32) != 0 ? new long[0] : jArr4, (i5 & 64) != 0 ? new long[0] : jArr5, (i5 & 128) != 0 ? new long[0] : jArr6);
    }
}
