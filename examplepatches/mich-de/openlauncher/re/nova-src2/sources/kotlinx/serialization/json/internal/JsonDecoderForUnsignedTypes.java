package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.UStringsKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.AbstractDecoder;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;
import r70.i;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0000\b\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\b\u0010\u0010\u001a\u00020\rH\u0016J\b\u0010\u0011\u001a\u00020\u0012H\u0016J\b\u0010\u0013\u001a\u00020\u0014H\u0016J\b\u0010\u0015\u001a\u00020\u0016H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\b\u001a\u00020\tX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0017"}, d2 = {"Lkotlinx/serialization/json/internal/JsonDecoderForUnsignedTypes;", "Lkotlinx/serialization/encoding/AbstractDecoder;", "lexer", "Lkotlinx/serialization/json/internal/AbstractJsonLexer;", "json", "Lkotlinx/serialization/json/Json;", "<init>", "(Lkotlinx/serialization/json/internal/AbstractJsonLexer;Lkotlinx/serialization/json/Json;)V", "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "decodeElementIndex", b.f42142b, "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "decodeInt", "decodeLong", b.f42142b, "decodeByte", b.f42142b, "decodeShort", b.f42142b, "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JsonDecoderForUnsignedTypes extends AbstractDecoder {

    @NotNull
    private final AbstractJsonLexer lexer;

    @NotNull
    private final SerializersModule serializersModule;

    public JsonDecoderForUnsignedTypes(@NotNull AbstractJsonLexer lexer, @NotNull Json json) {
        Intrinsics.g(lexer, "lexer");
        Intrinsics.g(json, "json");
        this.lexer = lexer;
        this.serializersModule = json.getSerializersModule();
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public byte decodeByte() {
        UByte uByte;
        AbstractJsonLexer abstractJsonLexer = this.lexer;
        String strConsumeStringLenient = abstractJsonLexer.consumeStringLenient();
        try {
            Intrinsics.g(strConsumeStringLenient, "<this>");
            UInt uIntB = UStringsKt.b(10, strConsumeStringLenient);
            if (uIntB != null) {
                int i5 = uIntB.f71697a;
                uByte = Integer.compareUnsigned(i5, 255) > 0 ? null : new UByte((byte) i5);
            }
            if (uByte != null) {
                return uByte.f71694a;
            }
            i.q0(strConsumeStringLenient);
            throw null;
        } catch (IllegalArgumentException unused) {
            AbstractJsonLexer.fail$default(abstractJsonLexer, c1.m('\'', "Failed to parse type 'UByte' for input '", strConsumeStringLenient), 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public int decodeElementIndex(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        throw new IllegalStateException("unsupported");
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public int decodeInt() {
        AbstractJsonLexer abstractJsonLexer = this.lexer;
        String strConsumeStringLenient = abstractJsonLexer.consumeStringLenient();
        try {
            Intrinsics.g(strConsumeStringLenient, "<this>");
            UInt uIntB = UStringsKt.b(10, strConsumeStringLenient);
            if (uIntB != null) {
                return uIntB.f71697a;
            }
            i.q0(strConsumeStringLenient);
            throw null;
        } catch (IllegalArgumentException unused) {
            AbstractJsonLexer.fail$default(abstractJsonLexer, c1.m('\'', "Failed to parse type 'UInt' for input '", strConsumeStringLenient), 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public long decodeLong() {
        AbstractJsonLexer abstractJsonLexer = this.lexer;
        String strConsumeStringLenient = abstractJsonLexer.consumeStringLenient();
        try {
            Intrinsics.g(strConsumeStringLenient, "<this>");
            ULong uLongD = UStringsKt.d(10, strConsumeStringLenient);
            if (uLongD != null) {
                return uLongD.f71700a;
            }
            i.q0(strConsumeStringLenient);
            throw null;
        } catch (IllegalArgumentException unused) {
            AbstractJsonLexer.fail$default(abstractJsonLexer, c1.m('\'', "Failed to parse type 'ULong' for input '", strConsumeStringLenient), 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public short decodeShort() {
        UShort uShort;
        AbstractJsonLexer abstractJsonLexer = this.lexer;
        String strConsumeStringLenient = abstractJsonLexer.consumeStringLenient();
        try {
            Intrinsics.g(strConsumeStringLenient, "<this>");
            UInt uIntB = UStringsKt.b(10, strConsumeStringLenient);
            if (uIntB != null) {
                int i5 = uIntB.f71697a;
                uShort = Integer.compareUnsigned(i5, 65535) > 0 ? null : new UShort((short) i5);
            }
            if (uShort != null) {
                return uShort.f71704a;
            }
            i.q0(strConsumeStringLenient);
            throw null;
        } catch (IllegalArgumentException unused) {
            AbstractJsonLexer.fail$default(abstractJsonLexer, c1.m('\'', "Failed to parse type 'UShort' for input '", strConsumeStringLenient), 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.encoding.Decoder, kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public SerializersModule getSerializersModule() {
        return this.serializersModule;
    }
}
