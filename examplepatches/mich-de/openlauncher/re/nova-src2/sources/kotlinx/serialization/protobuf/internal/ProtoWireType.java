package kotlinx.serialization.protobuf.internal;

import a2.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0080\u0081\u0002\u0018\u0000 \u00112\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0011B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000e\u0010\r\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u0003J\b\u0010\u000f\u001a\u00020\u0010H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\f¨\u0006\u0012"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtoWireType;", b.f42142b, "typeId", b.f42142b, "<init>", "(Ljava/lang/String;II)V", "getTypeId", "()I", "INVALID", "VARINT", "i64", "SIZE_DELIMITED", "i32", "wireIntWithTag", "tag", "toString", b.f42142b, k.O, "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ProtoWireType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ProtoWireType[] $VALUES;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE;

    @NotNull
    private static final ProtoWireType[] entryArray;
    private final int typeId;
    public static final ProtoWireType INVALID = new ProtoWireType("INVALID", 0, -1);
    public static final ProtoWireType VARINT = new ProtoWireType("VARINT", 1, 0);
    public static final ProtoWireType i64 = new ProtoWireType("i64", 2, 1);
    public static final ProtoWireType SIZE_DELIMITED = new ProtoWireType("SIZE_DELIMITED", 3, 2);
    public static final ProtoWireType i32 = new ProtoWireType("i32", 4, 5);

    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\b\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\nR\u0016\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0007¨\u0006\u000b"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtoWireType$Companion;", b.f42142b, "<init>", "()V", "entryArray", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoWireType;", "[Lkotlinx/serialization/protobuf/internal/ProtoWireType;", "fromLeastSignificantBits", "value", b.f42142b, "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final ProtoWireType fromLeastSignificantBits(int value) {
            return ProtoWireType.entryArray[value & 7];
        }

        private Companion() {
        }
    }

    private static final /* synthetic */ ProtoWireType[] $values() {
        return new ProtoWireType[]{INVALID, VARINT, i64, SIZE_DELIMITED, i32};
    }

    static {
        ProtoWireType next;
        ProtoWireType[] protoWireTypeArr$values = $values();
        $VALUES = protoWireTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(protoWireTypeArr$values);
        INSTANCE = new Companion(null);
        ProtoWireType[] protoWireTypeArr = new ProtoWireType[8];
        for (int i5 = 0; i5 < 8; i5++) {
            Iterator<ProtoWireType> it = getEntries().iterator();
            while (true) {
                if (it.hasNext()) {
                    next = it.next();
                    if (next.typeId == i5) {
                        break;
                    }
                } else {
                    next = null;
                    break;
                }
            }
            ProtoWireType protoWireType = next;
            if (protoWireType == null) {
                protoWireType = INVALID;
            }
            protoWireTypeArr[i5] = protoWireType;
        }
        entryArray = protoWireTypeArr;
    }

    private ProtoWireType(String str, int i5, int i11) {
        this.typeId = i11;
    }

    @NotNull
    public static EnumEntries<ProtoWireType> getEntries() {
        return $ENTRIES;
    }

    public static ProtoWireType valueOf(String str) {
        return (ProtoWireType) Enum.valueOf(ProtoWireType.class, str);
    }

    public static ProtoWireType[] values() {
        return (ProtoWireType[]) $VALUES.clone();
    }

    public final int getTypeId() {
        return this.typeId;
    }

    @Override // java.lang.Enum
    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(name());
        sb2.append('(');
        return c.m(sb2, this.typeId, ')');
    }

    public final int wireIntWithTag(int tag) {
        return (tag << 3) | this.typeId;
    }
}
