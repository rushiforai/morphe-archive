package kotlinx.serialization.json.internal;

import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmField;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.MissingFieldException;
import kotlinx.serialization.PolymorphicSerializerKt;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.encoding.AbstractDecoder;
import kotlinx.serialization.encoding.ChunkedDecoder;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.internal.AbstractPolymorphicSerializer;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonConfiguration;
import kotlinx.serialization.json.JsonDecoder;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.JsonElementKt;
import kotlinx.serialization.json.JsonObject;
import kotlinx.serialization.json.JsonPrimitive;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000º\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u0001\n\u0002\b\u000e\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\f\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0010\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003:\u0001UB1\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u000e\u0010\u000fJ\u0016\u0010\u0012\u001a\u00020\u0013*\u0004\u0018\u00010\r2\u0006\u0010\u0014\u001a\u00020\u0015H\u0002J\b\u0010 \u001a\u00020!H\u0016J!\u0010\"\u001a\u0002H#\"\u0004\b\u0000\u0010#2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H#0%H\u0016¢\u0006\u0002\u0010&J\u0010\u0010'\u001a\u00020(2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0010\u0010)\u001a\u00020*2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0010\u0010+\u001a\u00020*2\u0006\u0010\n\u001a\u00020\u000bH\u0002J\b\u0010,\u001a\u00020\u0013H\u0016J\n\u0010-\u001a\u0004\u0018\u00010.H\u0016J\b\u0010/\u001a\u00020*H\u0002J;\u00100\u001a\u0002H#\"\u0004\b\u0000\u0010#2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u00101\u001a\u00020\u001b2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H#0%2\b\u00102\u001a\u0004\u0018\u0001H#H\u0016¢\u0006\u0002\u00103J\u0010\u00104\u001a\u00020\u001b2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\b\u00105\u001a\u00020\u001bH\u0002J\u0018\u00106\u001a\u00020\u00132\u0006\u0010\n\u001a\u00020\u000b2\u0006\u00101\u001a\u00020\u001bH\u0002J\u0010\u00107\u001a\u00020\u001b2\u0006\u0010\n\u001a\u00020\u000bH\u0002J\u0018\u00108\u001a\u00020\u00132\u0006\u0010\n\u001a\u00020\u000b2\u0006\u00109\u001a\u00020\u0015H\u0002J\b\u0010:\u001a\u00020\u001bH\u0002J\b\u0010;\u001a\u00020\u0013H\u0016J\b\u0010<\u001a\u00020=H\u0016J\b\u0010>\u001a\u00020?H\u0016J\b\u0010@\u001a\u00020\u001bH\u0016J\b\u0010A\u001a\u00020BH\u0016J\b\u0010C\u001a\u00020DH\u0016J\b\u0010E\u001a\u00020FH\u0016J\b\u0010G\u001a\u00020HH\u0016J\b\u0010I\u001a\u00020\u0015H\u0002J\b\u0010J\u001a\u00020\u0015H\u0016J+\u0010K\u001a\u00020*2!\u0010L\u001a\u001d\u0012\u0013\u0012\u00110\u0015¢\u0006\f\bN\u0012\b\bO\u0012\u0004\b\b(P\u0012\u0004\u0012\u00020*0MH\u0016J\u0010\u0010Q\u001a\u00020R2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0010\u0010S\u001a\u00020\u001b2\u0006\u0010T\u001a\u00020\u000bH\u0016R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\b\u001a\u00020\t8\u0000X\u0081\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0016\u001a\u00020\u0017X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\f\u001a\u0004\u0018\u00010\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u001dX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u001fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006V"}, d2 = {"Lkotlinx/serialization/json/internal/StreamingJsonDecoder;", "Lkotlinx/serialization/json/JsonDecoder;", "Lkotlinx/serialization/encoding/ChunkedDecoder;", "Lkotlinx/serialization/encoding/AbstractDecoder;", "json", "Lkotlinx/serialization/json/Json;", "mode", "Lkotlinx/serialization/json/internal/WriteMode;", "lexer", "Lkotlinx/serialization/json/internal/AbstractJsonLexer;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "discriminatorHolder", "Lkotlinx/serialization/json/internal/StreamingJsonDecoder$DiscriminatorHolder;", "<init>", "(Lkotlinx/serialization/json/Json;Lkotlinx/serialization/json/internal/WriteMode;Lkotlinx/serialization/json/internal/AbstractJsonLexer;Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlinx/serialization/json/internal/StreamingJsonDecoder$DiscriminatorHolder;)V", "getJson", "()Lkotlinx/serialization/json/Json;", "trySkip", b.f42142b, "unknownKey", b.f42142b, "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "currentIndex", b.f42142b, "configuration", "Lkotlinx/serialization/json/JsonConfiguration;", "elementMarker", "Lkotlinx/serialization/json/internal/JsonElementMarker;", "decodeJsonElement", "Lkotlinx/serialization/json/JsonElement;", "decodeSerializableValue", "T", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "(Lkotlinx/serialization/DeserializationStrategy;)Ljava/lang/Object;", "beginStructure", "Lkotlinx/serialization/encoding/CompositeDecoder;", "endStructure", b.f42142b, "skipLeftoverElements", "decodeNotNullMark", "decodeNull", b.f42142b, "checkLeadingComma", "decodeSerializableElement", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "previousValue", "(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "decodeElementIndex", "decodeMapIndex", "coerceInputValue", "decodeObjectIndex", "handleUnknown", DatabaseConstants.KEY_FIELD, "decodeListIndex", "decodeBoolean", "decodeByte", b.f42142b, "decodeShort", b.f42142b, "decodeInt", "decodeLong", b.f42142b, "decodeFloat", b.f42142b, "decodeDouble", b.f42142b, "decodeChar", b.f42142b, "decodeStringKey", "decodeString", "decodeStringChunked", "consumeChunk", "Lkotlin/Function1;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "chunk", "decodeInline", "Lkotlinx/serialization/encoding/Decoder;", "decodeEnum", "enumDescriptor", "DiscriminatorHolder", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public class StreamingJsonDecoder extends AbstractDecoder implements JsonDecoder, ChunkedDecoder {

    @NotNull
    private final JsonConfiguration configuration;
    private int currentIndex;

    @Nullable
    private DiscriminatorHolder discriminatorHolder;

    @Nullable
    private final JsonElementMarker elementMarker;

    @NotNull
    private final Json json;

    @JvmField
    @NotNull
    public final AbstractJsonLexer lexer;

    @NotNull
    private final WriteMode mode;

    @NotNull
    private final SerializersModule serializersModule;

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0014\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Lkotlinx/serialization/json/internal/StreamingJsonDecoder$DiscriminatorHolder;", b.f42142b, "discriminatorToSkip", b.f42142b, "<init>", "(Ljava/lang/String;)V", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class DiscriminatorHolder {

        @JvmField
        @Nullable
        public String discriminatorToSkip;

        public DiscriminatorHolder(@Nullable String str) {
            this.discriminatorToSkip = str;
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[WriteMode.values().length];
            try {
                iArr[WriteMode.LIST.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[WriteMode.MAP.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[WriteMode.POLY_OBJ.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[WriteMode.OBJ.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public StreamingJsonDecoder(@NotNull Json json, @NotNull WriteMode mode, @NotNull AbstractJsonLexer lexer, @NotNull SerialDescriptor descriptor, @Nullable DiscriminatorHolder discriminatorHolder) {
        Intrinsics.g(json, "json");
        Intrinsics.g(mode, "mode");
        Intrinsics.g(lexer, "lexer");
        Intrinsics.g(descriptor, "descriptor");
        this.json = json;
        this.mode = mode;
        this.lexer = lexer;
        this.serializersModule = json.getSerializersModule();
        this.currentIndex = -1;
        this.discriminatorHolder = discriminatorHolder;
        JsonConfiguration configuration = json.getConfiguration();
        this.configuration = configuration;
        this.elementMarker = configuration.getExplicitNulls() ? null : new JsonElementMarker(descriptor);
    }

    private final void checkLeadingComma() {
        if (this.lexer.peekNextToken() != 4) {
            return;
        }
        AbstractJsonLexer.fail$default(this.lexer, "Unexpected leading comma", 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    private final boolean coerceInputValue(SerialDescriptor descriptor, int index) {
        String strPeekString;
        Json json = this.json;
        boolean zIsElementOptional = descriptor.isElementOptional(index);
        SerialDescriptor elementDescriptor = descriptor.getElementDescriptor(index);
        if (zIsElementOptional && !elementDescriptor.getIsNullable() && this.lexer.tryConsumeNull(true)) {
            return true;
        }
        if (!Intrinsics.b(elementDescriptor.getKind(), SerialKind.ENUM.INSTANCE) || ((elementDescriptor.getIsNullable() && this.lexer.tryConsumeNull(false)) || (strPeekString = this.lexer.peekString(this.configuration.getIsLenient())) == null)) {
            return false;
        }
        int jsonNameIndex = JsonNamesMapKt.getJsonNameIndex(elementDescriptor, json, strPeekString);
        boolean z11 = !json.getConfiguration().getExplicitNulls() && elementDescriptor.getIsNullable();
        if (jsonNameIndex == -3 && (zIsElementOptional || z11)) {
            this.lexer.consumeString();
            return true;
        }
        return false;
    }

    private final int decodeListIndex() {
        boolean zTryConsumeComma = this.lexer.tryConsumeComma();
        if (!this.lexer.canConsumeValue()) {
            if (!zTryConsumeComma || this.json.getConfiguration().getAllowTrailingComma()) {
                return -1;
            }
            JsonExceptionsKt.invalidTrailingComma(this.lexer, "array");
            throw new KotlinNothingValueException();
        }
        int i5 = this.currentIndex;
        if (i5 != -1 && !zTryConsumeComma) {
            AbstractJsonLexer.fail$default(this.lexer, "Expected end of the array or comma", 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
        int i11 = i5 + 1;
        this.currentIndex = i11;
        return i11;
    }

    private final int decodeMapIndex() {
        int i5 = this.currentIndex;
        boolean zTryConsumeComma = false;
        boolean z11 = i5 % 2 != 0;
        if (!z11) {
            this.lexer.consumeNextToken(AbstractJsonLexerKt.COLON);
        } else if (i5 != -1) {
            zTryConsumeComma = this.lexer.tryConsumeComma();
        }
        if (!this.lexer.canConsumeValue()) {
            if (!zTryConsumeComma || this.json.getConfiguration().getAllowTrailingComma()) {
                return -1;
            }
            JsonExceptionsKt.invalidTrailingComma$default(this.lexer, null, 1, null);
            throw new KotlinNothingValueException();
        }
        if (z11) {
            if (this.currentIndex == -1) {
                AbstractJsonLexer abstractJsonLexer = this.lexer;
                int i11 = abstractJsonLexer.currentPosition;
                if (zTryConsumeComma) {
                    AbstractJsonLexer.fail$default(abstractJsonLexer, "Unexpected leading comma", i11, null, 4, null);
                    throw new KotlinNothingValueException();
                }
            } else {
                AbstractJsonLexer abstractJsonLexer2 = this.lexer;
                boolean z12 = zTryConsumeComma;
                int i12 = abstractJsonLexer2.currentPosition;
                if (!z12) {
                    AbstractJsonLexer.fail$default(abstractJsonLexer2, "Expected comma after the key-value pair", i12, null, 4, null);
                    throw new KotlinNothingValueException();
                }
            }
        }
        int i13 = this.currentIndex + 1;
        this.currentIndex = i13;
        return i13;
    }

    private final int decodeObjectIndex(SerialDescriptor descriptor) {
        int jsonNameIndex;
        boolean zTryConsumeComma;
        boolean zTryConsumeComma2 = this.lexer.tryConsumeComma();
        while (true) {
            boolean z11 = true;
            if (!this.lexer.canConsumeValue()) {
                if (zTryConsumeComma2 && !this.json.getConfiguration().getAllowTrailingComma()) {
                    JsonExceptionsKt.invalidTrailingComma$default(this.lexer, null, 1, null);
                    throw new KotlinNothingValueException();
                }
                JsonElementMarker jsonElementMarker = this.elementMarker;
                if (jsonElementMarker != null) {
                    return jsonElementMarker.nextUnmarkedIndex$kotlinx_serialization_json();
                }
                return -1;
            }
            String strDecodeStringKey = decodeStringKey();
            this.lexer.consumeNextToken(AbstractJsonLexerKt.COLON);
            jsonNameIndex = JsonNamesMapKt.getJsonNameIndex(descriptor, this.json, strDecodeStringKey);
            if (jsonNameIndex == -3) {
                zTryConsumeComma = false;
            } else {
                if (!this.configuration.getCoerceInputValues() || !coerceInputValue(descriptor, jsonNameIndex)) {
                    break;
                }
                zTryConsumeComma = this.lexer.tryConsumeComma();
                z11 = false;
            }
            zTryConsumeComma2 = z11 ? handleUnknown(descriptor, strDecodeStringKey) : zTryConsumeComma;
        }
        JsonElementMarker jsonElementMarker2 = this.elementMarker;
        if (jsonElementMarker2 != null) {
            jsonElementMarker2.mark$kotlinx_serialization_json(jsonNameIndex);
        }
        return jsonNameIndex;
    }

    private final String decodeStringKey() {
        return this.configuration.getIsLenient() ? this.lexer.consumeStringLenientNotNull() : this.lexer.consumeKeyString();
    }

    private final boolean handleUnknown(SerialDescriptor descriptor, String key) {
        if (JsonNamesMapKt.ignoreUnknownKeys(descriptor, this.json) || trySkip(this.discriminatorHolder, key)) {
            this.lexer.skipElement(this.configuration.getIsLenient());
        } else {
            this.lexer.path.popDescriptor();
            this.lexer.failOnUnknownKey(key);
        }
        return this.lexer.tryConsumeComma();
    }

    private final void skipLeftoverElements(SerialDescriptor descriptor) {
        while (decodeElementIndex(descriptor) != -1) {
        }
    }

    private final boolean trySkip(DiscriminatorHolder discriminatorHolder, String str) {
        if (discriminatorHolder == null || !Intrinsics.b(discriminatorHolder.discriminatorToSkip, str)) {
            return false;
        }
        discriminatorHolder.discriminatorToSkip = null;
        return true;
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    @NotNull
    public CompositeDecoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        WriteMode writeModeSwitchMode = WriteModeKt.switchMode(this.json, descriptor);
        this.lexer.path.pushDescriptor(descriptor);
        this.lexer.consumeNextToken(writeModeSwitchMode.begin);
        checkLeadingComma();
        int i5 = WhenMappings.$EnumSwitchMapping$0[writeModeSwitchMode.ordinal()];
        return (i5 == 1 || i5 == 2 || i5 == 3) ? new StreamingJsonDecoder(this.json, writeModeSwitchMode, this.lexer, descriptor, this.discriminatorHolder) : (this.mode == writeModeSwitchMode && this.json.getConfiguration().getExplicitNulls()) ? this : new StreamingJsonDecoder(this.json, writeModeSwitchMode, this.lexer, descriptor, this.discriminatorHolder);
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public boolean decodeBoolean() {
        return this.lexer.consumeBooleanLenient();
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public byte decodeByte() {
        long jConsumeNumericLiteral = this.lexer.consumeNumericLiteral();
        byte b11 = (byte) jConsumeNumericLiteral;
        if (jConsumeNumericLiteral == b11) {
            return b11;
        }
        AbstractJsonLexer.fail$default(this.lexer, "Failed to parse byte for input '" + jConsumeNumericLiteral + '\'', 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public char decodeChar() {
        String strConsumeStringLenient = this.lexer.consumeStringLenient();
        if (strConsumeStringLenient.length() == 1) {
            return strConsumeStringLenient.charAt(0);
        }
        AbstractJsonLexer.fail$default(this.lexer, c1.m('\'', "Expected single char, but got '", strConsumeStringLenient), 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public double decodeDouble() throws NumberFormatException {
        AbstractJsonLexer abstractJsonLexer = this.lexer;
        String strConsumeStringLenient = abstractJsonLexer.consumeStringLenient();
        try {
            double d5 = Double.parseDouble(strConsumeStringLenient);
            if (this.json.getConfiguration().getAllowSpecialFloatingPointValues() || Math.abs(d5) <= Double.MAX_VALUE) {
                return d5;
            }
            JsonExceptionsKt.throwInvalidFloatingPointDecoded(this.lexer, Double.valueOf(d5));
            throw new KotlinNothingValueException();
        } catch (IllegalArgumentException unused) {
            AbstractJsonLexer.fail$default(abstractJsonLexer, c1.m('\'', "Failed to parse type 'double' for input '", strConsumeStringLenient), 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public int decodeElementIndex(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        int i5 = WhenMappings.$EnumSwitchMapping$0[this.mode.ordinal()];
        int iDecodeListIndex = i5 != 2 ? i5 != 4 ? decodeListIndex() : decodeObjectIndex(descriptor) : decodeMapIndex();
        if (this.mode != WriteMode.MAP) {
            this.lexer.path.updateDescriptorIndex(iDecodeListIndex);
        }
        return iDecodeListIndex;
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public int decodeEnum(@NotNull SerialDescriptor enumDescriptor) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        return JsonNamesMapKt.getJsonNameIndexOrThrow(enumDescriptor, this.json, decodeString(), " at path " + this.lexer.path.getPath());
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public float decodeFloat() throws NumberFormatException {
        AbstractJsonLexer abstractJsonLexer = this.lexer;
        String strConsumeStringLenient = abstractJsonLexer.consumeStringLenient();
        try {
            float f11 = Float.parseFloat(strConsumeStringLenient);
            if (this.json.getConfiguration().getAllowSpecialFloatingPointValues() || Math.abs(f11) <= Float.MAX_VALUE) {
                return f11;
            }
            JsonExceptionsKt.throwInvalidFloatingPointDecoded(this.lexer, Float.valueOf(f11));
            throw new KotlinNothingValueException();
        } catch (IllegalArgumentException unused) {
            AbstractJsonLexer.fail$default(abstractJsonLexer, c1.m('\'', "Failed to parse type 'float' for input '", strConsumeStringLenient), 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    @NotNull
    public Decoder decodeInline(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return StreamingJsonEncoderKt.isUnsignedNumber(descriptor) ? new JsonDecoderForUnsignedTypes(this.lexer, this.json) : super.decodeInline(descriptor);
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public int decodeInt() {
        long jConsumeNumericLiteral = this.lexer.consumeNumericLiteral();
        int i5 = (int) jConsumeNumericLiteral;
        if (jConsumeNumericLiteral == i5) {
            return i5;
        }
        AbstractJsonLexer.fail$default(this.lexer, "Failed to parse int for input '" + jConsumeNumericLiteral + '\'', 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    @Override // kotlinx.serialization.json.JsonDecoder
    @NotNull
    public JsonElement decodeJsonElement() {
        return new JsonTreeReader(this.json.getConfiguration(), this.lexer).read();
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public long decodeLong() {
        return this.lexer.consumeNumericLiteral();
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public boolean decodeNotNullMark() {
        JsonElementMarker jsonElementMarker = this.elementMarker;
        return ((jsonElementMarker != null ? jsonElementMarker.getIsUnmarkedNull() : false) || AbstractJsonLexer.tryConsumeNull$default(this.lexer, false, 1, null)) ? false : true;
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    @Nullable
    public Void decodeNull() {
        return null;
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.CompositeDecoder
    public <T> T decodeSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(deserializer, "deserializer");
        boolean z11 = this.mode == WriteMode.MAP && (index & 1) == 0;
        if (z11) {
            this.lexer.path.resetCurrentMapKey();
        }
        T t6 = (T) super.decodeSerializableElement(descriptor, index, deserializer, previousValue);
        if (z11) {
            this.lexer.path.updateCurrentMapKey(t6);
        }
        return t6;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x0159  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x015a  */
    @Override // kotlinx.serialization.encoding.Decoder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public <T> T decodeSerializableValue(@NotNull DeserializationStrategy<? extends T> deserializer) {
        String message;
        JsonPrimitive jsonPrimitive;
        Intrinsics.g(deserializer, "deserializer");
        try {
        } catch (MissingFieldException e3) {
            message = e3.getMessage();
            Intrinsics.d(message);
            if (!k.K0(message, "at path", false)) {
            }
        }
        if ((deserializer instanceof AbstractPolymorphicSerializer) && !this.json.getConfiguration().getUseArrayPolymorphism()) {
            String strClassDiscriminator = PolymorphicKt.classDiscriminator(((AbstractPolymorphicSerializer) deserializer).getDescriptor(), this.json);
            String strPeekLeadingMatchingValue = this.lexer.peekLeadingMatchingValue(strClassDiscriminator, this.configuration.getIsLenient());
            if (strPeekLeadingMatchingValue != null) {
                try {
                    DeserializationStrategy deserializationStrategyFindPolymorphicSerializer = PolymorphicSerializerKt.findPolymorphicSerializer((AbstractPolymorphicSerializer) deserializer, this, strPeekLeadingMatchingValue);
                    Intrinsics.e(deserializationStrategyFindPolymorphicSerializer, "null cannot be cast to non-null type kotlinx.serialization.DeserializationStrategy<T of kotlinx.serialization.json.internal.StreamingJsonDecoder.decodeSerializableValue>");
                    this.discriminatorHolder = new DiscriminatorHolder(strClassDiscriminator);
                    return (T) deserializationStrategyFindPolymorphicSerializer.deserialize(this);
                } catch (SerializationException e11) {
                    String message2 = e11.getMessage();
                    Intrinsics.d(message2);
                    String strB1 = k.b1(k.q1(message2, '\n'), ".");
                    String message3 = e11.getMessage();
                    Intrinsics.d(message3);
                    AbstractJsonLexer.fail$default(this.lexer, strB1, 0, k.l1('\n', message3, b.f42142b), 2, null);
                    throw new KotlinNothingValueException();
                }
            }
            if ((deserializer instanceof AbstractPolymorphicSerializer) && !getJson().getConfiguration().getUseArrayPolymorphism()) {
                String strClassDiscriminator2 = PolymorphicKt.classDiscriminator(((AbstractPolymorphicSerializer) deserializer).getDescriptor(), getJson());
                JsonElement jsonElementDecodeJsonElement = decodeJsonElement();
                String serialName = ((AbstractPolymorphicSerializer) deserializer).getDescriptor().getSerialName();
                if (jsonElementDecodeJsonElement instanceof JsonObject) {
                    JsonObject jsonObject = (JsonObject) jsonElementDecodeJsonElement;
                    JsonElement jsonElement = (JsonElement) jsonObject.get((Object) strClassDiscriminator2);
                    try {
                        DeserializationStrategy deserializationStrategyFindPolymorphicSerializer2 = PolymorphicSerializerKt.findPolymorphicSerializer((AbstractPolymorphicSerializer) deserializer, this, (jsonElement == null || (jsonPrimitive = JsonElementKt.getJsonPrimitive(jsonElement)) == null) ? null : JsonElementKt.getContentOrNull(jsonPrimitive));
                        Intrinsics.e(deserializationStrategyFindPolymorphicSerializer2, "null cannot be cast to non-null type kotlinx.serialization.DeserializationStrategy<T of kotlinx.serialization.json.internal.PolymorphicKt.decodeSerializableValuePolymorphic>");
                        return (T) TreeJsonDecoderKt.readPolymorphicJson(getJson(), strClassDiscriminator2, jsonObject, deserializationStrategyFindPolymorphicSerializer2);
                    } catch (SerializationException e12) {
                        String message4 = e12.getMessage();
                        Intrinsics.d(message4);
                        throw JsonExceptionsKt.JsonDecodingException(-1, message4, jsonObject.toString());
                    }
                }
                StringBuilder sb2 = new StringBuilder("Expected ");
                ReflectionFactory reflectionFactory = Reflection.f71864a;
                sb2.append(reflectionFactory.getOrCreateKotlinClass(JsonObject.class).getSimpleName());
                sb2.append(", but had ");
                sb2.append(reflectionFactory.getOrCreateKotlinClass(jsonElementDecodeJsonElement.getClass()).getSimpleName());
                sb2.append(" as the serialized body of ");
                sb2.append(serialName);
                sb2.append(" at element: ");
                sb2.append(this.lexer.path.getPath());
                throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementDecodeJsonElement.toString());
            }
            return deserializer.deserialize(this);
            message = e3.getMessage();
            Intrinsics.d(message);
            if (!k.K0(message, "at path", false)) {
                throw e3;
            }
            throw new MissingFieldException(e3.getMissingFields(), e3.getMessage() + " at path: " + this.lexer.path.getPath(), e3);
        }
        return deserializer.deserialize(this);
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    public short decodeShort() {
        long jConsumeNumericLiteral = this.lexer.consumeNumericLiteral();
        short s11 = (short) jConsumeNumericLiteral;
        if (jConsumeNumericLiteral == s11) {
            return s11;
        }
        AbstractJsonLexer.fail$default(this.lexer, "Failed to parse short for input '" + jConsumeNumericLiteral + '\'', 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.Decoder
    @NotNull
    public String decodeString() {
        return this.configuration.getIsLenient() ? this.lexer.consumeStringLenientNotNull() : this.lexer.consumeString();
    }

    @Override // kotlinx.serialization.encoding.ChunkedDecoder
    public void decodeStringChunked(@NotNull Function1<? super String, Unit> consumeChunk) {
        Intrinsics.g(consumeChunk, "consumeChunk");
        this.lexer.consumeStringChunked(this.configuration.getIsLenient(), consumeChunk);
    }

    @Override // kotlinx.serialization.encoding.AbstractDecoder, kotlinx.serialization.encoding.CompositeDecoder
    public void endStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        if (descriptor.getElementsCount() == 0 && JsonNamesMapKt.ignoreUnknownKeys(descriptor, this.json)) {
            skipLeftoverElements(descriptor);
        }
        if (this.lexer.tryConsumeComma() && !this.json.getConfiguration().getAllowTrailingComma()) {
            JsonExceptionsKt.invalidTrailingComma(this.lexer, b.f42142b);
            throw new KotlinNothingValueException();
        }
        this.lexer.consumeNextToken(this.mode.end);
        this.lexer.path.popDescriptor();
    }

    @Override // kotlinx.serialization.json.JsonDecoder
    @NotNull
    public final Json getJson() {
        return this.json;
    }

    @Override // kotlinx.serialization.encoding.Decoder, kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public SerializersModule getSerializersModule() {
        return this.serializersModule;
    }
}
