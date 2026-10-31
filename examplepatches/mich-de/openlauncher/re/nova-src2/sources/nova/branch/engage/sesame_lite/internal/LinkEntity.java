package nova.branch.engage.sesame_lite.internal;

import android.content.ComponentName;
import android.net.Uri;
import b.c0;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.internal.ULongSerializer;
import nova.branch.engage.sesame_lite.internal.stores.IdHashInMemoryEntity;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0017\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\f\b\u0087\b\u0018\u0000 _2\u00020\u0001:\u0002_`B\u008b\u0001\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\n\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0007\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0004\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e\u0012\u000e\b\u0002\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010\u0012\u000e\b\u0002\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00130\u0010¢\u0006\u0004\b\u0015\u0010\u0016B{\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\n\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0007\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0004\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e\u0012\u000e\b\u0002\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010¢\u0006\u0004\b\u0015\u0010\u0017B\u009b\u0001\b\u0010\u0012\u0006\u0010\u0019\u001a\u00020\u0018\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u000b\u001a\u00020\u0007\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\u000e\u0010\u0012\u001a\n\u0012\u0004\u0012\u00020\u0011\u0018\u00010\u0010\u0012\u000e\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u0010\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u001a¢\u0006\u0004\b\u0015\u0010\u001cJ\u0087\u0001\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00042\b\b\u0002\u0010\b\u001a\u00020\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\n\u001a\u00020\u00042\b\b\u0002\u0010\u000b\u001a\u00020\u00072\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\u000e\b\u0002\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010¢\u0006\u0004\b\u001d\u0010\u001eJ\r\u0010!\u001a\u00020 ¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b'\u0010&J\u0010\u0010(\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b(\u0010)J\u0012\u0010*\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b*\u0010&J\u0010\u0010+\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b+\u0010&J\u0010\u0010,\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b,\u0010)J\u0012\u0010-\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b-\u0010&J\u0012\u0010.\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b.\u0010&J\u0010\u00100\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b/\u0010)J\u0016\u00101\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010HÆ\u0003¢\u0006\u0004\b1\u00102J\u009a\u0001\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00042\b\b\u0002\u0010\b\u001a\u00020\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\n\u001a\u00020\u00042\b\b\u0002\u0010\u000b\u001a\u00020\u00072\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\u000e\b\u0002\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u00102\u000e\b\u0002\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00130\u0010HÆ\u0001¢\u0006\u0004\b3\u00104J\u0010\u00105\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b5\u0010&J\u0010\u00106\u001a\u00020\u0018HÖ\u0001¢\u0006\u0004\b6\u00107J\u001a\u0010;\u001a\u00020:2\b\u00109\u001a\u0004\u0018\u000108HÖ\u0003¢\u0006\u0004\b;\u0010<J\u0016\u0010=\u001a\b\u0012\u0004\u0012\u00020\u00130\u0010HÂ\u0003¢\u0006\u0004\b=\u00102J'\u0010E\u001a\u00020 2\u0006\u0010>\u001a\u00020\u00002\u0006\u0010@\u001a\u00020?2\u0006\u0010B\u001a\u00020AH\u0001¢\u0006\u0004\bC\u0010DR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010F\u001a\u0004\bG\u0010$R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010H\u001a\u0004\bI\u0010&R\u0017\u0010\u0006\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010H\u001a\u0004\bJ\u0010&R\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010K\u001a\u0004\bL\u0010)R\u0019\u0010\t\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010H\u001a\u0004\bM\u0010&R\u0017\u0010\n\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010H\u001a\u0004\bN\u0010&R\u0017\u0010\u000b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\u000b\u0010K\u001a\u0004\bO\u0010)R\u0019\u0010\f\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010H\u001a\u0004\bP\u0010&R\u0019\u0010\r\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010H\u001a\u0004\bQ\u0010&R\u0017\u0010\u000f\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010K\u001a\u0004\bR\u0010)R\u001d\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u00108\u0006¢\u0006\f\n\u0004\b\u0012\u0010S\u001a\u0004\bT\u00102R\u001c\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00130\u00108\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0014\u0010SR\u0011\u0010X\u001a\u00020U8F¢\u0006\u0006\u001a\u0004\bV\u0010WR\u0013\u0010Z\u001a\u0004\u0018\u00010\u00048F¢\u0006\u0006\u001a\u0004\bY\u0010&R\u0013\u0010\\\u001a\u0004\u0018\u00010\u00048F¢\u0006\u0006\u001a\u0004\b[\u0010&R\u0017\u0010^\u001a\b\u0012\u0004\u0012\u00020\u00130\u00108F¢\u0006\u0006\u001a\u0004\b]\u00102¨\u0006a"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "Lnova/branch/engage/sesame_lite/internal/stores/IdHashInMemoryEntity;", "Lnova/branch/engage/sesame_lite/internal/IdHash;", "idHash", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "groupId", "typeSpecificKey", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userSerial", "displayLabelPrefix", "displayLabel", "expirationOn", "customIconUri", "intentUri", "Lkotlin/ULong;", "typeSpecificFlags", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lnova/branch/engage/sesame_lite/internal/SearchAlias;", "aliases", "Lnova/branch/engage/sesame_lite/internal/SearchableLabel;", "searchableLabelsInternal", "<init>", "(Lnova/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/util/List;Ljava/util/List;)V", "(Lnova/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/util/List;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILnova/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Lkotlin/ULong;Ljava/util/List;Ljava/util/List;Lkotlinx/serialization/internal/SerializationConstructorMarker;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "copy-VIp7_1Y", "(Lnova/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/util/List;)Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "copy", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "migrateSearchableLabels", "()V", "component1", "()Lnova/branch/engage/sesame_lite/internal/IdHash;", "component2", "()Ljava/lang/String;", "component3", "component4", "()J", "component5", "component6", "component7", "component8", "component9", "component10-s-VKNKU", "component10", "component11", "()Ljava/util/List;", "copy-6tB2MSI", "(Lnova/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/util/List;Ljava/util/List;)Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "toString", "hashCode", "()I", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "equals", "(Ljava/lang/Object;)Z", "component12", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", "write$Self$sesame_lite_release", "(Lnova/branch/engage/sesame_lite/internal/LinkEntity;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "write$Self", "Lnova/branch/engage/sesame_lite/internal/IdHash;", "getIdHash", "Ljava/lang/String;", "getGroupId", "getTypeSpecificKey", "J", "getUserSerial", "getDisplayLabelPrefix", "getDisplayLabel", "getExpirationOn", "getCustomIconUri", "getIntentUri", "getTypeSpecificFlags-s-VKNKU", "Ljava/util/List;", "getAliases", "Lr80/d;", "getType", "()Lr80/d;", TTConst.TRACK_TYPE, "getPackageName", "packageName", "getIconUri", "iconUri", "getSearchableLabels", "searchableLabels", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "$serializer", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public final /* data */ class LinkEntity implements IdHashInMemoryEntity {

    @NotNull
    private final List<SearchAlias> aliases;

    @Nullable
    private final String customIconUri;

    @NotNull
    private final String displayLabel;

    @Nullable
    private final String displayLabelPrefix;
    private final long expirationOn;

    @NotNull
    private final String groupId;

    @NotNull
    private final IdHash idHash;

    @Nullable
    private final String intentUri;

    @NotNull
    private List<SearchableLabel> searchableLabelsInternal;
    private final long typeSpecificFlags;

    @NotNull
    private final String typeSpecificKey;
    private final long userSerial;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @JvmField
    @NotNull
    private static final KSerializer<Object>[] $childSerializers = {null, null, null, null, null, null, null, null, null, null, new ArrayListSerializer(SearchAlias$$serializer.INSTANCE), new ArrayListSerializer(SearchableLabel$$serializer.INSTANCE)};

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J,\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\u0010\u0007\u001a\u0004\u0018\u00010\b2\u0006\u0010\t\u001a\u00020\b2\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0005J\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r¨\u0006\u000f"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/LinkEntity$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "computeSearchableLabels", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lnova/branch/engage/sesame_lite/internal/SearchableLabel;", "displayLabelPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "displayLabel", "aliases", "Lnova/branch/engage/sesame_lite/internal/SearchAlias;", "serializer", "Lkotlinx/serialization/KSerializer;", "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final List<SearchableLabel> computeSearchableLabels(@Nullable String displayLabelPrefix, @NotNull String displayLabel, @NotNull List<SearchAlias> aliases) {
            Intrinsics.g(displayLabel, "displayLabel");
            Intrinsics.g(aliases, "aliases");
            if (displayLabelPrefix != null) {
                displayLabel = u4.m(displayLabelPrefix, ": ", displayLabel);
            }
            List<SearchableLabel> listCreateSearchableLabels = SearchableLabel.INSTANCE.createSearchableLabels(displayLabel, null);
            ArrayList arrayList = new ArrayList();
            for (SearchAlias searchAlias : aliases) {
                b70.d.z0(SearchableLabel.INSTANCE.createSearchableLabels(displayLabelPrefix != null ? u4.m(displayLabelPrefix, ": ", searchAlias.getMatchDisplay()) : searchAlias.getMatchDisplay(), displayLabelPrefix != null ? u4.m(displayLabelPrefix, ": ", searchAlias.getDisplayOverride()) : searchAlias.getDisplayOverride()), arrayList);
            }
            return b70.g.t1(arrayList, listCreateSearchableLabels);
        }

        @NotNull
        public final KSerializer<LinkEntity> serializer() {
            return LinkEntity$$serializer.INSTANCE;
        }

        private Companion() {
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[r80.d.values().length];
            try {
                r80.c cVar = r80.d.Companion;
                iArr[2] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                r80.c cVar2 = r80.d.Companion;
                iArr[0] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                r80.c cVar3 = r80.d.Companion;
                iArr[1] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public /* synthetic */ LinkEntity(int i5, IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, ULong uLong, List list, List list2, SerializationConstructorMarker serializationConstructorMarker, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, idHash, str, str2, j11, str3, str4, j12, str5, str6, uLong, list, list2, serializationConstructorMarker);
    }

    private final List<SearchableLabel> component12() {
        return this.searchableLabelsInternal;
    }

    @JvmStatic
    public static final void write$Self$sesame_lite_release(LinkEntity self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = $childSerializers;
        output.encodeSerializableElement(serialDesc, 0, IdHash$$serializer.INSTANCE, self.getIdHash());
        output.encodeStringElement(serialDesc, 1, self.groupId);
        output.encodeStringElement(serialDesc, 2, self.typeSpecificKey);
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.userSerial != -1) {
            output.encodeLongElement(serialDesc, 3, self.userSerial);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.displayLabelPrefix != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.displayLabelPrefix);
        }
        output.encodeStringElement(serialDesc, 5, self.displayLabel);
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.expirationOn != -1) {
            output.encodeLongElement(serialDesc, 6, self.expirationOn);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.customIconUri != null) {
            output.encodeNullableSerializableElement(serialDesc, 7, StringSerializer.INSTANCE, self.customIconUri);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.intentUri != null) {
            output.encodeNullableSerializableElement(serialDesc, 8, StringSerializer.INSTANCE, self.intentUri);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.typeSpecificFlags != 0) {
            output.encodeSerializableElement(serialDesc, 9, ULongSerializer.INSTANCE, new ULong(self.typeSpecificFlags));
        }
        if (output.shouldEncodeElementDefault(serialDesc, 10) || !Intrinsics.b(self.aliases, EmptyList.f71733a)) {
            output.encodeSerializableElement(serialDesc, 10, kSerializerArr[10], self.aliases);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 11) && Intrinsics.b(self.searchableLabelsInternal, EmptyList.f71733a)) {
            return;
        }
        output.encodeSerializableElement(serialDesc, 11, kSerializerArr[11], self.searchableLabelsInternal);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final IdHash getIdHash() {
        return this.idHash;
    }

    /* renamed from: component10-s-VKNKU, reason: not valid java name and from getter */
    public final long getTypeSpecificFlags() {
        return this.typeSpecificFlags;
    }

    @NotNull
    public final List<SearchAlias> component11() {
        return this.aliases;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getGroupId() {
        return this.groupId;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getTypeSpecificKey() {
        return this.typeSpecificKey;
    }

    /* renamed from: component4, reason: from getter */
    public final long getUserSerial() {
        return this.userSerial;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getDisplayLabelPrefix() {
        return this.displayLabelPrefix;
    }

    @NotNull
    /* renamed from: component6, reason: from getter */
    public final String getDisplayLabel() {
        return this.displayLabel;
    }

    /* renamed from: component7, reason: from getter */
    public final long getExpirationOn() {
        return this.expirationOn;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final String getCustomIconUri() {
        return this.customIconUri;
    }

    @Nullable
    /* renamed from: component9, reason: from getter */
    public final String getIntentUri() {
        return this.intentUri;
    }

    @NotNull
    /* renamed from: copy-6tB2MSI, reason: not valid java name */
    public final LinkEntity m453copy6tB2MSI(@NotNull IdHash idHash, @NotNull String groupId, @NotNull String typeSpecificKey, long userSerial, @Nullable String displayLabelPrefix, @NotNull String displayLabel, long expirationOn, @Nullable String customIconUri, @Nullable String intentUri, long typeSpecificFlags, @NotNull List<SearchAlias> aliases, @NotNull List<SearchableLabel> searchableLabelsInternal) {
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(typeSpecificKey, "typeSpecificKey");
        Intrinsics.g(displayLabel, "displayLabel");
        Intrinsics.g(aliases, "aliases");
        Intrinsics.g(searchableLabelsInternal, "searchableLabelsInternal");
        return new LinkEntity(idHash, groupId, typeSpecificKey, userSerial, displayLabelPrefix, displayLabel, expirationOn, customIconUri, intentUri, typeSpecificFlags, aliases, searchableLabelsInternal);
    }

    @NotNull
    /* renamed from: copy-VIp7_1Y, reason: not valid java name */
    public final LinkEntity m454copyVIp7_1Y(@NotNull IdHash idHash, @NotNull String groupId, @NotNull String typeSpecificKey, long userSerial, @Nullable String displayLabelPrefix, @NotNull String displayLabel, long expirationOn, @Nullable String customIconUri, @Nullable String intentUri, long typeSpecificFlags, @NotNull List<SearchAlias> aliases) {
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(typeSpecificKey, "typeSpecificKey");
        Intrinsics.g(displayLabel, "displayLabel");
        Intrinsics.g(aliases, "aliases");
        return new LinkEntity(idHash, groupId, typeSpecificKey, userSerial, displayLabelPrefix, displayLabel, expirationOn, customIconUri, intentUri, typeSpecificFlags, aliases, (DefaultConstructorMarker) null);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LinkEntity)) {
            return false;
        }
        LinkEntity linkEntity = (LinkEntity) other;
        return Intrinsics.b(this.idHash, linkEntity.idHash) && Intrinsics.b(this.groupId, linkEntity.groupId) && Intrinsics.b(this.typeSpecificKey, linkEntity.typeSpecificKey) && this.userSerial == linkEntity.userSerial && Intrinsics.b(this.displayLabelPrefix, linkEntity.displayLabelPrefix) && Intrinsics.b(this.displayLabel, linkEntity.displayLabel) && this.expirationOn == linkEntity.expirationOn && Intrinsics.b(this.customIconUri, linkEntity.customIconUri) && Intrinsics.b(this.intentUri, linkEntity.intentUri) && this.typeSpecificFlags == linkEntity.typeSpecificFlags && Intrinsics.b(this.aliases, linkEntity.aliases) && Intrinsics.b(this.searchableLabelsInternal, linkEntity.searchableLabelsInternal);
    }

    @NotNull
    public final List<SearchAlias> getAliases() {
        return this.aliases;
    }

    @Nullable
    public final String getCustomIconUri() {
        return this.customIconUri;
    }

    @NotNull
    public final String getDisplayLabel() {
        return this.displayLabel;
    }

    @Nullable
    public final String getDisplayLabelPrefix() {
        return this.displayLabelPrefix;
    }

    public final long getExpirationOn() {
        return this.expirationOn;
    }

    @NotNull
    public final String getGroupId() {
        return this.groupId;
    }

    @Nullable
    public final String getIconUri() {
        String str = this.customIconUri;
        if (str != null) {
            return str;
        }
        int i5 = WhenMappings.$EnumSwitchMapping$0[getIdHash().getType().ordinal()];
        if (i5 == 1 || i5 == 2) {
            Uri.Builder builderScheme = new Uri.Builder().scheme("appIcon");
            String packageName = getPackageName();
            Intrinsics.d(packageName);
            return builderScheme.authority(new ComponentName(packageName, this.typeSpecificKey).flattenToShortString()).fragment(String.valueOf(this.userSerial)).build().toString();
        }
        if (i5 != 3) {
            return this.customIconUri;
        }
        Uri.Builder builderScheme2 = new Uri.Builder().scheme("deepShortcutIcon");
        String packageName2 = getPackageName();
        Intrinsics.d(packageName2);
        return builderScheme2.encodedOpaquePart(new ComponentName(packageName2, this.typeSpecificKey).flattenToShortString()).encodedFragment(String.valueOf(this.userSerial)).build().toString();
    }

    @Override // nova.branch.engage.sesame_lite.internal.stores.IdHashInMemoryEntity
    @NotNull
    public IdHash getIdHash() {
        return this.idHash;
    }

    @Nullable
    public final String getIntentUri() {
        return this.intentUri;
    }

    @Nullable
    public final String getPackageName() {
        if (getIdHash().getType().a()) {
            return this.groupId;
        }
        return null;
    }

    @NotNull
    public final List<SearchableLabel> getSearchableLabels() {
        return this.searchableLabelsInternal;
    }

    @NotNull
    public final r80.d getType() {
        return getIdHash().getType();
    }

    /* renamed from: getTypeSpecificFlags-s-VKNKU, reason: not valid java name */
    public final long m455getTypeSpecificFlagssVKNKU() {
        return this.typeSpecificFlags;
    }

    @NotNull
    public final String getTypeSpecificKey() {
        return this.typeSpecificKey;
    }

    public final long getUserSerial() {
        return this.userSerial;
    }

    public int hashCode() {
        int iD = c0.d(io.branch.engage.sesame_lite.internal.a.a(this.typeSpecificKey, io.branch.engage.sesame_lite.internal.a.a(this.groupId, this.idHash.hashCode() * 31, 31), 31), 31, this.userSerial);
        String str = this.displayLabelPrefix;
        int iD2 = c0.d(io.branch.engage.sesame_lite.internal.a.a(this.displayLabel, (iD + (str == null ? 0 : str.hashCode())) * 31, 31), 31, this.expirationOn);
        String str2 = this.customIconUri;
        int iHashCode = (iD2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.intentUri;
        int iHashCode2 = str3 != null ? str3.hashCode() : 0;
        long j11 = this.typeSpecificFlags;
        ULong.Companion companion = ULong.f71699b;
        return this.searchableLabelsInternal.hashCode() + u4.c(c0.d((iHashCode + iHashCode2) * 31, 31, j11), 31, this.aliases);
    }

    public final void migrateSearchableLabels() {
        this.searchableLabelsInternal = INSTANCE.computeSearchableLabels(this.displayLabelPrefix, this.displayLabel, this.aliases);
    }

    @NotNull
    public String toString() {
        IdHash idHash = this.idHash;
        String str = this.groupId;
        String str2 = this.typeSpecificKey;
        long j11 = this.userSerial;
        String str3 = this.displayLabelPrefix;
        String str4 = this.displayLabel;
        long j12 = this.expirationOn;
        String str5 = this.customIconUri;
        String str6 = this.intentUri;
        long j13 = this.typeSpecificFlags;
        ULong.Companion companion = ULong.f71699b;
        String strC = UnsignedKt.c(10, j13);
        List<SearchAlias> list = this.aliases;
        List<SearchableLabel> list2 = this.searchableLabelsInternal;
        StringBuilder sb2 = new StringBuilder("LinkEntity(idHash=");
        sb2.append(idHash);
        sb2.append(", groupId=");
        sb2.append(str);
        sb2.append(", typeSpecificKey=");
        sb2.append(str2);
        sb2.append(", userSerial=");
        sb2.append(j11);
        c0.D(sb2, ", displayLabelPrefix=", str3, ", displayLabel=", str4);
        c0.B(sb2, ", expirationOn=", j12, ", customIconUri=");
        c0.D(sb2, str5, ", intentUri=", str6, ", typeSpecificFlags=");
        sb2.append(strC);
        sb2.append(", aliases=");
        sb2.append(list);
        sb2.append(", searchableLabelsInternal=");
        return a80.m.j(sb2, list2, ")");
    }

    public /* synthetic */ LinkEntity(IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, long j13, List list, DefaultConstructorMarker defaultConstructorMarker) {
        this(idHash, str, str2, j11, str3, str4, j12, str5, str6, j13, list);
    }

    @Override // nova.branch.engage.sesame_lite.internal.stores.InMemoryEntity
    @NotNull
    public IdHash getDbId() {
        return IdHashInMemoryEntity.DefaultImpls.getDbId(this);
    }

    private LinkEntity(int i5, IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, ULong uLong, List list, List list2, SerializationConstructorMarker serializationConstructorMarker) {
        if (39 != (i5 & 39)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 39, LinkEntity$$serializer.INSTANCE.getDescriptor());
        }
        this.idHash = idHash;
        this.groupId = str;
        this.typeSpecificKey = str2;
        if ((i5 & 8) == 0) {
            this.userSerial = -1L;
        } else {
            this.userSerial = j11;
        }
        if ((i5 & 16) == 0) {
            this.displayLabelPrefix = null;
        } else {
            this.displayLabelPrefix = str3;
        }
        this.displayLabel = str4;
        if ((i5 & 64) == 0) {
            this.expirationOn = -1L;
        } else {
            this.expirationOn = j12;
        }
        if ((i5 & 128) == 0) {
            this.customIconUri = null;
        } else {
            this.customIconUri = str5;
        }
        if ((i5 & 256) == 0) {
            this.intentUri = null;
        } else {
            this.intentUri = str6;
        }
        this.typeSpecificFlags = (i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0 ? 0L : uLong.f71700a;
        this.aliases = (i5 & 1024) == 0 ? EmptyList.f71733a : list;
        this.searchableLabelsInternal = (i5 & 2048) == 0 ? EmptyList.f71733a : list2;
    }

    private LinkEntity(IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, long j13, List<SearchAlias> list, List<SearchableLabel> list2) {
        this.idHash = idHash;
        this.groupId = str;
        this.typeSpecificKey = str2;
        this.userSerial = j11;
        this.displayLabelPrefix = str3;
        this.displayLabel = str4;
        this.expirationOn = j12;
        this.customIconUri = str5;
        this.intentUri = str6;
        this.typeSpecificFlags = j13;
        this.aliases = list;
        this.searchableLabelsInternal = list2;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    private LinkEntity(IdHash idHash, String groupId, String typeSpecificKey, long j11, String str, String displayLabel, long j12, String str2, String str3, long j13, List<SearchAlias> aliases) {
        this(idHash, groupId, typeSpecificKey, j11, str, displayLabel, j12, str2, str3, j13, aliases, INSTANCE.computeSearchableLabels(str, displayLabel, aliases));
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(typeSpecificKey, "typeSpecificKey");
        Intrinsics.g(displayLabel, "displayLabel");
        Intrinsics.g(aliases, "aliases");
    }

    public LinkEntity(IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, long j13, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(idHash, str, str2, (i5 & 8) != 0 ? -1L : j11, (i5 & 16) != 0 ? null : str3, str4, (i5 & 64) != 0 ? -1L : j12, (i5 & 128) != 0 ? null : str5, (i5 & 256) != 0 ? null : str6, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? 0L : j13, (i5 & 1024) != 0 ? EmptyList.f71733a : list, (DefaultConstructorMarker) null);
    }

    public LinkEntity(IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, long j13, List list, List list2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(idHash, str, str2, (i5 & 8) != 0 ? -1L : j11, (i5 & 16) != 0 ? null : str3, str4, (i5 & 64) != 0 ? -1L : j12, (i5 & 128) != 0 ? null : str5, (i5 & 256) != 0 ? null : str6, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? 0L : j13, (List<SearchAlias>) ((i5 & 1024) != 0 ? EmptyList.f71733a : list), (List<SearchableLabel>) ((i5 & 2048) != 0 ? EmptyList.f71733a : list2));
    }
}
