package io.branch.engage.sesame_lite.internal;

import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.util.TTConst;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.UStringsKt;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.ULongSerializer;
import kotlinx.serialization.internal.UShortSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\b\b\u0007\u0018\u0000 /2\u00020\u0001:\u00020/B\"\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004ø\u0001\u0000¢\u0006\u0004\b\u0007\u0010\bB<\b\u0017\u0012\u0006\u0010\n\u001a\u00020\t\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u000bø\u0001\u0000¢\u0006\u0004\b\u0007\u0010\rJ(\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011HÇ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001b\u0010\u001a\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u0016ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u001a\u0010 \u001a\u00020\u001f2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001H\u0096\u0002¢\u0006\u0004\b \u0010!J\u000f\u0010\"\u001a\u00020\tH\u0016¢\u0006\u0004\b\"\u0010#R\u001d\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004ø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\u0006\n\u0004\b\u0003\u0010$R \u0010\u0005\u001a\u00020\u00048\u0006ø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\f\n\u0004\b\u0005\u0010%\u001a\u0004\b&\u0010'R \u0010\u0006\u001a\u00020\u00048\u0006ø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\f\n\u0004\b\u0006\u0010%\u001a\u0004\b(\u0010'R\u0011\u0010,\u001a\u00020)8F¢\u0006\u0006\u001a\u0004\b*\u0010+R\u001a\u0010\u0017\u001a\u00020\u00168Fø\u0001\u0000ø\u0001\u0001ø\u0001\u0002¢\u0006\u0006\u001a\u0004\b-\u0010.\u0082\u0002\u000f\n\u0002\b\u0019\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u00061"}, d2 = {"Lio/branch/engage/sesame_lite/internal/IdHash;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/UShort;", "typeData", "Lkotlin/ULong;", "hash128_a", "hash128_b", "<init>", "(SJJLkotlin/jvm/internal/DefaultConstructorMarker;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen1", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILkotlin/UShort;Lkotlin/ULong;Lkotlin/ULong;Lkotlinx/serialization/internal/SerializationConstructorMarker;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "write$Self", "(Lio/branch/engage/sesame_lite/internal/IdHash;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "Lkotlin/UByte;", "subtype", "copyWithSubtype-7apg3OU", "(B)Lio/branch/engage/sesame_lite/internal/IdHash;", "copyWithSubtype", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "S", "J", "getHash128_a-s-VKNKU", "()J", "getHash128_b-s-VKNKU", "Lu40/a;", "getType", "()Lu40/a;", TTConst.TRACK_TYPE, "getSubtype-w2LRezQ", "()B", k.O, "$serializer", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final class IdHash {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long hash128_a;
    private final long hash128_b;
    private final short typeData;

    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J=\u0010\u0010\u001a\u00020\r2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\b\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t2\b\b\u0002\u0010\f\u001a\u00020\u000bø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ%\u0010\u0013\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0013\u0010\u0014J%\u0010\u0016\u001a\u00020\r2\u0006\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0016\u0010\u0014J\u0017\u0010\u0018\u001a\u0004\u0018\u00010\r2\u0006\u0010\u0017\u001a\u00020\u0006¢\u0006\u0004\b\u0018\u0010\u0019J\u0016\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\r0\u001aHÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001c\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b\u0019¨\u0006\u001d"}, d2 = {"Lio/branch/engage/sesame_lite/internal/IdHash$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Lu40/a;", TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "groupId", DatabaseConstants.KEY_FIELD, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userSerial", "Lkotlin/UByte;", "subtype", "Lio/branch/engage/sesame_lite/internal/IdHash;", "of-KY3lZgs", "(Lu40/a;Ljava/lang/String;Ljava/lang/String;JB)Lio/branch/engage/sesame_lite/internal/IdHash;", "of", "shortcutId", "packageName", "ofShortcut", "(Ljava/lang/String;Ljava/lang/String;J)Lio/branch/engage/sesame_lite/internal/IdHash;", "className", "ofAppComponent", "str", "fromEncodedString", "(Ljava/lang/String;)Lio/branch/engage/sesame_lite/internal/IdHash;", "Lkotlinx/serialization/KSerializer;", "serializer", "()Lkotlinx/serialization/KSerializer;", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        /* renamed from: of-KY3lZgs$default, reason: not valid java name */
        public static /* synthetic */ IdHash m320ofKY3lZgs$default(Companion companion, u40.a aVar, String str, String str2, long j11, byte b11, int i5, Object obj) {
            if ((i5 & 16) != 0) {
                b11 = 0;
            }
            return companion.m321ofKY3lZgs(aVar, str, str2, j11, b11);
        }

        @Nullable
        public final IdHash fromEncodedString(@NotNull String str) {
            Intrinsics.g(str, "str");
            try {
                int iS0 = r70.k.S0(str, ":", 0, false, 6);
                String strSubstring = str.substring(0, iS0);
                Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
                short sE = UStringsKt.e(strSubstring);
                int i5 = iS0 + 17;
                String strSubstring2 = str.substring(iS0 + 1, i5);
                Intrinsics.f(strSubstring2, "this as java.lang.String…ing(startIndex, endIndex)");
                long jC = UStringsKt.c(strSubstring2);
                String strSubstring3 = str.substring(i5, iS0 + 33);
                Intrinsics.f(strSubstring3, "this as java.lang.String…ing(startIndex, endIndex)");
                return new IdHash(sE, jC, UStringsKt.c(strSubstring3), null);
            } catch (Exception unused) {
                return null;
            }
        }

        @NotNull
        /* renamed from: of-KY3lZgs, reason: not valid java name */
        public final IdHash m321ofKY3lZgs(@NotNull u40.a type, @NotNull String groupId, @NotNull String key, long userSerial, byte subtype) {
            Intrinsics.g(type, "type");
            Intrinsics.g(groupId, "groupId");
            Intrinsics.g(key, "key");
            String str = groupId + '/' + key + '#' + userSerial;
            Charset UTF_8 = StandardCharsets.UTF_8;
            Intrinsics.f(UTF_8, "UTF_8");
            byte[] bytes = str.getBytes(UTF_8);
            Intrinsics.f(bytes, "this as java.lang.String).getBytes(charset)");
            long[] jArr = {0, 0};
            MurmurHash3.murmurhash3_x64_128(bytes, 0, bytes.length, 0, jArr);
            short sOrdinal = (short) (type.ordinal() << 8);
            UShort.Companion companion = UShort.f71703b;
            short s11 = (short) (sOrdinal | ((short) (subtype & 255)));
            long j11 = jArr[0];
            ULong.Companion companion2 = ULong.f71699b;
            return new IdHash(s11, j11, jArr[1], null);
        }

        @NotNull
        public final IdHash ofAppComponent(@NotNull String packageName, @NotNull String className, long userSerial) {
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(className, "className");
            return m320ofKY3lZgs$default(this, u40.a.f90553b, packageName, className, userSerial, (byte) 0, 16, null);
        }

        @NotNull
        public final IdHash ofShortcut(@NotNull String shortcutId, @NotNull String packageName, long userSerial) {
            Intrinsics.g(shortcutId, "shortcutId");
            Intrinsics.g(packageName, "packageName");
            return m320ofKY3lZgs$default(this, u40.a.f90554c, packageName, shortcutId, userSerial, (byte) 0, 16, null);
        }

        @NotNull
        public final KSerializer<IdHash> serializer() {
            return IdHash$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    @Deprecated
    public /* synthetic */ IdHash(int i5, UShort uShort, ULong uLong, ULong uLong2, SerializationConstructorMarker serializationConstructorMarker, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, uShort, uLong, uLong2, serializationConstructorMarker);
    }

    @JvmStatic
    public static final void write$Self(@NotNull IdHash self, @NotNull CompositeEncoder output, @NotNull SerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeSerializableElement(serialDesc, 0, UShortSerializer.INSTANCE, new UShort(self.typeData));
        ULongSerializer uLongSerializer = ULongSerializer.INSTANCE;
        output.encodeSerializableElement(serialDesc, 1, uLongSerializer, new ULong(self.hash128_a));
        output.encodeSerializableElement(serialDesc, 2, uLongSerializer, new ULong(self.hash128_b));
    }

    @NotNull
    /* renamed from: copyWithSubtype-7apg3OU, reason: not valid java name */
    public final IdHash m316copyWithSubtype7apg3OU(byte subtype) {
        short s11 = (short) (this.typeData & (-256));
        UShort.Companion companion = UShort.f71703b;
        return new IdHash((short) (((short) (subtype & 255)) | s11), this.hash128_a, this.hash128_b, null);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof IdHash)) {
            return false;
        }
        IdHash idHash = (IdHash) other;
        return this.typeData == idHash.typeData && this.hash128_a == idHash.hash128_a && this.hash128_b == idHash.hash128_b;
    }

    /* renamed from: getHash128_a-s-VKNKU, reason: not valid java name and from getter */
    public final long getHash128_a() {
        return this.hash128_a;
    }

    /* renamed from: getHash128_b-s-VKNKU, reason: not valid java name and from getter */
    public final long getHash128_b() {
        return this.hash128_b;
    }

    /* renamed from: getSubtype-w2LRezQ, reason: not valid java name */
    public final byte m319getSubtypew2LRezQ() {
        return UtilsKt.m336getLoBytexj2QHRw(this.typeData);
    }

    @NotNull
    public final u40.a getType() {
        return u40.a.values()[UtilsKt.m334getHiBytexj2QHRw(this.typeData) & 255];
    }

    public int hashCode() {
        return (int) this.hash128_b;
    }

    @NotNull
    public String toString() {
        return String.format("%04x:%016x%016x", Arrays.copyOf(new Object[]{Integer.valueOf(this.typeData & 65535), Long.valueOf(this.hash128_a), Long.valueOf(this.hash128_b)}, 3));
    }

    public /* synthetic */ IdHash(short s11, long j11, long j12, DefaultConstructorMarker defaultConstructorMarker) {
        this(s11, j11, j12);
    }

    private IdHash(int i5, UShort uShort, ULong uLong, ULong uLong2, SerializationConstructorMarker serializationConstructorMarker) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, IdHash$$serializer.INSTANCE.getDescriptor());
        }
        this.typeData = uShort.f71704a;
        this.hash128_a = uLong.f71700a;
        this.hash128_b = uLong2.f71700a;
    }

    private IdHash(short s11, long j11, long j12) {
        this.typeData = s11;
        this.hash128_a = j11;
        this.hash128_b = j12;
    }
}
