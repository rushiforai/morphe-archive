package io.branch.engage.sesame_lite.internal;

import android.content.ComponentName;
import android.net.Uri;
import b.c0;
import b.u4;
import b70.g;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.util.TTConst;
import io.branch.engage.sesame_lite.internal.stores.IdHashInMemoryEntity;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.Transient;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.internal.ULongSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\n\b\u0087\b\u0018\u0000 Y2\u00020\u0001:\u0002ZYB|\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\n\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0007\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0004\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e\u0012\u000e\b\u0002\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0014B\u008e\u0001\b\u0017\u0012\u0006\u0010\u0016\u001a\u00020\u0015\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u000b\u001a\u00020\u0007\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\u000e\u0010\u0012\u001a\n\u0012\u0004\u0012\u00020\u0011\u0018\u00010\u0010\u0012\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001dJ\u0010\u0010\u001f\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0012\u0010!\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b!\u0010\u001dJ\u0010\u0010\"\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\"\u0010\u001dJ\u0010\u0010#\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b#\u0010 J\u0012\u0010$\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b$\u0010\u001dJ\u0012\u0010%\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b%\u0010\u001dJ\u0019\u0010'\u001a\u00020\u000eHÆ\u0003ø\u0001\u0001ø\u0001\u0002ø\u0001\u0000¢\u0006\u0004\b&\u0010 J\u0016\u0010(\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010HÆ\u0003¢\u0006\u0004\b(\u0010)J\u0090\u0001\u0010,\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00042\b\b\u0002\u0010\b\u001a\u00020\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\n\u001a\u00020\u00042\b\b\u0002\u0010\u000b\u001a\u00020\u00072\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\u000e\b\u0002\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010HÆ\u0001ø\u0001\u0002ø\u0001\u0000¢\u0006\u0004\b*\u0010+J\u0010\u0010-\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b-\u0010\u001dJ\u0010\u0010.\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b.\u0010/J\u001a\u00103\u001a\u0002022\b\u00101\u001a\u0004\u0018\u000100HÖ\u0003¢\u0006\u0004\b3\u00104J(\u0010;\u001a\u00020:2\u0006\u00105\u001a\u00020\u00002\u0006\u00107\u001a\u0002062\u0006\u00109\u001a\u000208HÇ\u0001¢\u0006\u0004\b;\u0010<R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010=\u001a\u0004\b>\u0010\u001bR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010?\u001a\u0004\b@\u0010\u001dR\u0017\u0010\u0006\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010?\u001a\u0004\bA\u0010\u001dR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010B\u001a\u0004\bC\u0010 R\u0019\u0010\t\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010?\u001a\u0004\bD\u0010\u001dR\u0017\u0010\n\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010?\u001a\u0004\bE\u0010\u001dR\u0017\u0010\u000b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\u000b\u0010B\u001a\u0004\bF\u0010 R\u0019\u0010\f\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010?\u001a\u0004\bG\u0010\u001dR\u0019\u0010\r\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010?\u001a\u0004\bH\u0010\u001dR \u0010\u000f\u001a\u00020\u000e8\u0006ø\u0001\u0000ø\u0001\u0002ø\u0001\u0001¢\u0006\f\n\u0004\b\u000f\u0010B\u001a\u0004\bI\u0010 R\u001d\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u00108\u0006¢\u0006\f\n\u0004\b\u0012\u0010J\u001a\u0004\bK\u0010)R&\u0010M\u001a\b\u0012\u0004\u0012\u00020L0\u00108\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\bM\u0010J\u0012\u0004\bO\u0010P\u001a\u0004\bN\u0010)R\u0011\u0010T\u001a\u00020Q8F¢\u0006\u0006\u001a\u0004\bR\u0010SR\u0013\u0010V\u001a\u0004\u0018\u00010\u00048F¢\u0006\u0006\u001a\u0004\bU\u0010\u001dR\u0013\u0010X\u001a\u0004\u0018\u00010\u00048F¢\u0006\u0006\u001a\u0004\bW\u0010\u001d\u0082\u0002\u000f\n\u0002\b\u0019\n\u0002\b!\n\u0005\b¡\u001e0\u0001¨\u0006["}, d2 = {"Lio/branch/engage/sesame_lite/internal/LinkEntity;", "Lio/branch/engage/sesame_lite/internal/stores/IdHashInMemoryEntity;", "Lio/branch/engage/sesame_lite/internal/IdHash;", "idHash", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "groupId", "typeSpecificKey", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userSerial", "displayLabelPrefix", "displayLabel", "expirationOn", "customIconUri", "intentUri", "Lkotlin/ULong;", "typeSpecificFlags", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/branch/engage/sesame_lite/internal/SearchAlias;", "aliases", "<init>", "(Lio/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/util/List;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen1", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILio/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Lkotlin/ULong;Ljava/util/List;Lkotlinx/serialization/internal/SerializationConstructorMarker;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "component1", "()Lio/branch/engage/sesame_lite/internal/IdHash;", "component2", "()Ljava/lang/String;", "component3", "component4", "()J", "component5", "component6", "component7", "component8", "component9", "component10-s-VKNKU", "component10", "component11", "()Ljava/util/List;", "copy-VIp7_1Y", "(Lio/branch/engage/sesame_lite/internal/IdHash;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/util/List;)Lio/branch/engage/sesame_lite/internal/LinkEntity;", "copy", "toString", "hashCode", "()I", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "equals", "(Ljava/lang/Object;)Z", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "write$Self", "(Lio/branch/engage/sesame_lite/internal/LinkEntity;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "Lio/branch/engage/sesame_lite/internal/IdHash;", "getIdHash", "Ljava/lang/String;", "getGroupId", "getTypeSpecificKey", "J", "getUserSerial", "getDisplayLabelPrefix", "getDisplayLabel", "getExpirationOn", "getCustomIconUri", "getIntentUri", "getTypeSpecificFlags-s-VKNKU", "Ljava/util/List;", "getAliases", "Lio/branch/engage/sesame_lite/internal/SearchableLabel;", "searchableLabels", "getSearchableLabels", "getSearchableLabels$annotations", "()V", "Lu40/a;", "getType", "()Lu40/a;", TTConst.TRACK_TYPE, "getPackageName", "packageName", "getIconUri", "iconUri", k.O, "$serializer", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class LinkEntity implements IdHashInMemoryEntity {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

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
    private final List<SearchableLabel> searchableLabels;
    private final long typeSpecificFlags;

    @NotNull
    private final String typeSpecificKey;
    private final long userSerial;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/engage/sesame_lite/internal/LinkEntity$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/engage/sesame_lite/internal/LinkEntity;", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<LinkEntity> serializer() {
            return LinkEntity$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    @Metadata(k = 3, mv = {1, 7, 1}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[u40.a.values().length];
            EnumSet enumSet = u40.a.f90552a;
            iArr[2] = 1;
            EnumSet enumSet2 = u40.a.f90552a;
            iArr[0] = 2;
            EnumSet enumSet3 = u40.a.f90552a;
            iArr[1] = 3;
            $EnumSwitchMapping$0 = iArr;
        }
    }

    @Deprecated
    public /* synthetic */ LinkEntity(int i5, IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, ULong uLong, List list, SerializationConstructorMarker serializationConstructorMarker, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, idHash, str, str2, j11, str3, str4, j12, str5, str6, uLong, (List<SearchAlias>) list, serializationConstructorMarker);
    }

    @Transient
    public static /* synthetic */ void getSearchableLabels$annotations() {
    }

    @JvmStatic
    public static final void write$Self(@NotNull LinkEntity self, @NotNull CompositeEncoder output, @NotNull SerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
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
        if (!output.shouldEncodeElementDefault(serialDesc, 10) && Intrinsics.b(self.aliases, EmptyList.f71733a)) {
            return;
        }
        output.encodeSerializableElement(serialDesc, 10, new ArrayListSerializer(SearchAlias$$serializer.INSTANCE), self.aliases);
    }

    @NotNull
    public final IdHash component1() {
        return getIdHash();
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
    /* renamed from: copy-VIp7_1Y, reason: not valid java name */
    public final LinkEntity m324copyVIp7_1Y(@NotNull IdHash idHash, @NotNull String groupId, @NotNull String typeSpecificKey, long userSerial, @Nullable String displayLabelPrefix, @NotNull String displayLabel, long expirationOn, @Nullable String customIconUri, @Nullable String intentUri, long typeSpecificFlags, @NotNull List<SearchAlias> aliases) {
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(typeSpecificKey, "typeSpecificKey");
        Intrinsics.g(displayLabel, "displayLabel");
        Intrinsics.g(aliases, "aliases");
        return new LinkEntity(idHash, groupId, typeSpecificKey, userSerial, displayLabelPrefix, displayLabel, expirationOn, customIconUri, intentUri, typeSpecificFlags, aliases, null);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LinkEntity)) {
            return false;
        }
        LinkEntity linkEntity = (LinkEntity) other;
        return Intrinsics.b(getIdHash(), linkEntity.getIdHash()) && Intrinsics.b(this.groupId, linkEntity.groupId) && Intrinsics.b(this.typeSpecificKey, linkEntity.typeSpecificKey) && this.userSerial == linkEntity.userSerial && Intrinsics.b(this.displayLabelPrefix, linkEntity.displayLabelPrefix) && Intrinsics.b(this.displayLabel, linkEntity.displayLabel) && this.expirationOn == linkEntity.expirationOn && Intrinsics.b(this.customIconUri, linkEntity.customIconUri) && Intrinsics.b(this.intentUri, linkEntity.intentUri) && this.typeSpecificFlags == linkEntity.typeSpecificFlags && Intrinsics.b(this.aliases, linkEntity.aliases);
    }

    @NotNull
    public final List<SearchAlias> getAliases() {
        return this.aliases;
    }

    @Nullable
    public final String getCustomIconUri() {
        return this.customIconUri;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // io.branch.engage.sesame_lite.internal.stores.InMemoryEntity
    @NotNull
    public IdHash getDbId() {
        return IdHashInMemoryEntity.DefaultImpls.getDbId(this);
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

    @Override // io.branch.engage.sesame_lite.internal.stores.IdHashInMemoryEntity
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
        int iOrdinal = getIdHash().getType().ordinal();
        if (iOrdinal == 0 || iOrdinal == 1 || iOrdinal == 2 || iOrdinal == 3 || iOrdinal == 4 || iOrdinal == 6) {
            return this.groupId;
        }
        return null;
    }

    @NotNull
    public final List<SearchableLabel> getSearchableLabels() {
        return this.searchableLabels;
    }

    @NotNull
    public final u40.a getType() {
        return getIdHash().getType();
    }

    /* renamed from: getTypeSpecificFlags-s-VKNKU, reason: not valid java name */
    public final long m325getTypeSpecificFlagssVKNKU() {
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
        int iD = c0.d(c0.e(c0.e(getIdHash().hashCode() * 31, 31, this.groupId), 31, this.typeSpecificKey), 31, this.userSerial);
        String str = this.displayLabelPrefix;
        int iD2 = c0.d(c0.e((iD + (str == null ? 0 : str.hashCode())) * 31, 31, this.displayLabel), 31, this.expirationOn);
        String str2 = this.customIconUri;
        int iHashCode = (iD2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.intentUri;
        int iHashCode2 = str3 != null ? str3.hashCode() : 0;
        long j11 = this.typeSpecificFlags;
        ULong.Companion companion = ULong.f71699b;
        return this.aliases.hashCode() + c0.d((iHashCode + iHashCode2) * 31, 31, j11);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("LinkEntity(idHash=");
        sb2.append(getIdHash());
        sb2.append(", groupId=");
        sb2.append(this.groupId);
        sb2.append(", typeSpecificKey=");
        sb2.append(this.typeSpecificKey);
        sb2.append(", userSerial=");
        sb2.append(this.userSerial);
        sb2.append(", displayLabelPrefix=");
        sb2.append(this.displayLabelPrefix);
        sb2.append(", displayLabel=");
        sb2.append(this.displayLabel);
        sb2.append(", expirationOn=");
        sb2.append(this.expirationOn);
        sb2.append(", customIconUri=");
        sb2.append(this.customIconUri);
        sb2.append(", intentUri=");
        sb2.append(this.intentUri);
        sb2.append(", typeSpecificFlags=");
        long j11 = this.typeSpecificFlags;
        ULong.Companion companion = ULong.f71699b;
        sb2.append((Object) UnsignedKt.c(10, j11));
        sb2.append(", aliases=");
        return fq.c.e(sb2, this.aliases, ')');
    }

    public /* synthetic */ LinkEntity(IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, long j13, List list, DefaultConstructorMarker defaultConstructorMarker) {
        this(idHash, str, str2, j11, str3, str4, j12, str5, str6, j13, list);
    }

    private LinkEntity(int i5, IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, ULong uLong, List<SearchAlias> list, SerializationConstructorMarker serializationConstructorMarker) {
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
        List<SearchableLabel> listCreateSearchableLabels = SearchableLabel.INSTANCE.createSearchableLabels(this.displayLabelPrefix != null ? c0.r(new StringBuilder(), this.displayLabelPrefix, ": ", str4) : str4, null);
        List<SearchAlias> list2 = this.aliases;
        ArrayList arrayList = new ArrayList();
        for (SearchAlias searchAlias : list2) {
            b70.d.z0(SearchableLabel.INSTANCE.createSearchableLabels(this.displayLabelPrefix != null ? this.displayLabelPrefix + ": " + searchAlias.getMatchDisplay() : searchAlias.getMatchDisplay(), this.displayLabelPrefix != null ? this.displayLabelPrefix + ": " + searchAlias.getDisplayOverride() : searchAlias.getDisplayOverride()), arrayList);
        }
        this.searchableLabels = g.t1(arrayList, listCreateSearchableLabels);
    }

    public LinkEntity(IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, long j13, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(idHash, str, str2, (i5 & 8) != 0 ? -1L : j11, (i5 & 16) != 0 ? null : str3, str4, (i5 & 64) != 0 ? -1L : j12, (i5 & 128) != 0 ? null : str5, (i5 & 256) != 0 ? null : str6, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? 0L : j13, (i5 & 1024) != 0 ? EmptyList.f71733a : list, null);
    }

    private LinkEntity(IdHash idHash, String str, String str2, long j11, String str3, String str4, long j12, String str5, String str6, long j13, List<SearchAlias> list) {
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
        List<SearchableLabel> listCreateSearchableLabels = SearchableLabel.INSTANCE.createSearchableLabels(str3 != null ? u4.m(str3, ": ", str4) : str4, null);
        ArrayList arrayList = new ArrayList();
        for (SearchAlias searchAlias : list) {
            b70.d.z0(SearchableLabel.INSTANCE.createSearchableLabels(this.displayLabelPrefix != null ? this.displayLabelPrefix + ": " + searchAlias.getMatchDisplay() : searchAlias.getMatchDisplay(), this.displayLabelPrefix != null ? this.displayLabelPrefix + ": " + searchAlias.getDisplayOverride() : searchAlias.getDisplayOverride()), arrayList);
        }
        this.searchableLabels = g.t1(arrayList, listCreateSearchableLabels);
    }
}
